<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="smshare-form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  
  <div class="container-fluid">
    <?php if (isset($error['error_warning'])) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['error_warning']; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    
    <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?> 4.1.0</h3>
        </div>
    
        <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="smshare-form" class="form-horizontal">
            
                  <h4>SENDING MODE</h4>
                  <hr>
            
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="smshare_sender_profile"><span data-toggle="tooltip" title="If you chose android as sender profile, you must enter your smshare login and password just below.">Sender Profile</span></label>
                    <div class="col-sm-9">
                      <select id="smshare_sender_profile" name="smshare_sender_profile" class="form-control">
                        <option value="profile_android" <?php if($smshare_sender_profile == 'profile_android') echo 'selected'; ?> >Android</option>
                        <optgroup label="Gateways (API)">
                            <option value="profile_api_smsbump"     <?php if($smshare_sender_profile == 'profile_api_smsbump')     echo 'selected'; ?>>smsbump.com</option>
                        </optgroup>
                        <option value="profile_api"     <?php if($smshare_sender_profile == 'profile_api')     echo 'selected'; ?> >Other gateway</option>
                      </select>
                    </div>
                  </div>
              
                  <div id="profile_android_settings">
                      <h4>SMSHARE ACCOUNT</h4>
                      <hr>
                      
                      <div class="form-group">
                        <label class="col-sm-3 control-label" for="smshare_username"><?php echo $smshare_entry_username; ?></label>
                        <div class="col-sm-9">
                          <input type="text" id="smshare_username" name="smshare_username" value="<?php echo $smshare_username; ?>" class="form-control"/>
                        </div>
                      </div>
              
                      <div class="form-group">
                        <label class="col-sm-3 control-label" for="smshare_passwd"><?php echo $smshare_entry_passwd; ?></label>
                        <div class="col-sm-9">
                          <input id="smshare_passwd" type="password" name="smshare_passwd" value="<?php echo $smshare_passwd; ?>" class="form-control"/>
                        </div>
                      </div>
                  </div>
                  
                  
                  <div id="profile_api_settings">
                      <h4>SMS GATEWAY SETUP</h4>
                      <p><a href="https://www.smshare.fr/blog/opencart/setup-sms-gateway/index.html" target="_blank">Learn how to setup a new gateway</a></p>
                      <hr>
                      
                      <div class="form-group">
                        <label class="col-sm-3 control-label" for="smshare_api_url">API URL</label>
                        <div class="col-sm-9">
                          <input id="smshare_api_url" type="text" name="smshare_api_url" value="<?php echo $smshare_api_url; ?>" class="form-control"/>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-3 control-label" for="smshare_api_http_method">API HTTP method</label>
                        <div class="col-sm-9">
                          <select id="smshare_api_http_method" name="smshare_api_http_method" class="form-control">
                            <option value="get"   <?php if($smshare_api_http_method == 'get')  echo 'selected'; ?> >Get</option>
                            <option value="post"  <?php if($smshare_api_http_method == 'post') echo 'selected'; ?> >Post</option>
                          </select>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-3 control-label" for="smshare_api_dest_var"><span data-toggle="tooltip" title="This is the name of the variable that represents the destination numbers.">The destination field</span></label>
                        <div class="col-sm-9">
                          <input type="text" id="smshare_api_dest_var" name="smshare_api_dest_var" value="<?php echo $smshare_api_dest_var; ?>" class="form-control" placeholder="ex: mobiles or destinations" />
                        </div>
                      </div>
                      
                      
                      <div class="form-group">
                        <label class="col-sm-3 control-label" for="smshare_api_msg_var"><span data-toggle="tooltip" title="This is the name of the variable that reprensents the message.">The message field</span></label>
                        <div class="col-sm-9">
                          <input type="text" id="smshare_api_msg_var" name="smshare_api_msg_var" value="<?php echo $smshare_api_msg_var; ?>" class="form-control" placeholder="ex: message" />
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-3 control-label" for="smshare_api_msg_to_unicode"><span data-toggle="tooltip" title="Some API gateway (Ex. for Arabic language) requires the message body to be converted to Unicode.">Unicode the message?</span></label>
                        <div class="col-sm-9">
                            <div class="radio">
                                <label style="padding-left: 0">
                                    <input type="checkbox" id="smshare_api_msg_to_unicode" name="smshare_api_msg_to_unicode" <?php if(isset($smshare_api_msg_to_unicode) && $smshare_api_msg_to_unicode === 'on') echo 'checked' ?> />
                                    Some API gateways (Ex. for Arabic language) require the message body to be converted to Unicode. We remove the \u before sending. Ex: <b>test</b> will be sent as: <b>0074006500730074</b>
                                </label>
                            </div>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-3 control-label" for="smshare_api_msg_url_encode_disabled">Disable message URL encoding (POST)?</label>
                        <div class="col-sm-9">
                            <div class="radio">
                                <label style="padding-left: 0">
                                  <input type="checkbox" id="smshare_api_msg_url_encode_disabled" name="smshare_api_msg_url_encode_disabled" value="on" <?php if($smshare_api_msg_url_encode_disabled === 'on') echo 'checked' ?>  />
                                  Some API gateways require message body not to be URL-encoded in case of POST method. Check if this is the case. See note below about url encoding.
                                </label>
                            </div>
                        </div>
                      </div>
                      
                      
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Additional fields:
                        <br />
                        <br />
                        <a id="smshare-add-new-field" class="btn btn-info" href="#">Add New field</a>
                        </label>
                        <div class="col-sm-9">
                          <div id="fields-wrapper">
                      
                            <?php 
                            if(! is_array($smshare_api_kv)){
                                $smshare_api_kv = array();
                            }
                           
                            $tmpl_arr = array("key" => "", "val" => "", "encode" => "", "is_tmpl" => true);
                            array_push($smshare_api_kv, $tmpl_arr);
                            
                            foreach ($smshare_api_kv as $api_kv) {
                            ?>
                           
                                <div <?php if(isset($api_kv['is_tmpl'])) {  echo 'id="data-tv-fields-tmpl"';} ?> style="margin-bottom: 5px;" data-tv-kv>
                                    
                                    <label>Name: </label>
                                    <input type="text" data-tv-kv-key placeholder="field name" value="<?php echo $api_kv['key'] ?>"  class="form-control" style="width: 20%; display: inline-block" />
                                    
                                    <label>Value: </label>
                                    <input type="text" data-tv-kv-val placeholder="field value" value="<?php echo $api_kv['val'] ?>" class="form-control" style="width: 20%; display: inline-block" />
                           
                                    <label>URL encode: </label>
                                    <input type="checkbox" data-tv-kv-encode 
                                    <?php if( (isset($api_kv['is_tmpl'])) || 
                                              (isset($api_kv['encode'])   && $api_kv['encode'] === 'on') ){ 
                                                  echo "checked"; 
                                          }
                                    ?> >
                           
                                    <a class="btn btn-default" href="#" style="" title="Remove this field" data-tv-remove><i class="fa fa-remove"></i></a>
                                </div>
                           
                            <?php
                            }
                            ?>
                           
                           </div><!-- #fields-wrapper -->
                           
                           <div class="help" style="margin-top: 22px;">
                               <p style="color: black;">What is Url Encoding?</p>
                               <p>URL encoding converts characters into a format that can be send through internet.
                               <br />
                               We should use urlencode for all GET parameters because POST parameters are automatically encoded.
                               <br />
                               Some API doesn't understand some URL encoded fields when sending with GET. If this is the case, disable URL encoding for the concerned fields.                       
                               </p>
                               
                           </div>
                           
                        </div><!-- .col-sm-9 -->
                      </div><!-- form-group -->
                  </div>
                  
                  
                  <h4>SMS TEMPLATING SYSTEM</h4>
                  <hr>
                  
                  
                  <div class="panel panel-primary panel-tv">
            
                    <div class="panel-heading"><h3 class="panel-title">Available variables (shortcodes)</h3></div>
                    
                    <div class="panel-body">
                        <p>You will be using predefined "variables" which are place-holders that will be replaced by the real information at runtime.</p>
                        <p>
                          <span class="label label-info">Example</span> If you enter the following:
                        </p>
                        <pre>Dear <b>{firstname}</b>, Thank you for your order at mystore.com order ID <b>{order_id}</b> amount <b>{total}</b></pre>
                        <p>
                          The next time a customer makes an order (let's say <b>Bérénice</b>), she will receive a SMS containing the following: 
                        </p>
                        <pre>Dear <b>Bérénice</b>, Thank you for your order at mystore.com order ID <b>1234</b> amount <b>$12.34</b></pre>
                        
                    </div>
                
                    <table class="table table-striped">
                      <caption>Here is the list of available variables and their context (where to use).</caption>
                      <thead>
                        <tr>
                          <th style="width: 150px;">Variable</th>
                          <th>Description</th>
                          <th class="text-center">Customer registration</th>
                          <th class="text-center">Marketing SMS</th>
                          <th class="text-center">Order create</th>
                          <th class="text-center">Order status update</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>{firstname}</td>
                          <td>First name</td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{lastname}</td>
                          <td>Last name</td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{phonenumber}</td>
                          <td>Phone number</td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{password}</td>
                          <td>Password</td>
                          <td class="text-center"><small class="text-warning"><i class="fa fa-asterisk"></i></small>[1]</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                        </tr>
                        <tr>
                          <td>{store_url}</td>
                          <td>Store URL</td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{order_id}</td>
                          <td>Order ID</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                       <tr>
                          <td>{total}</td>
                          <td>Total</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{shipping_address_1}</td>
                          <td>Shipping address 1</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{shipping_address_2}</td>
                          <td>Shipping address 2</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{shipping_postcode}</td>
                          <td>Shipping address postcode</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{shipping_city}</td>
                          <td>Shipping address city</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{shipping_region}</td>
                          <td>Shipping address region</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{shipping_country}</td>
                          <td>Shipping address country</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{payment_address_1}</td>
                          <td>Payment address 1</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{payment_address_2}</td>
                          <td>Payment address 2</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{payment_postcode}</td>
                          <td>Payment address postcode</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{payment_city}</td>
                          <td>Payment address city</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{payment_region}</td>
                          <td>Payment address region</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{payment_country}</td>
                          <td>Payment address country</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{payment_method}</td>
                          <td>Payment method</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{shipping_method}</td>
                          <td>Shipping method</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{default_template}</td>
                          <td>Contains almost the same information as the Opencart default email sent when you update order status</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{comment}</td>
                          <td>The comment you write when you update order status</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center">✔</td>
                        </tr>
                        <tr>
                          <td>{tracking_code}</td>
                          <td>The tracking number you enter when you update order status</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center"><small class="text-warning"><i class="fa fa-asterisk"></i></small>[2]</td>
                        </tr>
                        <tr>
                          <td>{tracking_company}</td>
                          <td>The name of the selected tracking company when you update order status.</td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center"></td>
                          <td class="text-center"><small class="text-warning"><i class="fa fa-asterisk"></i></small>[2]</td>
                        </tr>
                      </tbody>
                    </table>
                    <div class="panel-footer">
                        <h3>Remarks:</h3>
                        
                        <ul>
                            <li>
                                <small class="text-warning"><i class="fa fa-asterisk"></i></small>
                                [1] Password variable works for SMS sent on registration. However, if you have installed the
                                <a href="https://www.smshare.fr/store/index.php?route=product/product&product_id=52">PVA extension (Phone Verified Accounts by SMS at registration)</a>, 
                                SMS at registration will be delayed and sent only when customer verifies his phone number. Pay attention to the password variable because it will not be available at this
                                time. This is because Opencart doesn't store password in clear in the database. In fact, password are hashed. If you use it, customer will see the useless hashed password.
                                If this is an issue for you, contact us.
                                 
                            </li>
                            <li>
                                <small class="text-warning"><i class="fa fa-asterisk"></i></small>
                                [2] Requires the <a href="https://www.smshare.fr/store/index.php?route=product/product&path=61&product_id=57" target="_blank">Powertrack</a> module.
                            </li>
                        </ul>
                    </div>
                </div>
                  
                  
                  <h4>CUSTOMER NOTIFICATION</h4>
                  <hr>
                  
                  <div class="form-group">
                    <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $smshare_entry_notify_customer_by_sms_on_registration_help; ?>"><?php echo $smshare_entry_notify_customer_by_sms_on_registration; ?></span></label>
                    <div class="col-sm-9">
                        <div class="form-control" style="border: none; box-shadow: none;">
                        
                            <?php if ($smshare_config_notify_customer_by_sms_on_registration) { ?>
                            <input type="radio" name="smshare_config_notify_customer_by_sms_on_registration" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <input type="radio" name="smshare_config_notify_customer_by_sms_on_registration" value="0" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="smshare_config_notify_customer_by_sms_on_registration" value="1" />
                            <?php echo $text_yes; ?>
                            <input type="radio" name="smshare_config_notify_customer_by_sms_on_registration" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                            
                        </div>
                    </div>
                  </div>
                  
                  
                  <div class="form-group">
                    <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $smshare_entry_cstmr_reg_available_vars ?>">Customer <b>registration</b> SMS template</span></label>
                    <div class="col-sm-9">
                        <?php foreach ($languages as $language) { ?>
                        <div class="input-group">
                          <span class="input-group-addon">
                            <?php if(version_compare(VERSION, '2.2.0.0', 'ge')) {?>
                            <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                            <?php }else{ ?>
                            <img src="../image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
                            <?php }?>
                          </span>
                          <textarea class="form-control" name="smshare_cfg_on_registration_customer_tmpls[<?php echo $language['code']; ?>]" cols="40" rows="5"><?php echo isset($smshare_cfg_on_registration_customer_tmpls[$language['code']]) ? $smshare_cfg_on_registration_customer_tmpls[$language['code']] : '';?></textarea>
                        </div>
                        <?php } ?>
                    </div>
                  </div>
                  
                  
                  
                  <div class="form-group">
                    <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $smshare_entry_notify_customer_by_sms_on_checkout_help; ?>"><?php echo $smshare_entry_notify_customer_by_sms_on_checkout; ?></span></label>
                    <div class="col-sm-9">
                        <div class="form-control" style="border: none; box-shadow: none;">
                        
                            <?php if ($smshare_config_notify_customer_by_sms_on_checkout) { ?>
                            <input type="radio" name="smshare_config_notify_customer_by_sms_on_checkout" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <input type="radio" name="smshare_config_notify_customer_by_sms_on_checkout" value="0" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="smshare_config_notify_customer_by_sms_on_checkout" value="1" />
                            <?php echo $text_yes; ?>
                            <input type="radio" name="smshare_config_notify_customer_by_sms_on_checkout" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                            
                        </div>
                    </div>
                  </div>
                  
                  
                  <div class="form-group">
                    <label class="col-sm-3 control-label">Customer <b>new order</b> SMS template</label>
                    <div class="col-sm-9">
                        <?php foreach ($languages as $language) { ?>
                        <div class="input-group">
                          <span class="input-group-addon">
                            <?php if(version_compare(VERSION, '2.2.0.0', 'ge')) {?>
                            <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                            <?php }else{ ?>
                            <img src="../image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
                            <?php }?>
                          </span>
                          <textarea class="form-control" name="smshare_cfg_on_checkout_customer_tmpls[<?php echo $language['code']; ?>]" cols="40" rows="5"><?php echo isset($smshare_cfg_on_checkout_customer_tmpls[$language['code']]) ? $smshare_cfg_on_checkout_customer_tmpls[$language['code']] : '';?></textarea>
                        </div>
                        <?php } ?>
                    </div>
                  </div>
                  
                  
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="smshare_cfg_donotsend_sms_on_checkout_coupon_keywords"><span data-toggle="tooltip" title="Do not send SMS to customer on <b>new order</b> if one of the following keywords is used in the coupon during checkout.<br />One keyword per line (a keyword can contain spaces).">Do-not-send keywords</span></label>
                    <div class="col-sm-9">
                      <textarea id="smshare_cfg_donotsend_sms_on_checkout_coupon_keywords" name="smshare_cfg_donotsend_sms_on_checkout_coupon_keywords" cols="40" rows="5"><?php echo $smshare_cfg_donotsend_sms_on_checkout_coupon_keywords; ?></textarea>
                    </div>
                  </div>
                  
                  <hr />
                  
                  <div class="form-group">
                    <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="SMS template to be used when you update order status in the order history page. (you must have checked the <i>&ldquo;Notify by SMS&rdquo;</i> checkbox).">SMS template on order status change</span>
                        <br />
                        <br />
                        <a id="add-order-observer" class="btn btn-info" href="#">Add New Notification</a>
                    </label>
                    
                    <div class="col-sm-9">
    
    
                      <ul>
                        <li>
                          Empty text box will use default template.
                        </li>
                        <li>To delete an item, select "status" (first option) and save</li>
                      </ul>
                  
                  
                      <div id="observers-wrapper">
                        <?php
                        if(! is_array($smshare_cfg_odr_observers)){    //Useful the first time when no config is saved yet.
                            $smshare_cfg_odr_observers = array();      //Opencart knows how to save/read array property in/from DB.
                        }
                        
                        $tmpl_arr = array("key" => "", "val" => "", "encode" => "", "is_tmpl" => true);
                        array_push($smshare_cfg_odr_observers, $tmpl_arr);
                        
                        foreach ($smshare_cfg_odr_observers as $observer) {
                        ?>
                          <div <?php if(isset($observer['is_tmpl'])) { echo 'id="data-tv-observer-tmpl"';} ?> data-tv-observer style="margin-bottom: 11px;">
                            <select name="smshare_cfg_odr_observers_status" class="form-control" data-tv-observer-status>
                                <option value="0">Status</option>
                                <option disabled>___________________________</option>
                                <?php foreach ($order_statuses as $order_status) { ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>" <?php if($order_status['order_status_id'] == $observer['key']) echo 'selected' ?>><?php echo $order_status['name']; ?></option>
                                <?php } ?>
                            </select>
                            
                            <?php foreach ($languages as $language) { ?>
                            <div class="input-group">
                              <span class="input-group-addon">
                                <?php if(version_compare(VERSION, '2.2.0.0', 'ge')) {?>
                                <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
                                <?php }else{ ?>
                                <img src="../image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
                                <?php }?>
                              </span>
                              <textarea class="form-control" 
                                        data-tv-observer-msg 
                                        data-tv-lg="<?php echo $language['code'] ?>"><?php echo isset($observer['val'][$language['code']]) ? $observer['val'][$language['code']] : ''; ?></textarea>
                            </div>
                            <?php } ?>
                            
                          </div>
                        <?php
                        }
                        ?>
                      </div><!-- #observers-wrapper -->
                    </div><!-- .col-sm-9 -->
                  </div><!-- .form-group -->
                  
                  
                  <h4>STORE OWNER NOTIFICATION</h4>
                  <hr />
                  
                  
                  <div class="form-group">
                    <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $smshare_entry_ntfy_admin_by_sms_on_reg_help; ?>"><?php echo $smshare_entry_ntfy_admin_by_sms_on_reg; ?></span></label>
                    <div class="col-sm-9">
                        <div class="form-control" style="border: none; box-shadow: none;">
                        
                            <?php if ($smshare_cfg_ntfy_admin_by_sms_on_reg) { ?>
                            <input type="radio" name="smshare_cfg_ntfy_admin_by_sms_on_reg" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <input type="radio" name="smshare_cfg_ntfy_admin_by_sms_on_reg" value="0" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="smshare_cfg_ntfy_admin_by_sms_on_reg" value="1" />
                            <?php echo $text_yes; ?>
                            <input type="radio" name="smshare_cfg_ntfy_admin_by_sms_on_reg" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                            
                        </div>
                    </div>
                  </div>
                  
                                
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="smshare_cfg_sms_tmpl_for_admin_notif_on_reg"><span data-toggle="tooltip" title="<?php echo $smshare_entry_cstmr_reg_available_vars ?>">Store owner SMS template, on customer registration</span></label>
                    <div class="col-sm-9">
                      <textarea id="smshare_cfg_sms_tmpl_for_admin_notif_on_reg" name="smshare_cfg_sms_tmpl_for_admin_notif_on_reg" class="form-control" cols="40" rows="5"><?php echo $smshare_cfg_sms_tmpl_for_admin_notif_on_reg; ?></textarea>
                    </div>
                  </div>
                  
                  
                  <div class="form-group">
                    <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $smshare_entry_notify_admin_by_sms_on_checkout_help; ?>"><?php echo $smshare_entry_notify_admin_by_sms_on_checkout; ?></span></label>
                    <div class="col-sm-9">
                        <div class="form-control" style="border: none; box-shadow: none;">
                        
                            <?php if ($smshare_config_notify_admin_by_sms_on_checkout) { ?>
                            <input type="radio" name="smshare_config_notify_admin_by_sms_on_checkout" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <input type="radio" name="smshare_config_notify_admin_by_sms_on_checkout" value="0" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="smshare_config_notify_admin_by_sms_on_checkout" value="1" />
                            <?php echo $text_yes; ?>
                            <input type="radio" name="smshare_config_notify_admin_by_sms_on_checkout" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                            
                        </div>
                    </div>
                  </div>
                  
                  
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="smshare_config_sms_template_for_storeowner_notif_on_checkout"><span data-toggle="tooltip" title="In addition to the variables listed above, there are two special variables <b>{default_template}</b> and <b>{compact_default_template}</b> that you can use to inject the default template or a compact version of the default template (which reduces the SMS size)</div>">Store owner SMS template</span></label>
                    <div class="col-sm-9">
                      <textarea id="smshare_config_sms_template_for_storeowner_notif_on_checkout" name="smshare_config_sms_template_for_storeowner_notif_on_checkout" class="form-control" cols="40" rows="5"><?php echo $smshare_config_sms_template_for_storeowner_notif_on_checkout; ?></textarea>
                    </div>
                  </div>
                  
                  
                  
                  
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="smshare_config_notify_extra_by_sms_on_checkout"><span data-toggle="tooltip" title="<?php echo $smshare_entry_notify_extra_by_sms_on_checkout_help; ?>"><?php echo $smshare_entry_notify_extra_by_sms_on_checkout; ?></span></label>
                    <div class="col-sm-9">
                      <textarea id="smshare_config_notify_extra_by_sms_on_checkout" name="smshare_config_notify_extra_by_sms_on_checkout" class="form-control" cols="40" rows="5"><?php echo $smshare_config_notify_extra_by_sms_on_checkout; ?></textarea>
                    </div>
                  </div>
                  
                  
                  
                  <h4>SMS FILTERING RULES</h4>
                  <hr />
                  
                  
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="smshare_config_number_filtering"><span data-toggle="tooltip" title="Send SMS only if phone number starts with the digits you enter here.<br/>Multiple patterns must be comma separated. Example: 00336,+336,06">Phone number filtering:<br />«Starts-with» filter</span></label>
                    <div class="col-sm-9">
                      <input type="text" id="smshare_config_number_filtering" name="smshare_config_number_filtering" value="<?php echo $smshare_config_number_filtering; ?>" class="form-control" size="41" />
                    </div>
                  </div>
                  
                  
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="smshare_config_number_filtering"><span data-toggle="tooltip" title="Send SMS only if phone number has x digits you enter here. For example: if you set the value to 8 then, automatic SMS will be sent to 12345678 but not to 2345678.">Phone number filtering:<br />«Number-size» filter</span></label>
                    <div class="col-sm-9">
                      <input type="text" id="smshare_cfg_num_filt_by_size" name="smshare_cfg_num_filt_by_size" value="<?php echo $smshare_cfg_num_filt_by_size; ?>" size="2" class="form-control"/>
                    </div>
                  </div>
                  
                              
                              
                  <h4>Phone number rewriting <small>Make replacement to phone number before sending SMS</small></h4>
                  <hr />
                  <p>
                  <ol>
                    <li>
                      Note that there is a default rewriting that is always applied which will remove some characters from the phone number before sending SMS.
                      These characters are usually found in phone numbers because people use them to make the phone number easy to read.
                      These characters are: 
                      <ul>
                        <li>The dot character: "."</li>
                        <li>The dash character: "-" </li>
                        <li>The white space character</li>
                      </ul>
                    </li>
                    <li>Rewriting is applied only after filtering rules are applied.</li>
                  </ol>
                  
                  
                  </p>
                  <div class="form-group">
                    <label class="col-sm-3 control-label"></label>
                    <div class="col-sm-9">
                        <label>Replace first occurrence of: </label>
                        <input type="text" name="smshare_cfg_number_rewriting_search"  value="<?php echo $smshare_cfg_number_rewriting_search ?>"  size="8" placeholder="pattern" class="form-control" style="width: 20%; display: inline-block" />
                        
                        <label>By: </label>
                        <input type="text" name="smshare_cfg_number_rewriting_replace" value="<?php echo $smshare_cfg_number_rewriting_replace ?>" size="8"  placeholder="substitution" class="form-control" style="width: 20%; display: inline-block" />
                    </div>
                  </div>
                  
                  <h4>Troubleshooting</h4>
                  <hr />
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="smshare_cfg_log"><span data-toggle="tooltip" title="Verbose logs will be printed to the opencart log file. Useful when you need to figure out what is going on.">Enable smshare logs:</span></label>
                    <div class="col-sm-9">
                        <div class="form-control" style="border: none; box-shadow: none;">
                        
                            <?php if ($smshare_cfg_log) { ?>
                            <input type="radio" name="smshare_cfg_log" value="1" checked="checked" id="smshare_cfg_log" />
                            <?php echo $text_yes; ?>
                            <input type="radio" name="smshare_cfg_log" value="0" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="smshare_cfg_log" value="1" />
                            <?php echo $text_yes; ?>
                            <input type="radio" name="smshare_cfg_log" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                            
                        </div>
                    </div>
                  </div>
                  
            
            </form>
            
            <hr />
                  
        </div><!-- .panel-body -->
     </div>
  </div><!-- .container-fluid -->
  
  
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="smshare-form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      
      <a href="http://www.twitter.com/smshare">
          <img alt="Follow smshare on Twitter" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKAAAAAbCAYAAAD7woSbAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpGNzdGMTE3NDA3MjA2ODExQUQyNkQxRjlGQjI3MUJFMCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo4MkJEMUYxQUNDQzgxMURGOTQ4QUM3MUMzQkEwMjkyRSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo4MkJEMUYxOUNDQzgxMURGOTQ4QUM3MUMzQkEwMjkyRSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjc5QUJGNEQ3OUIyMDY4MTE4RTM3OTNENTRFRENEQTNGIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkY3N0YxMTc0MDcyMDY4MTFBRDI2RDFGOUZCMjcxQkUwIi8+IDwvcmRmOkRlc2NyaXB0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">
      </a>
          
    </div>
  </div>
  
  
</div><!-- #content -->

<?php echo $footer; ?>

<style data-tv-info="smshare module">
    
    /* on OC 2.0.3.1 radio button was looking bad...
    #content{
        direction: ltr;
    }
    */
    
    textarea{
        <?php echo "direction:" . $direction; ?>
    }
    
    .tv-statuses select, .tv-statuses textarea{
        vertical-align:middle;
    }
</style>

<script type="text/javascript" src="view/javascript/smshare.js?v=3.3"></script>
<script type="text/javascript" src="view/javascript/hideShowPassword.min.js"></script>
<script>

//Reveal password by default and create an inner toggle
$('#smshare_passwd').hideShowPassword(false, true, {
    toggle: {
        className: 'btn btn-xs'
    }
});
</script>