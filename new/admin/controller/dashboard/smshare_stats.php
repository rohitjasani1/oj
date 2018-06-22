<?php
class ControllerDashboardSmshareStats extends Controller {
	public function index() {
		$this->load->language('dashboard/smshare_stats');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		// Total Orders
		$this->load->model('report/customer');
		
		//$data['smshare_credit'] = $this->config->get('tv_sms_admin_currency') . $this->config->get('tv_sms_admin_credit');
		
		$converted_balance = $this->currency->convert($this->config->get('tv_sms_admin_credit'), 'USD', $this->config->get('tv_sms_admin_currency'));
		$formated_balance  = $this->currency->format($converted_balance, $this->config->get('tv_sms_admin_currency'));
		//$data['smshare_credit'] = '<span style="font-size: 12px;">' . $this->config->get('tv_sms_admin_currency') . '</span>' . $converted_balance;
		$data['smshare_credit'] = '<span style="font-size: 40px;">' . $formated_balance . '</span>';
		
		$data['stats_link'] = $this->url->link('report/smshare_sms', 'token=' . $this->session->data['token'], 'SSL');

		return $this->load->view('dashboard/smshare_stats.tpl', $data);
	}
}
