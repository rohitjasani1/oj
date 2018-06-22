<?php
/**
 * 
 * @version 1.1
 * @author donghai <donghai90@gmail.com>
 * @copyright (c) 2016-08-11, http://www.kuaidi.com
 * 
 */
class Controllermodulekdtracker extends Controller {
	private $error = array(); 
	
	public function index() {
		//加载语言文件
		$this->load->language('module/kdtracker');
		
		//设置titile
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			//编辑
                        //var_dump($this->request->post);
			$this->model_setting_setting->editSetting('kdtracker', $this->request->post);			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
                
                $data['help_info'] = $this->language->get('help_info');
		$data['help_info_list1'] = $this->language->get('help_info_list1');
                $data['help_info_list2'] = $this->language->get('help_info_list2');
		$data['help_info_list3'] = $this->language->get('help_info_list3');
                
                $data['kdtracker_email_entry'] = $this->language->get('kdtracker_email_entry');
                $data['email_status'] = $this->language->get('email_status');
		//授权的key
		$data['entry_key'] = $this->language->get('entry_key');		
		//保存
		$data['button_save'] = $this->language->get('button_save');
		//取消
		$data['button_cancel'] = $this->language->get('button_cancel');
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
 		if (isset($this->error['code'])) {
			$data['error_code'] = $this->error['code'];
		} else {
			$data['error_code'] = '';
		}
                if (isset($this->error['code1'])) {
			$data['error_code1'] = $this->error['code1'];
		} else {
			$data['error_code1'] = '';
		}
		
		$data['breadcrumbs'] = array();

 		$data['breadcrumbs'][] = array(
     		'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
    		'separator' => false
 		);

 		$data['breadcrumbs'][] = array(
     		'text'      => $this->language->get('text_module'),
				'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
    		'separator' => ' :: '
 		);
	
 		$data['breadcrumbs'][] = array(
     		'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('module/kdtracker', 'token=' . $this->session->data['token'], 'SSL'),
    		'separator' => ' :: '
 		);
		
		$data['action'] = $this->url->link('module/kdtracker', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		//获取KEY
		if (isset($this->request->post['kdtracker_key'])) {
			$data['kdtracker_key'] = $this->request->post['kdtracker_key'];
		} else {
			$data['kdtracker_key'] = $this->config->get('kdtracker_key');
		}
                //获取邮件状态
		if (isset($this->request->post['kdtracker_email_status'])) {
			$data['kdtracker_email_status'] = $this->request->post['kdtracker_email_status'];
		} else {
			$data['kdtracker_email_status'] = $this->config->get('kdtracker_email_status');
		}
                
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/kdtracker.tpl', $data));
	}

	/*
         * 验证表单输入
         */
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/kdtracker')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['kdtracker_key']) {
			$this->error['code'] = $this->language->get('error_code');
		}
                if (!$this->request->post['kdtracker_email_status']) {
			$this->error['code1'] = $this->language->get('error_no_choose');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>