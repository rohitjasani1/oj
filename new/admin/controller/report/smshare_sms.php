<?php
class ControllerReportSmshareSms extends Controller {
	
	public function index() {
		$this->load->language('report/smshare_sms');

		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->request->get['filter_date_start'])) {
			$filter_date_start = $this->request->get['filter_date_start'];
		} else {
			$filter_date_start = '';
		}

		if (isset($this->request->get['filter_date_end'])) {
			$filter_date_end = $this->request->get['filter_date_end'];
		} else {
			$filter_date_end = '';
		}
		
		if (isset($this->request->get['filter_reference'])) {
			$filter_reference = $this->request->get['filter_reference'];
		} else {
			$filter_reference = '';
		}
		
		if (isset($this->request->get['filter_username'])) {
			$filter_username = $this->request->get['filter_username'];
		} else {
			$filter_username = '';
		}
		
		if (isset($this->request->get['filter_comment'])) {
			$filter_comment = $this->request->get['filter_comment'];
		} else {
			$filter_comment = '';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}
		
		if (isset($this->request->get['filter_reference'])) {
			$url .= '&filter_reference=' . $this->request->get['filter_reference'];
		}
		
		if (isset($this->request->get['filter_username'])) {
			$url .= '&filter_username=' . $this->request->get['filter_username'];
		}
		
		if (isset($this->request->get['filter_comment'])) {
			$url .= '&filter_comment=' . $this->request->get['filter_comment'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('report/smshare_sms', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		//remove me
		$this->load->model('report/marketing');

		$this->load->model('report/smshare_sms');

		$data['smsBeans'] = array();

		$filter_data = array(
			'filter_date_start'	=> $filter_date_start,
			'filter_date_end'	=> $filter_date_end,
			'filter_reference'	=> $filter_reference,
			'filter_username'	=> $filter_username,
			'filter_comment'	=> $filter_comment,
		    'sort'              => 'id',
		    'order'             => 'DESC',
			'start'             => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'             => $this->config->get('config_limit_admin')
		);

		$smsbeans_total = $this->model_report_smshare_sms->get_total_sms_beans($filter_data);

		$results = $this->model_report_smshare_sms->get_sms_beans($filter_data);

		$price_total = 0;
		foreach ($results as $result) {
			$action = array();

			//$action[] = array(
			//	'text' => $this->language->get('text_edit'),
			//	'href' => $this->url->link('marketing/marketing/edit', 'token=' . $this->session->data['token'] . '&marketing_id=' . $result['marketing_id'] . $url, 'SSL')
			//);

			$converted_and_formated_sms_price = $this->currency->format($result['price'], $this->config->get('tv_sms_admin_currency'));
			
			$data['smsBeans'][] = array(
				'to'       => $result['to'],
				'username' => $result['username'],
				'reference'=> $result['reference'],
				'comment'  => $result['comment'],
				'price'    => $converted_and_formated_sms_price,
			);
			
		    $price_total += $result['price'];
		}
		
		$data['price_total'] = $this->currency->format($price_total, $this->config->get('tv_sms_admin_currency'));
		
		/*
		 * Spent today
		 */
		$data['spent_today']      = $this->get_total_spent_by_period('NOW');
		$data['spent_this_week']  = $this->get_total_spent_by_period('monday this week');
		$data['spent_this_month'] = $this->get_total_spent_by_period('first day of this month');
		$data['spent_this_year']  = $this->get_total_spent_by_period('first day of January this year');
		
		//spent this month
		
		//spent this year

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_all_status'] = $this->language->get('text_all_status');

		$data['column_to']      = $this->language->get('column_to');
		$data['column_price']   = $this->language->get('column_price');
		$data['column_from']    = $this->language->get('column_from');
		$data['column_comment'] = $this->language->get('column_comment');
		$data['column_user']    = $this->language->get('column_user');
		$data['column_action']  = $this->language->get('column_action');

		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_filter'] = $this->language->get('button_filter');

		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		$url = '';

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}
		
		if (isset($this->request->get['filter_reference'])) {
			$url .= '&filter_reference=' . $this->request->get['filter_reference'];
		}

		if (isset($this->request->get['filter_username'])) {
		    $url .= '&filter_username=' . $this->request->get['filter_username'];
		}
		
		if (isset($this->request->get['filter_comment'])) {
		    $url .= '&filter_comment=' . $this->request->get['filter_comment'];
		}

		$pagination = new Pagination();
		$pagination->total = $smsbeans_total;
		$pagination->page  = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url   = $this->url->link('report/smshare_sms', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($smsbeans_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($smsbeans_total - $this->config->get('config_limit_admin'))) ? $smsbeans_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $smsbeans_total, ceil($smsbeans_total / $this->config->get('config_limit_admin')));

		$data['filter_date_start'] = $filter_date_start;
		$data['filter_date_end']   = $filter_date_end;
		$data['filter_reference']  = $filter_reference;
		$data['filter_username']   = $filter_username;
		$data['filter_comment']    = $filter_comment;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('report/smshare_sms.tpl', $data));
	}
	
	/**
	 * 
	 */
	private function get_total_spent_by_period($period) {
	    $filter_date = new DateTime($period);
	    $filter_date->setTime(0, 0, 0);
	    //echo $filter_date->format('c') . "<br>";
	    
	    $filter_data = array(
            'filter_date_start'	=> $filter_date->format('c'  /*mysql 'Y-m-d H:i:s' */),
	    );
	    
	    $results = $this->model_report_smshare_sms->get_sms_beans($filter_data);
	    
	    $spent_total = 0;
	    foreach ($results as $result) {
	        $spent_total += $result['price'];
	    }	 
	    
	    return $this->currency->format($spent_total, $this->config->get('tv_sms_admin_currency'));   
	}
}