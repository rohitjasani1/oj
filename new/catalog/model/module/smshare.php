<?php
class ModelModuleSmshare extends Model {
    
    public function on_registration($data, $customer_id){
        
        //hook_65e6e Allow scar to cancel from here. Scar will call send_sms_on_registration in its onSuccess. 
        
        if ($this->config->get('smshare_cfg_log')) $this->log->write("[smshare] Going to send or not SMS on registration to customer/admins");
        $this->send_sms_on_registration($data, $customer_id);
    }
    
    
    /**
     * We didn't use event system because we need the password variable.
     * called by PVA2 too.
     */
    public function send_sms_on_registration($data, $customer_id){
        $this->load->helper('smshare_phonenumber_filter');
        $this->load->component('smshare/net');
        $this->load->component('smshare/dao');
        
        $find = array(
            '{firstname}'  ,
            '{lastname}'   ,
            '{phonenumber}',
            '{password}'   ,
        );
         
        $replace = array(
            'firstname'   => $data['firstname'],
            'lastname'    => $data['lastname'] ,
            'phonenumber' => $data['telephone'],
            'password'    => $data['password'] ,
        );
    
    
        /*
         * Send SMS to customer
         */
        if($this->config->get('smshare_config_notify_customer_by_sms_on_registration') && pass_filters($data['telephone'], $this)) {
    
            $tmpls = $this->config->get('smshare_cfg_on_registration_customer_tmpls');
            //get customer preferred language, fallback to store default language
            $lg = $this->component_smshare_dao->get_preferred_language($customer_id);
            $sms_template = $tmpls[$lg];
    
            $sms_body = str_replace($find, $replace, $sms_template);
    
            $sms_to = rewritePhoneNumber($data['telephone'], $this);
            
            $reply = $this->component_smshare_net->send_sms(array(
                'to'        => $sms_to,
                'body'      => $sms_body,
                'reference' => 'Automatic SMS to customer at registration',
                'comment'   => ''
            ));
        }
    
        /*
         * Send sms to store owner on registration
         */
        if ( $this->config->get('smshare_cfg_ntfy_admin_by_sms_on_reg') ) {
    
            $sms_template = $this->config->get('smshare_cfg_sms_tmpl_for_admin_notif_on_reg');
    
            $sms_body = str_replace($find, $replace, $sms_template);
    
            $reply = $this->component_smshare_net->send_sms(array(
                'to'        => $this->config->get('config_telephone'), 
                'body'      => $sms_body, 
                'reference' => 'Automatic SMS to store owner at registration',
                'comment'   => ''
            ));
        }
    }
    
    /**
     * We don't use anymore event 'post.order.add', because it is send before customer confirms the order.
     * The order status is 0
     * However, Opencart send the new order email in the addHistory function by checking that order status becomes greater than 0.
     */
    public function send_sms_on_new_order($order_id){
        $this->load->helper('smshare_phonenumber_filter');
        
        $this->send_sms_to_customer($order_id);
        $this->send_sms_or_not_to_admin($order_id);
    }
    
    
    /**
     * Send SMS to store owner on new order
     */
    private function send_sms_or_not_to_admin($order_id){
        
        $admins = "";
        
        if($this->config->get('smshare_config_notify_admin_by_sms_on_checkout')){    //coded this way because we can send to additional numbers even if the notify admin setting is off. 
            $admins = $this->config->get('config_telephone');
        }else{
            if ($this->config->get('smshare_cfg_log')) $this->log->write('[smshare] Notify admin setting is off.. Checking the additional numbers..');
        }
         
        $admin_extra_numbers = $this->config->get('smshare_config_notify_extra_by_sms_on_checkout');
        if(!empty($admin_extra_numbers)){
            if(! empty($admins)){
                $admins .= ',';
            }
            $admins .= $admin_extra_numbers ;
        }
        
        //inject any number into the admin variable $admins
        //hook_878f5
        
        if(empty($admins)){
            if ($this->config->get('smshare_cfg_log')) $this->log->write('[smshare] No admins phone number and there are no extra admin phone numbers. No SMS will be sent. Abort!');
            return;
        }
         
        
        $this->load->model('checkout/order');
        $order_info = $this->model_checkout_order->getOrder($order_id);
        
        // Get Order Totals
        $order_total_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order ASC");

        //Get Order products
        $order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");
        
        //Get Ordre voucher
        $order_voucher_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int)$order_id . "'");
        
        /*
         * Get order_status
         */
        $order_status_id = $order_info["order_status_id"];
        $order_status_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$order_status_id . "' AND language_id = '" . (int)$order_info['language_id'] . "'");
        
        $order_status = '';
        if ($order_status_query->num_rows) {
            $order_status = $order_status_query->row['name'];
        }

        $language = new Language($order_info['language_directory']);
        $language->load('default');                            //contains date_format_short d/m/Y
        $language->load($order_info['language_directory']);    //In recent version of opencart, the "default" file is no more default.php but english.php, arabic.php ... Hash: b7934
        $language->load('mail/order');
        
        /*
         * Get message template
         */
        $sms_template = $this->config->get('smshare_config_sms_template_for_storeowner_notif_on_checkout');
    
        /*
         * Get and format order total
         */
        $smshare_order_total = doGetOrderTotal($order_total_query->rows, $this);
        $smshare_order_total = $this->currency->format($smshare_order_total);
        
        /*
         * Merge
         */
        $sms_template = replace_smshare_variables($sms_template, $order_info, $smshare_order_total);
    
        $isDefaultTempateKeywordUsed = strpos($sms_template, '{default_template}');
    
        if($isDefaultTempateKeywordUsed !== false){
            //
            // Text for defaultTemplate
            //
            $text  = $language->get('text_new_received')     . "\n\n";
            $text .= $language->get('text_new_order_id')     . ' ' . $order_id . "\n";
            //$this->log->write("[smshare debug] language->get('date_format_short') is: " . $language->get('date_format_short'));
            $text .= $language->get('text_new_date_added')   . ' ' . date($language->get('date_format_short'), strtotime($order_info['date_added'])) . "\n";
            
            if(!empty($order_status)){
                $text .= $language->get('text_new_order_status') . ' ' . $order_status . "\n\n";
            }
                
            $text .= $language->get('text_new_products')     . "\n";
        
            foreach ($order_product_query->rows as $result) {
                $text .= $result['quantity'] . 'x ' . $result['name'] . ' (' . $result['model'] . ') ' . html_entity_decode($this->currency->format($result['total'], $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8') . "\n";
        
                $order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . $result['order_product_id'] . "'");
        
                foreach ($order_option_query->rows as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['value'];
                    } else {
                        $value = utf8_substr($option['value'], 0, utf8_strrpos($option['value'], '.'));
                    }
                    
                     $text .= chr(9) . '-' . $option['name'] . ' ' . (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value) . "\n";
                }
            }
        
            
            foreach ($order_voucher_query->rows as $voucher) {
                $text .= '1x ' . $voucher['description'] . ' ' . $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']);
            }
        
            $text .= "\n";
        
            $text .= $language->get('text_new_order_total') . "\n";
        
            foreach ($order_total_query->rows as $result) {
                $text .= $result['title'] . ': ' . $this->currency->format($result['value']) . "\n";
            }
        
            $text .= "\n";
        
            if ($order_info['comment']) {
                $text .= $language->get('text_new_comment') . "\n\n";
                $text .= $order_info['comment'] . "\n\n";
            }
        
            /*
             * Merge default_template
             */
            $find    = array('{default_template}');
            $replace = array('default_template' => $text);
            $sms_template = str_replace($find, $replace, $sms_template);
        
        }  //End if isDefaultTempateKeywordUsed
    
    
        $isCompactDefaultTempateKeywordUsed = strpos($sms_template, '{compact_default_template}');
    
        if($isCompactDefaultTempateKeywordUsed !== false){
            //
            // Text for compactDefaultTemplate
            //
            
            $text  = 'ID:'     . $order_id     . "\n";
            $text .= 'Status:' . $order_status . "\n\n";
            $text .= $language->get('text_new_products') . ":";
            
            foreach ($order_product_query->rows as $result) {
                $text .= $result['quantity'] . 'x ' . $result['name'] . html_entity_decode($this->currency->format($result['total'], $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8') . "\n";
                
                $order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . $result['order_product_id'] . "'");
                
                foreach ($order_option_query->rows as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['value'];
                    } else {
                        $value = utf8_substr($option['value'], 0, utf8_strrpos($option['value'], '.'));
                    }
                    
                    $text .= chr(9) . '-' . $option['name'] . ' ' . (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value) . "\n";
                }
            }
                
            foreach ($order_voucher_query->rows as $voucher) {
                $text .= '1x ' . $voucher['description'] . ' ' . $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']);
            }
                
            $text .= "\n";
            
            foreach ($order_total_query->rows as $result) {
                if('total' === $result['code']){
                    $text .= $result['title'] . ':' . $this->currency->format($result['value']) . "\n";
                }
            }
            $text .= "\n";
            
            if ($order_info['comment']) {
                $text .= $language->get('text_new_comment') . "\n\n";
                $text .= $order_info['comment'] . "\n\n";
            }
            
            //
            //Do default_template variable substitution.
            //
            $find         = array('{compact_default_template}');
            $replace      = array('compact_default_template' => $text);
            $sms_template = str_replace($find, $replace, $sms_template);
        }
            
        $this->load->component('smshare/net');
        return $this->component_smshare_net->send_sms(array(
            'to'        => $admins,
            'body'      => $sms_template,
            'reference' => 'SMS to store owner on new order',
            'comment'   => ''
        ));
    }
    
    /**
     * Send SMS to customer on new order
     */
    private function send_sms_to_customer($order_id){
        
        $this->load->model('checkout/order');
        $order_info = $this->model_checkout_order->getOrder($order_id);
        
        // Order Totals
        $order_total_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order ASC");
        
        $keyword_found = false;
        
        /*
         * Get coupon
         */
        $donotsend_coupon_keywords = $this->config->get('smshare_cfg_donotsend_sms_on_checkout_coupon_keywords');
        if(!isNullOrEmptyString($donotsend_coupon_keywords)){
            foreach($order_total_query->rows as $result) {
                $code = $result['code'];
                if($code == 'coupon') {
                    if ($this->config->get('smshare_cfg_log')) $this->log->write('[smshare] Customer used coupon, Checking if coupon is in the do-no-send keywords.');
                    $title = $result['title'];
        
                    //foreach smshare do-not-send sms keyword
                    foreach(preg_split("/((\r?\n)|(\r\n?))/", $donotsend_coupon_keywords) as $donotsend_coupon_keyword){
                        //if coupon contains one of these keywords, then set the do not send SMS boolean to false.
                        $pos = strpos($title, $donotsend_coupon_keyword);
                        if($pos !== false){
                            $keyword_found = true;
                            if ($this->config->get('smshare_cfg_log')) $this->log->write('[smshare] Coupon keyword found, we should not send SMS to customer on checkout.');
                            break;
                        }
                    }
        
                    break;
                }
            }
        }
        
        if($keyword_found === false) {
            /*
             * Send sms to customer here
             */
            $smshare_patterns   = $this->config->get('smshare_config_number_filtering');
            $number_size_filter = $this->config->get('smshare_cfg_num_filt_by_size');
        
            if($this->config->get('smshare_config_notify_customer_by_sms_on_checkout')&&
               isNumberAuthorized($order_info['telephone'],      $smshare_patterns)   &&
               passTheNumberSizeFilter($order_info['telephone'], $number_size_filter)
            ) {
                 
                $this->load->component('smshare/dao');
                $tmpls = $this->config->get('smshare_cfg_on_checkout_customer_tmpls');
                //get customer preferred language, fallback to store default language
                $lg = $this->component_smshare_dao->get_preferred_language($order_info['customer_id']);
                $sms_template = $tmpls[$lg];
                

                /*
                 * Get and format order total
                 */
                $smshare_order_total = doGetOrderTotal($order_total_query->rows, $this);
                $smshare_order_total = $this->currency->format($smshare_order_total);
                
                /*
                 * Merge
                 */
                $smshare_message = replace_smshare_variables($sms_template, $order_info, $smshare_order_total);
        
                $sms_to = rewritePhoneNumber($order_info['telephone'], $this);
                
                $this->load->component('smshare/net');
                return $this->component_smshare_net->send_sms(array(
                    'to'        => $sms_to,
                    'body'      => $smshare_message,
                    'reference' => 'Automatic SMS to customer on new order',
                    'comment'   => ''
                ));
                
            }
        }
    }
    
}
?>
