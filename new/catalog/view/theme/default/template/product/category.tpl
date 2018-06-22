



<?php echo $header; ?>

<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/header_c.css">

<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>

    	
			

		<div class="col-md-7 col-sm-4 col-xs-6">
		
		</div>
		<div class="col-md-5 col-sm-4  hidden-xs col-xs-6">
          <div class="form-group input-group input-group-sm">
            <!-- <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label> -->
            <select id="input-sort" class="form-control" onchange="location = this.value;" style="font-size: 14px;">
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <option value="">Sort By</option>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>



      
      <?php if ($products) { ?>
      <div class="row">
       <div class="col-md-5 col-sm-6 hidden-xs hidden-md hidden-lg hidden-sm ">
          <div class="btn-group btn-group-sm">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="" data-original-title="List"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default active" data-toggle="tooltip" title="" data-original-title="Grid"><i class="fa fa-th"></i></button>
          </div>
        </div>
      





      </div>
      <div class="row">
        <?php foreach ($products as $product) { //print_r($product) ;?>
        <div class="product-layout product-list col-xs-12">
         <div class="product-thumb transition " >

          	 <div class="imageInn">




          	 	
          	 	 <a href="<?php echo $product['href']; ?>"> <img src="<?php echo $product['thumb'];?>" alt="Default Image" ></a>
               
			</div>


   			
            <div>
              <div class="caption">
              
              
			 <!--<a class=" removequickview " data-toggle="modal" data-target="#productInfoModal" onclick="quickview_popup('<?php echo $product['product_id']; ?>');" id="quick<?php echo $product['product_id']; ?>" title="Quick View" style="display:none;position: absolute;top: 15%;left: 33%;" href="#">

        <div class="view" hidden-xs>Quick View</div>
 
      </a> -->
			
                <h5><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h5><hr>
               
                <?php if ($product['price']) { ?>

				<div class="price-box-main">
 					<div class="price_box">
 						<span class="retail">Retail Price</span><br>
 						<span class="product-price"><strike style="color: #3b3b3b"><?php echo $product['price']; ?></strike><!-- <small style="color: red">&nbsp;&nbsp;(20%off)</small> --></span>
 					</div>
 					<div class="savebox">
 						<span class="mainprice"><strong><?php echo $product['special']; ?></strong></span><br>You Saved Rs 400
 					</div>
 				</div>

                <?php } ?>
                
              </div>
              <div class="button-group">
                <button type="button" onclick="addTOcart('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>','<?php echo $product['name']; ?>','<?php echo $product['thumb'];?>');"><i class="fa fa-shopping-cart" style="display: inline-block; font-size: 18px;">
            </i> <span style="margin-left: 15px;" ><?php echo $button_cart; ?></span></button>
                </div>
            </div>
          </div>
        </div>


        <?php } ?>
      </div>
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
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>


 <style> 
	#productInfoModal	 .modal.fade .modal-dialog {
    -webkit-transform: scale(0.1);
    -moz-transform: scale(0.1);
    -ms-transform: scale(0.1);
    transform: scale(0.1);
    top: -300px;
    opacity: 0;
    -webkit-transition: all 0.9s;
    -moz-transition: all 0.9s;
    transition: all 0.9s;
}

#productInfoModal .modal.fade.in .modal-dialog {
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -ms-transform: scale(1);
    transform: scale(1);
    -webkit-transform: translate3d(0, 300px, 0);
    transform: translate3d(0, 300px, 0);
    opacity: 1;
    overflow: auto;
}
/* when product picture zoon & swipe extension is installed ? than product picture on modals look outside out of border of modal in left side so add morgin  to fix the issue */
.thumbnail {
 margin-left: 5px;

}




</style> 
<div id="productInfoModal" class="modal fade" role="dialog">
  <div  class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-center">Quick View</h4>
      </div>
      <div id="product_details" class="modal-body">
        <i class='fa fa-spinner fa-spin' style='font-size:26px;color:red'></i> &nbsp; Loading Product Details...Please Wait
      </div>
      <div class="modal-footer">
        <button type="button" id="modalCloseButton" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<!-- <style type="text/css">

	/* Make Footer Sticky */
#footer_container { background:#bfbfbf; bottom:0; height:60px; left:0; position:fixed; width:100%; }
#footer { line-height:60px; margin:0 auto; width:1170px; text-align:center; color: #FFF; }
.filter{color: #fff; float: left; display: inline-block; text-align: center;}
.sort{color: #fff; float: left; display: inline-block; text-align: center;}

</style>

<div id="footer_container">
   	<div class="container">
    	<div id="footer">
        	<div class="col-md-6 col-sm-6 filter">FILTER</div>
        	<div class=" col-md-6 col-sm-6 sort">SORT</div>
    	</div>
	</div>
</div>
 -->

<style type="text/css">
	.stickyfilter {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: red;
   color: white;
   text-align: center;
}

.ripple-container {
    position: relative;
    overflow: hidden;
}
.btn.primary.flat, .btn.primary.outline {
    color: #ff3e6c;
    font-weight: bold;
}
.ripple-container .ripple {
    position: absolute;
    border-radius: 50%;
    -webkit-transform: scale(0);
    transform: scale(0);
}

.btn {
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
}
.results-btn {
    width: 100%;
    height: 50px;
    padding: 16px 14px 12px;
    font-size: 13px;
}

.col-1-2 {
    width: 50%;
}

[class*=col-] {
    float: left;
    padding-right: 16px;
}

.filter
{
    background-color: #fff;
    width: 100%;
    border-top: 1px solid #eaeaec;
    z-index: 10;
    margin: 0;
    text-align: center;
}

 .buttonDivider {
    border-left: 0.5px solid #ababb6;
    width: 1px;
    height: 22px;
    position: absolute;
    left: 50%;
    top: 15px;
}

</style>

<?php //print_r( $sorts); ?>
<div class="stickyfilter filter hidden-lg hidden-md">
  <div class="">
  	<div class="">
  		<div class="col-md-6 col-sm-6 col-1-2 ">
  			<div class="ripple-container ">
  				<div class="btn primary flat results-btn"> 
				
			<!--<select class="sortByOptions" >
			
				
             <option value="Price: Low to High">
               Price: Low to High
             </option><option value="Price: High to Low">
               Price: High to Low
             </option><option value="New Arrivals">
               New Arrivals
             </option><option value="Popularity">
               Popularity
             </option></select>-->
			 
			 <select class="sortByOptions"  onchange="location = this.value;"  >
              
              
              <option value="">Sort By</option>
              <option value="http://localhost/new/index.php?route=product/category&amp;path=72&amp;sort=p.sort_order&amp;order=ASC">Default</option>
                                                        <option value="http://localhost/new/index.php?route=product/category&amp;path=72&amp;sort=pd.name&amp;order=ASC">Name (A - Z)</option>
                                                        <option value="http://localhost/new/index.php?route=product/category&amp;path=72&amp;sort=pd.name&amp;order=DESC">Name (Z - A)</option>
                                                        <option value="http://localhost/new/index.php?route=product/category&amp;path=72&amp;sort=p.price&amp;order=ASC">Price (Low &gt; High)</option>
                                                        <option value="http://localhost/new/index.php?route=product/category&amp;path=72&amp;sort=p.price&amp;order=DESC">Price (High &gt; Low)</option>
                                                        <option value="http://localhost/new/index.php?route=product/category&amp;path=72&amp;sort=rating&amp;order=DESC">Rating (Highest)</option>
                                                        <option value="http://localhost/new/index.php?route=product/category&amp;path=72&amp;sort=rating&amp;order=ASC">Rating (Lowest)</option>
                                                        <option value="http://localhost/new/index.php?route=product/category&amp;path=72&amp;sort=p.model&amp;order=ASC">Model (A - Z)</option>
                                                        <option value="http://localhost/new/index.php?route=product/category&amp;path=72&amp;sort=p.model&amp;order=DESC">Model (Z - A)</option>
                                        </select>

            
             
             
            </select>
			 
			 </div>
  				<div class="ripple "></div>
  			</div>
  		</div>
  		<div class="buttonDivider"></div>
  		<div class="col-md-6 col-sm-6 col-1-2">
  			<div class="ripple-container ">
  				
				<div class=" btn primary flat results-btn filter1">Filter</div>
  				<div class="ripple "></div>
  			</div>
  		</div>
  	</div>
  </div>
</div>



</div>

<script>
  
$(document).ready(function(){
    $(".filter1").click(function(){
        $('.bf-panel-wrapper').toggleClass('bf-opened');
    });
});

</script>

















<script type="text/javascript"> 
function quickview(id){
$("#quick"+id).show();
}
function quickout(){

$(".removequickview").css("display","none");
}
function quickview_popup(id){
$("#product_details").load("index.php?route=product/product&product_id="+id+" #content .row:first", function(){
    cart_add();
});    
 
}

  $('#productInfoModal').on('shown.bs.modal', function() {
  //  $(".fade").removeClass('modal-backdrop');

});
function cart_add(){
// script for add to cart button 
$('#product_details').find('#button-cart').on('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function() {
                $('#product_details').find('#button-cart').button('loading');
            },
            complete: function() {
                $('#product_details').find('#button-cart').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
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
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

					document.getElementById('modalCloseButton').click();
					
                    $('html, body').animate({
                        scrollTop: 0
                    }, 'slow');										

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

	
	// script for buy now button 
	$('#product_details').find('#button-cart2').on('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function() {
                $('#product_details').find('#button-cart2').button('loading');
            },
            complete: function() {
                $('#product_details').find('#button-cart2').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
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
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

					document.getElementById('modalCloseButton').click();
					
                    $('html, body').animate({
                        scrollTop: 0
                    }, 'slow');
					
					location = '/index.php?route=checkout/checkout';

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
 

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
  
}
// Clear modal content when its get hidden (close) otherwise it will show last product content in new product also until the new product get loaded
$(document).ready(function() {
  $("#productInfoModal").on("hidden.bs.modal", function() {
    $(".modal-body").html("<i class='fa fa-spinner fa-spin' style='font-size:26px;color:red'></i> &nbsp; Loading Product Details...Please Wait");
  });







});


if($(window).width()<767){
$(".m-menu").click(function(){
	//$(".menu").animate({width:'toggle'},400);
	$(".menu-overlay").toggleClass("active");
	$("body, html").toggleClass("bohidden");
});
$(".menu-overlay").click(function(){
	$(".menu").animate({width:'toggle'},400);
	$(".menu-overlay").toggleClass("active");
	$("body, html").toggleClass("bohidden");});

}

/*

if($(window).width()<767){
//$(".menu").animate({width:'toggle'},400);
//$(".menu-overlay").toggleClass("active");



//$("body, html").toggleClass("bohidden");
$(".menu-overlay").click(function()
	{$(".menu").animate({width:'toggle'},400);
	//$(".menu-overlay").toggleClass("active");
	$("body, html").toggleClass("bohidden");
});

}*/

// $(".menu").animate({width:'toggle'},400);$(".menu-overlay").toggleClass("active");$("body, html").toggleClass("bohidden");});$(".menu-overlay").click(function(){$(".menu").animate({width:'toggle'},400);$(".menu-overlay").toggleClass("active");$("body, html").toggleClass("bohidden");});

</script>

<?php echo $footer; ?>


 <style> 
	#productInfoModal	 .modal.fade .modal-dialog {
    -webkit-transform: scale(0.1);
    -moz-transform: scale(0.1);
    -ms-transform: scale(0.1);
    transform: scale(0.1);
    top: -300px;
    opacity: 0;
    -webkit-transition: all 0.9s;
    -moz-transition: all 0.9s;
    transition: all 0.9s;
}

#productInfoModal .modal.fade.in .modal-dialog {
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -ms-transform: scale(1);
    transform: scale(1);
    -webkit-transform: translate3d(0, 300px, 0);
    transform: translate3d(0, 300px, 0);
    opacity: 1;
}



/* when product picture zoon & swipe extension is installed ? than product picture on modals look outside out of border of modal in left side so add morgin  to fix the issue */
/*.thumbnail {
 margin-left: 5px;

}*/
</style> 
<div id="productInfoModal" class="modal fade" role="dialog">
  <div  class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-center">Quick View</h4>
      </div>
      <div id="product_details" class="modal-body">
        <i class='fa fa-spinner fa-spin' style='font-size:26px;color:red'></i> &nbsp; Loading Product Details...Please Wait
      </div>
      <div class="modal-footer">
        <button type="button" id="modalCloseButton" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<script type="text/javascript"> 
function quickview(id){
$("#quick"+id).show();
}
function quickout(){

$(".removequickview").css("display","none");
}
function quickview_popup(id){
$("#product_details").load("index.php?route=product/product&product_id="+id+" #content .row:first", function(){
    cart_add();
});    
 
}

  $('#productInfoModal').on('shown.bs.modal', function() {
  //  $(".fade").removeClass('modal-backdrop');

});
function cart_add(){
// script for add to cart button 
$('#product_details').find('#button-cart').on('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function() {
                $('#product_details').find('#button-cart').button('loading');
            },
            complete: function() {
                $('#product_details').find('#button-cart').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
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
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

					document.getElementById('modalCloseButton').click();
					
                    $('html, body').animate({
                        scrollTop: 0
                    }, 'slow');										

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

	
	// script for buy now button 
	$('#product_details').find('#button-cart2').on('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function() {
                $('#product_details').find('#button-cart2').button('loading');
            },
            complete: function() {
                $('#product_details').find('#button-cart2').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
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
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

					document.getElementById('modalCloseButton').click();
					
                    $('html, body').animate({
                        scrollTop: 0
                    }, 'slow');
					
					location = '/index.php?route=checkout/checkout';

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
 

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
  
}
// Clear modal content when its get hidden (close) otherwise it will show last product content in new product also until the new product get loaded
$(document).ready(function() {
  $("#productInfoModal").on("hidden.bs.modal", function() {
    $(".modal-body").html("<i class='fa fa-spinner fa-spin' style='font-size:26px;color:red'></i> &nbsp; Loading Product Details...Please Wait");
  });
});




</script>

<script type="text/javascript">
	
/*
$(function () {
    $("div").slice(0, 4).show();
    $("#loadMore").on('click', function (e) {
        e.preventDefault();
        $("div:hidden").slice(0, 4).slideDown();
        if ($("div:hidden").length == 0) {
            $("#load").fadeOut('slow');
        }
        $('html,body').animate({
            scrollTop: $(this).offset().top
        }, 1500);
    });
});

$('a[href=#top]').click(function () {
    $('body,html').animate({
        scrollTop: 0
    }, 600);
    return false;
});

$(window).scroll(function () {
    if ($(this).scrollTop() > 50) {
        $('.totop a').fadeIn();
    } else {
        $('.totop a').fadeOut();
    }
});*/

</script>
<script type="text/javascript">
     var $ = jQuery.noConflict(true);
     $.noConflict(); 
     // Code that uses other library's $ can follow here.
</script>
<script>


function addTOcart(product_id,quantity,product_name,product_image){
	
	<?php if($logged){ ?>
	
    (pushalertbyiw = window.pushalertbyiw || []).push(['abandonedCart', 'add-to-cart',{'first_name':'<?php echo  $firstname; ?>','total_items':quantity,'product_name':product_name,'image':product_image }]);

	
	<?php } else { ?>
	
   // (pushalertbyiw = window.pushalertbyiw || []).push(['abandonedCart', 'add-to-cart']);
(pushalertbyiw = window.pushalertbyiw || []).push(['abandonedCart', 'add-to-cart',{'product_name':product_name,'image':product_image }]);
	
	<?php } ?>
	
	
	
	$.ajax({url:'index.php?route=checkout/cart/add',
	type:'post',data:'product_id='+product_id+'&quantity='+(typeof(quantity)!='undefined'?quantity:1),
	dataType:'json',beforeSend:function(){$('#cart > button').button('loading');},
	complete:function(){$('#cart > button').button('reset');},success:function(json){$('.alert, .text-danger').remove();if(json['redirect']){location=json['redirect'];}if(json['success']){;$('.breadcrumb').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+json['success']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');setTimeout(function(){$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> '+json['total']+'</span>');},100);$('html, body').animate({scrollTop:0},'slow');$('#cart > span').load('index.php?route=common/cart/info span a');}},error:function(xhr,ajaxOptions,thrownError){alert(thrownError+"\r\n"+xhr.statusText+"\r\n"+xhr.responseText);}});
}

/*
function addTOcart(product_id,quantity){
	
	(pushalertbyiw = window.pushalertbyiw || []).push(['abandonedCart', 'add-to-cart']);
	$.ajax({url:'index.php?route=checkout/cart/add',
	type:'post',data:'product_id='+product_id+'&quantity='+(typeof(quantity)!='undefined'?quantity:1),
	dataType:'json',beforeSend:function(){$('#cart > button').button('loading');},
	complete:function(){$('#cart > button').button('reset');},success:function(json){$('.alert, .text-danger').remove();if(json['redirect']){location=json['redirect'];}if(json['success']){;$('.breadcrumb').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+json['success']+' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');setTimeout(function(){$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> '+json['total']+'</span>');},100);$('html, body').animate({scrollTop:0},'slow');$('#cart > span').load('index.php?route=common/cart/info span a');}},error:function(xhr,ajaxOptions,thrownError){alert(thrownError+"\r\n"+xhr.statusText+"\r\n"+xhr.responseText);}});
	}*/
</script>