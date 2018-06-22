<?php
class ControllerModuleSmshare extends Controller {
	private $error = array(); 
	
	public function install() {
	    $defaultSettings = array(
	        "smshare_cfg_log" => true,
	    );
	    
		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('smshare', $defaultSettings);
		
		
	    $this->load->model('module/smshare');
	    $this->model_module_smshare->install();
	}
	
	public function index() {
		
		//Seems to be available in a "default" language object. See controller/common/header.php @0ce36
		$data['direction'] = $this->language->get('direction');
		
		//Load the language file for this module
		$this->load->language('module/smshare');

		$this->document->setTitle($this->language->get('heading_title'));
		
		//Load the settings model. You can also add any other models you want to load here.
		$this->load->model('setting/setting');
		
		$this->load->model('extension/event');
		
		//for test
		//$this->event->trigger('post.customer.add', $_POST);
		
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

		    /*
		     * Data cleaning.
		     */
			if ( isset( $_POST['smshare_api_kv'] ) )
			{

			    foreach ( $_POST['smshare_api_kv'] as $index => $api_kv )
			    {
					if($api_kv['key'] == ""){
						unset( $_POST['smshare_api_kv'][$index] );
					}
			    }
			    $this->request->post["smshare_api_kv"] = $_POST['smshare_api_kv'];
			}

			/*
			 * Clean observers with status==0
			 */
			if ( isset( $_POST['smshare_cfg_odr_observers'] ) ){
			
				foreach ( $_POST['smshare_cfg_odr_observers'] as $index => $api_kv )
				{
					if($api_kv['key'] == "0"){
						unset( $_POST['smshare_cfg_odr_observers'][$index] );
					}
				}
				$this->request->post["smshare_cfg_odr_observers"] = $_POST['smshare_cfg_odr_observers'];
			}
				
			
			/*
			 *  ______               _       
			 * |  ____|             | |      
			 * | |____   _____ _ __ | |_ ___ 
			 * |  __\ \ / / _ \ '_ \| __/ __|
			 * | |___\ V /  __/ | | | |_\__ \
			 * |______\_/ \___|_| |_|\__|___/
			 *                               
			 */
			//because events are register based on module name, we can't unregister just one event when its options is disabled (it will delete all smshare events)
			//This is why, we delete events and then recreate them based on enabled options.
			//may be we could pass a more specific module name to addEvent like smshare.customer.add, smshare.order.add...
			
			//unregister
			$this->model_extension_event->deleteEvent('smshare');
			
			if ($_POST['smshare_config_notify_customer_by_sms_on_registration'] || $_POST['smshare_cfg_ntfy_admin_by_sms_on_reg']){
				//registration happens on front office, so listener is defined in catalog.
				$this->model_extension_event->addEvent('smshare', 'post.customer.add', 'module/smshare/send_sms_on_registration_callback');
			}
			
			//vqmod
			//if ($_POST['smshare_config_notify_customer_by_sms_on_checkout'] || $_POST['smshare_config_notify_admin_by_sms_on_checkout']){
			//	//Checkout happens on front office, so listener is defined in catalog.
			//	$this->model_extension_event->addEvent('smshare', 'post.order.add', 'module/smshare/send_sms_on_new_order');
			//}
			
			
			$this->model_setting_setting->editSetting('smshare', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		// This is how the language gets pulled through from the language file.
		//
		// If you want to use any extra language items - ie extra text on your admin page for any reason,
		// then just add an extra line to the $text_strings array with the name you want to call the extra text,
		// then add the same named item to the $_[] array in the language file.
		//
		// See admin/language/english/module/smshare.php for the
		// other required part.
		
		$text_strings = array(
			'heading_title',
			'text_enabled',
			'text_disabled',
			'text_left',
			'text_right',
			'text_home',
			'text_yes',
			'text_no',
			'smshare_entry_username',
			'smshare_entry_passwd',
			'smshare_entry_notify_customer_by_sms_on_registration',
			'smshare_entry_notify_customer_by_sms_on_registration_help',
			'smshare_entry_cstmr_reg_available_vars',
			'smshare_entry_notify_customer_by_sms_on_checkout',
			'smshare_entry_notify_customer_by_sms_on_checkout_help',
			'smshare_entry_ntfy_admin_by_sms_on_reg',
			'smshare_entry_ntfy_admin_by_sms_on_reg_help',
			'smshare_entry_notify_admin_by_sms_on_checkout',
			'smshare_entry_notify_admin_by_sms_on_checkout_help',
			'smshare_entry_notify_extra_by_sms_on_checkout',
			'smshare_entry_notify_extra_by_sms_on_checkout_help',
			'button_save',
			'button_cancel'
		);
		
		foreach ($text_strings as $text) {
			$data[$text] = $this->language->get($text);
		}
		
		/*
		 * Inject supported languages.
		 */
		
		$this->load->model('localisation/language');
		
		$data['languages'] = array();
		
		$results = $this->model_localisation_language->getLanguages();
		
		foreach ($results as $result) {
		    if ($result['status']) {
		        $data['languages'][] = array(
		                'name'  => $result['name'],
		                'code'  => $result['code'],
		                'image' => isset($result['image']) ? $result['image'] : '',
		        );
		    }
		}
		
		//END LANGUAGE


 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}


		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_module'),
      		'separator' => ' :: '
   		);
		
   		$data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('module/smshare', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('module/smshare', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		/*
		 * order statuses
		 */
		$this->load->model('localisation/order_status');
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		//The following code pulls in the required data from either config files or user
		//submitted data (when the user presses save in admin). Add any extra config data
		// you want to store.
		//
		// NOTE: These must have the same names as the form data in your smshare.tpl file
		$config_data = array(
			'smshare_username',
			'smshare_passwd',
			
			"smshare_sender_profile",
			"smshare_api_url",
			"smshare_api_dest_var",
			"smshare_api_msg_var",
			"smshare_api_msg_to_unicode",
	        "smshare_api_msg_url_encode_disabled",
			"smshare_api_http_method",
			"smshare_api_kv",

			'smshare_config_notify_customer_by_sms_on_registration',
			'smshare_config_notify_customer_by_sms_on_checkout',
			'smshare_cfg_donotsend_sms_on_checkout_coupon_keywords',
			'smshare_cfg_ntfy_admin_by_sms_on_reg',
			'smshare_config_notify_admin_by_sms_on_checkout',
			'smshare_config_notify_extra_by_sms_on_checkout',
			"smshare_cfg_odr_observers",
			
			'smshare_cfg_sms_tmpl_for_admin_notif_on_reg',
			'smshare_config_sms_template_for_storeowner_notif_on_checkout',
			
	        'smshare_cfg_on_registration_customer_tmpls',
	        'smshare_cfg_on_checkout_customer_tmpls',
		        
			'smshare_cfg_number_rewriting_search' ,
			'smshare_cfg_number_rewriting_replace',

			'smshare_config_number_filtering',
			'smshare_cfg_num_filt_by_size'   ,
		    'smshare_cfg_log'                ,
		);
		
		/*
		 * Inject data from config into the data (to be displayed)
		 */
		foreach ($config_data as $conf) {
			if (isset($this->request->post[$conf])) {
				$data[$conf] = $this->request->post[$conf];
			} else {

				$data[$conf] = $this->config->get($conf);
				
				if(empty($data[$conf])){
					
					if($conf == 'smshare_config_sms_template_for_storeowner_notif_on_checkout'){
						$data[$conf] = "{default_template}";
						
					}else if($conf == 'smshare_cfg_on_registration_customer_tmpls'){
						$data[$conf] = array();
					    
					}else if($conf == 'smshare_cfg_on_checkout_customer_tmpls'){
						$data[$conf] = array();
					    
					}
				}
			}
		}			
				
		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('module/smshare.tpl', $data));
	}
	
	/**
	 * server side customer add?
	 * @event: post.customer.add
	 */
	public function send_sms_on_registration_callback($customer_id){
		$this->load->model('sale/customer');
		
		$customer = $this->model->sale->customer->getCustomer($customer_id);
		
		error_log("[smshare] server side customer add?. customer registered: " . $customer['firstname']);
		
	}
	
}