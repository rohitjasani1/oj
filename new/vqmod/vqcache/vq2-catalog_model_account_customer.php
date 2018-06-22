<?php
class ModelAccountCustomer extends Model {
	public function addCustomer($data) {
		if (isset($data['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($data['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $data['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$this->load->model('account/customer_group');

		$customer_group_info = $this->model_account_customer_group->getCustomerGroup($customer_group_id);

		$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET customer_group_id = '" . (int)$customer_group_id . "', store_id = '" . (int)$this->config->get('config_store_id') . "', language_id = '" . (int)$this->config->get('config_language_id') . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']['account']) ? json_encode($data['custom_field']['account']) : '') . "', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', newsletter = '1', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '1', approved = '" . (int)!$customer_group_info['approval'] . "', date_added = NOW()");

		$customer_id = $this->db->getLastId();

		//$this->db->query("INSERT INTO " . DB_PREFIX . "address SET customer_id = '" . (int)$customer_id . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', company = '" . $this->db->escape($data['company']) . "', address_1 = '" . $this->db->escape($data['address_1']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', city = '" . $this->db->escape($data['city']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "', custom_field = '" . $this->db->escape(isset($data['custom_field']['address']) ? json_encode($data['custom_field']['address']) : '') . "'");

		//$address_id = $this->db->getLastId();

			if($this->xtensions->isActive() && isset($data['noaddress']) && $data['noaddress']){
				$this->db->query("DELETE FROM " . DB_PREFIX . "address WHERE customer_id = '" . (int)$customer_id . "' AND address_id ='".$address_id. "'");
				$address_id = 0;
			}
		

		//$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$customer_id . "'");

		$this->load->language('mail/customer');

		$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

		
		$message='<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<body>
		
<table style="font-family: Arial, Helvetica, sans-serif;" align="center" bgcolor="#ffffff" cellpadding="0" width="650px" cellspacing="0" border="0">
	<tbody>
		<tr>
			<td><table align="center" width="100%" bgcolor="#ffffff" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td width="100%" height="10"></td>
						</tr>
						<tr>
						<tr>
								<td align="center" width="100%" height="70"><a href="https://www.ornatejewels.com/"><img src="http://i.imgur.com/yB2UX14.png"  alt="Welcome to Ornate." style="display:block; border:none; vertical-align:bottom ; max-width:257px;"></a></td>
						</tr>
					</tbody>
				</table>
				<table align="center" width="100%" bgcolor="#ffffff" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td width="100%" height="10"></td>
						</tr>
						<tr>
							<td width="100%" height="5"><hr size="1" width="100%" color="#b8b8b8"></td>
						</tr>
						<tr>
							<td align="center"><table align="center" width="100%" border="0" cellpadding="0" cellspacing="0">
									<tbody>
										<tr>
                      <td  width="55px" style="height:30px;background:#fff;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/" target="_blank" style="color:#504f4e; text-decoration:none;">Home</a></td>
                      <td width="3"></td>
                      <td width="55px" style="height:30px;background:#fff;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/rings" target="_blank" style="color:#504f4e; text-decoration:none;">Rings</a></td>
                      <td width="4"></td>
                      <td width="91px" style="height:30px;background:#fff;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/earrings" target="_blank" style="color:#504f4e; text-decoration:none;">Earrings</a></td>
                      <td width="3px"></td>
                      <td width="90px" style="height:30px;background:#fff;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/necklaces" target="_blank" style="color:#504f4e; text-decoration:none;">Necklaces</a></td>
                      <td width="3px"></td>
                      <td width="100px" align="center" valign="middle"  style="height:30px;background:#fff;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/bracelets" target="_blank" style="color:#504f4e; text-decoration:none;">Bracelets</a></td>
		
		
<td  width="100px" align="center" style="height:30px;background:#fff;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/collections " target="_blank" style="color:#504f4e; text-decoration:none;"> Collections </a></td>
<td  width="100px" align="center" style="height:30px;background:#fff;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/999-Deals" target="_blank" style="color:#504f4e; text-decoration:none;">999 Deals</a></td>
                      <td width="7px"></td>
                      <td width="90px" align="center" valign="bottom"  style="height:30px;background:#fff;text-align:center; font-family: sans-serif; text-transform:uppercase; color:#504f4e; font-size:14px; vertical-align: middle;">
<a href="https://www.ornatejewels.com/kids-jewels" target="_blank" style="color:#504f4e; text-decoration:none;">
                        <div>Kids Jewels</div>
                        </a></td>
       
                    </tr>
									</tbody>
								</table></td>
						</tr>
						<tr>
							<td width="100%" height="5"><hr size="1" width="100%" color="#b8b8b8"></td>
						</tr>
					</tbody>
				</table>
				<table align="center" width="100%" bgcolor="#ffffff" cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<tr>
							<td width="100%" height="20"></td>
						</tr>
						<tr>
							<td width="100%" align="center"><div>
									<p style="margin:0px; padding:0px; font-size:14px; color:#494949;">'.$this->db->escape($data['firstname']).'</p>
									<h1 style="margin:10px 0; padding:0px; margin-bottom:5px; font-size:30px; color:#cc2229; font-weight:normal">CONGRATULATIONS!</h1>
									<p style="margin:0px; padding:0px; font-size:14px; color:#494949;">You have successfully created a new account with ornatejewels.</p>
								</div></td>
						</tr>
						<tr>
							<td width="100%" height="30"></td>
						</tr>
						<tr>
							<td width="100%"><a href="https://www.ornatejewels.com/" target="_blank"><img src="http://imgur.com/ToMSapY.png" alt="Welcome! "/></a></td>
						</tr>
				
						 	<tr>
							<td width="100%" height="20"></td>
						</tr>
		
						<tr>
					        <td style="padding-top:10px;"><a href="https://www.ornatejewels.com/collections" target="_blank">
                                                 <img src="http://i.imgur.com/HCYTnf4.jpg" alt="Collection"/></a>
                                                 </td>
						</tr>
						<tr>
                                                    <td height="350" align="center" valign="middle">
                                                        <a href="https://www.ornatejewels.com/necklaces" target="_blank"><img src="http://i.imgur.com/8aEEFKG.jpg" alt="necklaces"></a>
                                                        <a href="https://www.ornatejewels.com/blue-hues" target="_blank" style="margin-left: 33px"><img src="http://i.imgur.com/sP2QKJ2.jpg" alt="Blue Hues"></a>
                                                    </td>
						</tr>
						<tr>
							<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
	                                         <tr>
							<td width="100%" height="10"><hr size="1" width="100%" color="#b8b8b8"></td>
						</tr>
						<tr>
							<td width="100%" height="6"></td>
						</tr>
	<tr>
		<td><table width="190" style="text-align:center;" height="35" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td><a href="https://www.facebook.com/ornatejewelscom" target="_blank"><img src="http://i.imgur.com/5YW9Bsk.jpg" width="28" height="28"  alt="Facebook"/></a></td>
		<td>&nbsp;</td>
		<td><a href="https://twitter.com/ornatejewelscom" target="_blank"><img src="http://i.imgur.com/zyTB1Vj.jpg" width="28" height="28"  alt="twitter"/></a></td>
		<td>&nbsp;</td>
		<td><a href="https://plus.google.com/102333590500856537008" target="_blank"><img src="http://i.imgur.com/tI5y7wU.jpg" width="28" height="28"  alt="google-plus"/></a></td>
 		<td>&nbsp;</td>
		
		<td><a href="https://in.pinterest.com/ornatejewels/" target="_blank"><img src="http://i.imgur.com/klqZO8p.jpg" width="28" height="28"  alt="pinterest"/></a></td>
		<td>&nbsp;</td>
	</tr>
</table>
</td>
	</tr>
	<tr>
		<td height="40" align="center" style="font-size:18px; color:#333;" valign="middle"><span style="color:#c24a26;">Call :</span> +91-8600718666 &nbsp;&nbsp;  |&nbsp;&nbsp;   <span style="color:#c24a26;">Email :</span> <a href="mailto:sales@ornatejewels.com" target="_blank" style="outline:none; color:#333; text-decoration:none;">sales@ornatejewels.com</a> </td>
	</tr>
     <tr>
		<td height="30" align="center" style="font-size:13px; line-height:19px; color:#626262; height:20px; padding: 10px 0px 0px 0px;" valign="middle">Online  Jewelry Shopping  Website - Delivering across India.</td>
	</tr>
	<tr>
		<td height="40" align="center" style="font-size:13px;" valign="middle">&copy; 2017 www.ornatejewels.com All rights reserved.</td>
	</tr>
	<tr>
		<td height="10" bgcolor="#582d1e" style="font-size:5px;" headers="5">&nbsp;</td>
	</tr>
</table>
		
							</td>
						</tr>
					</tbody>
				</table></td>
		</tr>
	</tbody>
</table>
		
</body>
</html>';
		
		
		
		//$message = sprintf($this->language->get('text_welcome'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";

		//if (!$customer_group_info['approval']) {
	//		$message .= $this->language->get('text_login') . "\n";
	//	} else {
	//		$message .= $this->language->get('text_approval') . "\n";
	//	}

	//	$message .= $this->url->link('account/login', '', true) . "\n\n";
	//	$message .= $this->language->get('text_services') . "\n\n";
	//	$message .= $this->language->get('text_thanks') . "\n";
	//	$message .= html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');

		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($data['email']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender($this->config->get('config_name'));
		$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
		$mail->setHtml(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
		$mail->send();

		// Send to main admin email if new account email is enabled
		if (in_array('account', (array)$this->config->get('config_mail_alert'))) {
			$message  = $this->language->get('text_signup') . "\n\n";
			$message .= $this->language->get('text_website') . ' ' . html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8') . "\n";
			$message .= $this->language->get('text_firstname') . ' ' . $data['firstname'] . "\n";
			$message .= $this->language->get('text_lastname') . ' ' . $data['lastname'] . "\n";
			$message .= $this->language->get('text_customer_group') . ' ' . $customer_group_info['name'] . "\n";
			$message .= $this->language->get('text_email') . ' '  .  $data['email'] . "\n";
			$message .= $this->language->get('text_telephone') . ' ' . $data['telephone'] . "\n";

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode($this->language->get('text_new_customer'), ENT_QUOTES, 'UTF-8'));
			$mail->setText($message);
			//$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
			//$mail->setHtml(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
			
			// Send to additional alert emails if new account email is enabled
			$emails = explode(',', $this->config->get('config_alert_email'));

			foreach ($emails as $email) {
				if (utf8_strlen($email) > 0 && filter_var($email, FILTER_VALIDATE_EMAIL)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
		}

		return $customer_id;
	}

	public function editCustomer($data) {
		$customer_id = $this->customer->getId();

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']) ? json_encode($data['custom_field']) : '') . "' WHERE customer_id = '" . (int)$customer_id . "'");
	}

	public function editPassword($email, $password) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($password)))) . "', code = '' WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}

	public function editCode($email, $code) {
		$this->db->query("UPDATE `" . DB_PREFIX . "customer` SET code = '" . $this->db->escape($code) . "' WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}

	public function editNewsletter($newsletter) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET newsletter = '" . (int)$newsletter . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
	}

	public function getCustomer($customer_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row;
	}

	public function getCustomerByEmail($email) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}
	public function getDeliveredPincode($pincode){
		$query = $this->db->query("SELECT 1 FROM " . DB_PREFIX . "pincheck WHERE pincode = '" . $this->db->escape($pincode) . "'");
		if ($query->num_rows) {
			return true;
		}else{
		return false;
		}
		//return $query->row;
	}
	public function getCustomerByCode($code) {
		$query = $this->db->query("SELECT customer_id, firstname, lastname, email FROM `" . DB_PREFIX . "customer` WHERE code = '" . $this->db->escape($code) . "' AND code != ''");

		return $query->row;
	}

	public function getCustomerByToken($token) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE token = '" . $this->db->escape($token) . "' AND token != ''");

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET token = ''");

		return $query->row;
	}

	public function getTotalCustomersByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row['total'];
	}

	public function getRewardTotal($customer_id) {
		$query = $this->db->query("SELECT SUM(points) AS total FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row['total'];
	}

	public function getIps($customer_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer_ip` WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->rows;
	}

	public function addLoginAttempt($email) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_login WHERE email = '" . $this->db->escape(utf8_strtolower((string)$email)) . "' AND ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'");

		if (!$query->num_rows) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_login SET email = '" . $this->db->escape(utf8_strtolower((string)$email)) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', total = 1, date_added = '" . $this->db->escape(date('Y-m-d H:i:s')) . "', date_modified = '" . $this->db->escape(date('Y-m-d H:i:s')) . "'");
		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "customer_login SET total = (total + 1), date_modified = '" . $this->db->escape(date('Y-m-d H:i:s')) . "' WHERE customer_login_id = '" . (int)$query->row['customer_login_id'] . "'");
		}
	}

	public function getLoginAttempts($email) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer_login` WHERE email = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}

	public function deleteLoginAttempts($email) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "customer_login` WHERE email = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}
}
