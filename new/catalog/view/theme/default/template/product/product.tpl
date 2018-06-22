

<?php echo $header; ?><?php //print_r($category_id); ?>
 <!--<script>
  fbq('track', 'ViewContent', {
    value: <?php echo $special1; ?>,
    currency: 'INR',
    content_ids: ['<?php echo $product_id; ?>'],
    content_type: 'product_group',
  });
</script>
<noscript><img height="1" width="1" style="display:none" alt="facebook"
  src="https://www.facebook.com/tr?id=1967458016872929&ev=PageView&noscript=1"
/></noscript>



 <script>
  fbq('track', 'ViewContent', {
    value: <?php echo $special1; ?>,
    currency: 'INR',
    content_ids: ['<?php echo $product_id; ?>'],
    content_type: 'product_group',
  });
</script>
<noscript><img height="1" width="1" style="display:none" alt="facebook"
  src="https://www.facebook.com/tr?id=290183114743026&ev=PageView&noscript=1"
/></noscript>-->


  <!--<script src="js/vendor/modernizr.js"></script>
    <script src="js/vendor/jquery.js"></script>-->
  <!-- xzoom plugin here -->
  <script type="text/javascript" src="dist/xzoom.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://ornate-bc57.kxcdn.com/css/xzoom.css" media="all" /> 
  <!-- hammer plugin here -->
  <script type="text/javascript" src="https://ornate-bc57.kxcdn.com/hammer.js/1.0.5/jquery.hammer.min.js"></script>  
 
						
					<script type="text/javascript" src="https://ornate-bc57.kxcdn.com/fancybox/source/jquery.fancybox.js"></script>
  <script type="text/javascript" src="https://ornate-bc57.kxcdn.com/magnific-popup/js/magnific-popup.js"></script> 

<?php //echo $stock; ?>

<div class="product-detail-main"> <!--main start here -->
            <div class="container">  <!--container start here -->    
   <ul itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb">
 <?php 
				 $i=0;
				 foreach ($breadcrumbs as $breadcrumb) { 
				 $i++; ?>
<li itemprop="itemListElement" itemscope
      itemtype="http://schema.org/ListItem">
    <a itemscope itemtype="http://schema.org/ListItem"
       itemprop="item" href="<?php echo $breadcrumb['href']; ?>">
        <span itemprop="name"><?php echo $breadcrumb['text']; ?></span>
       </a>
    <meta itemprop="position" content="<?php echo $i; ?>" />
  </li>
  <?php } ?>
</ul>
<span xmlns:v="http://rdf.data-vocabulary.org/#">
				<?php foreach ($mbreadcrumbs as $mbreadcrumb) { if (strip_tags($mbreadcrumb['text'])) { ?>
				<span typeof="v:Breadcrumb"><a rel="v:url" property="v:title" href="<?php echo $mbreadcrumb['href']; ?>" alt="<?php echo strip_tags($mbreadcrumb['text']); ?>"></a></span>
				<?php } } ?>				
				</span>
				
				<span itemscope itemtype="http://schema.org/Product">
				<meta itemprop="url" content="<?php $mlink = end($breadcrumbs); echo $mlink['href']; ?>" >
				<meta itemprop="name" content="<?php echo $heading_title; ?>" >
				<meta itemprop="model" content="<?php echo $sku; ?>" >
				<meta itemprop="manufacturer" content="<?php echo 'Ornate Jewels'; ?>" >
				<meta itemprop="brand" content="<?php echo 'Ornate Jewels'; ?>" >
				
				<?php if ($thumb) { ?>
				<!--<meta itemprop="image" content="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>">-->
				  <meta itemprop="image" src="<?php echo $thumb; ?>" alt='<?php echo $heading_title; ?>' />

				<?php } ?>
				
				<!--<?php if ($images) { foreach ($images as $image) {?>
				<meta itemprop="image" content="<?php echo $image['thumb']; ?>" >
				<?php } } ?>-->
				
				
				<span itemprop="offers" itemscope itemtype="http://schema.org/Offer">
				<meta itemprop="price" content="<?php echo preg_replace( '/[^.,0-9]/', '',($special ? $special : $price)); ?>" />
				<meta itemprop="priceCurrency" content="INR" />
				
				<link itemprop="availability" href="http://schema.org/<?php echo (($quantity > 0) ? "InStock" : "OutOfStock") ?>" />
				</span>
			
			
			<?php if( $review_no!=0){ ?>
				
				<span itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
				<meta itemprop="reviewCount" content="<?php echo $review_no; ?>">
				<meta itemprop="ratingValue" content="<?php echo $rating; ?>">
				<meta itemprop="bestRating" content="5">
				<meta itemprop="worstRating" content="1">
				</span>
			
			<?php }	?>
				</span>


 <div class="clearfix product-detail-box">  
					
				<div class="product-slider-box">
                        <div class="product-slider clearfix">
                          <ul class="slides">
                              
                                    <li data-thumb="<?php echo $thumb; ?>">
                                        
										<img class="xzoom" id="xzoom-default" src="<?php echo $thumb; ?>" xoriginal="<?php echo $image1; ?>" alt="<?php echo $heading_title; ?>"  style=""/>
                                    </li>
                               
                                <?php   if ($images) { ?>
                                    <?php foreach ($images as $image) { ?>
                                     <li data-thumb="<?php echo $image['thumb']; ?>">
									   <div class="xzoom-thumbs">
                                            <!--<img src="<?php echo $image['popup']; ?>"  alt="<?php echo $image['popup']; ?>"/>-->
											<img class="xzoom"  src="<?php echo $image['popup']; ?>" xoriginal="<?php echo $image['thumb1']; ?>" alt="<?php echo $image['popup']; ?>"  class="xzoom-gallery"   >
                                        </div>
										</li>
                                    <?php  } ?>
									<?php } ?>
                                    <li data-thumb="<?php echo $lastimage; ?>">
                                            <img src="<?php echo $lastimage; ?>" alt="box"/>
										

                                        </li>
									<li data-thumb="<?php echo $lastimage1; ?>">
                                            <img src="<?php echo $lastimage1; ?>" alt="box"/>
										

                                        </li>	
										
										
                                    </ul>
                        </div>
                    <script  src="//s7.addthis.com/js/250/addthis_widget.js" async="async"></script> 
						
						<ul class="share-list">
                            <li class="title">Share it</li>
							<li><a class="addthis_button_whatsapp at300b" href="javascript:void(0);"><i class="fa fa-whatsapp " aria-hidden="true"></i></a></li>
                            <li><a class="addthis_button_facebook at300b" href="javascript:void(0);" title="Facebook"><i class="fa fa-facebook addthis_button_facebook" aria-hidden="true"></i></a></li>
                            <li><a class="addthis_button_twitter at300b" href="javascript:void(0);"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                            <!--<li><a class="addthis_button_pinterest at300b" href="javascript:void(0);"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                            <li><a class="addthis_button_instagram at300b" href="javascript:void(0);"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>-->
							<li><a class="addthis_button_google-plus at300b" href="javascript:void(0);"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
					
                    <div class="product-detail" >
					 <h1 class="heading"   title="<?php echo $heading_title; ?>"><?php echo $heading_title; ?></h1>
                        <span class="subhead">Product Code: <?php echo $sku; ?></span>
						<a class="rating inline" href="#inline_content"><span class="subhead" style="margin-left:85px;"><?php if ($rating) { ?> <?php for ($i = 1; $i <= 5; $i++) { ?><?php if ($rating < $i) { ?> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack"></i></span> <?php } else { ?><span class="fa fa-stack"><i class="fa fa-star fa-stack"></i></span><?php } ?> <?php } ?> <?php } ?><!--<i class="my-icons-rating">--></i>(Write a review)</span></a>
						
                       


					
						<div itemprop="offers" itemscope itemtype="https://schema.org/Offer"><meta itemprop="priceCurrency" content="<?php echo 'INR';?>" />
						<meta itemprop="price" content="<?php echo filter_var($price,FILTER_SANITIZE_NUMBER_FLOAT,FILTER_FLAG_ALLOW_FRACTION); ?>" />
						<meta itemprop="itemCondition" itemtype="https://schema.org/OfferItemCondition" content="https://schema.org/NewCondition" />
						<link itemprop="availability" href="https://schema.org/<?php echo $stock; ?>" />
						
						
						
<!--Price table start-->
	<table style="width:100%;">
	<tbody>
	<tr>
         <td class="golden_color tabtitle" style="">Price:</td>
            <td width="70%">
                <div style="margin: 10px 0px 10px 0px;" data-hook="product_price" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
                    
						  <dl style="margin-bottom:0px;" id="product-price">
				   <?php if($parent_category==0) { ?>

				  
                      <dd><del class="golden_color"><span style="color: #F00;text-decoration: initial;"><?php echo $price; ?></span></del></dd>
                        <dd>
                                
                        <span class="golden_color price selling variant_specific_price" style="color: #000000;font-size: 13pt;"><?php echo $special; ?></span>
                        <meta itemprop="price" content="439">
                        <span class="golden_color save" style="padding-left: 40px;">You save <span class="variant_specific_save"><?php echo $discount_price; ?></span></span>
                              
						</dd>
                        
				   <?php } else { ?>
				   
				 
                        <dd>
                                
                        <span class="golden_color price selling variant_specific_price" style="color: #000000;font-size: 13pt;"><?php echo $special; ?></span>
                        <meta itemprop="price" content="439">
                        
                              
						</dd>
				   
				   
				   <?php  } ?>
						  </dl>
						  
                            <meta itemprop="priceCurrency" content="INR">
                            <meta itemprop="availability" content="http://schema.org/InStock">
                </div>
			</td>
    
	</tr>
	</tbody>
	</table>
<!---prize table ends-->

<!--material table ends-->

<table style="width: 100%; margin-top:15px" >
	<tbody>
		<tr>
			<td class="golden_color title " style="float:left;">Material:</td>
			<td class="golden_color title" style="width: 70%;text-align: left;">925 Sterling Silver</td>
		</tr>
	</tbody>
</table>


<!--material table ends-->	



<!--size table ends-->	
<div id="product">
        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" /> 
<table style="margin-top: 10px;width: 100%;">
	<tbody>
	   <?php if ($options) { ?>
            <!--<h3><?php // echo $text_option; ?></h3>-->
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
	<tr id="size_1060584303">
        <td style="width: 30%;text-align:left;" class="golden_color title"><label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?>:</label></td>
		<td style="width: 35%;float: left;">
		<span class="935339138">
			
			<select class="form-control <?php echo ($option['required'] ? ' required' : ''); ?> radio_gds_size gds_variation navrang_outlne navrang_border_color" name="option[<?php echo $option['product_option_id']; ?>]"  style="width:auto;text-transform: capitalize;" id="size_select2_1060584303">
						<option value=""><?php echo $text_select; ?></option>
						<?php foreach ($option['product_option_value'] as $option_value) { ?>
						
            <option class="" style="background: #E5E5E5; padding: 1px 12px 0px 12px;cursor: pointer; font-size: 15px; border-radius: 2px; margin-right: 0px; vertical-align: -webkit-baseline-middle; vertical-align: -moz-middle-with-baseline; -webkit-vertical-align: -webkit-baseline-middle; font-weight: normal !important;" value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
			  <?php } ?>
			
			</select>
			</span>
         </td>
    </tr>
	<tr style="width: 100%;">
                              <td style="width:30%;"></td>
                            <td class="right_column">
                                            <div class="taxon_size_chart1 golden_color clickable" style="padding-top:10px;text-decoration: underline; display: inline-block;"> <a href="pdf/rings-size-new.pdf" target="_blank">Know Your Ring's Size</a>
                                             </div>
                              </td>
                            </tr>
							
							<?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>                    
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>

    </tbody>
</table>
<table class="quantity_variant" style="width: 100%;margin-top:18px">
                      <tbody><tr class="quantity_variant_qty golden_color">
<td class="tabtitle" style="width: 30%;">Quantity:</td>
<td class="right_column" style="width: 70%;display: inline-flex;">
                        <div id="sel2" style="position:relative;width: 31%;height: 20px;">
                          <select class="form-control cart_qauntity" name="quantity"  >
						  <option value="1" <?php if($minimum=='1'){ echo 'selected'; } ?>>1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
						  </select>
                        </div>
						<?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
						
                        <div class="pdp-qty-left golden_color" id="prod_left_txt"><a class="youtube" href="https://www.youtube.com/embed/lrUIL7rrTUw?rel=0&amp;showinfo=0" >Ring Size Video</a></div>
						<?php } } ?>
                          <input type="number" name="quantity" id="quantity" value="1" class="title" style="display:none;" min="1" max="1">
                          
                      </td></tr>
                    </tbody></table>
				</div>
<table class="cart_table" style="width:100%;">
    
	 <?php if($soldout==1){ ?>
	 
	 <tbody>
		
        <tr>
            <td style="width:50%;">
                <div id="">
                 <button name="button"   class=" my-btn-new my-btn-primary-new  "  style="">
                   
                        <span class="text">Sold Out</span></button>  
                    </div>
                <div id="shop_more_button" style="display:none;">
                     <button type="button" onclick="continue_shop(event)" class="my-btn-new add_cart_new add_cart_new_studio my-btn-primary-new" style="padding-left:27px;height:40px;width:98%;">Continue Shopping
					 </button>
                </div>    
            </td>
            <td style="width: 50%">
            
<span class="request-back " style="font-size: 10pt;height:40px;width:98%;float:right;position: relative;outline:none;    background: #5c5c5c;
    padding: 14px 46px;"><a href="#request" class="inline my-btn-new " >Request A Call Back</a></span>				
			</td>
        </tr>
    </tbody>
	 
	 
	 
	 
	 <?php }else { ?>
	 
	 <tbody>
		<tr>
            <td colspan="2" style="padding-bottom:8px;">
                <button name="button" type="submit" class=" my-btn-new my-btn-primary-new  " onclick="buynow()" data-loading-text="<?php echo $text_loading; ?>" id="button-buy" style="width:100%;height:40px;position: relative;">
                    <span class="buy_image_new  buy_image_new_studio buy_image_space"></span>
                        <span class="text" >Buy Now</span></button>                           
            </td>
        </tr>
        <tr>
            <td style="width:50%;">
                <div id="">
                 <button name="button" id="button-cart" onclick="addTOcart();" class=" my-btn-new my-btn-primary-new  " data-loading-text="<?php echo $text_loading; ?>"  style="">
                   
                        <span class="text">Add To Cart</span<</button>  
                    </div>
                <div id="shop_more_button" style="display:none;">
                     <button type="button" onclick="continue_shop(event)" class="my-btn-new add_cart_new add_cart_new_studio my-btn-primary-new" style="padding-left:27px;height:40px;width:98%;">Continue Shopping
					 </button>
                </div>    
            </td>
            <td style="width: 50%">
            
<span class="request-back " style="font-size: 10pt;height:40px;width:98%;float:right;position: relative;outline:none;    background: #5c5c5c;
    padding: 14px 46px; text-align: center;"><a href="#request" class="inline my-btn-new " >CALL ME</a></span>				
			</td>
        </tr>
    </tbody>
	 
	 
	 
	 <?php } ?>
	
	
</table>
			

<!--accordion start-->

<div class="product_accordion">
<button class="accordion">Delivery & Returns</button>
<div class="panel">





  <table style="width:100%">
	<tbody>
	
		<tr><form method = "POST"  id = "pincheck1" <?php if(isset($_SESSION['pincode'])){ echo "style='display:none;'";}?>>
			<td style="padding-left: 0px;margin-right: -15px;padding-top: 5px;"></td>
			<td class="pincodecheck" <?php if(isset($_SESSION['pincode'])){ ?> style='display:none' <?php } ?>>
			<input class="form-control navrang_outlne navrang_border_color" id="pin1" placeholder="Enter Your Pincode" is="null" type="text" maxlength="6" onkeypress="return isNumberKey(event)" style="border: none; border-bottom: 1px solid #969696; border-radius:0;"></td>
			  <td class="pincodecheck" <?php if(isset($_SESSION['pincode'])){ ?> style='display:none' <?php } ?>><input type="button" onclick="getdata1()" value="Check" class="check" style="border: 1px solid #969696;"></td> <?php  ?>
			</form>
			
			
			<span class="delievrt-text"> <i class="my-icons-truck"></i> <b>Delivery Within 4-7 Working Days.</b></span>
			<p>Ships within 24 hours </p>
			<p>Product can be returned within 7 days from the date the item is delivered to you. For more information, please check our return policy.</p>
			
			
			<?php
							if(isset($_SESSION['pincode'])){ ?> <br/>
			<div id="msg1"><label><img src='image/pincode/l.png' width='15' height='15' alt='pincode'>Delivery option for: "<?php echo $_SESSION['pincode']; ?>"  </label>
			
			

									
									
			<p><?php echo $_SESSION['pin_check_result']; ?></p>
					 <div style="margin:8px 0px 18px 121px;"><input type = 'button'  onclick = 'showform1()' value='Change' class='pin-check' /></div></div>
								</br>
							<?php } ?>
			
			
		</tr>
		
		
	</tbody>
</table>

</div>

<button class="accordion">Product Details</button>
<div class="panel">
  <p><?php echo $description; ?></p>
  <ul>
  <?php foreach ($options as $option) { ?>
                                        <?php if ($option['type'] == 'text') { ?>
                                            <li> <?php echo $option['name']; ?>:<span style="padding: 10px;"><?php echo $option['value']; ?></span></li>
                                        <?php } ?>
                                    <?php } ?>
	<!--<li>Metal Karatage:925</li>
	<li>Metal Name:925 Sterling Silver</li>
	<li>Gross Weight:4.53 Gms</li>
	<li>Stone Details:American Diamond And Pearl</li>-->
  <ul>
</div>

<button class="accordion">Product Care</button>
<div class="panel">
  <ul>
	<li>Keep your jewels safe in our box </li>

<li>When storing jewelry make sure it doesn’t rub against other jewelry </li>

<li>Though our jewelry doesn't turn black it is recommended to keep it away from water chemicals, soap etc.</li>

  </ul>
</div>
<p class="accordion925">925 Guaranteed Silver Won't Turn Black </p>
</div>
<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
</script>


<div class="icon-bar">
  <a onclick="wishlist.add('<?php echo $product_id; ?>');"><img src="https://ornate-bc57.kxcdn.com/images/wishlist.png" alt="Wishlist"><p> Add to Wishlist</p></a> 
  <a ><img src="https://ornate-bc57.kxcdn.com/images/square-gifbox-wrapped-.png" alt="Gift Wrap"><p>Gift Wrap Available</p></a> 
  <a ><img src="https://ornate-bc57.kxcdn.com/images/delivery-truck.png" alt="Delivery"><p>4-7 Days Delivery</p></a> 
  <a ><img src="https://ornate-bc57.kxcdn.com/images/refresh-left-arrow.png" alt="Easy Returns"><p>Easy Returns </p></a>
  <a ><img src="https://ornate-bc57.kxcdn.com/images/badge.png" alt="pure silver"><p>100% Pure Silver</p></a> 
</div>

                        </div>
                    </div>
                </div>   <!--product-detail-box end here -->  
				  
				
				
            </div>  <!--container end here -->    
            <section>  <!--section start here -->    
                <div class="container">  <!--container start here -->    
                     <?php if ($products) { ?>
                    <div class="related-main"> <!-- related-main start here -->
                        <div class="page-head">
                            <h2><span>Related <strong>Products </strong></span></h2>
                        </div>
                        <div class="flexslider-car">
                            <ul class="slides">
                                    <?php foreach ($products as $product) { ?>
                                        <li>
                                            <a href="<?php echo $product['href']; ?>" class="related-coloum">
                                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
                                                <p><?php echo $product['name']; ?></p>
                                                <span class="price-discount">
                                                    <?php if(!$product['special']){ echo $product['price']; }else{ echo $product['special']; } ?><small>(<?php echo $product['discount_persent']; ?>% Off)</small>
                                                </span>
                                            </a>
                                        </li>
                                    <?php } ?>
                                </ul>
                        </div>
                    </div>  <!-- related-main end here -->        
                    <?php } ?>
                     <!-- <div class="product-info clearfix"> <!-- product-info start here 
                        <?php if ($options) { ?>
                            <aside>
                                <h5 class="title">Additional Information</h5>
                                <ul>
                                    <?php foreach ($options as $option) { ?>
                                        <?php if ($option['type'] == 'text') { ?>
                                            <li> <?php echo $option['name']; ?>:<span><?php echo $option['value']; ?></span></li>
                                        <?php } ?>
                                    <?php } ?>
                                </ul>
                            </aside>
                        <?php } ?>
                        <article>
                            <h5 class="title">Product Description</h5>
                            <?php echo $description; ?>
						 </article>
                    </div> --> 
                    <div class="faq-question">
							<?php if(isset($haveaquestion)&& !empty($haveaquestion)){ ?>
                             <h5>Customers' Questions & Answers</h5>
                             <?php foreach($haveaquestion as $questions){ ?>
                               <div class="answer">
                                 <span>Q.<?php echo $questions['question']; ?></span>
                                 <p><?php echo $questions['answer']; ?></p>
                                 <small>Answered on <?php echo $questions['month']; ?></small>
                             </div>
                             <?php } ?>
							<?php }?>
                         </div>
  <?php echo $content_bottom; ?>
                     <!-- review-main start  here   
					 
					 <div class="review-main">   
                        <div class="page-head">
                            <h2><span>Products <strong> Reviews</strong></span></h2>
                        </div>
                        
                        <div id="review"></div>
                    </div>   <!-- review-main end  here -->
                </div> <!--container end here -->    
            </section> <!--section end here -->    
        </div> <!--main end here -->
        <div style='display:none'> <!-- popup start here -->
            <div id='inline_content'>
                <form class="popup" id="form-review">
                    <span class="title">Write a Review</span>  
                    <div class="clearfix">
                        <div class="one-half">
                            <label>Name*</label>
                            <input type="text" name="name" placeholder="Your Full Name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                            <label>Email*</label>
                            <input type="email" name="email" placeholder="Your Email Address" value="<?php echo $customer_email; ?>" id="input-email" class="form-control">
                        </div>
                        <div class="rating-box">
                            <div class="clearfix"><span>Appearance:* </span>         
                                <fieldset class="rating">
                                    <input type="radio" id="star5" class="appearance" name="rating" value="5" /><label class = "full" for="star5"></label>
                                    <input type="radio" id="star4" class="appearance" name="rating" value="4" /><label class = "full" for="star4" ></label>
                                    <input type="radio" id="star3" class="appearance" name="rating" value="3" /><label class = "full" for="star3" ></label>
                                    <input type="radio" id="star2" class="appearance" name="rating" value="2" /><label class = "full" for="star2" ></label>
                                    <input type="radio" id="star1" class="appearance" name="rating" value="1"  /><label class = "full" for="star1" ></label>
                                </fieldset>
                            </div>

                            <div class="clearfix"><span>Quality:*</span>
                                <fieldset class="rating">
                                    <input type="radio" id="qua-star5" class="quality" name="qua-rating" value="5" /><label class = "full" for="qua-star5"></label>
                                    <input type="radio" id="qua-star4" class="quality" name="qua-rating" value="4" /><label class = "full" for="qua-star4" ></label>
                                    <input type="radio" id="qua-star3" class="quality" name="qua-rating" value="3" /><label class = "full" for="qua-star3" ></label>
                                    <input type="radio" id="qua-star2" class="quality" name="qua-rating" value="2" /><label class = "full" for="qua-star2" ></label>
                                    <input type="radio" id="qua-star1" class="quality" name="qua-rating" value="1"  /><label class = "full" for="qua-star1" ></label>
                                </fieldset>
                            </div>

                            <div class="clearfix"><span>Price:* </span>         
                                <fieldset class="rating">
                                    <input type="radio" id="price-star5" class="price" name="price-rating" value="5" /><label class = "full" for="price-star5"></label>
                                    <input type="radio" id="price-star4" class="price" name="price-rating" value="4" /><label class = "full" for="price-star4" ></label>
                                    <input type="radio" id="price-star3" class="price" name="price-rating" value="3" /><label class = "full" for="price-star3" ></label>
                                    <input type="radio" id="price-star2" class="price" name="price-rating" value="2" /><label class = "full" for="price-star2" ></label>
                                    <input type="radio" id="price-star1" class="price" name="price-rating" value="1"  /><label class = "full" for="price-star1" ></label>
                                </fieldset>
                            </div>


                        </div>      
                    </div>
                    <div class="one-full">
                        <label>Message*</label>
                        <textarea name="text" class="form-control" id="input-review" placeholder="Your Reviews"></textarea>
                    </div>
                    <div class="clearfix">
					<div class="captcha one-half">
                                <?php echo $captcha; ?>
                        </div>
                        <!--<div class="one-half">
                            <label>Enter Code*</label>
                            <input type="text" name="code" placeholder="Your Full Name" class="form-control pr">
                            <div class="code">
                                6931 
                            </div>
                        </div>-->
                        <div class="rating-box bg-none">
                            <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btncom"><?php echo $button_continue; ?></button>
<!--                            <button class="submit">Submit</button>-->
<button class="btncom" onclick="$.colorbox.close(); return false;">Cancel</button>

                        </div>
                    </div>            
                </form>  
            </div>
        </div> <!-- popup end here -->
    <?php echo $column_right; ?>
	<?php if($rating!=0) { ?>
	<script type="application/ld+json">
			{
			  "@context": "http://schema.org",
			  "@type": "Product",
			  "aggregateRating": {
				"@type": "AggregateRating",
				"ratingValue": "<?php echo $rating;?>",
				"reviewCount": "<?php echo preg_replace('/\D/', '', $reviews);?>"
			  },
			  "description": "<?php echo $product['description']; ?>",
			  "name": "<?php echo $product['name']; ?>",
			  "image": "<?php echo $thumb; ?>",	
				<?php if(!empty($reviewss)){ ?>
			  "review":       
				<?php foreach($reviewss as $review) { ?>
				{
				  "@type": "Review",
				  "author": "<?php echo $review['author'];?>",
				  "datePublished": "<?php echo $review['date_added'];?>",
				  "description": "<?php echo $review['text'];?>",
				  "name": "<?php echo $review['author'];?>",
				  "reviewRating": {
					"@type": "Rating",
					"bestRating": "5",
					"ratingValue": "<?php echo $review['rating'];?>",
					"worstRating": "1"
				  }
				}	     
				<?php }} ?>
			}
			  
			
		</script>
	<?php } ?>

 
  
   <script type="text/javascript">
            var google_tag_params = {
                ecomm_prodid: <?php echo $product_id; ?>,
                ecomm_pagetype: 'product',
                ecomm_totalvalue: parseFloat('<?php echo $special1; ?>')
            };
        </script>
 

<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>


<script type="text/javascript"><!--
//$('#button-cart').on('click', function() {
function addTOcart(){	

//alert('in'); return false;
	<?php if($logged){ ?>
	alert(<?php echo  $firstname; ?>);
	
	<?php } else { ?>
	alert('sss');
	
	<?php } ?>
	
	return false;
	
	
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select,#size_1060584303 select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="alert alert-danger">' + json['error']['option'][i] + '</div>');
						} else {
							$('.taxon_size_chart1 ').before('<div class="alert alert-danger"><b>' + json['error']['option'][i] + '</b></div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				//window.location='cart';
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > span').load('index.php?route=common/cart/info span a');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
//});
}


$('#button-buy').on('click', function() {

	
	
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked,#size_1060584303 select, #product input[type=\'checkbox\']:checked,  #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-buy').button('loading');
		},
		complete: function() {
			$('#button-buy').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="alert alert-danger">' + json['error']['option'][i] + '</div>');
						} else {
							$('.taxon_size_chart1 ').before('<div class="alert alert-danger"><b>' + json['error']['option'][i] + '</b></div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				window.location='checkout';
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				//$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
				$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > span').load('index.php?route=common/cart/info span a');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});


//--></script>
<script type="text/javascript"><!--

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#form-review span.title').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['success']) {
				$('#form-review span.title').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('input[name=\'email\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
				$('input[name=\'qua-rating\']:checked').prop('checked', false);
				$('input[name=\'price-rating\']:checked').prop('checked', false);
			}
		}
	});
});
/*
$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});*/
function haveQuestion(){
if($('.havename').val()==''){
    $('.havename').css('border','1px solid red');
 return false;   
}else if($('.haveemail').val()==''){
    $('.havename').css('border','1px solid #dadada');
    $('.haveemail').css('border','1px solid red');
 return false;   
}else if($('.havemobile').val()==''){
    $('.haveemail').css('border','1px solid #dadada');
    $('.havemobile').css('border','1px solid red');
 return false;   
}else if($('.havedetail').val()==''){
    $('.havemobile').css('border','1px solid #dadada');
    $('.havedetail').css('border','1px solid red');
 return false;   
}else{
$.ajax({
    url:'index.php?route=product/product/havaquestion',
    type:'POST',
    data:$('.have-a-qstn input, textarea')
      }).done(function(result){
     if(result=='1'){
         $('.have-a-qstn input, textarea').val('');
             $('.breadcrumb').after('<div class="alert alert-success">Success: Thank you for showing interest!<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
     $('html, body').animate({ scrollTop: 0 }, 'slow');
     //$('.have-question-success').html('Thank you for showing interest!');
     }else{
            $('.breadcrumb').after('<div class="alert alert-danger">Something went wrong! Please check carefully.<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
$('html, body').animate({ scrollTop: 0 }, 'slow');
    //  $('.have-question-error').html('Something went wrong! Please check carefully.');
     }
      })
}
}
$('#notifyMe').click(function(){
var email = $(this).parent().find('#notifyEmail').val();
//alert(email);return false;
if(email==''){
    $('#notifyEmail').css('border','1px solid red');
 return false; 
 }else{  
$.ajax({
    type:'POST',
    url:'index.php?route=product/notifyme/send',
    data:$('input[name=\'emailnotify\'] ')
    }).done(function(result){
    if(result=='1'){
		$('html, body').animate({ scrollTop: 0 }, 'slow');
		
        $('.breadcrumb').after('<div class="alert alert-success">Success: You will be notified when the product will available.<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
    })
}
})
//--></script>

<script>
 $( "#button-cart" ).click(function() {
var Triggers={
"campaign_name": "Checkout Cart - 1",
"event_name": "add-to-cart",
"title": {"productname":"<?php echo $heading_title; ?>"},
"message": {"price":"<?php echo $product['special']; ?>" },
"notification_url": {"notificationurl":"checkout"},
"notification_image": {"imageurl": "<?php echo $thumb; ?>"},
"big_image": {"bigimageurl":"<?php echo $thumb; ?>"}
}
_pe.trigger(Triggers);

 });
</script>

<script>


var Triggers={
"campaign_name": "Browse - 1",
"event_name": "browse",
"title": {"productname":"<?php echo $heading_title; ?>"},
"message": {"price":"<?php echo $product['special']; ?>" },
"notification_url": {"notificationurl":"<?php echo $prod_url; ?>"},
"notification_image": {"imageurl": "<?php echo $thumb; ?>"},
"big_image": {"bigimageurl":"<?php echo $thumb; ?>"}
}
window._peq.push(["add-to-trigger",Triggers]);



</script>


<script type="text/javascript">
					function getdata1(){
						var pin = $("#pin1").val();
						if(pin != ''){
							$.ajax({
								type: "POST",
								url: "?route=product/product/pinCheck",
								data: {pincode: pin},
								dataType : "text"
							}).done(function( result ) 
							{
								$("#msg1").show();
								$("#msg1").html( result );
								$("#pincheck1").hide();
								
							});
						}
						else{
							alert('Please enter a valid Pincode');
						}
					}
					function showform1(){
						$("#msg1").hide();
						$('.pincodecheck').show();
						$("#pincheck1").show();
					}
				</script>
				<script src="js/foundation.min.js"></script>
    <script src="js/setup.js"></script>
<?php echo $footer; ?>
