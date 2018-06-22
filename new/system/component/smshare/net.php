<?php 
class ComponentSmshareNet extends Model {
	
    /**
	 * To debug use the following command on the server:
	 * tshark -i eth0
	 * 
	 * Send or broadcast One SMS. 
	 */
	public function send_sms($args){
	    
	    $this->load->helper('smshare_net');
	    
	    //hook for smsadmin to check balance
	    //hook_846fd
	    
	    $smshare_sender_profile = $this->config->get('smshare_sender_profile');
	    if(empty($smshare_sender_profile)){
	        if ($this->config->get('smshare_cfg_log')) $this->log->write('[smshare] No sending mode registered. Aborting!');
	        return;
	    }
	    
	    if($smshare_sender_profile === 'profile_android') {    //send using Android
	
	        $smshare_json = $this->build_smshare_json(
	            $this->config->get('smshare_username'),
	            $this->config->get('smshare_passwd')  ,
                $args
	        );
	
	        $result = post_json(REQUEST_PATH_SHARELINK, $smshare_json, $this);
	
	    }else{    //send using api (sms_bump or other)
	
	        //populate postData:
	
	        /*
	         * sms_to
	         */
	        $data = array($this->config->get('smshare_api_dest_var') => $args['to']);
	
	        
	        $method = $this->config->get('smshare_api_http_method');
	        $url    = $this->config->get('smshare_api_url');
	        if(empty($url)){
	            $result = array();
	            $result['error'] = "You need to enter the SMS gateway URL in the smshare module configuration page.";
	            return $result;
	        }
	
	        /*
	         * SMS Body
	         */
	        $sms_body = $args['body'];
	        if($this->config->get('smshare_api_msg_to_unicode') === 'on'){
	            $sms_body = $this->utf8ToUnicodeCodePoints($sms_body);
	        }
	
	        if ($method === 'post'                 &&    //Do not encode for GET because http_build_query encodes also.
	            $url    !==  ALERT_SMS_GATEWAY_URL &&    //Do not encode for alertsms.ro (setting below did not exist before..)
	            $this->config->get('smshare_api_msg_url_encode_disabled') !== 'on'){    //Honor the setting
	            $sms_body = urlencode($sms_body);
	            
	            if ($this->config->get('smshare_cfg_log')) $this->log->write('[smshare] body was url-encoded');
	        }else{
	            if ($this->config->get('smshare_cfg_log')) $this->log->write('[smshare] body was not url-encoded');
	        }
	        
            if ($this->config->get('smshare_cfg_log')) $this->log->write('[smshare] SMS body before html_entity_decode is: ' . $sms_body);
            $sms_body = html_entity_decode($sms_body);
	        $data[$this->config->get('smshare_api_msg_var')] = $sms_body;
            if ($this->config->get('smshare_cfg_log')) $this->log->write('[smshare] SMS body after  html_entity_decode is: ' . $sms_body);
	
	
	        //Inject additionnal fields
	        $api_kv_arr = $this->config->get('smshare_api_kv');
	        if(!is_array($api_kv_arr)) $api_kv_arr = array();    //defensive, bug fix gmail#14c38e947f3b158
	
	        if($method === 'post'){

	            foreach ($api_kv_arr as $api_kv) {
	                $data[$api_kv['key']] = $api_kv['val'];
	            }
	            
	            if($url === EXPERTTEXTING_GATEWAY_URL){    //http://blog.experttexting.com/experttexting-api-in-php/
	                if ($this->config->get('smshare_cfg_log')) $this->log->write('[smshare] Gateway is experttexting');
	                $fieldstring = "Userid=" . $data['Userid'] . "&pwd=" . $data['pwd'] . "&APIKEY=" . $data['APIKEY'] . "&MSG=" . $data['MSG'] . "&FROM=" . $data['FROM'] . "&To=" . $data['To'];
	                $data = $fieldstring;
	            }
	            
	
	        }else{    //GET
	            $do_not_encode_kv = array();
	            foreach ($api_kv_arr as $api_kv) {
	                if(!isset($api_kv['encode'])) {    //No Encode. Encode must be set explicitely by the user before we encode params in http_build_query
	                    array_push($do_not_encode_kv, $api_kv['key'] . '=' . $api_kv['val']);
	                }else{
	                    $data[$api_kv['key']] = $api_kv['val'];
	                }
	            }
	
	            $request_params = http_build_query($data, '', '&');
	            if(count($do_not_encode_kv) > 0){
	                $request_params .= '&' . implode("&", $do_not_encode_kv);
	            }
	
	            if (strpos($url, '?') === false) {
	                $connector = '?';
	            }else{
	                $connector = '&';
	            }
	            $url = $url . $connector . $request_params;
	        }
	
	        if($url === ALERT_SMS_GATEWAY_URL){
	            $result = do_call_alert_sms_dot_ro($url, $data, $this);
	            
	        }else if($url === SMS_USLUGI_GATEWAY_URL){
	           $result = $this->do_call_sms_uslugi_gateway($url, $data);
	           
	        }else{
	            $result = do_call_gateway($url, $method, $data, $this);
	        }
	    }
	    
	    /*
	     * Save to db
	     */
        $this->save_sms_to_db(array(
            'to'        => $args['to']       ,
            'body'      => $args['body']     ,
            'reference' => $args['reference'],
            'comment'   => $args['comment']  ,
            'http_reply'=> $result           ,
        ));
	    
	    return $result;
	}
	
	
	/**
	 * 
	 */
	private function build_smshare_json($username, $passwd, $args) {
	
	    //Create the user
	    $smshare_user = new stdClass();
	    $smshare_user->login  = $username;
	    $smshare_user->passwd = $passwd;
	
	    //Create the smsbean
	    $smshare_smsBean = new stdClass();
	    
	    $smshare_smsBean->destination = $args['to'];    /*may be coma separated. Broadcast*/
	    $smshare_smsBean->message = html_entity_decode($args['body'], ENT_QUOTES, 'UTF-8');
	    
	    if(isset($args['scheduleTimestamp'])){    //smsreview
	        $smshare_smsBean->scheduleTimestamp = $args['scheduleTimestamp'];
	    }
	    
	
	    //Create the smshareBean
	    $smshare_json = new stdClass();
	    $smshare_json->user = $smshare_user;
	    $smshare_json->smsBean = $smshare_smsBean;
	
	    //Stringify
	    $smshare_data = json_encode($smshare_json);
	
	    return $smshare_data;
	}
	
	
	private function get_sms_price_from_smsbump_reply($json) {
	    $obj = json_decode($json, true);
	    if($obj['status'] === 'OK'){
    	    $price = $obj['data']['price'];
    	    return $price;
	    }else{
	        return 0;
	    }
	}
	
    /**
     * Save sms into DB.
     */
	private function save_sms_to_db($args){
	     
	    //comment for release
	     
	    //split to, and for each number, insert sms.
	    $dstArr = explode(",", $args['to']);
	     
	    /*
	     * Get username
	    */
	     
	    $this->load->component('smshare/dao');
	    $usernameData = $this->component_smshare_dao->get_username_sending_sms();
	     
	    $total_price_304ec = 0;
	    foreach ($dstArr as $dst) {    //handle broadcast
	        
	        /*
	         * Get the price
	         */
	        if($this->config->get('smshare_sender_profile') === 'profile_api_smsbump'){
	            $price = $this->get_sms_price_from_smsbump_reply($args['http_reply']['http_body']);
	        }else {
	            $price = $this->config->get('tv_sms_admin_sms_price_estimate');
	        }
	        
	        $total_price_304ec += $price;
	        
	        $this->component_smshare_dao->addSms(array(
	            'to'          => $dst,
	            'body'        => $args['body'],
	            'username'    => $usernameData['username'],
	            'reference'   => $args['reference'],
	            'comment'     => $args['comment'],
	            'price'       => $price,
	        ));
	    }
	    
	    //hook_e915e
	    //smsadmin: Decrement balance for successful SMS.
	}
	
	/**
	 * Android only
	 */
	public function send_bulk_sms($args){
	    
	    $this->load->helper('smshare_net');
	    
	    if ($this->config->get('config_error_log')) $this->log->write('→ smshare_json for notify customer by sms is: ' . json_encode($args['smsBeans']));
	
	    /*
	     * Send
	     */
	    $smshare_json = $this->build_sms_list_json(
    		$this->config->get('smshare_username'),
            $this->config->get('smshare_passwd')  ,
            $args['smsBeans']
        );
	
	    $result = post_json(REQUEST_PATH_SMS_BULK, $smshare_json, $this);
	    
	    /*
	     * Save to db
	     */
	    foreach ($args['smsBeans'] as $smsBean) {
	        $this->save_sms_to_db(array(
	                'to'        => $smsBean->destination,
	                'body'      => $smsBean->message    ,
	                'reference' => $args['reference']   ,
	                'comment'   => $args['comment']     ,
	                'http_reply'=> $result              ,
	        ));
	    }
	}
	
	
	private function build_sms_list_json($username, $passwd, $smsList){
	    //Create the smsList bean.
	    $smshare_json = new stdClass();
	    $smshare_json->login    = $username;
	    $smshare_json->passwd   = $passwd;
	    $smshare_json->smsBeans = $smsList;
	
	    $smshare_json = json_encode($smshare_json);
	    return $smshare_json;
	}
	
	/**
	 * Done for users with php < 5.3 that does not support anonymous functions.
	 * @param unknown $m
	 */
	private function utf8ToUnicodeCodePoints_replacement_callback($m){
	    $ord = ord($m[0]);
	
	    if ($ord <= 127) {
	        $r = sprintf('\u%04x', $ord);
	    } else {
	        $r = trim(json_encode($m[0]), '"');
	    }
	    return str_replace("\u", "", $r);  //remove \u because mobily.ws need unicode without \u
	}
	
	/**
	 * http://stackoverflow.com/questions/10100617/how-to-convert-text-to-unicode-code-point-like-u0054-u0068-u0069-u0073-using-p
	 * required for mobily.ws (arabic) that needs msg to be in unicode. Eg. test → %5Cu0074%5Cu0065%5Cu0073%5Cu0074
	 */
	public function utf8ToUnicodeCodePoints($str) {
	    if (!mb_check_encoding($str, 'UTF-8')) {
	        trigger_error('$str is not encoded in UTF-8, I cannot work like this');
	        return false;
	    }
	    $str_unicode = preg_replace_callback('/./u', array($this, "utf8ToUnicodeCodePoints_replacement_callback")/*http://stackoverflow.com/a/5530057/353985*/, $str);
	
	    return str_replace("\n", "000D", $str_unicode);    //\n was not handled before..
	}
	
	
	
	function do_call_sms_uslugi_gateway($url, $data) {
	    
	    $xml = "<?xml version='1.0' encoding='UTF-8'?>
            	<data>
            		<login>LOGIN</login>
            		<password>PASSWORD</password>
            		<action>send</action>
            		<text>TEXT</text>
            		<to number='NUMBER'></to>
	                OPTIONAL_SOURCE
            	</data>";
	    
	    $find = array(
            'LOGIN',
            'PASSWORD',
            'TEXT',
            'NUMBER',
	        'OPTIONAL_SOURCE'
	    );
	    
	    $replace = array(
            'LOGIN'           => $data['login'],
            'PASSWORD'        => $data['password'],
            'TEXT'            => $data['text'] ,
            'NUMBER'          => $data['to'],
	        'OPTIONAL_SOURCE' => $data['source'] ? "<source>" . $data['source'] . "</source>" : "" 
	    );
	    
	    $xml = str_replace($find, $replace, $xml);
	    
// 	    error_log("XML is: " . $xml);
	    $result = array();
	    
	    $ch = curl_init($url);
	    curl_setopt($ch, CURLOPT_URL, $url);
	    curl_setopt($ch, CURLOPT_FAILONERROR, 1);
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
	    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
	    curl_setopt($ch, CURLOPT_POST, 1);
	    curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
	    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	    $output = curl_exec($ch);
	    
	    if(!$output){
	        if ($this->config->get('smshare_cfg_log')) $this->log->write('[smshare] Curl error: ' . curl_error($ch));
	    }
	    
	    
	    //$xml = simplexml_load_string($output, "SimpleXMLElement", LIBXML_NOCDATA);
	    //$json = json_encode($xml);
	    //$array = json_decode($json,TRUE);
	    
	    $result['http_code'] = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// 	    $result['http_code'] = $array['code'];
// 	    $result['http_body'] = $array['descr'];
	    $result['http_body'] = $output;
	    
	    curl_close($ch);
	    return $result ;
	}
}
?>