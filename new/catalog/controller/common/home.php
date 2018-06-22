<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->load->model('catalog/review');
		$this->load->model('tool/image');
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
                }else{
                    
                        $this->document->addLink($this->config->get('config_url'), 'canonical');
                }
                
                $testimonials = $this->model_catalog_review->getHomePageTestimonials();
                //echo '<pre>'; print_r($testimonials); die();
                foreach($testimonials as $testimonial){
                    $data['testimonials'][] = array(
                        'author'    =>     $testimonial['author'],
                        'city'    =>     $testimonial['city'],
                        'text'    =>     $testimonial['text'],
                     //   'image'    =>     $this->model_tool_image->resize($testimonial['image'], 331, 205),
						  'image'    =>    $testimonial['image'],
                        'date_added'    =>     $testimonial['date_added'],
                    );
                }
              //  echo '<pre>'; print_r($data['testimonials']); die();
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
	public function callback_request(){
		$this->load->model('catalog/category');
		$name = $this->request->post['name'];
            $email = $this->request->post['email'];
            $phone = $this->request->post['phone'];
            $message = $this->request->post['message'];
            $slot = $this->request->post['slot_time'];
          //  print_r($name);
          //  print_r($email);
          //  print_r($phone);
          //  print_r($message);
            
          //  print_r($slot);
            if($this->model_catalog_category->callback($this->request->post)){
            	echo '1';
            }
	}
	
	
}
