<?php

const SMSHARE_HOST              = "https://smshare.fr";    //PHP doesn't like concat at compile time.
const REQUEST_PATH_SHARELINK    = "https://smshare.fr/service/sharelink";
const REQUEST_PATH_SMS_BULK     = "https://smshare.fr/service/sms/bulk";
const ALERT_SMS_GATEWAY_URL     = "http://alertsms.ro/ws/server.php";
const EXPERTTEXTING_GATEWAY_URL = "https://www.experttexting.com/exptapi/exptsms.asmx/SendSMS";
const GATEWAY_46ELKS_GATEWAY_URL= "https://api.46elks.com/a1/SMS";
const SMS_USLUGI_GATEWAY_URL    = "https://lcab.sms-uslugi.ru/API/XML/send.php";


function gateway_support_comma_separated_numbers($gateway, $gateway_url){
    
    if($gateway_url === EXPERTTEXTING_GATEWAY_URL) return false;
    
    if($gateway === 'profile_api_smsbump') return false;    //We know that smsbump does not support coma separated numbers. http://smsbump.com/pages/docs/send-sms-messages
}


/**
 * @return response status.
 */
function post_json($url, $postData, $This) {           
    
    if ($This->config->get('smshare_cfg_log')) $This->log->write("[smshare] postData: " . print_r($postData, true));
    
    $result = array();

    $ch = curl_init($url);                             
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");   
    curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    //curl_setopt($ch, CURLOPT_CAINFO, dirname(__FILE__)."/cacert.pem");    //because some customers has a Curl wich comes with an outdated file to authenticate HTTPS certificates from. See http://stackoverflow.com/a/316732/353985
        
    //$smshare_headers = array("Accept" => "application/json", "Content-Type" => "application/json");
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(        
        'Content-Type: application/json')     
    );//'Content-Length: ' . strlen($postData)               
                                                       
    $reply = curl_exec($ch);                          
    
    if(!$reply){
    	$err = curl_error($ch);
    	if($err){
        	$result['error'] = $err;
            if ($This->config->get('smshare_cfg_log')) $This->log->write("[smshare] Curl error: " . $err);
    	}
    }

    $result['http_code'] = curl_getinfo($ch, CURLINFO_HTTP_CODE); 
    
    if ($This->config->get('smshare_cfg_log')) $This->log->write("[smshare] Gateway reply: " . print_r($result, true));
    
    curl_close($ch);
    return $result;
}


/**
 * 
 */
function do_call_gateway($url, $method, $data, $This){
	
	$result = array();
	
	//XXX remove me
	//$result['http_code'] = "200";
	//$result['http_body'] = "ok" ;
	//return $result;
	
	// curl options:
	$options = array(
     CURLOPT_URL               => $url,
     CURLOPT_RETURNTRANSFER    => true
     //,CURLOPT_FOLLOWLOCATION => true
	);
	
	
	
	if($url === GATEWAY_46ELKS_GATEWAY_URL){
	    
	    $options[CURLOPT_USERPWD] = $data['username'] . ":" . $data['password'];
	    
	    unset($data['username']);
	    unset($data['password']);
	    
	    $data = http_build_query($data, '', '&');
	    //Passing a URL-encoded string will result in application/x-www-form-urlencoded
	    //$options[CURLOPT_HTTPHEADER] = array('Content-Type: application/x-www-form-urlencoded');
	    
	    //passing an array to CURLOPT_POSTFIELDS results in  multipart/form-data
	    //http://php.net/manual/en/function.curl-setopt.php#84916
	    
	}else if (strpos($url, '/api/v3/texting') !== false) {
	    //inject access token in header.
	    $options[CURLOPT_HTTPHEADER] = array('X-Access-Token: ' . $data['access_token']);
	    unset($data['access_token']);
	    
	    $data = http_build_query($data, '', '&');
	}
	
	
	
	if($method == 'post'){
	    $options[CURLOPT_POST]       = true;
	    $options[CURLOPT_POSTFIELDS] = $data;
	}
	
	//if ($config->get('config_error_log')) $log->write("URL  is: " . $url);
    if ($This->config->get('smshare_cfg_log')) $This->log->write("[PWS-DEBUG] data is: " . print_r($data, true));
	//if ($config->get('config_error_log')) $log->write("options is: " . print_r($options, true));
	
	
	// init the resource: curl handle
	$ch = curl_init();
	curl_setopt_array($ch, $options);
	
	$output = curl_exec($ch);    //get response
	if(!$output){
	    if ($This->config->get('smshare_cfg_log')) $This->log->write('[smshare] Curl error: ' . curl_error($ch));
	}
    
    $result['http_code'] = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $result['http_body'] = $output;
    
    if ($This->config->get('smshare_cfg_log')) $This->log->write("[smshare] Gateway reply: " . print_r($result, true));
    
	curl_close($ch);
	return $result;
}

/**
 * 
 */
function do_call_alert_sms_dot_ro($url, $data, $This){
	
	$result = array();
	
	require_once __DIR__ ."/smshare/third_party/nusoap.php";
	
	$client = new nusoap_client($url);
	$error = $client->getError();
	
	if ($error) {
	    if ($This->config->get('smshare_cfg_log')) $This->log->write("[smshare] alertsms.ro constructor error" . $error);
	}
	
	/*
	 * Sort the data array. Variable order in array is important for nusoap.php this is crazy.
	 */
	$sorted_data = array(
	        "token" => $data["token"],
	        "numar" => $data["numar"],
	        "mesaj" => $data["mesaj"],
	);
	$data = $sorted_data;
	
	/*
	 * Send
	 */
	$resp = $client->call("trimiteSms", $data);
	
	if ($client->fault) {
	    $output = print_r($resp, true);
    	$result['error'] = $output;
	    
	}else {
	    $error = $client->getError();
	
	    if ($error) {
	        $output = $error;
        	$result['error'] = $output;
	    }
	    else {
	        $output = var_export($resp, true);
        	$result['http_body'] = $output;
	    }
	}

	return $result;
}
