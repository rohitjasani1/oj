<?php
class ControllerMarketingSmshareSMS21 extends Controller {
	private $error = array();

	public function index() {
		
		$this->load->language('marketing/contact');
		$this->load->language('marketing/smshare_sms');
		
		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_default'] = $this->language->get('text_default');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_customer_all'] = $this->language->get('text_customer_all');
		$data['text_customer'] = $this->language->get('text_customer');
		$data['text_customer_group'] = $this->language->get('text_customer_group');
		$data['text_affiliate_all'] = $this->language->get('text_affiliate_all');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_product'] = $this->language->get('text_product');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_to'] = $this->language->get('entry_to');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_customer'] = $this->language->get('entry_customer');
		$data['entry_affiliate'] = $this->language->get('entry_affiliate');
		$data['entry_product'] = $this->language->get('entry_product');
		$data['entry_message'] = $this->language->get('entry_message');

		$data['help_customer'] = $this->language->get('help_customer');
		$data['help_affiliate'] = $this->language->get('help_affiliate');
		$data['help_product'] = $this->language->get('help_product');

		$data['button_send'] = $this->language->get('button_send');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['token'] = $this->session->data['token'];

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('marketing/smshare_sms', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['cancel'] = $this->url->link('marketing/smshare_sms', 'token=' . $this->session->data['token'], 'SSL');

		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		
        $this->load->model('customer/customer_group');

		$data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();
		

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('marketing/smshare_sms21.tpl', $data));
	}

	public function send() {
		$this->load->language('marketing/contact');
		$this->load->language('marketing/smshare_sms');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			if (!$this->request->post['message']) {
				$json['error']['message'] = $this->language->get('error_message');
			}

			if (!$json) {
				$this->load->model('setting/store');

				$store_info = $this->model_setting_store->getStore($this->request->post['store_id']);

				if ($store_info) {
					$store_name = $store_info['name'];
				} else {
					$store_name = $this->config->get('config_name');
				}

				$this->load->model('customer/customer');
				
				$this->load->model('customer/customer_group');
				
				$this->load->model('marketing/affiliate');
				
				$this->load->model('sale/order');
				

				if (isset($this->request->get['page'])) {
					$page = $this->request->get['page'];
				} else {
					$page = 1;
				}

				$dstCount = 0;

				$emails = array();
				$results= array();

				switch ($this->request->post['to']) {
					case 'newsletter':
						$customer_data = array(
							'filter_newsletter' => 1,
							'start'             => ($page - 1) * 10,
							'limit'             => 10
						);

						$dstCount = $this->model_customer_customer->getTotalCustomers($customer_data);

						$results = $this->model_customer_customer->getCustomers($customer_data);

// 						foreach ($results as $result) {
// 							$emails[] = $result['telephone'];
// 						}
						break;
					case 'customer_all':
						$customer_data = array(
							'start'  => ($page - 1) * 10,
							'limit'  => 10
						);

						$dstCount = $this->model_customer_customer->getTotalCustomers($customer_data);

						$results = $this->model_customer_customer->getCustomers($customer_data);

// 						foreach ($results as $result) {
// 							$emails[] = $result['telephone'];
// 						}
						break;
					case 'customer_group':
						$customer_data = array(
							'filter_customer_group_id' => $this->request->post['customer_group_id'],
							'start'                    => ($page - 1) * 10,
							'limit'                    => 10
						);

						$dstCount = $this->model_customer_customer->getTotalCustomers($customer_data);

						$results = $this->model_customer_customer->getCustomers($customer_data);

// 						foreach ($results as $result) {
// 							$emails[$result['customer_id']] = $result['telephone'];
// 						}
						break;
					case 'customer':
						if (!empty($this->request->post['customer'])) {
							foreach ($this->request->post['customer'] as $customer_id) {
								$customer_info = $this->model_customer_customer->getCustomer($customer_id);

// 								if ($customer_info) {
// 									$emails[] = $customer_info['telephone'];
// 								}
								$results[] = $customer_info;
							}
						}
						break;
					case 'affiliate_all':
						$affiliate_data = array(
							'start'  => ($page - 1) * 10,
							'limit'  => 10
						);

						$dstCount = $this->model_marketing_affiliate->getTotalAffiliates($affiliate_data);

						$results = $this->model_marketing_affiliate->getAffiliates($affiliate_data);

// 						foreach ($results as $result) {
// 							$emails[] = $result['telephone'];
// 						}
						break;
					case 'affiliate':
						if (!empty($this->request->post['affiliate'])) {
							foreach ($this->request->post['affiliate'] as $affiliate_id) {
								$affiliate_info = $this->model_marketing_affiliate->getAffiliate($affiliate_id);

// 								if ($affiliate_info) {
// 									$emails[] = $affiliate_info['telephone'];
// 								}

								$results[] = $affiliate_info;
							}
						}
						break;
					case 'product':
						if (isset($this->request->post['product'])) {
							$dstCount = $this->model_sale_order->getTotalTelephonesByProductsOrdered($this->request->post['product']);

							$rows= $this->model_sale_order->getCustomerIdsByProductsOrdered($this->request->post['product'], ($page - 1) * 10, 10);
							

							foreach ($rows as $row){
								$customer_info = $this->model_customer_customer->getCustomer($row['customer_id']);
								$results[] = $customer_info;
							}
							

// 							foreach ($results as $result) {
// 								$emails[] = $result['telephone'];
// 							}
						}
						break;
				}

				if ($results) {
					
					//Hook smsadmin to do balance check here.
					//hook_b438a
					
					if (!$json){    //smsadmin may populate json with an error when balance is insufficient.
						
					    $this->load->helper('smshare_phonenumber_filter');
					    
						if($this->config->get('smshare_sender_profile') == 'profile_android') {    //Send using android
							$sms_gateway_reply = $this->filter_destinations_and_send_bulk_sms($results);
							$json['success'] = "";
						}else{    //Sending grouped SMS list to gateway requires more attention as you can see below.
							$sms_gateway_reply = $this->filter_destinations_and_send_bulk_sms_or_loop($results, $json);
						}
						
						$start = ($page - 1) * 10;
						$end = $start + 10;
	
						if(array_key_exists('success', $json)){
						    
						    
    						if ($end < $dstCount) {
    							$json['success'] = sprintf($this->language->get('text_sent'), $start, $dstCount) . $json['success'];
    						} else {
    							$json['success'] = $this->language->get('text_success') . $json['success'];
    						}
						}
	
						if ($end < $dstCount) {
							$json['next'] = str_replace('&amp;', '&', $this->url->link('marketing/smshare_sms/send', 'token=' . $this->session->data['token'] . '&page=' . ($page + 1), 'SSL'));
						} else {
							$json['next'] = '';
						}
						
					}
					
				}else{
					$json['error']['warning'] = "No contact found, no SMS was sent!";
					
				}
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	
	private function filter_destinations_and_send_bulk_sms($results){
		$smsBeans = array();
	
		$smshare_patterns   = $this->config->get('smshare_config_number_filtering');
		$number_size_filter = $this->config->get('smshare_cfg_num_filt_by_size');
	
		foreach ($results as $result) {
				
			if(! isNumberAuthorized($result['telephone'], $smshare_patterns) ||
			   ! passTheNumberSizeFilter($result['telephone'], $number_size_filter)
			){
				continue;
			}
				
			//Variable substitution in the SMS body
			$message = html_entity_decode($this->request->post['message'], ENT_QUOTES, 'UTF-8');
			$message = replace_smshare_variables($message, $result, 0);
				
			//Create the smsbean
			$smsBean = new stdClass();
			$smsBean->destination = rewritePhoneNumber($result['telephone'], $this);
			$smsBean->message     = $message;
	
			//push sms to the list
			$smsBeans[] = $smsBean;
		}
	
		$this->load->component('smshare/net');
		return $this->component_smshare_net->send_bulk_sms(array(
	        'smsBeans'  => $smsBeans,
	        'reference' => 'Marketing',
	        'comment'   => $this->request->post['comment'],
		));
	}
	
	/**
	 * If all messages are the same, we just join phone numbers and make one request to the gateway.
	 * Else, we make as much requests to the gateway as there are phonenumber.
	 */
	private function filter_destinations_and_send_bulk_sms_or_loop($results, &$json){
	
		$smshare_patterns   = $this->config->get('smshare_config_number_filtering');
		$number_size_filter = $this->config->get('smshare_cfg_num_filt_by_size');
	
		/*
		 *
		 */
		$smshare_smsBeans = array();
		foreach ($results as $result) {
				
			if(! isNumberAuthorized($result['telephone'], $smshare_patterns) ||
			   ! passTheNumberSizeFilter($result['telephone'], $number_size_filter)
			){
				continue;
			}
				
			//Variable substitution in the SMS body
			$message = html_entity_decode($this->request->post['message'], ENT_QUOTES, 'UTF-8');
			$message = replace_smshare_variables($message, $result, 0);
				
			//Create the smsbean
			$smshare_smsBean = new stdClass();
			$smshare_smsBean->destination = $result['telephone'];
			$smshare_smsBean->message     = $message;
				
			$smshare_smsBeans[] = $smshare_smsBean;
		}
	
		/*
		 *
		 */
		$messages_are_equals = true;
	
		if(count($smshare_smsBeans) == 0) return "✘ There is no SMS to send";
	
		$previous_message = $smshare_smsBeans[0]->message;
	
		foreach ($smshare_smsBeans as $smshare_smsBean){
			$current_message = $smshare_smsBean->message;
			if($current_message != $previous_message){
				$messages_are_equals = false;
				break;
			}else{
				$previous_message = $current_message;
			}
		}
	
		$gateway = $this->config->get('smshare_sender_profile');
		$gateway_url = $this->config->get('smshare_api_url');
		$this->load->helper('smshare_net');
		if($messages_are_equals && gateway_support_comma_separated_numbers($gateway, $gateway_url)){
				
			/*
			 * Get phones
			 */
			$phones = array();
			foreach ($results as $result) {
				$phones[] = $result['telephone'];
			}
				
			/*
			 * Remove duplicate
			 */
			$phones = array_unique($phones);
			
			if ($phones) {
	
				/*
				 * Send 1 SMS to multiple destinations (coma separated, hopefuly the gateway will supports it)
				 */
	
				//PHONE NUMBER REWRITING
				$dstArr = array();
				foreach ($phones as $phone) {
					array_push($dstArr, rewritePhoneNumber($phone, $this));
				}
	
				$destinations = implode(",", $dstArr);
				
				
				$this->load->component('smshare/net');
				$reply = $this->component_smshare_net->send_sms(array(
			        'to'        => $destinations, 
				    'body'      => $previous_message,
				    'reference' => "Marketing",
				    'comment'   => $this->request->post['comment'],
				));
				
				if(isset($reply['error'])){
					$json['error']['warning'] = $reply['error']; 
				}else{
					$json['success'] = print_r($reply, true);
// 					$json['success'] = json_encode($reply);
				}
				
// 				$this->log->write("json: " . print_r($json, true));
			}
			
		}else{
			
			$success_replies = array();
			$failure_replies = array();
			
			/*
			 * Send N requests.
			 */
			foreach ($smshare_smsBeans as $smshare_smsBean) {
	
				//PHONE NUMBER REWRITING
				$phone_rewritten = rewritePhoneNumber($smshare_smsBean->destination, $this);
	
				$this->load->component('smshare/net');
				$reply = $this->component_smshare_net->send_sms(array(
			        'to'        => $phone_rewritten, 
				    'body'      => $smshare_smsBean->message,
			        'reference' => "Marketing",
			        'comment'   => $this->request->post['comment'],
				));
				
				if(isset($reply['error'])){
				    $failure_replies[] = $reply['error'];
				}else{
				    $success_replies[] = $reply['http_body'];
				}
				
			}
			
			$json['success']          = implode("<br/>", $success_replies);
			$json['error']['warning'] = implode("<br/>", $failure_replies);
			
			error_log("json: " . print_r($json, true));
		}
	}
}