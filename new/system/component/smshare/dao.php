<?php 
class ComponentSmshareDao extends Model {
    
    public function addSms($data) {
        
		$this->db->query("INSERT INTO " . DB_PREFIX . "smsbean SET"  
		                                            . "   `to` = '"        . $this->db->escape($data['to']) 
                                                    . "', `body` = '"      . $this->db->escape($data['body'])
		                                            . "', `username` = '"  . $this->db->escape($data['username']) 
		                                            . "', `reference` = '" . $this->db->escape($data['reference']) 
		                                            . "', `comment` = '"   . $this->db->escape($data['comment']) 
                                    		        . "', `price` = '"     . $this->db->escape($data['price']) 
                                    		        . "', `create_date` = NOW()"  
                                    		        . " , `update_date` = NOW()" 
		                                            ); 
		//$sms_id = $this->db->getLastId();
	}
    
	/**
	 * if action in back  Return admin username logged in 
	 * if action in front Return constant
	 * 
	 * @see admin/controller/common/profile.php
	 */
	public function get_username_sending_sms(){
	    
	    if($this->user && $this->user->getId()){
	        $user_id = $this->user->getId();
    	    $query = $this->db->query("SELECT *, (SELECT ug.name FROM `" . DB_PREFIX . "user_group` ug WHERE ug.user_group_id = u.user_group_id) AS user_group FROM `" . DB_PREFIX . "user` u WHERE u.user_id = '" . (int)$user_id . "'");
    	    $user_info = $query->row;
    	    
	        $data['username'] = $user_info['username'];
	    } else {
	        $data['username'] = '';
	    }
	    return $data;
	}
	
	
	public function get_preferred_language($customer_id){
	    
	    //hook_ad2fd 
	    //PLS extension
	    
	    $lg = $this->config->get('config_language');
	    if ($this->config->get('smshare_cfg_log')) $this->log->write("[smshare] preferred language is default one: " . $lg);
        return $lg;    //default store language, when the "preferred language" extension is not installed. 
	}
	
	
	/**
	 * @param unknown $order_id   oc <  2.1.0.1
     * @param unknown $post_data
     * @param unknown $order_info oc >= 2.1.0.1
	 */
	function notify_or_not_customer_by_sms_after_history_add_by_id_param($order_id, $post_data, $order_info){
	    
	    if(!$order_info){
    	    $this->load->model('sale/order');
    	    $order_info = $this->model_sale_order->getOrder($order_id);
	    }
	    
	    $this->notify_or_not_customer_by_sms_after_history_add($order_info, $post_data);
	}
	
	
	/**
	 * Moved from admin to component because mm needs this method from catalog. (seller update order status from catalog)
	 */
	function notify_or_not_customer_by_sms_after_history_add($order_info, $post_data) {
	    
	    $this->load->helper('smshare_phonenumber_filter');
	     
	    if(! $post_data['notify_by_sms']){
	        if ($this->config->get('smshare_cfg_log')) $this->log->write("[smshare] Do not notify customer on order update because notify_by_sms is false. Not checked or not submitted. Aborting!");
	        return array();
	    }
	     
	    $order_id = $order_info['order_id'];
	
	    $telephone = $order_info['telephone'];
	
	    /*
	     * Early check
	    */
	    if(! pass_filters($telephone, $this)) {
	        if ($this->config->get('config_error_log')) $this->log->write("[smshare] Phone number '$telephone' does not pass filters.");
	        return array(
	                'error'=>'Phone number does not pass filters',
	                'code' =>'a7eb2'
	        );
	    }
	
	    /*
	     * Get language
	     */
	    $lg = $this->get_preferred_language($order_info['customer_id']);
	    
	    /*
	     * Get all observers
   	     */
	    
	    
	    $smshare_sms_template = "";
	    $smshare_cfg_odr_observers = $this->config->get('smshare_cfg_odr_observers');
	    if($smshare_cfg_odr_observers){
	        foreach ($smshare_cfg_odr_observers as $observer) {
	            if($observer['key'] == $post_data['order_status_id']){
	                $smshare_sms_template = $observer['val'][$lg];
	                break;
	            }
	        }
	    }
	
	    if(isNullOrEmptyString($smshare_sms_template)){
	        $smshare_sms_template = '{default_template}';
	    }
	
	    /*
	     * Order Totals
	     */
	    $order_total_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order ASC");
	    $order_total = doGetOrderTotal($order_total_query->rows, $this);
	    $order_total = $this->currency->format($order_total, $this->config->get('config_currency'));
	
	    /*
	     * Merge, user can put Hi {firstname}, ... in the comment.
	    */
	    $find            = array('{comment}');
	    $replace         = array('comment' => strip_tags(html_entity_decode($post_data['comment'], ENT_QUOTES, 'UTF-8')));
	    $smshare_message = str_replace($find, $replace, $smshare_sms_template);
	    
	    
        //Powertrack eventually
        //hook_24ce6
	    
	    
	
	    /*
	     * smshare all variable replacement
	     */
	    $smshare_message = replace_smshare_variables($smshare_message, $order_info, $order_total);
	
	    /*
	     * If default_template keyword is present, we build the default message as opencart did for email and we do replacement.
	    */
	    if(strpos($smshare_sms_template, '{default_template}') !== false){    //default_template keyword is used.
	
	        $default_message = $this->build_default_message($order_id, $order_info, $post_data);
	
	        /*
	         * Merge
	         */
	        $find            = array('{default_template}');
	        $replace         = array('default_template' => $default_message);
	        $smshare_message = str_replace($find, $replace, $smshare_message);
	    }
	
	    $sms_to = rewritePhoneNumber($telephone, $this);
	
	    $this->load->component('smshare/net');
	    return $this->component_smshare_net->send_sms(array(
	            'to'        => $sms_to,
	            'body'      => $smshare_message,
	            'reference' => 'SMS to customer on order status update',
	            'comment'   => 'Order ID ' . $order_id . ' status update'
	    ));
	     
	    //TODO update order_history customer notified yes.
	}
	
	
	private function build_default_message($order_id, $order_info, $post_data){
	
	    $this->load->language_common('smshare_history_notif');
	     
	    $message  = $this->language->get('text_new_order_id')   . ' ' . $order_id . "\n";
	    $message .= $this->language->get('text_new_date_added') . ' ' . date($this->language->get('date_format_short'), strtotime($order_info['date_added'])) . "\n\n";
	
	    $order_status_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$post_data['order_status_id'] . "' AND language_id = '" . (int)$order_info['language_id'] . "'");
	
	    if ($order_status_query->num_rows) {
	        $message .= $this->language->get('text_new_order_status') . "\n";
	        $message .= $order_status_query->row['name'] . "\n\n";
	    }
	
	    if ($order_info['customer_id']) {
	        $message .= $this->language->get('text_update_link') . "\n";
	        $message .= html_entity_decode($order_info['store_url'] . 'index.php?route=account/order/info&order_id=' . $order_id, ENT_QUOTES, 'UTF-8') . "\n\n";
	    }
	
	    if ($post_data['comment']) {
	        $message .= $this->language->get('text_new_comment') . "\n\n";
	        $message .= strip_tags(html_entity_decode($post_data['comment'], ENT_QUOTES, 'UTF-8')) . "\n\n";
	    }
	
	    $message .= $this->language->get('text_update_footer');
	
	    return $message;
	}
	
}
	
?>