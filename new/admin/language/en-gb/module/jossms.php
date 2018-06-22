<?php
// Heading
$_['heading_title']       		= 'jOS SMS Setting';
$_['intruction_title']    		= 'Instruction';

// Text
$_['text_module']         		= 'Modules';
$_['text_success']        		= 'Success: You have modified module jOS SMS!';
$_['text_content_top']    		= 'Content Top';
$_['text_content_bottom'] 		= 'Content Bottom';
$_['text_column_left']    		= 'Column Left';
$_['text_column_right']   		= 'Column Right';
$_['text_yes']      					= 'Yes';
$_['text_no']      						= 'No';
$_['text_none']      					= '-- Select Gateway --';
$_['text_status_none']      	= '-- Select Status --';
$_['text_limit']      				= 'SMS/day';
$_['text_enable_verify']      = 'Enable Verification by SMS?<br /><span class="help">Send Verification mobile phone when customers do order and/or register.</span>';
$_['text_verify_checkout']    = 'Order Verification?<br /><span class="help">Verification mobile phone when customers do order.</span>';
$_['text_verify_register']    = 'Register Verification?<br /><span class="help">Verification mobile phone when customers create account.</span>';
$_['text_verify_forgotten']   = 'Forgotten Password Verification?<br /><span class="help">Verification mobile phone when customers forgot password.</span>';

// Gateway
$_['entry_gateway']       		= 'Gateway:<br /><span class="help">Select gateway provider.<br />For the list of countries supported by gateways, you can visit the each gateway site.</span>';

// Zenziva
$_['entry_userkey']       		= 'Userkey:<br /><span class="help"><a href="http://www.zenziva.com/form_register.php" target="_blank">Register</a> or <a href="http://www.zenziva.com/login.php" target="_blank">Login</a> at zenziva.com go to SETTING > API SETTING copy &amp; paste the <b>userkey</b> into the text box.</span>';
$_['entry_passkey']       		= 'Passkey:<br /><span class="help"><a href="http://www.zenziva.com/form_register.php" target="_blank">Register</a> or <a href="http://www.zenziva.com/login.php" target="_blank">Login</a> at zenziva.com go to SETTING > API SETTING create new passkey if not any and copy &amp; paste the <b>passkey</b> into the text box.</span>';
$_['entry_httpapi']       		= 'HTTP API:<br /><span class="help"><a href="http://www.zenziva.com/form_register.php" target="_blank">Register</a> or <a href="http://www.zenziva.com/login.php" target="_blank">Login</a> at zenziva.com go to SETTING > API SETTING copy &amp; paste the <b>http API</b> into the text box.</span>';
$_['httpapi_example']					= '<span class="help"><b>Use this for HTTP API-></b> http://zenziva.com/apps/smsapi.php</span>';

// AMD Telecom
$_['entry_userkey_amd']   		= 'Username:<br /><span class="help"><a href="http://extranet.amdtelecom.net/register/" target="_blank">Register</a> or <a href="http://extranet.amdtelecom.net/" target="_blank">Login</a> at amdtelecom.net use your username for the <b>username</b>.</span>';
$_['entry_passkey_amd']   		= 'Password:<br /><span class="help"><a href="http://extranet.amdtelecom.net/register/" target="_blank">Register</a> or <a href="http://extranet.amdtelecom.net/" target="_blank">Login</a> at amdtelecom.net use your password for the <b>password</b>.</span>';
$_['entry_httpapi_amd']   		= 'HTTP API:<br /><span class="help"><a href="http://extranet.amdtelecom.net/register/" target="_blank">Register</a> or <a href="http://extranet.amdtelecom.net/" target="_blank">Login</a> at amdtelecom.net go to Help menu &amp; download the API Doc for documentation about <b>HTTP API</b> url.</span>';
$_['entry_senderid_amd']			= 'Sender ID:<br /><span class="help">Max. 11 characters, alphanumeric without spacing.</span>';
$_['httpapi_example_amd']			= '<span class="help"><b>Use this for HTTP API-></b> https://api2.amdtelecom.net/</span>';

// Bulk SMS Global
$_['entry_userkey_smsglobal']   		= 'Username:<br /><span class="help"><a href="http://www.bulksmsglobal.in/signup.html" target="_blank">Register</a> or <a href="http://login.bulksmsglobal.in/" target="_blank">Login</a> at bulksmsglobal.in use your username for the <b>username</b>.</span>';
$_['entry_passkey_smsglobal']   		= 'Password:<br /><span class="help"><a href="http://www.bulksmsglobal.in/signup.html" target="_blank">Register</a> or <a href="http://login.bulksmsglobal.in/" target="_blank">Login</a> at bulksmsglobal.in use your password for the <b>password</b>.</span>';
$_['entry_httpapi_smsglobal']   		= 'HTTP API:<br /><span class="help"><a href="http://www.bulksmsglobal.in/signup.html" target="_blank">Register</a> or <a href="http://login.bulksmsglobal.in/" target="_blank">Login</a> at bulksmsglobal.in go to Developer Tool menu.</span>';
$_['entry_senderid_smsglobal']			= 'Sender ID:<br /><span class="help">Max. 11 characters, alphanumeric without spacing.</span>';
$_['httpapi_example_smsglobal']			= '<span class="help"><b>Use this for HTTP API-></b> login.bulksmsglobal.in/sendhttp.php</span>';

// Clickatell
$_['entry_userkey_clickatell']   		= 'User:<br /><span class="help"><a href="http://www.clickatell.com/" target="_blank">Clickatell</a> Account Username.</span>';
$_['entry_passkey_clickatell']   		= 'Password:<br /><span class="help"><a href="http://www.clickatell.com/" target="_blank">Clickatell</a> Account Password.</span>';
$_['entry_httpapi_clickatell']   		= 'HTTP API:<br /><span class="help"><a href="http://www.clickatell.com/" target="_blank">Clickatell</a> HTTP Api <b>api.clickatell.com/http/</b></span>';
$_['entry_apiid_clickatell']				= 'API ID:<br /><span class="help"><a href="http://www.clickatell.com/" target="_blank">Clickatell</a> API ID.</span>';
$_['entry_senderid_clickatell']			= 'Sender ID:<br /><span class="help">Your Sender ID which has been added in clickatell and approved.</span>';
$_['httpapi_example_clickatell']		= '<span class="help"><b>Use this for HTTP API-></b> api.clickatell.com/http/sendmsg</span>';
$_['entry_unicode_clickatell']			= 'Unicode:<br /><span class="help">Send all message text as unicode.</span>';

// LiveAll
$_['entry_userkey_liveall']   = 'Username:<br /><span class="help">username of your account at liveall.eu.</span>';
$_['entry_passkey_liveall']   = 'Password:<br /><span class="help">password of the above username.</span>';
$_['entry_httpapi_liveall']   = 'HTTP API:';
$_['entry_senderid_liveall']	= 'Sender:<br /><span class="help">Sender name. Maximum 11 characters. Phone number is not allowed.</span>';
$_['httpapi_example_liveall']	= '<span class="help"><b>Use this for HTTP API-></b> http://www.liveall.eu/webservice/sms/sendSMSHTTP.php</span>';

// Malath
$_['entry_userkey_malath']   	= 'Username:<br /><span class="help">This is your account username given by <a href="http://sms.malath.net.sa" target="_blank">Malath SMS</a>.</span>';
$_['entry_passkey_malath']   	= 'Password:<br /><span class="help">This is password of your account.</span>';
$_['entry_httpapi_malath']   	= 'HTTP API:<br /><span class="help">This is HTTP API URL of Malath SMS</span>';
$_['entry_senderid_malath']		= 'Sender ID:<br /><span class="help">This is sender name. This can be only in English and only up to 11 characters.<br />Must be active your sender name before do any test.</span>';
$_['httpapi_example_malath']	= '<span class="help"><b>Use this for HTTP API-></b> sms.malath.net.sa/httpSmsProvider.aspx</span>';
$_['entry_unicode_malath']		= 'Unicode:<br /><span class="help">Send all message text as unicode.</span>';

// mobily
$_['entry_userkey_mobily']   = 'Mobile:<br /><span class="help">Mobile number, which represents the user name</span>';
$_['entry_passkey_mobily']   = 'Password:<br /><span class="help">Password for the account in <a href="https://mobily.ws" target="_blank">mobily.ws</a></span>';
$_['entry_httpapi_mobily']   = 'HTTP API:';
$_['entry_senderid_mobily']	 = 'Sender Name:<br /><span class="help">If the sending to the numbers of Saudi mobile networks, it must send through the active names only to you.</span>';
$_['httpapi_example_mobily'] = '<span class="help"><b>Use this for HTTP API-></b> www.mobily.ws/api/msgSend.php</span>';

// msegat
$_['entry_userkey_msegat']   = 'Username:<br /><span class="help">username for the account in <a href="https://msegat.com" target="_blank">Msegat.com</a></span>';
$_['entry_passkey_msegat']   = 'Password:<br /><span class="help">userPassword for the account in <a href="https://msegat.com" target="_blank">Msegat.com</a></span>';
$_['entry_httpapi_msegat']   = 'HTTP API:';
$_['entry_senderid_msegat']	 = 'Sender Name:<br /><span class="help">sender name , should be activated from <a href="https://msegat.com" target="_blank">Msegat.com</a></span>';
$_['httpapi_example_msegat'] = '<span class="help"><b>Use this for HTTP API-></b> msegat.com/gw/</span>';

// MSG91
$_['entry_userkey_msg91']   = 'Auth Key:<br /><span class="help"><a href="https://msg91.com" target="_blank">MSG91</a> Authentication Key</span>';
$_['entry_route_msg91']   	= 'Route:<br /><span class="help">1 or 4</span>';
$_['entry_httpapi_msg91']   = 'HTTP API:';
$_['entry_senderid_msg91']	= 'Sender ID:<br /><span class="help">Your <a href="https://msg91.com" target="_blank">MSG91</a> Sender ID</span>';
$_['httpapi_example_msg91'] = '<span class="help"><b>Use this for HTTP API-></b> control.msg91.com/api/sendhttp.php</span>';

// mVaayoo
$_['entry_userkey_mvaayoo']   = 'Username:<br /><span class="help"><a href="http://www.mvaayoo.com/UI/Registration.aspx" target="_blank">Register</a> or <a href="http://www.mvaayoo.com/" target="_blank">Login</a> at mVaayoo.com click API Settings menu at top right.</span>';
$_['entry_passkey_mvaayoo']   = 'Password:<br /><span class="help"><a href="http://www.mvaayoo.com/UI/Registration.aspx" target="_blank">Register</a> or <a href="http://www.mvaayoo.com/" target="_blank">Login</a> at mVaayoo.com click API Settings menu at top right.</span>';
$_['entry_httpapi_mvaayoo']   = 'HTTP API:<br /><span class="help"><a href="http://www.mvaayoo.com/UI/Registration.aspx" target="_blank">Register</a> or <a href="http://www.mvaayoo.com/" target="_blank">Login</a> at mVaayoo.com On Compose page, click on the API Tab to see the URL & other details.</span>';
$_['entry_senderid_mvaayoo']	= 'Sender ID:';
$_['httpapi_example_mvaayoo']	= '<span class="help"><b>Use this for HTTP API-></b> http://api.mVaayoo.com/mvaayooapi/MessageCompose</span>';
$_['entry_term_mvaayoo']   		= 'Terms:';
$_['text_term_mvaayoo']   		= '<span class="help">Just <strong><i>Transactional route</i></strong> will work with this module.<br />Make sure you had registered Templates and approved by mVaayoo before you use message templates in this module.</span>';

// mysms
$_['entry_userkey_mysms']   = 'Username:<br /><span class="help"><a href="http://www.mysms.com.gr" target="_blank">Register</a> or <a href="http://www.mysms.com.gr" target="_blank">Login</a> at www.mysms.com.gr</span>';
$_['entry_passkey_mysms']   = 'Password:<br /><span class="help"><a href="http://www.mysms.com.gr" target="_blank">Register</a> or <a href="http://www.mysms.com.gr" target="_blank">Login</a> at www.mysms.com.gr</span>';
$_['entry_httpapi_mysms']   = 'HTTP API:<br /><span class="help"><a href="http://www.mysms.com.gr" target="_blank">Register</a> or <a href="http://www.mysms.com.gr" target="_blank">Login</a> at www.mysms.com.gr and see the documentation.</span>';
$_['entry_senderid_mysms']	= 'Sender ID:<br /><span class="help">11 Latin characters, without spaces, numbers or other symbols</span>';
$_['httpapi_example_mysms']	= '<span class="help"><b>Use this for HTTP API-></b>www.mysms.com.gr/api.php</span>';

// Nexmo
$_['entry_userkey_nexmo']   	= 'Key:<br /><span class="help"><a href="https://dashboard.nexmo.com/register" target="_blank">Register</a> or <a href="https://dashboard.nexmo.com/login" target="_blank">Login</a> at nexmo.com click API Settings menu at top right.</span>';
$_['entry_passkey_nexmo']   	= 'Secret:<br /><span class="help"><a href="https://dashboard.nexmo.com/register" target="_blank">Register</a> or <a href="https://dashboard.nexmo.com/login" target="_blank">Login</a> at nexmo.com click API Settings menu at top right.</span>';
$_['entry_httpapi_nexmo']   	= 'HTTP API:<br /><span class="help"><a href="https://dashboard.nexmo.com/register" target="_blank">Register</a> or <a href="https://dashboard.nexmo.com/login" target="_blank">Login</a> at nexmo.com go to API menu &amp; see the documentation about <b>HTTP API</b> Base URL. (Use json response)</span>';
$_['entry_senderid_nexmo']		= 'Sender ID:<br /><span class="help">Max. 11 characters, alphanumeric without spacing</span>';
$_['httpapi_example_nexmo']		= '<span class="help"><b>Use this for HTTP API-></b> https://rest.nexmo.com/sms/json</span>';
$_['entry_unicode_nexmo']			= 'Unicode:<br /><span class="help">Send all message text as unicode.</span>';

// Netgsm
$_['entry_userkey_netgsm']   = 'Username:<br /><span class="help"><a href="http://toplusms.netgsm.com.tr/" target="_blank">netgsm</a> received from the user name</span>';
$_['entry_passkey_netgsm']   = 'Password:<br /><span class="help">is <a href="http://toplusms.netgsm.com.tr/" target="_blank">netgsm</a> from received user password</span>';
$_['entry_httpapi_netgsm']   = 'HTTP API:<br /><span class="help"><a href="http://toplusms.netgsm.com.tr/" target="_blank">netgsm</a> api url</span>';
$_['entry_senderid_netgsm']	 = 'Sender Name:<br /><span class="help">Max. 11 characters.</span>';
$_['httpapi_example_netgsm'] = '<span class="help"><b>Use this for HTTP API-></b>api.netgsm.com.tr/xmlbulkhttppost.asp</span>';

// One Way SMS
$_['entry_userkey_oneway']   	= 'API Username:<br /><span class="help"><a href="http://onewaysms.com.my/" target="_blank">Register</a> or <a href="http://sms.onewaysms.com.my" target="_blank">Login</a> at onewaysms.com.my go to menu Account -> API at top right.</span>';
$_['entry_passkey_oneway']   	= 'API Password:<br /><span class="help"><a href="http://onewaysms.com.my/" target="_blank">Register</a> or <a href="http://sms.onewaysms.com.my" target="_blank">Login</a> at onewaysms.com.my go to menu Account -> API at top right.</span>';
$_['entry_httpapi_oneway']   	= 'MT URL:<br /><span class="help"><a href="http://onewaysms.com.my/" target="_blank">Register</a> or <a href="http://sms.onewaysms.com.my" target="_blank">Login</a> at onewaysms.com.my go to menu Account -> API at top right.</span>';
$_['entry_senderid_oneway']		= 'Sender ID:<br /><span class="help">Max. 11 characters, alphanumeric.</span>';
$_['httpapi_example_oneway']		= '<span class="help"><b>Example MT URL-></b> http://gateway.onewaysms.com.my:10001/api.aspx</span>';

// Openhouse IMI Mobile
$_['entry_userkey_openhouse'] = 'Key:<br /><span class="help">It is the Service Provider\'s unique access key</span>';
$_['entry_passkey_openhouse'] = 'Sender Address:<br /><span class="help"> It is the short code set to the application to receive SMS responses.</span>';
$_['entry_senderid_openhouse']		= 'Sender Name:<br /><span class="help">The name of the sender to appear on the terminal is the address to whom a responding SMS may be sent.</span>';

// Redsms India
$_['entry_userkey_redsms']   	= 'Username:<br /><span class="help"><a href="http://bulk.redsms.in/login.php" target="_blank">Register</a> or <a href="http://bulk.redsms.in/login.php" target="_blank">Login</a> at www.redsms.in</span>';
$_['entry_passkey_redsms']   	= 'Password:<br /><span class="help"><a href="http://bulk.redsms.in/login.php" target="_blank">Register</a> or <a href="http://bulk.redsms.in/login.php" target="_blank">Login</a> at www.redsms.in</span>';
$_['entry_httpapi_redsms']   	= 'HTTP API:<br /><span class="help"><a href="http://bulk.redsms.in/login.php" target="_blank">Register</a> or <a href="http://bulk.redsms.in/login.php" target="_blank">Login</a> at www.redsms.in</span>';
$_['entry_senderid_redsms']		= 'Sender ID:<br /><span class="help">Red SMS Approved Sender ID<br />Letters only and min 3 and max 20</span>';
$_['httpapi_example_redsms']	= '<span class="help"><b>Use this for HTTP API-></b> http://login.redsms.in/API/SendMessage.ashx</span>';

// Routesms
$_['entry_userkey_routesms']   	= 'Username:<br /><span class="help">Your <a href="http://routesms.com/" target="_blank">Routesms</a> Username</span>';
$_['entry_passkey_routesms']   	= 'Password:<br /><span class="help">Your <a href="http://routesms.com/" target="_blank">Routesms</a> Password</span>';
$_['entry_httpapi_routesms']   	= 'HTTP API:<br /><span class="help">Your <a href="http://routesms.com/" target="_blank">Routesms</a> API URL server</span>';
$_['entry_senderid_routesms']		= 'Sender ID:<br /><span class="help">Max Length of 18 if Only Numeric<br />Max Length of 11 if Alpha Numeric</span>';
$_['httpapi_example_routesms']	= '<span class="help"><strong>https://<font color="red">&#60;server&#62;</font>.routesms.com/bulksms/bulksms</strong><br /><i>ex: https://smsplus2.routesms.com/bulksms/bulksms</i><br />If not sure, ask your server to the routesms support</span>';

// smsgatewayhub
$_['entry_userkey_smsgatewayhub']   = 'User:<br /><span class="help">Your user name.</span>';
$_['entry_passkey_smsgatewayhub']   = 'Password:<br /><span class="help">Your Password.</span>';
$_['entry_httpapi_smsgatewayhub']   = 'HTTP API:<br /><span class="help">Transactional SMS API Url.</span>';
$_['entry_senderid_smsgatewayhub']	= 'Sender ID:';
$_['httpapi_example_smsgatewayhub']	= '<span class="help"><b>Use this for HTTP API-></b> api.smsgatewayhub.com/smsapi/pushsms.aspx</span>';
$_['entry_term_smsgatewayhub']   		= 'Terms:';
$_['text_term_smsgatewayhub']   		= '<span class="help">Just <strong><i>Transactional Route</i></strong> will work with this module.<br />Make sure you had registered Templates and approved transactional template SMS before you use message templates in this module.</span>';

// smslane
$_['entry_userkey_smslane']   	= 'Username:<br /><span class="help"><a href="http://www.smslane.com/registration.aspx" target="_blank">Register</a> or <a href="http://www.smslane.com/login.aspx" target="_blank">Login</a> at www.smslane.com</span>';
$_['entry_passkey_smslane']   	= 'Password:<br /><span class="help"><a href="http://www.smslane.com/registration.aspx" target="_blank">Register</a> or <a href="http://www.smslane.com/login.aspx" target="_blank">Login</a> at www.smslane.com</span>';
$_['entry_httpapi_smslane']   	= 'HTTP API:<br /><span class="help"><a href="http://www.smslane.com/registration.aspx" target="_blank">Register</a> or <a href="http://www.smslane.com/login.aspx" target="_blank">Login</a> at www.smslane.com</span>';
$_['entry_senderid_smslane']		= 'Sender ID:';
$_['httpapi_example_smslane']		= '<span class="help"><b>Use this for HTTP API-></b> http://smslane.com/vendorsms/pushsms.aspx</span>';
$_['entry_unicode_smslane']			= 'Unicode:<br /><span class="help">Send all message text as unicode.</span>';

// smslane global
$_['entry_userkey_smslaneg']   	= 'Username:<br /><span class="help">Client username for <a href="http://world.smslane.com/" target="_blank">GlobalSMS</a> system login.</span>';
$_['entry_passkey_smslaneg']   	= 'Password:<br /><span class="help">Client password for <a href="http://world.smslane.com/" target="_blank">GlobalSMS</a> system login.</span>';
$_['entry_httpapi_smslaneg']   	= 'HTTP API:<br /><span class="help"><a href="http://world.smslane.com/" target="_blank">GlobalSMS</a> HTTP API url</span>';
$_['entry_senderid_smslaneg']		= 'Sender ID:<br /><span class="help">Dynamic message sender ID Max. 11 characters.</span>';
$_['httpapi_example_smslaneg']	= '<span class="help"><b>Use this for HTTP API-></b> http://world.smslane.com/vendorsms/GlobalPush.aspx</span>';
$_['entry_unicode_smslaneg']		= 'Unicode:<br /><span class="help">Send all message text as unicode.</span>';

// topsms
$_['entry_userkey_topsms']   	= 'Username:<br /><span class="help">Username.</span>';
$_['entry_passkey_topsms']   	= 'Password:<br /><span class="help">Password.</span>';
$_['entry_httpapi_topsms']   	= 'HTTP API:<br />HTTP API url</span>';
$_['entry_senderid_topsms']		= 'Sender:<br /><span class="help">Sender Name.</span>';
$_['httpapi_example_topsms']	= '<span class="help"><b>Use this for HTTP API-></b> topsms.mobi/sendsms.php</span>';
$_['entry_lang_topsms']				= 'Language:<br /><span class="help">Changed Lang (English or Arabic).</span>';
$_['text_en']      						= 'English';
$_['text_ar']      						= 'Arabic';

// Velti India
$_['entry_userkey_velti']   	= 'AID:<br /><span class="help"><a href="http://www.velti.com" target="_blank">Register</a> or <a href="http://www.velti.com" target="_blank">Login</a> at www.velti.com</span>';
$_['entry_passkey_velti']   	= 'PIN:<br /><span class="help"><a href="http://www.velti.com" target="_blank">Register</a> or <a href="http://www.velti.com" target="_blank">Login</a> at www.velti.com</span>';
$_['entry_httpapi_velti']   	= 'HTTP API:<br /><span class="help"><a href="http://www.velti.com" target="_blank">Register</a> or <a href="http://www.velti.com" target="_blank">Login</a> at www.velti.com</span>';
$_['httpapi_example_velti']		= '<span class="help"><b>Use this for HTTP API-></b> https://luna.a2wi.co.in/failsafe/HttpLink</span>';

// Entry
$_['entry_layout']        		= 'Layout:';
$_['entry_position']      		= 'Position:';
$_['entry_status']        		= 'Status:';
$_['entry_sort_order']    		= 'Sort Order:';
$_['entry_nohp']    					= 'Mobile Number:';
$_['entry_message']    				= 'Message:';
$_['entry_smslimit']    			= 'SMS Limit:<br /><span class="help">You can limit the message who can sending of visitor for a day. Leave blank to disable limit.</span>';
$_['entry_alert_reg']   			= 'Register Message Alert:<br /><span class="help">You can insert a <i>{firstname}</i>, <i>{lastname}</i>, <i>{email}</i>, <i>{telephone}</i> and <i>{storename}</i> in the message. <b>eg</b>: <i>Dear {firstname} {lastname}, Thanks for sign up on {storename}.</i></span>';
$_['entry_alert_reg_vendor']   		= 'Vendor Register Message Alert:<br /><span class="help">You can insert a <i>{firstname}</i>, <i>{lastname}</i>, <i>{email}</i>, <i>{telephone}</i> and <i>{storename}</i> in the message. <b>eg</b>: <i>Dear {firstname} {lastname}, Thanks for sign up on {storename}.</i></span>';

$_['entry_alert_order_for_vendor']   		= 'Place Order Message Alert For Vendor:<br /><span class="help">You can insert a <i>{firstname}</i>, <i>{lastname}</i>, <i>{email}</i>, <i>{orderid}</i>, <i>{orderstatus}</i>, <i>{shippingmethod}</i>, <i>{paymentmethod}</i>, <i>{total}</i>, <i>{storename}</i> in the message.</span>';

$_['entry_alert_order']   		= 'Place Order Message Alert:<br /><span class="help">You can insert a <i>{firstname}</i>, <i>{lastname}</i>, <i>{email}</i>, <i>{orderid}</i>, <i>{orderstatus}</i>, <i>{delivery_time}</i>,<i>{shippingmethod}</i>, <i>{paymentmethod}</i>, <i>{total}</i>, <i>{storename}</i> in the message.</span>';
$_['entry_alert_changestate'] = 'Order Alert:<br /><span class="help">You can insert a <i>{firstname}</i>, <i>{lastname}</i>, <i>{orderid}</i>, <i>{orderstatus}</i>, <i>{shippingmethod}</i>, <i>{invoiceno}</i>, <i>{total}</i>, <i>{comment}</i>, <i>{storename}</i> in the message.</span>';
$_['entry_additional_alert']	= 'Additional Alert SMS:<br /><span class="help">Any additional admin mobile number (with Country Code) you want to receive the register and order alert sms. (comma separated). e.g: 1803015xxx,4475258xxx,6285220xxx</span>';
$_['entry_alert_sms']    			= 'New Order Alert SMS:<br /><span class="help">Send a SMS to the store owner when a new order is created. You can insert a <i>{firstname}</i>, <i>{lastname}</i>, <i>{email}</i>, <i>{orderid}</i>,<i>{delivery_time}</i>, <i>{orderstatus}</i> and etc (<strong>Variable accepted</strong>) in the message.</span>';
$_['entry_account_sms']  			= 'New Account Alert SMS:<br /><span class="help">Send a SMS to the store owner when a new account is registered. You can insert a <i>{firstname}</i>, <i>{lastname}</i>, <i>{email}</i>, <i>{telephone}</i> and <i>{storename}</i> in the message.</span>';
$_['entry_alert_blank']    		= '<span class="help">* Leave blank to disable this alert</span>';
$_['entry_status_order_alert']= 'Change Status Order Alert:<br /><span class="help">Select order status</span>';
$_['entry_status_order_alert_for_vendor']= 'Change Status Order Alert For Vendor:<br /><span class="help">Select order status</span>';

$_['entry_alert_order_more']	   = 'If message length More than 160 Char:<br /><span class="help">You can insert a <i>{orderid}{storename}</i></span>';
$_['entry_alert_order_more_for_vendor']	   = 'If message length More than 160 Char For Vendor:<br /><span class="help">You can insert a <i>{orderid}{storename}</i></span>';

$_['entry_vendor_approval']	= 'Vendor Approval Alert SMS:<br /><span class="help">You can insert a <i>{firstname}</i>, <i>{lastname}</i>, <i>{email}</i>, <i>{telephone}</i> and <i>{storename}</i> in the message. <b>eg</b>: <i>Dear {firstname} {lastname}, Thanks for sign up on {storename}.</i></span>';
$_['entry_verify_code']				= 'Verification code message:<br /><span class="help">Add <i>{code}</i> for verification code variable in message.<br />e.g: Your verification code is: {code}</span>';
$_['entry_skip_group']				= 'Skip verification for Groups:<br /><span class="help">When Order Verification is active, Customer who have login and is in group selected will not required mobile phone verification.</span>';
$_['entry_skip_group_help']   = '<span class="help">Hold alt key for multiple select.</span>';
$_['entry_code_digit']   			= 'Length of Verification Code digit:';
$_['entry_max_retry']   			= 'Maximum retry:<br /><span class="help">The maximum customers can resend verification code.</span>';
$_['entry_limit_blank']    		= '<span class="help">Leave blank to disable limit.</span>';
$_['entry_parsing']    				= '<span class="help"><strong>Variable accepted:</strong> {order_date},{products_ordered},{firstname},{lastname},{email},{telephone},{orderid},{orderstatus},{shippingmethod},{shipping_firstname},{shipping_lastname},{shipping_company},{shipping_address},{shipping_city},{shipping_postcode},{shipping_state},{shipping_country},{paymentmethod},{payment_firstname},{payment_lastname},{payment_company},{payment_address},{payment_city},{payment_postcode},{payment_state},{payment_country},{total},{comment},{storename}</span>';
$_['entry_skip_payment_method']				= 'Skip verification for Payment Method:<br /><span class="help">Select Payment Method that do not require verification.</span>';
$_['entry_skip_payment_method_help']  = '<span class="help">Hold alt key for multiple select.</span>';

// Button
$_['button_save']							= 'Save';
$_['button_cancel']						= 'Cancel';
$_['button_add_module']				= 'Add Module';
$_['button_remove']						= 'Remove';

// Error
$_['error_permission']    		= 'Warning: You do not have permission to modify module jOS SMS!';
$_['error_gateway']       		= 'Gateway required';
$_['error_userkey']       		= 'This field required';
$_['error_passkey']       		= 'This field required';
$_['error_httpapi']       		= 'This field required';
$_['error_senderid']       		= 'Sender ID required';
$_['error_apiid']       			= 'API ID required';
$_['error_nohp']       				= 'Phone number required';
$_['error_message']       		= 'Text message required';
$_['error_gateway_null']   		= 'Gateway not found! Please set the default gateway';

// Anounce
$_['text_instruction']				= '<span class="help">You can add <b>jOS SMS</b> module to enable your web visitor can Sending Message for free from your web. This can increase visitor traffic of your web.<br />Click <b>Add Module</b> button and set the configuration of module.<br/><br/><b>Layout</b>: On the page where the module will be displayed.<br/><b>Position</b>: Position of module.<br/><b>Status</b>: You can enable or disable the module.<br/><b>Sort Order</b>: Order position of the module.</span>';
?>