<?php echo $header; ?>   
<section class="categories-main">
    <div class="container">  
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
        <?php if($cat_strip){ ?>
        <div class="wholesale">
                    <img src="<?php echo $cat_strip; ?>"> 
            </div> 
          <?php } ?>
        <div class="page-head">
            
            
             <?php if($hone!=''){ ?>
            <h1 class="title">
            <?php echo $hone; ?>
            </h1>
             <?php }else{ ?>
            <h1 class="title"><?php echo $heading_title; ?></h1>
           <?php } ?>
            <?php if ($description) { ?>
            <?php echo $description; ?> 
            
            <a href="javascript:void(0)" class="more-btn"></a>
            <?php } ?>
        </div>
          
        
        <div class="filter clearfix"> 
            <?php echo $content_top; ?>
 
        <?php if ($products) { ?>
            <section class="categories"> 
                <?php foreach ($products as $product) { ?>
                <div class="c-box">
				
                            <a href="<?php echo $product['href']; ?>">
                                <img  src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['alt']; ?>">
                                <p><?php echo $product['name'] ?></p>
                            </a><br/>
                            
							<?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
						
							
							
                            <?php if ($product['price']) { ?>
                            <div class="price-box clearfix">
                                <?php if (!$product['special']) { ?>
                                    <div class="price-retail">
                                        <small>Retail Price</small>
                                        <strike><?php echo $product['price']; ?></strike><span>(0% Off)</span></strong>
                                    </div>
                                    <div class="price-save">
                                        <strong><?php echo $product['price']; ?></strong>
                                        <small>You Save Rs 0</small>
                                    </div> 
                                <?php } else { ?>
                                    <div class="price-retail">
                                        <small>Retail Price</small>
                                        <strike><?php echo $product['price']; ?></strike><span>(<?php echo $product['discount_persent']; ?>% Off)</span></strong>
                                    </div>
                                    <div class="price-save">
                                        <strong><?php echo $product['special']; ?></strong>
                                        <small>You Save <?php echo $product['discount_price']; ?></small>
                                    </div> 
                                <?php } ?>
                                <?php if($product['quantity']<1){ ?>
                                <span class="cart-btn" >Out Of Stock</span>
                                <?php }else{ ?>
                                <span class="cart-btn" onclick="
			<?php if ($ga_tracking_type == 0) { echo "ga('send', 'event', '$page', 'Add to Cart', '".addslashes(htmlspecialchars($product['name']))."');";} else{echo "_gaq.push(['_trackEvent', '$page', 'Add to Cart', '".addslashes(htmlspecialchars($product['name']))."']);"; } ?> cart.add
            ('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">Add To Cart</span>
                                <?php } ?>
									
                            </div>
                        <?php } ?>


                        </div>
                    
                <?php } ?>
            </section>   
            
        <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
        <?php } ?>
        
        <?php if (!$categories && !$products) { ?>
                <p><?php echo $text_empty; ?></p>
                <div class="buttons">
                    <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                </div>
            <?php } ?>
    </div>   
</div>	
</section>

<?php echo $footer; ?>
