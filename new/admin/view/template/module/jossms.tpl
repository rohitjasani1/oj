<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-banner" class="form-horizontal">
      	<div class="form" >
      		<!--<div class="control-group">
			 
				<label class="col-sm-2 control-label"><i class="required text-error icon-asterisk"></i><?php echo 'Gateway'; ?></label>
				<div class="col-sm-10 controls">
				   <select name="gateway" class="form-control">
            		<option value=""><?php echo $text_none; ?></option>
            		
            		<?php if ($gateway=="amd") { ?>
            			<option value="amd" selected="selected">AMD Telecom - www.amdtelecom.net</option>
            		<?php }else{ ?>
            			<option value="amd">AMD Telecom - www.amdtelecom.net</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="smsglobal") { ?>
            			<option value="smsglobal" selected="selected">Bulk SMS Global - www.bulksmsglobal.in</option>
            		<?php }else{ ?>
            			<option value="smsglobal">Bulk SMS Global - www.bulksmsglobal.in</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="clickatell") { ?>
            			<option value="clickatell" selected="selected">Clickatell - www.clickatell.com</option>
            		<?php }else{ ?>
            			<option value="clickatell">Clickatell - www.clickatell.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="liveall") { ?>
            			<option value="liveall" selected="selected">LiveAll - www.liveall.eu</option>
            		<?php }else{ ?>
            			<option value="liveall">LiveAll - www.liveall.eu</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="malath") { ?>
            			<option value="malath" selected="selected">Malath SMS - sms.malath.net.sa</option>
            		<?php }else{ ?>
            			<option value="malath">Malath SMS - sms.malath.net.sa</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="mobily") { ?>
            			<option value="mobily" selected="selected">mobily.ws - www.mobily.ws</option>
            		<?php }else{ ?>
            			<option value="mobily">mobily.ws - www.mobily.ws</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="msegat") { ?>
            			<option value="msegat" selected="selected">Msegat.com - www.msegat.com</option>
            		<?php }else{ ?>
            			<option value="msegat">Msegat.com - www.msegat.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="msg91") { ?>
            			<option value="msg91" selected="selected">MSG91 - www.msg91.com</option>
            		<?php }else{ ?>
            			<option value="msg91">MSG91 - www.msg91.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="mvaayoo") { ?>
            			<option value="mvaayoo" selected="selected">mVaayoo - www.mvaayoo.com</option>
            		<?php }else{ ?>
            			<option value="mvaayoo">mVaayoo - www.mvaayoo.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="mysms") { ?>
            			<option value="mysms" selected="selected">MySms.com.gr - www.mysms.com.gr</option>
            		<?php }else{ ?>
            			<option value="mysms">MySms.com.gr - www.mysms.com.gr</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="nexmo") { ?>
            			<option value="nexmo" selected="selected">Nexmo - www.nexmo.com</option>
            		<?php }else{ ?>
            			<option value="nexmo">Nexmo - www.nexmo.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="netgsm") { ?>
            			<option value="netgsm" selected="selected">Netgsm.com.tr - www.netgsm.com.tr</option>
            		<?php }else{ ?>
            			<option value="netgsm">Netgsm.com.tr - www.netgsm.com.tr</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="oneway") { ?>
            			<option value="oneway" selected="selected">One Way SMS - www.onewaysms.com.my</option>
            		<?php }else{ ?>
            			<option value="oneway">One Way SMS - www.onewaysms.com.my</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="openhouse") { ?>
            			<option value="openhouse" selected="selected">Openhouse IMI Mobile - www.openhouse.imimobile.com</option>
            		<?php }else{ ?>
            			<option value="openhouse">Openhouse IMI Mobile - www.openhouse.imimobile.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="redsms") { ?>
            			<option value="redsms" selected="selected">Red SMS - www.redsms.in</option>
            		<?php }else{ ?>
            			<option value="redsms">Red SMS - www.redsms.in</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="routesms") { ?>
            			<option value="routesms" selected="selected">Routesms - www.routesms.com</option>
            		<?php }else{ ?>
            			<option value="routesms">Routesms - www.routesms.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="smsgatewayhub") { ?>
            			<option value="smsgatewayhub" selected="selected">SMS GATEWAYHUB - www.smsgatewayhub.com</option>
            		<?php }else{ ?>
            			<option value="smsgatewayhub">SMS GATEWAYHUB - www.smsgatewayhub.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="smslane") { ?>
            			<option value="smslane" selected="selected">SMS Lane - www.smslane.com</option>
            		<?php }else{ ?>
            			<option value="smslane">SMS Lane - www.smslane.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="smslaneg") { ?>
            			<option value="smslaneg" selected="selected">SMSLane Global SMS - www.world.smslane.com</option>
            		<?php }else{ ?>
            			<option value="smslaneg">SMSLane Global SMS - www.world.smslane.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="topsms") { ?>
            			<option value="topsms" selected="selected">TOP SMS - www.topsms.mobi</option>
            		<?php }else{ ?>
            			<option value="topsms">TOP SMS - www.topsms.mobi</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="velti") { ?>
            			<option value="velti" selected="selected">Velti - www.velti.com</option>
            		<?php }else{ ?>
            			<option value="velti">Velti - www.velti.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="zenziva") { ?>
            			<option value="zenziva" selected="selected">Zenziva - www.zenziva.com</option>
            		<?php }else{ ?>
            			<option value="zenziva">Zenziva - www.zenziva.com</option>
            		<?php } ?>
            		
              </select>
					 <?php if ($error_gateway) { ?>
                <span class="error help-block"><?php echo $error_gateway; ?></span>
                <?php } ?>						
			  </div>
			</div>
-->			
      		<div class="control-group">
				<label class="col-sm-2 control-label"><i class="required text-error icon-asterisk"></i><?php echo $entry_gateway; ?></label>
				<div class="col-sm-10 controls">
            
           <select name="gateway" class="form-control">
            		<option value=""><?php echo $text_none; ?></option>
            		
            		<?php if ($gateway=="amd") { ?>
            			<option value="amd" selected="selected">AMD Telecom - www.amdtelecom.net</option>
            		<?php }else{ ?>
            			<option value="amd">AMD Telecom - www.amdtelecom.net</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="smsglobal") { ?>
            			<option value="smsglobal" selected="selected">Bulk SMS Global - www.bulksmsglobal.in</option>
            		<?php }else{ ?>
            			<option value="smsglobal">Bulk SMS Global - www.bulksmsglobal.in</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="clickatell") { ?>
            			<option value="clickatell" selected="selected">Clickatell - www.clickatell.com</option>
            		<?php }else{ ?>
            			<option value="clickatell">Clickatell - www.clickatell.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="liveall") { ?>
            			<option value="liveall" selected="selected">LiveAll - www.liveall.eu</option>
            		<?php }else{ ?>
            			<option value="liveall">LiveAll - www.liveall.eu</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="malath") { ?>
            			<option value="malath" selected="selected">Malath SMS - sms.malath.net.sa</option>
            		<?php }else{ ?>
            			<option value="malath">Malath SMS - sms.malath.net.sa</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="mobily") { ?>
            			<option value="mobily" selected="selected">mobily.ws - www.mobily.ws</option>
            		<?php }else{ ?>
            			<option value="mobily">mobily.ws - www.mobily.ws</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="msegat") { ?>
            			<option value="msegat" selected="selected">Msegat.com - www.msegat.com</option>
            		<?php }else{ ?>
            			<option value="msegat">Msegat.com - www.msegat.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="msg91") { ?>
            			<option value="msg91" selected="selected">MSG91 - www.msg91.com</option>
            		<?php }else{ ?>
            			<option value="msg91">MSG91 - www.msg91.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="mvaayoo") { ?>
            			<option value="mvaayoo" selected="selected">mVaayoo - www.mvaayoo.com</option>
            		<?php }else{ ?>
            			<option value="mvaayoo">mVaayoo - www.mvaayoo.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="mysms") { ?>
            			<option value="mysms" selected="selected">MySms.com.gr - www.mysms.com.gr</option>
            		<?php }else{ ?>
            			<option value="mysms">MySms.com.gr - www.mysms.com.gr</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="nexmo") { ?>
            			<option value="nexmo" selected="selected">Nexmo - www.nexmo.com</option>
            		<?php }else{ ?>
            			<option value="nexmo">Nexmo - www.nexmo.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="netgsm") { ?>
            			<option value="netgsm" selected="selected">Netgsm.com.tr - www.netgsm.com.tr</option>
            		<?php }else{ ?>
            			<option value="netgsm">Netgsm.com.tr - www.netgsm.com.tr</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="oneway") { ?>
            			<option value="oneway" selected="selected">One Way SMS - www.onewaysms.com.my</option>
            		<?php }else{ ?>
            			<option value="oneway">One Way SMS - www.onewaysms.com.my</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="openhouse") { ?>
            			<option value="openhouse" selected="selected">Openhouse IMI Mobile - www.openhouse.imimobile.com</option>
            		<?php }else{ ?>
            			<option value="openhouse">Openhouse IMI Mobile - www.openhouse.imimobile.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="redsms") { ?>
            			<option value="redsms" selected="selected">Red SMS - www.redsms.in</option>
            		<?php }else{ ?>
            			<option value="redsms">Red SMS - www.redsms.in</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="routesms") { ?>
            			<option value="routesms" selected="selected">Routesms - www.routesms.com</option>
            		<?php }else{ ?>
            			<option value="routesms">Routesms - www.routesms.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="smsgatewayhub") { ?>
            			<option value="smsgatewayhub" selected="selected">SMS GATEWAYHUB - www.smsgatewayhub.com</option>
            		<?php }else{ ?>
            			<option value="smsgatewayhub">SMS GATEWAYHUB - www.smsgatewayhub.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="smslane") { ?>
            			<option value="smslane" selected="selected">SMS Lane - www.smslane.com</option>
            		<?php }else{ ?>
            			<option value="smslane">SMS Lane - www.smslane.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="smslaneg") { ?>
            			<option value="smslaneg" selected="selected">SMSLane Global SMS - www.world.smslane.com</option>
            		<?php }else{ ?>
            			<option value="smslaneg">SMSLane Global SMS - www.world.smslane.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="topsms") { ?>
            			<option value="topsms" selected="selected">TOP SMS - www.topsms.mobi</option>
            		<?php }else{ ?>
            			<option value="topsms">TOP SMS - www.topsms.mobi</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="velti") { ?>
            			<option value="velti" selected="selected">Velti - www.velti.com</option>
            		<?php }else{ ?>
            			<option value="velti">Velti - www.velti.com</option>
            		<?php } ?>
            		
            		<?php if ($gateway=="zenziva") { ?>
            			<option value="zenziva" selected="selected">Zenziva - www.zenziva.com</option>
            		<?php }else{ ?>
            			<option value="zenziva">Zenziva - www.zenziva.com</option>
            		<?php } ?>
            		
              </select>
             
              <?php if ($error_gateway) { ?>
              <span class="error help-block"><?php echo $error_gateway; ?></span>
              <?php } ?></div>
          </div>  
           
          				
          				
       
	      
	      	
	      	  
	      
	      	<div >
          	              		 <div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_term_mvaayoo; ?></label>
									<div class="controls">
										<label class="control-label"><?php echo $text_term_mvaayoo; ?></label>
										</div>
								</div>
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_userkey_mvaayoo; ?></label>
									<div class="controls">
										<input type="text" name="userkey_mvaayoo" value="<?php echo $userkey_mvaayoo; ?>"
											class="span4 i-xlarge">
                						<?php if ($error_userkey_mvaayoo) { ?>
               							 <span class="error help-block"><?php echo $error_userkey_mvaayoo; ?></span>
               							 <?php } ?>
										</div>
								</div>
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_passkey_mvaayoo; ?></label>
									<div class="controls">
										<input type="password" name="passkey_mvaayoo" value="<?php echo $passkey_mvaayoo; ?>"
											class="span4 i-xlarge">
                						<?php if ($error_passkey_mvaayoo) { ?>
               							 <span class="error help-block"><?php echo $error_passkey_mvaayoo; ?></span>
               							 <?php } ?>
										</div>
								</div>
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_httpapi_mvaayoo; ?></label>
									<div class="controls">
										<input type="text" name="httpapi_mvaayoo" value="<?php echo $httpapi_mvaayoo; ?>" 
											class="span4 i-xlarge"> <?php echo $httpapi_example_mvaayoo; ?>
                						<?php if ($error_httpapi_mvaayoo) { ?>
               							 <span class="error help-block"><?php echo $error_httpapi_mvaayoo; ?></span>
               							 <?php } ?>
										</div>
								</div>
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_senderid_mvaayoo; ?></label>
									<div class="controls">
										<input type="text" name="senderid_mvaayoo" value="<?php echo $senderid_mvaayoo; ?>" 
											class="span4 i-xlarge"> 
                						<?php if ($error_senderid_mvaayoo) { ?>
               							 <span class="error help-block"><?php echo $error_senderid_mvaayoo; ?></span>
               							 <?php } ?>
										</div>
								</div>
							</div>
	      	
	      	<!--<div id="gateway-mvaayoo" class="gateway">
	      		<div class="form-group">
				 <label class="col-sm-2 control-label" for="input-attribute-group"><?php echo $entry_term_mvaayoo; ?></label>
	            <td><span class="required"></span> <?php echo $entry_term_mvaayoo; ?></td>
	            <td><span class="required"></span> <?php echo $text_term_mvaayoo; ?></td>
	          </div>
	          <div class="form-group">
			   <label class="col-sm-2 control-label" for="input-attribute-group"><<?php echo $entry_term_mvaayoo; ?></label>
	            <div class="form-group"><span class="required">*</span> <?php echo $entry_userkey_mvaayoo; ?></td>
	            <td><input type="text" name="userkey_mvaayoo" value="<?php echo $userkey_mvaayoo; ?>" size="40px">
	            <?php if ($error_userkey_mvaayoo) { ?>
	              <span class="error"><?php echo $error_userkey_mvaayoo; ?></span>
	              <?php } ?></td>
	          </div>
	          <div class="form-group">
	          	<td><span class="required">*</span> <?php echo $entry_passkey_mvaayoo; ?></td>
	            <td><input type="password" name="passkey_mvaayoo" value="<?php echo $passkey_mvaayoo; ?>">
	            <?php if ($error_passkey_mvaayoo) { ?>
	              <span class="error"><?php echo $error_passkey_mvaayoo; ?></span>
	              <?php } ?></td>
	         </div>
	          <div class="form-group">
	          	<td><span class="required">*</span> <?php echo $entry_httpapi_mvaayoo; ?></td>
	            <td><input type="text" name="httpapi_mvaayoo" value="<?php echo $httpapi_mvaayoo; ?>" size="60px"><?php echo $httpapi_example_mvaayoo; ?>
	            <?php if ($error_httpapi_mvaayoo) { ?>
	              <span class="error"><?php echo $error_httpapi_mvaayoo; ?></span>
	              <?php } ?></td>
	          </div>
	          <div class="form-group">
	            <td><span class="required">*</span> <?php echo $entry_senderid_mvaayoo; ?></td>
	            <td><input type="text" name="senderid_mvaayoo" value="<?php echo $senderid_mvaayoo; ?>" maxlength="11">
	            <?php if ($error_senderid_mvaayoo) { ?>
	              <span class="error"><?php echo $error_senderid_mvaayoo; ?></span>
	              <?php } ?></td>
	          </div>
	      	</div>-->
	      		
	      	 
	      
	      	
	      
	      	
	      	<!-- 
	      	<tbody id="gateway-openhouse" class="gateway">
	          <tr>
	            <td><span class="required">*</span> <?php echo $entry_userkey_openhouse; ?></td>
	            <td><input type="text" name="userkey_openhouse" value="<?php echo $userkey_openhouse; ?>" size="60px">
	            <?php if ($error_userkey_openhouse) { ?>
	              <span class="error"><?php echo $error_userkey_openhouse; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	          	<td><span class="required">*</span> <?php echo $entry_passkey_openhouse; ?></td>
	            <td><input type="text" name="passkey_openhouse" value="<?php echo $passkey_openhouse; ?>">
	            <?php if ($error_passkey_openhouse) { ?>
	              <span class="error"><?php echo $error_passkey_openhouse; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	            <td><span class="required">*</span> <?php echo $entry_senderid_openhouse; ?></td>
	            <td><input type="text" name="senderid_openhouse" value="<?php echo $senderid_openhouse; ?>" >
	            <?php if ($error_senderid_openhouse) { ?>
	              <span class="error"><?php echo $error_senderid_openhouse; ?></span>
	              <?php } ?></td>
	          </tr>
	      	</tbody> -->
	      	<div class="gateway" id="gateway-redsms">
          	              		
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_userkey_redsms; ?></label>
									<div class="controls">
										<input type="text" name="userkey_redsms" value="<?php echo $userkey_redsms; ?>"
											class="span4 i-xlarge">
                						<?php if ($error_userkey_redsms) { ?>
               							 <span class="error help-block"><?php echo $error_userkey_redsms; ?></span>
               							 <?php } ?>
										</div>
								</div>
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_passkey_redsms; ?></label>
									<div class="controls">
										<input type="password" name="passkey_redsms" value="<?php echo $passkey_redsms; ?>"
											class="span4 i-xlarge">
                						<?php if ($error_passkey_redsms) { ?>
               							 <span class="error help-block"><?php echo $error_passkey_redsms; ?></span>
               							 <?php } ?>
										</div>
								</div>
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_httpapi_redsms; ?></label>
									<div class="controls">
										<input type="text" name="httpapi_redsms" value="<?php echo $httpapi_redsms; ?>" 
											class="span4 i-xlarge"> <?php echo $httpapi_example_redsms; ?>
                						<?php if ($error_httpapi_redsms) { ?>
               							 <span class="error help-block"><?php echo $error_httpapi_redsms; ?></span>
               							 <?php } ?>
										</div>
								</div>
								
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_senderid_redsms; ?></label>
									<div class="controls">
										<input type="text" name="senderid_redsms" value="<?php echo $senderid_redsms; ?>" 
											class="span4 i-xlarge"> 
                						<?php if ($error_senderid_redsms) { ?>
               							 <span class="error help-block"><?php echo $error_senderid_redsms; ?></span>
               							 <?php } ?>
										</div>
								</div>
							</div>
	      	
	      	<div class="gateway" id="gateway-routesms">
          	              		
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_userkey_routesms; ?></label>
									<div class="controls">
										<input type="text" name="userkey_routesms" value="<?php echo $userkey_routesms; ?>"
											class="span4 i-xlarge">
                						<?php if ($error_userkey_routesms) { ?>
               							 <span class="error help-block"><?php echo $error_userkey_routesms; ?></span>
               							 <?php } ?>
										</div>
								</div>
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_passkey_routesms; ?></label>
									<div class="controls">
										<input type="password" name="passkey_routesms" value="<?php echo $passkey_routesms; ?>"
											class="span4 i-xlarge">
                						<?php if ($error_passkey_routesms) { ?>
               							 <span class="error help-block"><?php echo $error_passkey_routesms; ?></span>
               							 <?php } ?>
										</div>
								</div>
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_httpapi_routesms; ?></label>
									<div class="controls">
										<input type="text" name="httpapi_routesms" value="<?php echo $httpapi_routesms; ?>" 
											class="span4 i-xlarge"> <?php echo $httpapi_example_routesms; ?>
                						<?php if ($error_httpapi_routesms) { ?>
               							 <span class="error help-block"><?php echo $error_httpapi_routesms; ?></span>
               							 <?php } ?>
										</div>
								</div>
								
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_senderid_routesms; ?></label>
									<div class="controls">
										<input type="text" name="senderid_routesms" value="<?php echo $senderid_routesms; ?>" 
											class="span4 i-xlarge"> 
                						<?php if ($error_senderid_routesms) { ?>
               							 <span class="error help-block"><?php echo $error_senderid_routesms; ?></span>
               							 <?php } ?>
										</div>
								</div>
							</div>
	      	<!-- 
	      	<tbody id="gateway-routesms" class="gateway">
	          <tr>
	            <td><span class="required">*</span> <?php echo $entry_userkey_routesms; ?></td>
	            <td><input type="text" name="userkey_routesms" value="<?php echo $userkey_routesms; ?>">
	            <?php if ($error_userkey_routesms) { ?>
	              <span class="error"><?php echo $error_userkey_routesms; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	          	<td><span class="required">*</span> <?php echo $entry_passkey_routesms; ?></td>
	            <td><input type="password" name="passkey_routesms" value="<?php echo $passkey_routesms; ?>">
	            <?php if ($error_passkey_routesms) { ?>
	              <span class="error"><?php echo $error_passkey_routesms; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	          	<td><span class="required">*</span> <?php echo $entry_httpapi_routesms; ?></td>
	            <td><input type="text" name="httpapi_routesms" value="<?php echo $httpapi_routesms; ?>" size="60px"><?php echo $httpapi_example_routesms; ?>
	            <?php if ($error_httpapi_routesms) { ?>
	              <span class="error"><?php echo $error_httpapi_routesms; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	            <td><span class="required">*</span> <?php echo $entry_senderid_routesms; ?></td>
	            <td><input type="text" name="senderid_routesms" value="<?php echo $senderid_routesms; ?>" maxlength="18">
	            <?php if ($error_senderid_routesms) { ?>
	              <span class="error"><?php echo $error_senderid_routesms; ?></span>
	              <?php } ?></td>
	          </tr>
	      	</tbody> -->
	      	
	      	<!-- 
	      	<tbody id="gateway-smsgatewayhub" class="gateway">
	      		<tr>
	            <td><span class="required"></span> <?php echo $entry_term_smsgatewayhub; ?></td>
	            <td><span class="required"></span> <?php echo $text_term_smsgatewayhub; ?></td>
	          </tr>
	          <tr>
	            <td><span class="required">*</span> <?php echo $entry_userkey_smsgatewayhub; ?></td>
	            <td><input type="text" name="userkey_smsgatewayhub" value="<?php echo $userkey_smsgatewayhub; ?>" size="40px">
	            <?php if ($error_userkey_smsgatewayhub) { ?>
	              <span class="error"><?php echo $error_userkey_smsgatewayhub; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	          	<td><span class="required">*</span> <?php echo $entry_passkey_smsgatewayhub; ?></td>
	            <td><input type="password" name="passkey_smsgatewayhub" value="<?php echo $passkey_smsgatewayhub; ?>">
	            <?php if ($error_passkey_smsgatewayhub) { ?>
	              <span class="error"><?php echo $error_passkey_smsgatewayhub; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	          	<td><span class="required">*</span> <?php echo $entry_httpapi_smsgatewayhub; ?></td>
	            <td><input type="text" name="httpapi_smsgatewayhub" value="<?php echo $httpapi_smsgatewayhub; ?>" size="60px"><?php echo $httpapi_example_smsgatewayhub; ?>
	            <?php if ($error_httpapi_smsgatewayhub) { ?>
	              <span class="error"><?php echo $error_httpapi_smsgatewayhub; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	            <td><span class="required">*</span> <?php echo $entry_senderid_smsgatewayhub; ?></td>
	            <td><input type="text" name="senderid_smsgatewayhub" value="<?php echo $senderid_smsgatewayhub; ?>" maxlength="11">
	            <?php if ($error_senderid_smsgatewayhub) { ?>
	              <span class="error"><?php echo $error_senderid_smsgatewayhub; ?></span>
	              <?php } ?></td>
	          </tr>
	      	</tbody> -->
	      	
	      	<!-- 
	      	<tbody id="gateway-smslane" class="gateway">
	          <tr>
	            <td><span class="required">*</span> <?php echo $entry_userkey_smslane; ?></td>
	            <td><input type="text" name="userkey_smslane" value="<?php echo $userkey_smslane; ?>">
	            <?php if ($error_userkey_smslane) { ?>
	              <span class="error"><?php echo $error_userkey_smslane; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	          	<td><span class="required">*</span> <?php echo $entry_passkey_smslane; ?></td>
	            <td><input type="password" name="passkey_smslane" value="<?php echo $passkey_smslane; ?>">
	            <?php if ($error_passkey_smslane) { ?>
	              <span class="error"><?php echo $error_passkey_smslane; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	          	<td><span class="required">*</span> <?php echo $entry_httpapi_smslane; ?></td>
	            <td><input type="text" name="httpapi_smslane" value="<?php echo $httpapi_smslane; ?>" size="60px"><?php echo $httpapi_example_smslane; ?>
	            <?php if ($error_httpapi_smslane) { ?>
	              <span class="error"><?php echo $error_httpapi_smslane; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	            <td><span class="required">*</span> <?php echo $entry_senderid_smslane; ?></td>
	            <td><input type="text" name="senderid_smslane" value="<?php echo $senderid_smslane; ?>" maxlength="16">
	            <?php if ($error_senderid_smslane) { ?>
	              <span class="error"><?php echo $error_senderid_smslane; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
              <td><?php echo $entry_unicode_smslane; ?></td>
              <td><?php if ($config_unicode_smslane) { ?>
                <input type="radio" name="config_unicode_smslane" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_unicode_smslane" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_unicode_smslane" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_unicode_smslane" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
	      	</tbody> -->
	      
	      	<!-- 
	      	<tbody id="gateway-smslaneg" class="gateway">
	          <tr>
	            <td><span class="required">*</span> <?php echo $entry_userkey_smslaneg; ?></td>
	            <td><input type="text" name="userkey_smslaneg" value="<?php echo $userkey_smslaneg; ?>">
	            <?php if ($error_userkey_smslaneg) { ?>
	              <span class="error"><?php echo $error_userkey_smslaneg; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	          	<td><span class="required">*</span> <?php echo $entry_passkey_smslaneg; ?></td>
	            <td><input type="password" name="passkey_smslaneg" value="<?php echo $passkey_smslaneg; ?>">
	            <?php if ($error_passkey_smslaneg) { ?>
	              <span class="error"><?php echo $error_passkey_smslaneg; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	          	<td><span class="required">*</span> <?php echo $entry_httpapi_smslaneg; ?></td>
	            <td><input type="text" name="httpapi_smslaneg" value="<?php echo $httpapi_smslaneg; ?>" size="60px"><?php echo $httpapi_example_smslaneg; ?>
	            <?php if ($error_httpapi_smslaneg) { ?>
	              <span class="error"><?php echo $error_httpapi_smslaneg; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	            <td><span class="required">*</span> <?php echo $entry_senderid_smslaneg; ?></td>
	            <td><input type="text" name="senderid_smslaneg" value="<?php echo $senderid_smslaneg; ?>" maxlength="11">
	            <?php if ($error_senderid_smslaneg) { ?>
	              <span class="error"><?php echo $error_senderid_smslaneg; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
              <td><?php echo $entry_unicode_smslaneg; ?></td>
              <td><?php if ($config_unicode_smslaneg) { ?>
                <input type="radio" name="config_unicode_smslaneg" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_unicode_smslaneg" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_unicode_smslaneg" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_unicode_smslaneg" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
	      	</tbody>-->
	      	
	      	<!-- 
	      	<tbody id="gateway-topsms" class="gateway">
	          <tr>
	            <td><span class="required">*</span> <?php echo $entry_userkey_topsms; ?></td>
	            <td><input type="text" name="userkey_topsms" value="<?php echo $userkey_topsms; ?>">
	            <?php if ($error_userkey_topsms) { ?>
	              <span class="error"><?php echo $error_userkey_topsms; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	          	<td><span class="required">*</span> <?php echo $entry_passkey_topsms; ?></td>
	            <td><input type="password" name="passkey_topsms" value="<?php echo $passkey_topsms; ?>">
	            <?php if ($error_passkey_topsms) { ?>
	              <span class="error"><?php echo $error_passkey_topsms; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	          	<td><span class="required">*</span> <?php echo $entry_httpapi_topsms; ?></td>
	            <td><input type="text" name="httpapi_topsms" value="<?php echo $httpapi_topsms; ?>" size="60px"><?php echo $httpapi_example_topsms; ?>
	            <?php if ($error_httpapi_topsms) { ?>
	              <span class="error"><?php echo $error_httpapi_topsms; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	            <td><span class="required">*</span> <?php echo $entry_senderid_topsms; ?></td>
	            <td><input type="text" name="senderid_topsms" value="<?php echo $senderid_topsms; ?>" maxlength="11">
	            <?php if ($error_senderid_topsms) { ?>
	              <span class="error"><?php echo $error_senderid_topsms; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
              <td><?php echo $entry_lang_topsms; ?></td>
              <td><?php if ($config_lang_topsms) { ?>
                <input type="radio" name="config_lang_topsms" value="1" checked="checked" />
                <?php echo $text_ar; ?>
                <input type="radio" name="config_lang_topsms" value="0" />
                <?php echo $text_en; ?>
                <?php } else { ?>
                <input type="radio" name="config_lang_topsms" value="1" />
                <?php echo $text_ar; ?>
                <input type="radio" name="config_lang_topsms" value="0" checked="checked" />
                <?php echo $text_en; ?>
                <?php } ?></td>
            </tr>
	      	</tbody> -->
	      	
	      	<!-- 
	      	<tbody id="gateway-velti" class="gateway">
	          <tr>
	            <td><span class="required">*</span> <?php echo $entry_userkey_velti; ?></td>
	            <td><input type="text" name="userkey_velti" value="<?php echo $userkey_velti; ?>">
	            <?php if ($error_userkey_velti) { ?>
	              <span class="error"><?php echo $error_userkey_velti; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	          	<td><span class="required">*</span> <?php echo $entry_passkey_velti; ?></td>
	            <td><input type="password" name="passkey_velti" value="<?php echo $passkey_velti; ?>">
	            <?php if ($error_passkey_velti) { ?>
	              <span class="error"><?php echo $error_passkey_velti; ?></span>
	              <?php } ?></td>
	          </tr>
	          <tr>
	          	<td><span class="required">*</span> <?php echo $entry_httpapi_velti; ?></td>
	            <td><input type="text" name="httpapi_velti" value="<?php echo $httpapi_velti; ?>" size="60px"><?php echo $httpapi_example_velti; ?>
	            <?php if ($error_httpapi_velti) { ?>
	              <span class="error"><?php echo $error_httpapi_velti; ?></span>
	              <?php } ?></td>
	          </tr>
	      	</tbody> 
	      	
	      	
	      	<tr>
	          <td><?php echo $entry_smslimit; ?></td>
	          <td><input type="text" name="smslimit" value="<?php echo $smslimit; ?>" size="3"> <?php echo $text_limit; ?></td>
	        </tr> -->
	       
	        <!--  
	        <tr>
          	<td><?php echo $entry_alert_reg; ?></td>
          	<td><textarea name="message_reg" cols="47" rows="5" ><?php echo $message_reg; ?></textarea><?php echo $entry_alert_blank; ?>
            </td>
          </tr>
          <tr>
          	<td><?php echo $entry_alert_reg_vendor; ?></td>
          	<td><textarea name="message_reg_vendor" cols="47" rows="5" ><?php echo $message_reg_vendor; ?></textarea><?php echo $entry_alert_blank; ?>
            </td>
          </tr>
          <tr>
          	<td><?php echo $entry_alert_order; ?></td>
          	<td><textarea name="message_order" cols="47" rows="5" ><?php echo $message_order; ?></textarea><?php echo $entry_alert_blank; ?><?php echo $entry_parsing; ?>
            </td>
          </tr>
          <tr>
          	<td><?php echo $entry_alert_order_more; ?></td>
          	<td><textarea name="message_order_more" cols="47" rows="5" ><?php echo $message_order_more; ?></textarea><?php echo $entry_alert_blank; ?><?php ?>
            </td>
          </tr>
          <tr>
          	<td><?php echo $entry_alert_order_more_for_vendor; ?></td>
          	<td><textarea name="message_order_more_for_vendor" cols="47" rows="5" ><?php echo $message_order_more_for_vendor; ?></textarea><?php echo $entry_alert_blank; ?><?php ?>
            </td>
          </tr>
          <tr>
          	
          	<td><?php echo $entry_alert_order_for_vendor; ?></td>
          	<td><textarea name="message_order_for_vendor" cols="47" rows="5" ><?php echo $message_order_for_vendor; ?></textarea><?php echo $entry_alert_blank; ?><?php echo $entry_parsing; ?>
            </td>
          </tr>-->
          						<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_status_order_alert; ?></label>
									<div class="controls">
										<select name="status">
            								<option value=""><?php echo $text_status_none; ?></option>
            		
            								<?php foreach ($order_statuses as $order_status) { ?>
               								 <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
               								 <?php } ?>
                
             							 </select>				
             						 </div>
								</div>
		<!-- 						
          <tr>
            <td><?php echo $entry_status_order_alert; ?></td>
            <td><select name="status">
            		<option value=""><?php echo $text_status_none; ?></option>
            		
            		<?php foreach ($order_statuses as $order_status) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                
              </select>
            </td>
          </tr>
           -->
           <?php foreach ($order_statuses as $order_status) { ?>
              <div id="status-<?php echo $order_status['order_status_id'] ?>" class="status">
          			<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $order_status['name'].$entry_alert_changestate; ?></label>
									<div class="controls">
										<textarea name="message_changestate_<?php echo $order_status['order_status_id'] ?>" cols="47" rows="5" ><?php echo ${"message_changestate_" . $order_status['order_status_id']}; ?></textarea><?php echo $entry_alert_blank; ?>		
             						 </div>
								</div>
			</div>
          <?php } ?>
          <!-- 
          <?php foreach ($order_statuses as $order_status) { ?>
	          <tbody id="status-<?php echo $order_status['order_status_id'] ?>" class="status">
	             <tr>
				         <td><?php echo '<span class="required">'.$order_status['name'].'</span> '.$entry_alert_changestate; ?></td>
				         <td><textarea name="message_changestate_<?php echo $order_status['order_status_id'] ?>" cols="47" rows="5" ><?php echo ${"message_changestate_" . $order_status['order_status_id']}; ?></textarea><?php echo $entry_alert_blank; ?>
				         </td>
			         </tr>
			      </tbody>
          <?php } ?> -->
          <div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_status_order_alert_for_vendor; ?></label>
									<div class="controls">
										<select name="status_for_vendor">
            								<option value=""><?php echo $text_status_none; ?></option>
            		
            								<?php foreach ($order_statuses as $order_status) { ?>
               								 <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
               								 <?php } ?>
                
             							 </select>				
             						 </div>
								</div>
          <!-- 
          <tr>
            <td><?php echo $entry_status_order_alert_for_vendor; ?></td>
            <td><select name="status_for_vendor">
            		<option value=""><?php echo $text_status_none; ?></option>
            		
            		<?php foreach ($order_statuses as $order_status) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                
              </select>
            </td>
          </tr>  -->
            <?php foreach ($order_statuses as $order_status) { ?>
              <div id="status-vendor-<?php echo $order_status['order_status_id'] ?>" class="status_for_vendor">
          			<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $order_status['name'].$entry_alert_changestate; ?></label>
									<div class="controls">
										<textarea name="message_changestate_for_vendor_<?php echo $order_status['order_status_id'] ?>" cols="47" rows="5" ><?php echo ${"message_changestate_for_vendor_" . $order_status['order_status_id']}; ?></textarea><?php echo $entry_alert_blank; ?>		
             						 </div>
								</div>
								   </div>
          <?php } ?>
				<!--  				
          <?php foreach ($order_statuses as $order_status) { ?>
	          <tbody id="status-vendor-<?php echo $order_status['order_status_id'] ?>" class="status">
	             <tr>
				         <td><?php echo '<span class="required">'.$order_status['name'].'</span> '.$entry_alert_changestate; ?></td>
				         <td><textarea name="message_changestate_for_vendor_<?php echo $order_status['order_status_id'] ?>" cols="47" rows="5" ><?php echo ${"message_changestate_for_vendor_" . $order_status['order_status_id']}; ?></textarea><?php echo $entry_alert_blank; ?>
				         </td>
			         </tr>
			      </tbody>
          <?php } ?>
          -->
         					  <div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_alert_sms; ?></label>
									<div class="controls">
										<textarea name="config_alert_sms" cols="47" rows="5" ><?php echo $config_alert_sms; ?></textarea><?php echo $entry_alert_blank; ?><?php echo $entry_parsing; ?>
                						
										</div>
								</div>
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_account_sms; ?></label>
									<div class="controls">
										<textarea name="config_account_sms" cols="47" rows="5" ><?php echo $config_account_sms; ?></textarea><?php echo $entry_alert_blank; ?>
                						
										</div>
								</div>
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_additional_alert; ?></label>
									<div class="controls">
										<textarea name="message_alert" cols="47" rows="5" ><?php echo $message_alert; ?></textarea><?php echo $entry_alert_blank; ?>
                						
										</div>
								</div>
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_vendor_approval; ?></label>
									<div class="controls">
										<textarea name="config_message_alert_for_vendor_appoval" cols="47" rows="5" ><?php echo $config_message_alert_for_vendor_appoval; ?></textarea><?php echo $entry_alert_blank; ?>
                						
										</div>
								</div>
          <!-- 
          <tr>
              <td><?php echo $entry_alert_sms; ?></td>
              <td><textarea name="config_alert_sms" cols="47" rows="5" ><?php echo $config_alert_sms; ?></textarea><?php echo $entry_alert_blank; ?><?php echo $entry_parsing; ?></td>
          </tr>
          
          <tr>
              <td><?php echo $entry_account_sms; ?></td>
              <td><textarea name="config_account_sms" cols="47" rows="5" ><?php echo $config_account_sms; ?></textarea><?php echo $entry_alert_blank; ?></td>
            </tr>
            
          <tr>
          	<td><?php echo $entry_additional_alert; ?></td>
          	<td><textarea name="message_alert" cols="47" rows="5" ><?php echo $message_alert; ?></textarea><?php echo $entry_alert_blank; ?>
            </td>
          </tr>
           <tr>
          	<td><?php echo $entry_vendor_approval; ?></td>
          	<td><textarea name="config_message_alert_for_vendor_appoval" cols="47" rows="5" ><?php echo $config_message_alert_for_vendor_appoval; ?></textarea><?php echo $entry_alert_blank; ?>
            </td>
          </tr> -->
        					  <div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $text_enable_verify; ?></label>
									<div class="controls">
											<select name="verify">
            		
            								<?php if ($verify==0) { ?>
            									<option value="0" selected="selected"><?php echo $text_no; ?></option>
            								<?php }else{ ?>
            									<option value="0"><?php echo $text_no; ?></option>
            								<?php } ?>
            		
            								<?php if ($verify==1) { ?>
            									<option value="1" selected="selected"><?php echo $text_yes; ?></option>
            								<?php }else{ ?>
           							 			<option value="1"><?php echo $text_yes; ?></option>
            								<?php } ?>
                
           									   </select>                						
										</div>
								</div>
							<tbody id="verify-1" class="verify">
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $text_verify_checkout; ?></label>
									<div class="controls">
											<select name="order_verify">
            		
            								<?php if ($order_verify==0) { ?>
            									<option value="0" selected="selected"><?php echo $text_no; ?></option>
            								<?php }else{ ?>
            									<option value="0"><?php echo $text_no; ?></option>
            								<?php } ?>
            		
            								<?php if ($order_verify==1) { ?>
            									<option value="1" selected="selected"><?php echo $text_yes; ?></option>
            								<?php }else{ ?>
           							 			<option value="1"><?php echo $text_yes; ?></option>
            								<?php } ?>
                
           									   </select>                						
										</div>
								</div>
								<div class="control-group order_verify" id="order_verify-1">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_skip_payment_method; ?></label>
									<div class="controls">
										<select name="skip_payment_method[]" multiple="multiple" size="5">
		              						<option id="null" onClick="$('.nulls').removeAttr('selected')" value="none" <?php if (@in_array('none', $skip_payment_method)) echo "selected";?>>None</option>
		                 					 <?php foreach ($payment_methods as $payment_method) { ?>
		                  					<option class="nulls" onClick="$('#null').removeAttr('selected')" value="<?php echo $payment_method['code']; ?>" <?php if (@in_array($payment_method['code'],$skip_payment_method)) echo "selected";?>><?php echo $payment_method['title']; ?>
		                  					<?php } ?>
		                				</select><?php echo $entry_skip_payment_method_help; ?>              						
									</div>
								</div>
								<div class="control-group order_verify" id="order_verify-1">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_skip_group; ?></label>
									<div class="controls">
										<select name="skip_group_id[]" multiple="multiple" size="5">
		              						<option id="none" onClick="$('.nones').removeAttr('selected')" value=0 <?if (@in_array(0,$skip_group_id)) echo "selected";?>>None</option>
		                				    <?php foreach ($customer_groups as $customer_group) { ?>
		            					      <!--<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>-->
		             					     <option class="nones" onClick="$('#none').removeAttr('selected')" value="<?php echo $customer_group['customer_group_id']; ?>" <?php if (@in_array($customer_group['customer_group_id'],$skip_group_id)) echo "selected";?>><?php echo $customer_group['name']; ?>
		             					     <?php } ?>
		              				   </select><?php echo $entry_skip_group_help; ?>              						
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $text_verify_register; ?></label>
									<div class="controls">
											<select name="register_verify">
            		
            								<?php if ($register_verify==0) { ?>
            									<option value="0" selected="selected"><?php echo $text_no; ?></option>
            								<?php }else{ ?>
            									<option value="0"><?php echo $text_no; ?></option>
            								<?php } ?>
            		
            								<?php if ($register_verify==1) { ?>
            									<option value="1" selected="selected"><?php echo $text_yes; ?></option>
            								<?php }else{ ?>
           							 			<option value="1"><?php echo $text_yes; ?></option>
            								<?php } ?>
                
           									   </select>                						
										</div>
								</div>
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $text_verify_forgotten; ?></label>
									<div class="controls">
											<select name="forgotten_verify">
            		
            								<?php if ($forgotten_verify==0) { ?>
            									<option value="0" selected="selected"><?php echo $text_no; ?></option>
            								<?php }else{ ?>
            									<option value="0"><?php echo $text_no; ?></option>
            								<?php } ?>
            		
            								<?php if ($forgotten_verify==1) { ?>
            									<option value="1" selected="selected"><?php echo $text_yes; ?></option>
            								<?php }else{ ?>
           							 			<option value="1"><?php echo $text_yes; ?></option>
            								<?php } ?>
                
           									   </select>                						
										</div>
								</div>
								
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_code_digit; ?></label>
									<div class="controls">
										<input type="text" name="code_digit" value="<?php echo $code_digit; ?>"  onkeyup="this.value = this.value.replace (/\D+/, '')" 
											class="span4 i-xlarge"> 
                						<?php if ($error_code_digit) { ?>
               							 <span class="error help-block"><?php echo $error_code_digit; ?></span>
               							 <?php } ?>
										</div>
								</div>
								<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_max_retry; ?></label>
									<div class="controls">
										<input type="text" name="max_retry" value="<?php echo $max_retry; ?>"  onkeyup="this.value = this.value.replace (/\D+/, '')" 
											class="span4 i-xlarge"> <?php echo $entry_limit_blank; ?>
                						
										</div>
								</div>
		           				<div class="control-group">
									<label class="control-label"><i
										class="required text-error icon-asterisk"></i> <?php echo $entry_verify_code; ?></label>
									<div class="controls">
										<textarea name="message_code_verification" cols="47" rows="5" ><?php echo $message_code_verification; ?></textarea>
                						<?php if ($error_message_code_verification) { ?>
               							 <span class="error help-block"><?php echo $error_message_code_verification; ?></span>
               							 <?php } ?>
										</div>
								</div>
		         
		          
		          
		        
          		
		        
								
								
								</tbody>
          
          <!-- 
          <tr>
            <td><?php echo $text_enable_verify; ?></td>
            <td><select name="verify">
            		
            		<?php if ($verify==0) { ?>
            			<option value="0" selected="selected"><?php echo $text_no; ?></option>
            		<?php }else{ ?>
            			<option value="0"><?php echo $text_no; ?></option>
            		<?php } ?>
            		
            		<?php if ($verify==1) { ?>
            			<option value="1" selected="selected"><?php echo $text_yes; ?></option>
            		<?php }else{ ?>
            			<option value="1"><?php echo $text_yes; ?></option>
            		<?php } ?>
                
              </select>
            </td>
          </tr>  -->
        <!-- 
          <tbody id="verify-1" class="verify">
          		<tr>
		            <td><?php echo $text_verify_checkout; ?></td>
		            <td><select name="order_verify">
		            		
		            		<?php if ($order_verify==0) { ?>
		            			<option value="0" selected="selected"><?php echo $text_no; ?></option>
		            		<?php }else{ ?>
		            			<option value="0"><?php echo $text_no; ?></option>
		            		<?php } ?>
		            		
		            		<?php if ($order_verify==1) { ?>
		            			<option value="1" selected="selected"><?php echo $text_yes; ?></option>
		            		<?php }else{ ?>
		            			<option value="1"><?php echo $text_yes; ?></option>
		            		<?php } ?>
		                
		              </select>
		            </td>
		          </tr>
		          
		          <tr id="order_verify-1" class="order_verify">
		              <td><span class="required">*</span> <?php echo $entry_skip_payment_method; ?></td>
		              <td>
		              	<select name="skip_payment_method[]" multiple="multiple" size="5">
		              		<option id="null" onClick="$('.nulls').removeAttr('selected')" value="none" <?php if (@in_array('none', $skip_payment_method)) echo "selected";?>>None</option>
		                  <?php foreach ($payment_methods as $payment_method) { ?>
		                  <option class="nulls" onClick="$('#null').removeAttr('selected')" value="<?php echo $payment_method['code']; ?>" <?php if (@in_array($payment_method['code'],$skip_payment_method)) echo "selected";?>><?php echo $payment_method['title']; ?>
		                  <?php } ?>
		                </select><?php echo $entry_skip_payment_method_help; ?>
		              </td>
		           </tr>
		           
		           <tr id="order_verify-1" class="order_verify">
		              <td><span class="required">*</span> <?php echo $entry_skip_group; ?></td>
		              <td>
		              	<select name="skip_group_id[]" multiple="multiple" size="5">
		              		<option id="none" onClick="$('.nones').removeAttr('selected')" value=0 <?if (@in_array(0,$skip_group_id)) echo "selected";?>>None</option>
		                  <?php foreach ($customer_groups as $customer_group) { ?>
		                  <option class="nones" onClick="$('#none').removeAttr('selected')" value="<?php echo $customer_group['customer_group_id']; ?>" <?php if (@in_array($customer_group['customer_group_id'],$skip_group_id)) echo "selected";?>><?php echo $customer_group['name']; ?>
		                  <?php } ?>
		                </select><?php echo $entry_skip_group_help; ?>
		              </td>
		           </tr>
		           
		           <tr>
		            <td><?php echo $text_verify_register; ?></td>
		            <td><select name="register_verify">
		            		
		            		<?php if ($register_verify==0) { ?>
		            			<option value="0" selected="selected"><?php echo $text_no; ?></option>
		            		<?php }else{ ?>
		            			<option value="0"><?php echo $text_no; ?></option>
		            		<?php } ?>
		            		
		            		<?php if ($register_verify==1) { ?>
		            			<option value="1" selected="selected"><?php echo $text_yes; ?></option>
		            		<?php }else{ ?>
		            			<option value="1"><?php echo $text_yes; ?></option>
		            		<?php } ?>
		                
		              </select>
		            </td>
		          </tr>
		          
		          <tr>
		            <td><?php echo $text_verify_forgotten; ?></td>
		            <td><select name="forgotten_verify">
		            		
		            		<?php if ($forgotten_verify==0) { ?>
		            			<option value="0" selected="selected"><?php echo $text_no; ?></option>
		            		<?php }else{ ?>
		            			<option value="0"><?php echo $text_no; ?></option>
		            		<?php } ?>
		            		
		            		<?php if ($forgotten_verify==1) { ?>
		            			<option value="1" selected="selected"><?php echo $text_yes; ?></option>
		            		<?php }else{ ?>
		            			<option value="1"><?php echo $text_yes; ?></option>
		            		<?php } ?>
		                
		              </select>
		            </td>
		          </tr>
		          
          		<tr>
		            <td><span class="required">*</span> <?php echo $entry_code_digit; ?></td>
		            <td>
		            	<input type="text" name="code_digit" value="<?php echo $code_digit; ?>" onkeyup="this.value = this.value.replace (/\D+/, '')" />
		            	<?php if ($error_code_digit) { ?>
		              <span class="error"><?php echo $error_code_digit; ?></span>
		              <?php } ?>
		            </td>
		          </tr>
		          
		          <tr>
		            <td><?php echo $entry_max_retry; ?></td>
		            <td>
		            	<input type="text" name="max_retry" value="<?php echo $max_retry; ?>" onkeyup="this.value = this.value.replace (/\D+/, '')" />
		            	<?php echo $entry_limit_blank; ?>
		            </td>
		          </tr>
	          
	            <tr>
				        <td><span class="required">*</span> <?php echo $entry_verify_code ?></td>
				        <td>
				        <textarea name="message_code_verification" cols="47" rows="5" ><?php echo $message_code_verification; ?></textarea>
				        <?php if ($error_message_code_verification) { ?>
		            <span class="error"><?php echo $error_message_code_verification; ?></span>
		            <?php } ?>
				        </td>
			        </tr>
			         
			      </tbody>  -->
          
        </div>
        
         <table id="module" class="list table table-striped table-hover">
          <thead>
            <tr>
              <th class="column-layout"><?php echo $entry_layout; ?></th>
              <th class="column-position"><?php echo $entry_position; ?></th>
              <th class="column-status"><?php echo $entry_status; ?></th>
              <th class="column-sort"><?php echo $entry_sort_order; ?></th>
              <th></th>
            </tr>
          </thead>
          
          <tbody>
						<?php $module_row = 0; ?>
						<?php foreach ($modules as $module) { ?>
						<tr id="module-row<?php echo $module_row; ?>">
              <td class="column-layout">
								<label class="visible-480"><?php echo $entry_layout; ?></label>
								<select name="filter_module[<?php echo $module_row; ?>][layout_id]" class="span2 i-large">
                  <?php echo p3html::oc_layout_options($layouts, $module); ?>
                </select>
							</td>
              <td class="column-position">
								<label class="visible-480"><?php echo $entry_position; ?></label>
								<select name="filter_module[<?php echo $module_row; ?>][position]" class="span2 i-medium">
                  <?php echo p3html::oc_position_options($this->language, $module); ?>
                </select>
							</td>
              <td class="column-status">
								<label class="visible-480"><?php echo $entry_status; ?></label>
								<select name="filter_module[<?php echo $module_row; ?>][status]" class="input-small">
                  <?php echo p3html::oc_status_options($this->language, $module); ?>
                </select>
							</td>
              <td class="column-sort">
								<label class="visible-480"><?php echo $entry_sort_order; ?></label>
								<input type="text" name="filter_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" class="span1 i-mini">
							</td>
              <td class="column-action">
								<a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="btn btn-small"><i class="icon-trash ims" title="<?php echo $button_remove; ?>"></i><span class="hidden-phone"> <?php echo $button_remove; ?></span></a>
							</td>
            </tr>
						<?php $module_row++; ?>
						<?php } ?>
          </tbody>
           <tfoot>
            <tr>
              <td colspan="4"></td>
              <td class="column-action"><a onclick="addModule();" class="btn btn-small" title="<?php echo $button_add_module; ?>"><i class="icon-plus-squared"></i><span class="hidden-phone"> <?php echo $button_add_module; ?></span></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
	</div>
  </div>
  
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $intruction_title; ?></h1>
    </div>
    <div class="content" height="20%">
      <?php echo $text_instruction; ?>
    </div>
  </div>
  
</div>

<script type="text/javascript"><!--	
$('select[name=\'gateway\']').bind('change', function() {
	$('#setgate .gateway').hide();
	
	$('#setgate #gateway-' + $(this).attr('value').replace('_', '-')).show();
});

$('select[name=\'gateway\']').trigger('change');


$('select[name=\'status\']').bind('change', function() {
	$('#setgate .status').hide();
	
	$('#setgate #status-' + $(this).attr('value').replace('_', '-')).show();
});

$('select[name=\'status\']').trigger('change');

$('select[name=\'status_for_vendor\']').bind('change', function() {
	$('#setgate .status_for_vendor').hide();
	
	$('#setgate #status-vendor-' + $(this).attr('value').replace('_', '-')).show();
});
$('select[name=\'status_for_vendor\']').trigger('change');


$('select[name=\'verify\']').bind('change', function() {
	$('#setgate .verify').hide();
	
	$('#setgate #verify-' + $(this).attr('value').replace('_', '-')).show();
});

$('select[name=\'verify\']').trigger('change');

$('select[name=\'order_verify\']').bind('change', function() {
	$('#setgate .order_verify').hide();
	
	$('#setgate #order_verify-' + $(this).attr('value').replace('_', '-')).show();
});

$('select[name=\'order_verify\']').trigger('change');

//--></script>


<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {
	html  = '<tr id="module-row' + module_row + '">';
	html += '	<td class="column-layout"><label class="visible-480"><?php echo addslashes($entry_layout); ?></label><select name="filter_module[' + module_row + '][layout_id]" class="span2 i-large">';
	html += '		<?php echo p3html::oc_layout_options($layouts, null, true); ?>';
	html += '	</select></td>';
	html += '	<td class="column-position"><label class="visible-480"><?php echo addslashes($entry_position); ?></label><select name="filter_module[' + module_row + '][position]" class="span2 i-medium">';
	html += '		<?php echo p3html::oc_position_options($this->language, null, true); ?>';
	html += '	</select></td>';
	html += '	<td class="column-status"><label class="visible-480"><?php echo addslashes($entry_status); ?></label><select name="filter_module[' + module_row + '][status]" class="input-small">';
	html += '		<?php echo p3html::oc_status_options($this->language, null, true); ?>';
  html += '	</select></td>';
	html += '	<td class="column-sort"><label class="visible-480"><?php echo addslashes($entry_sort_order); ?></label><input type="text" name="filter_module[' + module_row + '][sort_order]" value="" class="span1 i-mini"></td>';
	html += '	<td class="column-action"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="btn btn-small"><i class="icon-trash ims" title="<?php echo $button_remove; ?>"></i><span class="hidden-phone"> <?php echo $button_remove; ?></span></a></td>';
	html += '</tr>';

	$('#module tbody').append(html);

	

	module_row++;
}


var module_row = <?php echo $module_row; ?>;

// function addModule() {	
// 	html  = '<tbody id="module-row' + module_row + '">';
// 	html += '  <tr>';
// 	html += '    <td class="left"><select name="jossms_module[' + module_row + '][layout_id]">';
	<?php //foreach ($layouts as $layout) { ?>
	//html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php //} ?>
// 	html += '    </select></td>';
// 	html += '    <td class="left"><select name="jossms_module[' + module_row + '][position]">';
//	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
//	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
//	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
//	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
// 	html += '    </select></td>';
// 	html += '    <td class="left"><select name="jossms_module[' + module_row + '][status]">';
 //   html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
 //   html += '      <option value="0"><?php echo $text_disabled; ?></option>';
//     html += '    </select></td>';
// 	html += '    <td class="right"><input type="text" name="jossms_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
//	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
// 	html += '  </tr>';
// 	html += '</tbody>';
	
// 	$('#module tfoot').before(html);
	
// 	module_row++;
// }
//--></script> 
<?php echo $footer; ?>