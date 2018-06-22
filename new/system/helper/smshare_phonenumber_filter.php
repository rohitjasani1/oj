<?php


// Function for basic field validation (present and neither empty nor only white space
function isNullOrEmptyString($question){
    return (!isset($question) || trim($question)==='');
}

function startsWith($haystack, $needle){
    return !strncmp($haystack, $needle, strlen($needle));
}

function endsWith($haystack, $needle){
    $length = strlen($needle);
    if ($length == 0) {
        return true;
    }

    return (substr($haystack, -$length) === $needle);
}

function replace_first($string, $search, $replace) {
    $pos = strpos($string, $search);
    if ($pos === 0) {
        $newstring = substr_replace($string,$replace,$pos,strlen($search));
        return $newstring;
    }
    return $string;
}



function doGetOrderTotal($rows, $This){
    foreach ($rows as $row) {
        $_title = $row['code'];    //was 'title', but title was translated to Arabic, so it won't match on 'Total'

        if($_title === 'total'){
            return html_entity_decode($row['value'], ENT_NOQUOTES, 'UTF-8');
        }
    }

    if ($This->config->get('config_error_log')) $This->log->write('[smshare] Total was not found as title in the order row. This means that order_total subtitution has failed.');

    return 0;
}



function replace_smshare_variables($template, $order_info, $smshare_order_total=''){

    $find = array(
            '{firstname}',
            '{lastname}',
            '{order_id}',
            '{phonenumber}',
            '{total}',
            '{store_url}',
            '{shipping_address_1}',
            '{shipping_address_2}',
            '{shipping_postcode}' ,
            '{shipping_city}'     ,
            '{shipping_region}'   ,
            '{shipping_country}'  ,
            '{payment_address_1}' ,
            '{payment_address_2}' ,
            '{payment_postcode}'  ,
            '{payment_city}'      ,
            '{payment_region}'    ,
            '{payment_country}'   ,
            '{payment_method}'    ,
            '{shipping_method}'   ,
    );

    $replace = array(
            'firstname'          => $order_info['firstname'],
            'lastname'           => $order_info['lastname'],
            'order_id'           => isset($order_info['order_id']) ? $order_info['order_id'] : "" ,
            'phonenumber'        => $order_info['telephone'],
            'total'              => $smshare_order_total,
            'store_url'          => isset($order_info['store_url']) ? $order_info['store_url'] : HTTP_CATALOG,
            'shipping_address_1' => isset($order_info['shipping_address_1']) ? $order_info['shipping_address_1'] : "",
            'shipping_address_2' => isset($order_info['shipping_address_2']) ? $order_info['shipping_address_2'] : "",
            'shipping_postcode'  => isset($order_info['shipping_postcode'])  ? $order_info['shipping_postcode'] : "",
            'shipping_city'      => isset($order_info['shipping_city'])      ? $order_info['shipping_city'] : "",
            'shipping_region'    => isset($order_info['shipping_zone'])      ? $order_info['shipping_zone'] : "",
            'shipping_country'   => isset($order_info['shipping_country'])   ? $order_info['shipping_country'] : "",
            'payment_address_1'  => isset($order_info['payment_address_1'])  ? $order_info['payment_address_1'] : "",
            'payment_address_2'  => isset($order_info['payment_address_2'])  ? $order_info['payment_address_2'] : "",
            'payment_postcode'   => isset($order_info['payment_postcode'])   ? $order_info['payment_postcode'] : "",
            'payment_city'       => isset($order_info['payment_city'])       ? $order_info['payment_city'] : "",
            'payment_region'     => isset($order_info['payment_zone'])       ? $order_info['payment_zone'] : "",
            'payment_country'    => isset($order_info['payment_country'])    ? $order_info['payment_country'] : "",
            'payment_method'     => isset($order_info['payment_method'])     ? $order_info['payment_method'] : "",
            'shipping_method'    => isset($order_info['shipping_method'])    ? $order_info['shipping_method'] : ""
    );

    $message = str_replace($find, $replace, $template);
    return $message;
}

/**
 * Number filtering is applied to one number only which is the customer number.
 * TODO rename to passTheStartsWithFilter
 */
function isNumberAuthorized($number, $patterns){

	//check that the number is not null and is not empty
	if(isNullOrEmptyString($number)){
		return false;
	}

	//if no patterns return true
	if(isNullOrEmptyString($patterns)){
		return true;
	}

	//split patterns by comma into an array
	$patternArr = explode(",", $patterns);

	foreach ($patternArr as $pattern) {
		if(startsWith($number, $pattern)){
			return true;
		}
	}

	return false;
}

function passTheNumberSizeFilter($number, $size){

	if(isNullOrEmptyString($number)){
		return false;
	}

	if(isNullOrEmptyString($size)){
		return true;
	}

	return strlen($number) == $size;
}



/**
 * @return boolean true if the number passes the filter, thus the sms should be sent. False otherwise.
 */
function pass_filters($number, $This){
    $smshare_patterns   = $This->config->get('smshare_config_number_filtering');
    $number_size_filter = $This->config->get('smshare_cfg_num_filt_by_size');
     
    $pass = isNumberAuthorized($number,      $smshare_patterns) &&
            passTheNumberSizeFilter($number, $number_size_filter);
     
    if($pass === false){
        if ($This->config->get('config_error_log')) $This->log->write("[smshare] Phone number: $number does not pass filters");
    }
     
    return $pass;
}

/**
 * 
 */
function rewritePhoneNumber($number, $This){
    
    //need to be backported to core1
    $rewritten = str_replace(array('-', ' ', '.'), '', $number);
    
	//if search is not empty.
	if(! isNullOrEmptyString($This->config->get('smshare_cfg_number_rewriting_search'))) {
	    
		$rewritten = replace_first($rewritten, $This->config->get('smshare_cfg_number_rewriting_search'), $This->config->get('smshare_cfg_number_rewriting_replace'));
		
        if ($This->config->get('config_error_log')) $This->log->write('[smshare] Phone number rewrite from: ' . $number . " to: " . $rewritten);
	}

    
	return $rewritten;
}
