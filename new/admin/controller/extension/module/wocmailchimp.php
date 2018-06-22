<?php

class ControllerExtensionModuleWocmailchimp extends Controller {
	
	private $error 						= array();
	private $version 					= '1.0.1';
	private $extension 					= 'wocmailchimp';
	private $type 						= 'module';
	private $db_table					= 'woc_mailchimp';
	private $oc_extension				= '';
	
	public function index() { 
		 $this->load->language('extension/module/wocmailchimp'); 
		 $this->load->model('setting/setting'); 

		//Set title from language file
		$this->document->setTitle($this->language->get('heading_title'));
		
		$data = array();
		
		//Save settings
		if (isset($this->request->post['wocmailchimp_api_key'])) {
			 $data = $this->request->post;
			 $this->model_setting_setting->editSetting('wocmailchimp', $this->request->post);
					
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		} else {
			 $data['wocmailchimp_api_key'] = $this->config->get('wocmailchimp_api_key');
			 $data['wocmailchimp_list_id'] = $this->config->get('wocmailchimp_list_id');
			// $this->log->write($data);
		}
		
		$text_strings = array(
				'heading_title',
				'button_save',
				'button_cancel',
				'button_add_module',
				'button_remove',
				'placeholder',
		);
		
		foreach ($text_strings as $text) {
			$data[$text] = $this->language->get($text);
		}
		
		 // This Block returns the warning if any
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
     
        // This Block returns the error code if any
        if (isset($this->error['code'])) {
            $data['error_code'] = $this->error['code'];
        } else {
            $data['error_code'] = '';
        }     
		
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/wocmailchimp', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('extension/module/wocmailchimp', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');

		$data['session'] = $this->session->data['token'];

		// This block parses the status (enabled / disabled)
        if (isset($this->request->post['wocmailchimp_status'])) {
            $data['wocmailchimp_status'] = $this->request->post['wocmailchimp_status'];
        } else {
            $data['wocmailchimp_status'] = $this->config->get('wocmailchimp_status');
        }

		// This block parses the status (enabled / disabled)
        if (isset($this->request->post['wocmailchimp_api_key'])) {
            $data['wocmailchimp_api_key'] = $this->request->post['wocmailchimp_api_key'];
        } else {
            $data['wocmailchimp_api_key'] = $this->config->get('wocmailchimp_api_key');
        }

		// This block parses the status (enabled / disabled)
        if (isset($this->request->post['wocmailchimp_list_id'])) {
            $data['wocmailchimp_list_id'] = $this->request->post['wocmailchimp_list_id'];
        } else {
            $data['wocmailchimp_list_id'] = $this->config->get('wocmailchimp_list_id');
        }

		//Prepare for display
		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		//Send the output
		$this->response->setOutput($this->load->view('extension/module/wocmailchimp.tpl', $data));
	}

    public function uninstall() {
   	$this->load->model('setting/setting');
	$this->model_setting_setting->deleteSetting('wocmailchimp');
   }

	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/wocmailchimp')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}

}
?>
