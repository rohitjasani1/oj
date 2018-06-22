<?php echo $header; ?>
<div class="container <?php if($information_id=='4'){ echo 'aboutus'; }?>">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    
    <?php if($information_id=='4'){ ?>
    <!-- Start About -->
            <section class="abusceo">
                <img src="images/about-us/ceo.jpg" alt="ceo" />
                <article>
                    <h1 class="title">About Us</h1>
                    <span>Designer, CEO and a Mother </span>
                    <p>Shelly started her company with only $1000 . She started her journey with jewelry back in 2002 and then took a break when her daughter was born. Having lived in USA, London, China and Hong Kong she experienced various cultures.</p>
                    <p>Women are the soul of this whole universe. They create life; they are confident, independent and go-getters. They know what they want and nothing is impossible for them. Shelly’s designs are guided by this positive life force. She expresses herself through these unique designs. She believes in the need and want of wearing new and different jewelry on different occasions without breaking the bank. That’s the core philosophy of her company to bring the Best Quality in Best Prices.</p>
                    <p>The foundation of Shelly’s success has been her innate ability to realize that today’s women want unique but wearable jewelry. This was common to all the women she interacted with in her journey. She started creating finely crafted jewelry at outstanding value, which looks gorgeous and at the same time is wearable and timeless.</p>
                </article>
            </section>
            <!-- Start Look -->
            <section class="abus-look disflex">
                <article>
                    <strong>At ornatejewels each piece is <br> crafted with utmost precision.</strong>
                    <p>We conceptualize, design and manufacture each piece in our state of the art facility using latest technology and skilled artisans assuring high quality. Our silver is hallmarked for 925 purity and is anti tarnish .</p>
                </article>
                <img src="images/about-us/look.jpg" alt="ceo" />
            </section>
            <!-- Start Social -->
            <div class="folllow-us">
                <div class="page-head">
                    <h2><span>Follow Us <strong>On</strong></span></h2>
                </div>
                <div class="social-col">
                   <a href="#" class="title"> <i class="my-icons-instgrame"></i> Instagram</a>
                   <figure><img src="images/instgrame-gallery.jpg"></figure>
               </div>
                <div class="social-col">
                     <a href="#" class="title">  <i class="my-icons-facebook facebook"></i> Facebook</a>
                    <figure><img src="images/facebook-gallery.jpg"></figure>
                   
               </div>   
              </div>
    
    <?php }else{ ?>
	
	 
	 <?php if($information_id=='12'){ ?>
	 <div class="commontext1 disflex-spbetween">
	 <section>
            <h1 class="heading"><?php echo $heading_title; ?></h1>
            <?php echo $description; ?>
        </section>
        <?php echo $content_bottom; ?>
        <?php echo $column_right; ?>
	 
	 </div>
	 <style>
	 
	 .commontext1 section .heading {
    font-size: 2.1875rem;
    border-bottom: 0;
    margin: 0;
}

.commontext1 .heading {
    font-size: 1.25rem;
    border-bottom: 1px solid #e5e5e5;
    text-transform: uppercase;
    display: block;
    padding-bottom: 12px;
    margin-bottom: 12px;
}
	 
	 .commontext1 section{
		 
		 width:100%;
	 }
	 .commontext1 p {
    font-size: .9375rem;
    color: #2d2d2d;
    line-height: 28px;
    padding: 10px 0;
	 }
	 .commontext1 section li {
    padding-left: 35px;
    font-size: 18px;
    list-style: inside;
    line-height: 28px;
}
	 
	 </style>
	 <?php }else{ ?>    
	
	
    <div class="commontext disflex-spbetween">
   


	   <aside>
            <strong class="heading">Information</strong>
            <ul>
                <li><a href="about-us.html">About Us</a></li>
                <li><a href="why-choose-us.html">Why choose us</a></li>
                <!--<li><a href="after-care">After Care</a></li>-->
                <li><a href="privacy-policy.html">Privacy Policy</a></li>
                <li><a href="shipping-and-delivery-information.html">Shipping Policies</a></li>
                <li><a href="terms-and-conditions.html">Terms & Conditions</a></li>
                <li><a href="return-cancellation-exchange-policies.html">Return And Exchange Policies</a></li>
            </ul>
        </aside>
		
	 
        <section>
            <h1 class="heading"><?php echo $heading_title; ?></h1>
            <?php echo $description; ?>
        </section>
        <?php echo $content_bottom; ?>
        <?php echo $column_right; ?>
    </div>
    <?php } ?>
    <?php } ?>
    
</div>
<?php echo $footer; ?>