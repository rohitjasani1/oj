<?php

/**
 * 
 * @version 1.1
 * @author donghai <donghai90@gmail.com>
 * @copyright (c) 2016-08-11, http://www.kuaidi.com
 * 
 */
include DIR_APPLICATION . '../system/vendor/KuaidiAPI.php';

class ControllerSaleKdtrackerOrder extends Controller {

    private $error = array();

    public function index() {
        $this->load->language('module/kdtracker');
        $this->document->setTitle($this->language->get('text_kdtracker'));
        $this->load->model('sale/kdtracker_order');
        $this->getList();
    }

    public function edit() {
        $this->load->language('module/kdtracker');
        $this->document->setTitle($this->language->get('heading_title_add_tracking'));
        $this->load->model('sale/kdtracker_order');

        $data['heading_title'] = $this->language->get('heading_title_add_tracking');
        $data['text_edit'] = $this->language->get('text_edit');
        $result = $this->model_sale_kdtracker_order->getOrderTracking($this->request->get['order_id']);

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            //编辑

            $this->model_sale_kdtracker_order->editTrackingNumber($this->request->post['order_id'], $this->request->post['tracking_number']);

            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->url->link('sale/kdtracker_order', 'token=' . $this->session->data['token'], 'SSL'));
        }

        //授权的key
        $data['entry_key'] = $this->language->get('entry_edit_key');
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

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_kdtracker'),
            'href' => $this->url->link('sale/kdtracker_order', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title_add_tracking'),
            'href' => $this->url->link('sale/kdtracker_order/edit', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['action'] = $this->url->link('sale/kdtracker_order/edit', 'token=' . $this->session->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('sale/kdtracker_order', 'token=' . $this->session->data['token'], 'SSL');

        //获取KEY
        if (isset($this->request->post['tracking_number'])) {
            $data['tracking_number'] = $this->request->post['tracking_number'];
        } else {
            $data['tracking_number'] = $result['tracking_number'];
        }
        if ($this->request->get['order_id']) {
            $data['order_id'] = $this->request->get['order_id'];
        } else {
            $this->response->redirect($this->url->link('sale/kdtracker_order', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('sale/kdtracker_order_edit.tpl', $data));
    }

    public function view() {
        $this->load->language('sale/order');
        $this->load->language('module/kdtracker');

        $data['view_order_id'] = $this->language->get('view_order_id');
        $data['view_tracking_info'] = $this->language->get('view_tracking_info');
        $data['view_tracking_status'] = $this->language->get('view_tracking_status');
        $data['view_update_time'] = $this->language->get('view_update_time');
        $data['view_company'] = $this->language->get('view_company');

        $data['title'] = $this->language->get('view_heading_title');

        if ($this->request->server['HTTPS']) {
            $data['base'] = HTTPS_SERVER;
        } else {
            $data['base'] = HTTP_SERVER;
        }

        $data['direction'] = $this->language->get('direction');
        $data['lang'] = $this->language->get('code');

        $data['text_invoice'] = $this->language->get('view_heading_title');
        $data['text_order_detail'] = $this->language->get('text_order_detail');
        $data['text_order_id'] = $this->language->get('text_order_id');
        $data['text_invoice_no'] = $this->language->get('text_invoice_no');
        $data['text_invoice_date'] = $this->language->get('text_invoice_date');
        $data['text_date_added'] = $this->language->get('text_date_added');
        $data['text_telephone'] = $this->language->get('text_telephone');
        $data['text_fax'] = $this->language->get('text_fax');
        $data['text_email'] = $this->language->get('text_email');
        $data['text_website'] = $this->language->get('text_website');
        $data['text_payment_address'] = $this->language->get('text_payment_address');
        $data['text_shipping_address'] = $this->language->get('text_shipping_address');
        $data['text_payment_method'] = $this->language->get('text_payment_method');
        $data['text_shipping_method'] = $this->language->get('text_shipping_method');
        $data['text_comment'] = $this->language->get('text_comment');

        $data['column_product'] = $this->language->get('column_product');
        $data['column_model'] = $this->language->get('column_model');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_price'] = $this->language->get('column_price');
        $data['column_total'] = $this->language->get('column_total');

        $this->load->model('sale/order');

        $this->load->model('setting/setting');

        $data['orders'] = array();

        $orders = array();

        if (isset($this->request->post['selected'])) {
            $orders = $this->request->post['selected'];
        } elseif (isset($this->request->get['order_id'])) {
            $orders[] = $this->request->get['order_id'];
        }

        foreach ($orders as $order_id) {
            $order_info = $this->model_sale_order->getOrder($order_id);

            if ($order_info) {
                $store_info = $this->model_setting_setting->getSetting('config', $order_info['store_id']);

                if ($store_info) {
                    $store_address = $store_info['config_address'];
                    $store_email = $store_info['config_email'];
                    $store_telephone = $store_info['config_telephone'];
                    $store_fax = $store_info['config_fax'];
                } else {
                    $store_address = $this->config->get('config_address');
                    $store_email = $this->config->get('config_email');
                    $store_telephone = $this->config->get('config_telephone');
                    $store_fax = $this->config->get('config_fax');
                }

                if ($order_info['invoice_no']) {
                    $invoice_no = $order_info['invoice_prefix'] . $order_info['invoice_no'];
                } else {
                    $invoice_no = '';
                }

                if ($order_info['payment_address_format']) {
                    $format = $order_info['payment_address_format'];
                } else {
                    $format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
                }

                $find = array(
                    '{firstname}',
                    '{lastname}',
                    '{company}',
                    '{address_1}',
                    '{address_2}',
                    '{city}',
                    '{postcode}',
                    '{zone}',
                    '{zone_code}',
                    '{country}'
                );

                $replace = array(
                    'firstname' => $order_info['payment_firstname'],
                    'lastname' => $order_info['payment_lastname'],
                    'company' => $order_info['payment_company'],
                    'address_1' => $order_info['payment_address_1'],
                    'address_2' => $order_info['payment_address_2'],
                    'city' => $order_info['payment_city'],
                    'postcode' => $order_info['payment_postcode'],
                    'zone' => $order_info['payment_zone'],
                    'zone_code' => $order_info['payment_zone_code'],
                    'country' => $order_info['payment_country']
                );

                $payment_address = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

                if ($order_info['shipping_address_format']) {
                    $format = $order_info['shipping_address_format'];
                } else {
                    $format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
                }

                $find = array(
                    '{firstname}',
                    '{lastname}',
                    '{company}',
                    '{address_1}',
                    '{address_2}',
                    '{city}',
                    '{postcode}',
                    '{zone}',
                    '{zone_code}',
                    '{country}'
                );

                $replace = array(
                    'firstname' => $order_info['shipping_firstname'],
                    'lastname' => $order_info['shipping_lastname'],
                    'company' => $order_info['shipping_company'],
                    'address_1' => $order_info['shipping_address_1'],
                    'address_2' => $order_info['shipping_address_2'],
                    'city' => $order_info['shipping_city'],
                    'postcode' => $order_info['shipping_postcode'],
                    'zone' => $order_info['shipping_zone'],
                    'zone_code' => $order_info['shipping_zone_code'],
                    'country' => $order_info['shipping_country']
                );

                $shipping_address = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

                $this->load->model('tool/upload');

                $product_data = array();

                $products = $this->model_sale_order->getOrderProducts($order_id);

                foreach ($products as $product) {
                    $option_data = array();

                    $options = $this->model_sale_order->getOrderOptions($order_id, $product['order_product_id']);

                    foreach ($options as $option) {
                        if ($option['type'] != 'file') {
                            $value = $option['value'];
                        } else {
                            $upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

                            if ($upload_info) {
                                $value = $upload_info['name'];
                            } else {
                                $value = '';
                            }
                        }

                        $option_data[] = array(
                            'name' => $option['name'],
                            'value' => $value
                        );
                    }

                    $product_data[] = array(
                        'name' => $product['name'],
                        'model' => $product['model'],
                        'option' => $option_data,
                        'quantity' => $product['quantity'],
                        'price' => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
                        'total' => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value'])
                    );
                }

                $voucher_data = array();

                $vouchers = $this->model_sale_order->getOrderVouchers($order_id);

                foreach ($vouchers as $voucher) {
                    $voucher_data[] = array(
                        'description' => $voucher['description'],
                        'amount' => $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value'])
                    );
                }

                $total_data = array();

                $totals = $this->model_sale_order->getOrderTotals($order_id);

                foreach ($totals as $total) {
                    $total_data[] = array(
                        'title' => $total['title'],
                        'text' => $this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value']),
                    );
                }

                $data['orders'][] = array(
                    'order_id' => $order_id,
                    'invoice_no' => $invoice_no,
                    'date_added' => date($this->language->get('date_format_short'), strtotime($order_info['date_added'])),
                    'store_name' => $order_info['store_name'],
                    'store_url' => rtrim($order_info['store_url'], '/'),
                    'store_address' => nl2br($store_address),
                    'store_email' => $store_email,
                    'store_telephone' => $store_telephone,
                    'store_fax' => $store_fax,
                    'email' => $order_info['email'],
                    'telephone' => $order_info['telephone'],
                    'shipping_address' => $shipping_address,
                    'shipping_method' => $order_info['shipping_method'],
                    'payment_address' => $payment_address,
                    'payment_method' => $order_info['payment_method'],
                    'product' => $product_data,
                    'voucher' => $voucher_data,
                    'total' => $total_data,
                    'comment' => nl2br($order_info['comment'])
                );
            }
        }
        $this->tracking($data);
    }

    protected function tracking($data) {

        $order_id = (int) $this->request->get['order_id'];
        $this->load->model('sale/kdtracker_order');
        $result = $this->model_sale_kdtracker_order->getOrderTracking($order_id);
        if ($result['tracking_status'] == 6) {
            $res = unserialize($result['tracking_info']);
            $data['company'] = $result['ship_company'];
        } else {
            $this->load->model('setting/setting');
            $key = $this->config->get('kdtracker_key');
            $key = trim($key);
            $key = rtrim($key);
            $kuaidi = new KuaidiAPI($key);

            $res = $kuaidi->query($result['tracking_number']);
            if ($res['success']) {
                $this->model_sale_kdtracker_order->saveTracking($result['id_kdtracker'], $res);
                $data['company'] = $res['exname'] . '[' . $res['company'] . ']';
            } else {
                $data['error'] = $res['reason'];
                $res = unserialize($result['tracking_info']);
                $data['company'] = $result['ship_company'];
            }
        }
        if (!isset($data['error'])) {
            $data['phone'] = $res['phone'];
            $data['url'] = $res['url'];
            $data['nu'] = $res['nu'];
            $express = $this->language->get('express');
            $data['status'] = $express[$res['status']];
            $data['ico'] = $res['ico'];
            $data['tracking_info'] = $res['data'];
        }
        $this->response->setOutput($this->load->view('sale/kdtracker_order_tracking.tpl', $data));
    }

    protected function getList() {
        if (isset($this->request->get['filter_order_id'])) {
            $filter_order_id = $this->request->get['filter_order_id'];
        } else {
            $filter_order_id = null;
        }
        if (isset($this->request->get['filter_tracking_number'])) {
            $filter_tracking_number = $this->request->get['filter_tracking_number'];
        } else {
            $filter_tracking_number = null;
        }

        if (isset($this->request->get['filter_customer'])) {
            $filter_customer = $this->request->get['filter_customer'];
        } else {
            $filter_customer = null;
        }

        if (isset($this->request->get['filter_order_status'])) {
            $filter_order_status = $this->request->get['filter_order_status'];
        } else {
            $filter_order_status = null;
        }

        if (isset($this->request->get['filter_total'])) {
            $filter_total = $this->request->get['filter_total'];
        } else {
            $filter_total = null;
        }

        if (isset($this->request->get['filter_date_added'])) {
            $filter_date_added = $this->request->get['filter_date_added'];
        } else {
            $filter_date_added = null;
        }

        if (isset($this->request->get['filter_date_modified'])) {
            $filter_date_modified = $this->request->get['filter_date_modified'];
        } else {
            $filter_date_modified = null;
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'o.order_id';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'DESC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['filter_order_id'])) {
            $url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
        }
        if (isset($this->request->get['filter_tracking_number'])) {
            $url .= '&filter_tracking_number=' . $this->request->get['filter_tracking_number'];
        }

        if (isset($this->request->get['filter_customer'])) {
            $url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_order_status'])) {
            $url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
        }

        if (isset($this->request->get['filter_total'])) {
            $url .= '&filter_total=' . $this->request->get['filter_total'];
        }

        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
        }

        if (isset($this->request->get['filter_date_modified'])) {
            $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
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
            'text' => $this->language->get('text_kdtracker'),
            'href' => $this->url->link('sale/kdtracker_order', 'token=' . $this->session->data['token'] . $url, 'SSL')
        );

        $data['invoice'] = $this->url->link('sale/order/invoice', 'token=' . $this->session->data['token'], 'SSL');
        $data['shipping'] = $this->url->link('sale/order/shipping', 'token=' . $this->session->data['token'], 'SSL');
        $data['add'] = $this->url->link('sale/order/add', 'token=' . $this->session->data['token'], 'SSL');

        $data['orders'] = array();

        $filter_data = array(
            'filter_order_id' => $filter_order_id,
            'filter_tracking_number' => $filter_tracking_number,
            'filter_customer' => $filter_customer,
            'filter_order_status' => $filter_order_status,
            'filter_total' => $filter_total,
            'filter_date_added' => $filter_date_added,
            'filter_date_modified' => $filter_date_modified,
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $order_total = $this->model_sale_kdtracker_order->getTotalOrders($filter_data);

        $results = $this->model_sale_kdtracker_order->getOrders($filter_data);
        $express = $this->language->get('express');
        foreach ($results as $result) {
            $data['orders'][] = array(
                'order_id' => $result['order_id'],
                'customer' => $result['customer'],
                'status' => $result['status'],
                'total' => $this->currency->format($result['total'], $result['currency_code'], $result['currency_value']),
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'date_modified' => date($this->language->get('date_format_short'), strtotime($result['date_modified'])),
                'shipping_code' => $result['shipping_code'],
                'tracking_number' => $result['tracking_number'],
                'tracking_status' =>  isset($express[$result['tracking_status']])?$express[$result['tracking_status']]:'',
                'email' => $result['email'],
                'telephone' => $result['telephone'],
                'view' => $this->url->link('sale/kdtracker_order/view', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'] . $url, 'SSL'),
                'edit' => $this->url->link('sale/kdtracker_order/edit', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'] . $url, 'SSL'),
            );
        }

        $data['heading_title'] = $this->language->get('text_kdtracker');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');
        $data['text_missing'] = $this->language->get('text_missing');
        $data['text_loading'] = $this->language->get('text_loading');

        $data['column_order_id'] = $this->language->get('column_order_id');
        $data['column_customer'] = $this->language->get('column_customer');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_total'] = $this->language->get('column_total');
        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_date_modified'] = $this->language->get('column_date_modified');
        $data['column_action'] = $this->language->get('column_action');
        $data['column_kdtracker_number'] = $this->language->get('column_kdtracker_number');
        $data['column_email'] = $this->language->get('column_email');
        $data['column_telephone'] = $this->language->get('column_telephone');
        $data['text_column_empty'] = $this->language->get('text_column_empty');
        $data['view_tracking_status'] = $this->language->get('view_tracking_status');

        $data['entry_return_id'] = $this->language->get('entry_return_id');
        $data['entry_order_id'] = $this->language->get('entry_order_id');
        $data['entry_customer'] = $this->language->get('entry_customer');
        $data['entry_order_status'] = $this->language->get('entry_order_status');
        $data['entry_total'] = $this->language->get('entry_total');
        $data['entry_date_added'] = $this->language->get('entry_date_added');
        $data['entry_date_modified'] = $this->language->get('entry_date_modified');

        $data['button_refresh'] = $this->language->get('button_refrsh');

        $data['button_invoice_print'] = $this->language->get('button_invoice_print');
        $data['button_shipping_print'] = $this->language->get('button_shipping_print');
        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_filter'] = $this->language->get('button_filter');
        $data['button_view'] = $this->language->get('button_view');
        $data['button_ip_add'] = $this->language->get('button_ip_add');

        $data['token'] = $this->session->data['token'];

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array) $this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if (isset($this->request->get['filter_order_id'])) {
            $url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
        }
        if (isset($this->request->get['filter_tracking_number'])) {
            $url .= '&filter_tracking_number=' . $this->request->get['filter_tracking_number'];
        }

        if (isset($this->request->get['filter_customer'])) {
            $url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_order_status'])) {
            $url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
        }

        if (isset($this->request->get['filter_total'])) {
            $url .= '&filter_total=' . $this->request->get['filter_total'];
        }

        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
        }

        if (isset($this->request->get['filter_date_modified'])) {
            $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
        }

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_order'] = $this->url->link('sale/kdtracker_order', 'token=' . $this->session->data['token'] . '&sort=o.order_id' . $url, 'SSL');
        $data['sort_customer'] = $this->url->link('sale/kdtracker_order', 'token=' . $this->session->data['token'] . '&sort=customer' . $url, 'SSL');
        $data['sort_status'] = $this->url->link('sale/kdtracker_order', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
        $data['sort_total'] = $this->url->link('sale/kdtracker_order', 'token=' . $this->session->data['token'] . '&sort=o.total' . $url, 'SSL');
        $data['sort_date_added'] = $this->url->link('sale/kdtracker_order', 'token=' . $this->session->data['token'] . '&sort=o.date_added' . $url, 'SSL');
        $data['sort_date_modified'] = $this->url->link('sale/kdtracker_order', 'token=' . $this->session->data['token'] . '&sort=o.date_modified' . $url, 'SSL');

        $url = '';

        if (isset($this->request->get['filter_order_id'])) {
            $url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
        }
        if (isset($this->request->get['filter_tracking_number'])) {
            $url .= '&filter_tracking_number=' . $this->request->get['filter_tracking_number'];
        }

        if (isset($this->request->get['filter_customer'])) {
            $url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_order_status'])) {
            $url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
        }

        if (isset($this->request->get['filter_total'])) {
            $url .= '&filter_total=' . $this->request->get['filter_total'];
        }

        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
        }

        if (isset($this->request->get['filter_date_modified'])) {
            $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $order_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('sale/kdtracker_order', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($order_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($order_total - $this->config->get('config_limit_admin'))) ? $order_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $order_total, ceil($order_total / $this->config->get('config_limit_admin')));

        $data['filter_order_id'] = $filter_order_id;
        $data['filter_tracking_number'] = $filter_tracking_number;
        $data['filter_customer'] = $filter_customer;
        $data['filter_order_status'] = $filter_order_status;
        $data['filter_total'] = $filter_total;
        $data['filter_date_added'] = $filter_date_added;
        $data['filter_date_modified'] = $filter_date_modified;

        $this->load->model('localisation/order_status');

        $data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['store'] = HTTPS_CATALOG;

        // API login
        $this->load->model('user/api');

        $api_info = $this->model_user_api->getApi($this->config->get('config_api_id'));

        if ($api_info) {
            $data['api_id'] = isset($api_info['api_id'])?$api_info['api_id']:'';
            $data['api_key'] = isset($api_info['key'])?$api_info['key']:'';
            $data['api_ip'] = $this->request->server['REMOTE_ADDR'];
        } else {
            $data['api_id'] = '';
            $data['api_key'] = '';
            $data['api_ip'] = '';
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('sale/kdtracker_order_list.tpl', $data));
    }

    /*
     * 验证表单输入
     */

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'sale/kdtracker_order')) {
            $this->error['warning'] = $this->language->get('error_edit_permission');
        }

        if (!$this->request->post['tracking_number']) {
            $this->error['code'] = $this->language->get('error_edit_code');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 查询符合条件的订单数目
     */
    public function refresh() {
        $this->load->model('sale/kdtracker_order');
        $result = $this->model_sale_kdtracker_order->getTrackingTotals_status_6();
        $json['page'] = ceil($result['total'] / 20);
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    /*
     * 分段刷新订单物流
     */

    public function refresh_step() {
        $limit = (int) $this->request->post['limit'];
        $start = ($limit - 1) * 20;
        $end = $limit * 20;
        $this->load->model('sale/kdtracker_order');

        $result = $this->model_sale_kdtracker_order->getTrackings_Status_6($start, $end);
        //获取api的key，生成对象
        $this->load->model('setting/setting');
        $key = rtrim(trim($this->config->get('kdtracker_key')));
        $kuaidi = new KuaidiAPI($key);
        //获取物流邮件发送状态
        $tracking_mail_status = $this->config->get('kdtracker_email_status');

       
        
        foreach ($result as $value) {
             //配置email
            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
            $mail->setFrom($this->config->get('config_mail_smtp_username'));//$this->config->get('config_email')
            $mail->setSender(html_entity_decode('http://kuaidi.com', ENT_QUOTES, 'UTF-8'));
            $json = array();
            $json['error'] = 0;
            $ret = $this->refresh_data($kuaidi, $value, $mail, $tracking_mail_status);
            if (!$ret) {
                $json['error']+=1;
            }
        }
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    protected function refresh_data($obj, $data, $mailObj, $emailSendConfig) {
        $res = $obj->query($data['tracking_number']);
        if ($res['success']) {
            $needSend = FALSE;
            $newStatus = $res['status'];
            $newUpdateDate = $this->lasttime($res['data']);
            $oldStatus = $data['tracking_status'];
            $info = unserialize($data['tracking_info']);
            if ($data['tracking_info']) {
                $oldUpdateDate = $this->lasttime($info['data']);
            } else {
                $oldUpdateDate = '';
            }

            //判断发送物流邮件的状态
            if ($emailSendConfig == 1) { //每次物流变化的时候
                if ($oldUpdateDate != $newUpdateDate) {
                    $needSend = true;
                }
            }
            if ($emailSendConfig == 2) { //发货，在途，签收 
                if ($newStatus != $oldStatus) {
                    $needSend = true;
                }
            }
            if ($emailSendConfig == 3) { //只有签收的时候
                if ($newStatus == 6 && $oldStatus != 6) {
                    $needSend = true;
                }
            }
            if ($emailSendConfig == 4) { //只有签收的时候
               $needSend = true;
            }
            $this->model_sale_kdtracker_order->saveTracking($data['id_kdtracker'], $res);            
            if ($needSend) {
                $mailInfo = $this->parseTemplate($res);
                $mailObj->setTo($data['email']);
                $mailObj->setSubject(html_entity_decode($mailInfo['mailsubject'], ENT_QUOTES, 'UTF-8'));
                $mailObj->setHtml($mailInfo['mailbody']);
                $err=$mailObj->send();
            }

            return true;
        } else {
            return false;
        }
    }

    protected function emailTemplate() {
        $cache = new Cache('file');
        $resource = $cache->get('tdtracker_email_template');
        if ($resource) {
            return $resource;
        } else {
            $tpl = file_get_contents('http://global.kuaidi.com/email/index.html');
            $cache->set('tdtracker_email_template', $tpl);
            return $tpl;
        }
    }

    protected function parseTemplate($result) {
        $this->load->language('module/kdtracker');
        $tpl = $this->emailTemplate();
        $tracking_status = $this->language->get('express');
        $tracking_status = $tracking_status[$result['status']];
        $shippingstatus = $this->language->get('express_desc');
        $desc = $shippingstatus[$result['status']];

        $trackingnumber = $result['nu'];
        $phone = $result['phone'];
        $courier = $result['company'];
        $lastinfo = $result['data'][0]['time'] . '  ' . $result['data'][0]['context'];
        $detaillink = 'http://global.kuaidi.com/query.html?nus=' . $result['nu'];

        $tpl = str_replace('$text_status', $desc, $tpl);
        $tpl = str_replace('$text_trackingnumber', $trackingnumber, $tpl);
        $tpl = str_replace('$text_shippingstatus', $tracking_status, $tpl);
        $tpl = str_replace('$text_courier', $courier, $tpl);
        $tpl = str_replace('$text_phone', $phone, $tpl);
        $tpl = str_replace('$text_lastinfo', $lastinfo, $tpl);
        $tpl = str_replace('$text_detaillink', $detaillink, $tpl);

        $return['mailsubject'] = 'Tracking Info ' . $trackingnumber;
        $return['mailbody'] = $tpl;
        return $return;
    }

    protected function lasttime($data) {
        $lastt = 0;
        foreach ($data as $item) {
            $t = strtotime($item['time']);
            if ($t > $lastt) {
                $lastt = $t;
            }
        }
        return $lastt;
    }

}
