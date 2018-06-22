<?php

echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
    </ul>
</div>
    <div class="contactus">
        <div class="container">
            <h1 class="heading">Contact Us</h1>
            <!--<p>Start a discussion with us</p>
			<br>
			<p>Address: </p>--><br>
			<p>Bunglow 32, Sai Niwas Undri,</p>
			<br><p>Pune, 411060</p>
            <!--Start Box -->
            <div class="cous-inqury disflex-spbetween">
                <a href="#cous-form" class="cous-support custom-scroll"><i class="my-icons-support"></i><strong>Help and Support</strong>We're here to help.</a>
                <a href="#cous-form" class="cous-support custom-scroll"><i class="my-icons-inquriry"></i><strong>sales inquiry</strong><span>sales@ornatejewels.com</span></a>
                <a href="tel:+91-8600718666"><i class="my-icons-call"></i><strong>call us</strong>+91-8600718666</a>
            </div>
            <!--Start Form -->
            <div class="cous-form" id="cous-form">
                <form action="<?php echo $action; ?>" method="post" class="disflex-wrap-spbetween clearfix">
                    <span class="close">X</span>
                    <p>Send us a Message</p>
                    <div class="box">
                        <input type="text" placeholder="Name" name="name" class="form-control">
                            <?php if ($error_name) { ?>
                        <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
                        <input type="email" placeholder="Email" name="email" class="form-control">
                            <?php if ($error_email) { ?>
                        <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
                        <input type="text" placeholder="Phone" name="phone" class="form-control">
                             <?php if ($error_phone) { ?>
                        <div class="text-danger"><?php echo $error_phone; ?></div>
              <?php } ?>
                    </div>
                    <div class="box">
                        <textarea placeholder="Message" name="enquiry" class="form-control"></textarea>
                            <?php if ($error_enquiry) { ?>
                        <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>
                        <div class="captcha">
                                <?php echo $captcha; ?>
                        </div></div>
                    <input type="submit" value="Submit" class="btn-yellow">
                </form>
            </div>
        </div>
    </div>
    
    <?php if($error_name||$error_email||$error_phone||$error_enquiry){  ?>
 <script type="text/javascript"><!--
$( document ).ready(function() {

$('#cous-form').show();
$("html body").animate({ scrollTop: $('#cous-form').offset().top}, 100);
//$('#cous-form').focus();
});
--></script>
<?php } ?> 
    
<?php echo $footer; ?>
