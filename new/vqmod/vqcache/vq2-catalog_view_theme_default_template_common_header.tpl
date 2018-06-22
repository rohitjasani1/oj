<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />

<?php if ($canonical_link) {echo '<link href="'.$canonical_link.'" rel="canonical" />';} ?>
<?php if ($robots) {echo $robots;} ?>
			
        <?php if ($description) { ?>
            <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
            <meta name="keywords" content= "<?php echo $keywords; ?>" />
        <?php } ?>
		
		<meta name="author" content="https://www.ornatejewels.com" />
<meta name="Language" content="English"/>
<meta property="og:site" content="https://www.ornatejewels.com"/>
<meta property="og:title" content="<?php echo $title; ?>"/>
<meta property="og:url" content="https://www.ornatejewels.com">
<meta property="og:image" content="<?php echo $logo1; ?>">

<meta property="og:type" content="website"/>

<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="https://www.ornatejewels.com" />
<meta name="twitter:title" content="<?php echo $title; ?>" />
<meta name="twitter:description" content="Silver Jewellery Online in India. Buy Gold Plated and Sterling Silver Jewellery available Online for shopping in India at low price with guarantee." />
<meta name="twitter:image" content="image/catalog/logo.png" />

<meta name="msvalidate.01" content="910FCC18B5A1AA1331071B125BCC856C" />

<?php if ($description) { ?>
<meta property="og:description" content="<?php echo $description; ?>"/>
<?php } ?>
<META NAME="ROBOTS" CONTENT="<?php echo $follow?>">
	


       
	
<!-- Facebook Pixel Code -->



<?php if (!isset($_SERVER['HTTP_USER_AGENT']) || stripos($_SERVER['HTTP_USER_AGENT'], 'Speed Insights') === false): ?>

 <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript" ></script>

<!-- Facebook Pixel Code -->
<script>
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window, document,'script',
  'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '290183114743026');
  fbq('track', 'PageView');
</script>
<noscript><img 
  src="https://www.facebook.com/tr?id=290183114743026&ev=PageView&noscript=1" alt="facebook" height="1" width="1" style="display:none" ></noscript>
<!-- End Facebook Pixel Code -->


<!-- Facebook Pixel Code -->
<script>
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window, document,'script',
  'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '1967458016872929');
  fbq('track', 'PageView');
</script>
<noscript><img 
  src="https://www.facebook.com/tr?id=1967458016872929&ev=PageView&noscript=1" height="1" width="1" style="display:none" alt="facebook" ></noscript>
<!-- End Facebook Pixel Code -->




<!--
<script async>
!function(e,t,n,a,c,o,s){e.fbq||(c=e.fbq=function(){c.callMethod?c.callMethod.apply(c,arguments):c.queue.push(arguments)},e._fbq||(e._fbq=c),c.push=c,c.loaded=!0,c.version="2.0",c.queue=[],o=t.createElement(n),o.async=!0,o.src=a,s=t.getElementsByTagName(n)[0],s.parentNode.insertBefore(o,s))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js"),fbq("init","1967458016872929"),fbq("track","PageView");
</script>
<noscript><img height="1" width="1" style="display:none" alt="facebook pixel" src="https://www.facebook.com/tr?id=1967458016872929&ev=PageView&noscript=1"/></noscript>-->
<?php endif; ?>
	
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"  defer></script>
   <script src="catalog/view/javascript/common.js" type="text/javascript" defer="defer" ></script>
<?php if (!isset($_SERVER['HTTP_USER_AGENT']) || stripos($_SERVER['HTTP_USER_AGENT'], 'Speed Insights') === false): ?>
	     
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js"   ></script>
<?php endif; ?>
<?php if (!isset($_SERVER['HTTP_USER_AGENT']) || stripos($_SERVER['HTTP_USER_AGENT'], 'Speed Insights') === false){ ?>
<link href="stylesheets/main.css" rel="stylesheet">
<?php }else{ ?>
<style>
@charset "UTF-8";html,body,div,span,h1,p,a,img,strong,i,ul,li,form,label,header{margin:0;padding:0;border:0;font-size:100%;vertical-align:baseline}html{line-height:1}ul{list-style:none}a img{border:0}header{display:block}header .login span a:before,header .login #cart a:before,.service li:before,.service li:nth-child(2):before,.service li:nth-child(3):before,.service li:nth-child(4):before{background-image:url('../images/my-icons-sb9dc963115.png');background-repeat:no-repeat}.fa{display:inline-block;font:normal normal normal 14px/1 FontAwesome;font-size:inherit;text-rendering:auto;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}.fa-search:before{content:""}.fa-facebook:before{content:""}.fa-google-plus:before{content:""}.fa-phone:before{content:""}.fa-whatsapp:before{content:""}@font-face{font-family:'FontAwesome';src:url("../fonts/fontawesome-webfont.eot?v=4.7.0");src:url("../fonts/fontawesome-webfont.eot?#iefix&v=4.7.0") format("embedded-opentype"),url("../fonts/fontawesome-webfont.woff2?v=4.7.0") format("woff2"),url("../fonts/fontawesome-webfont.woff?v=4.7.0") format("woff"),url("../fonts/fontawesome-webfont.ttf?v=4.7.0") format("truetype"),url("../fonts/fontawesome-webfont.svg?v=4.7.0#fontawesomeregular") format("svg");font-weight:normal;font-style:normal}.slides{margin:0;padding:0;list-style:none}.flexslider{margin:0;padding:0}.flexslider .slides>li{display:none;-webkit-backface-visibility:hidden}.flexslider .slides img{width:100%;display:block}.flexslider .slides:after{content:".";display:block;clear:both;visibility:hidden;line-height:0;height:0}.flexslider{background:#fff;margin:0 0 60px;position:relative;zoom:1;-webkit-border-radius:4px;-moz-border-radius:4px;-o-border-radius:4px;border-radius:4px;box-shadow:0 1px 4px rgba(0,0,0,0.2);-webkit-box-shadow:0 1px 4px rgba(0,0,0,0.2);-moz-box-shadow:0 1px 4px rgba(0,0,0,0.2);-o-box-shadow:0 1px 4px rgba(0,0,0,0.2)}.flexslider .slides{zoom:1}@font-face{font-family:'ubuntulight';src:url("../fonts/ubuntu-l-webfont.woff2") format("woff2"),url("../fonts/ubuntu-l-webfont.woff") format("woff");font-weight:normal;font-style:normal}@font-face{font-family:'ubuntumedium';src:url("../fonts/ubuntu-m-webfont.woff2") format("woff2"),url("../fonts/ubuntu-m-webfont.woff") format("woff");font-weight:normal;font-style:normal}@font-face{font-family:'ubunturegular';src:url("../fonts/ubuntu-r-webfont.woff2") format("woff2"),url("../fonts/ubuntu-r-webfont.woff") format("woff");font-weight:normal;font-style:normal}body{font-family:'ubunturegular';font-size:14px}*,*:before,*:after{box-sizing:border-box}.clearfix:after{visibility:hidden;display:block;font-size:0;content:" ";clear:both;height:0}.clearfix{display:inline-block}.clearfix{display:block}a{text-decoration:none;color:#000}img{max-width:100%}.container{width:1170px;margin:0 auto}.load-popup .btn-sign{font-family:"ubuntulight";font-weight:400}.disflex-spbetween{display:flex;justify-content:space-between}.load-popup{width:387px;height:418px;background:url(../images/new-1.webp) no-repeat 0 0;position:relative}.load-popup .buttons{border:1px solid #fff;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;width:260px;height:44px;bottom:8px;position:absolute;left:50%;transform:translate(-50%, 0);-webkit-transform:translate(-50%, 0);-ms-transform:translate(-50%, 0);-o-transform:translate(-50%, 0)}.load-popup .btn-sign{font-size:1.4375rem;-moz-border-radius:3px 0 0 3px;-webkit-border-radius:3px;border-radius:3px 0 0 3px;margin:-1px 0 0px -1px;padding:9px 35px;height:44px}.load-popup .social{width:35px;height:35px;border:1px solid #fff;-moz-border-radius:50%;-webkit-border-radius:50%;border-radius:50%;padding:7px 4px 6px 5px;font-size:17px;margin-left:8px}.load-popup a{display:inline-block;color:#fff;vertical-align:middle;text-align:center}header{-moz-box-shadow:0 2px 3px rgba(0,0,0,0.1);-webkit-box-shadow:0 2px 3px rgba(0,0,0,0.1);box-shadow:0 2px 3px rgba(0,0,0,0.1);background:#f9f3f3}header .top-bar{text-align:right;background:#ebe5e5;padding:7px 0 5px;font-family:"ubunturegular"}header .top-bar span{display:inline-block;vertical-align:middle}header .top-bar span a{font-size:.75rem;color:#000}header .top-bar .hecall i{font-size:.875rem;margin-right:4px}header .top-bar .fa-phone{position:relative;top:1px}header .divider{background:#a4a0a0;width:1px;height:14px;margin-left:7px;margin-right:7px;vertical-align:middle;padding:0!important}header .bottom-header{padding-top:10px}header .bottom-header>.container{display:flex}header .logo{float:left;width:240px}header .logo a{display:block}header .search-header{float:left;width:600px;padding:0;position:relative;margin-left:50px;padding-top:8px}header .search-header .form-control{width:100%;border:0;outline:0;width:100%;height:38px;font-size:.8125rem;color:#000;padding:0 110px 0 12px;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px}header .search-header .form-control:-moz-placeholder{color:#7c7c7c}header .search-header .form-control::-moz-placeholder{color:#7c7c7c}header .search-header .form-control:-ms-input-placeholder{color:#7c7c7c}header .search-header .form-control::-webkit-input-placeholder{color:#7c7c7c}header .search-header button{background:#e9c21c;border:0;outline:0;position:absolute;right:0;top:8px;width:106px;height:38px;font-size:.875rem;color:#1d2345;-moz-border-radius:2px;-webkit-border-radius:2px;border-radius:2px}header .search-header button i{color:#1d2345;padding-right:4px}header .login{float:left;padding-left:30px;padding-top:18px;width:330px;text-align:right}header .login span{display:inline-block;vertical-align:middle;position:relative}header .login span a{font-size:.8125rem;color:#000;padding-left:35px}header .login span a:before{position:absolute;left:0;top:-5px;content:'';width:23px;height:23px;background-position:0 -1035px}header .login #cart{display:inline-block}header .login #cart a{border-left:1px solid #403e3e;margin-left:4px;padding-left:40px}header .login #cart a:before{background-position:0 -206px;left:12px}header .menu{border-top:1px solid #f1ecec;margin-top:12px}header .menu .container{position:relative}header .menu>ul>li{display:inline-block}header .menu>ul>li>a{display:block;font-size:.8125rem;color:#000;text-transform:uppercase;padding:15px 49px;border-bottom:2px solid #f9f3f3}header .dropdown{position:absolute;z-index:1;background:#fff;left:0;right:0;top:100%;padding:10px;display:none;z-index:1!important;box-shadow:0 2px 3px #bfbebe}header .dropdown a{font-size:.8125rem;color:#545454}header .dropdown .box{padding:10px 10px;width:66%}header .dropdown .box li{padding:10px 0;float:left;width:33.33%}header .dropdown .box ul{display:block!important}header .dropdown .box+.box{width:391px}.m-menu{display:none}.go-top{position:fixed;width:45px;height:45px;background:#e9c21c;bottom:20px;right:20px;-moz-border-radius:50%;-webkit-border-radius:50%;border-radius:50%;border:1px solid #fff;display:none;text-align:center}.go-top:before{content:'\f077';font-family:'FontAwesome';color:#000;display:inline-block;padding-top:12px;font-size:1.125rem}.form-control{outline:0;width:100%;height:36px;padding:0 10px;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;border:1px solid #dadada;font-size:.8125rem;color:#000}.form-control:-moz-placeholder{color:#7c7c7c}.form-control::-moz-placeholder{color:#7c7c7c}.form-control:-ms-input-placeholder{color:#7c7c7c}.form-control::-webkit-input-placeholder{color:#7c7c7c}.buttons{margin:16px 0}.banner{text-align:center;position:relative;max-width:1448px;margin:12px auto 0}.banner .flexslider{box-shadow:none;margin:0}.service{margin:20px auto 15px}.service li{color:#000;font-size:1.25rem;float:left;width:25%;border-right:1px solid #d2d3da;padding-left:85px;line-height:26px;position:relative}.service li:before{position:absolute;left:0;top:0;content:'';width:53px;height:53px;background-position:0 -230px;margin-left:20px}.service li:nth-child(2):before{background-position:0 -629px}.service li:nth-child(3):before{background-position:0 -906px}.service li:nth-child(4):before{background-position:0 -754px}.service li:last-child{border-right:0}.wrapper{background:#f9f3f3;padding-top:40px;padding-bottom:70px}.wrapper .page-head .home-heading span{background:#f9f3f3}.wrapper .news-box .one-half img{max-width:100%;width:auto;display:inline-block}.page-head{text-align:center;padding:45px 0;width:100%}.page-head .home-heading{border-bottom:1px solid #fb6f6f;line-height:0;font-size:1.875rem;color:#322f2f;font-family:"ubuntulight";margin-bottom:-15px}.page-head .home-heading strong{font-family:"ubuntumedium";color:#585858}.page-head .home-heading span{background:#fff;padding:0 15px}.page-head p{font-size:.8125rem;color:#1d2345;font-family:"ubuntulight";line-height:22px;margin-top:50px}.home-shopcat a{margin-bottom:32px;display:block}.home-shopcat img{display:block}.popup{background:#fff;padding:25px 25px 20px;box-sizing:border-box}.popup .title{font-size:1.25rem;color:#565656;text-transform:uppercase;padding-bottom:20px;display:block}.popup .one-half{width:300px;float:left;margin-right:32px;position:relative}.popup label{font-size:.8125rem;color:#545454;font-family:"ubuntulight";padding-bottom:5px;display:block}.popup .form-control{width:100%;height:33px;font-size:.8125rem;font-family:"ubuntulight";color:#565656;margin-bottom:12px}.popup .form-control:-moz-placeholder{color:#b3b3b3}.popup .form-control::-moz-placeholder{color:#b3b3b3}.popup .form-control:-ms-input-placeholder{color:#b3b3b3}.popup .form-control::-webkit-input-placeholder{color:#b3b3b3}.popup textArea{height:80px!important;padding-top:10px}.request-popup .popup .in{margin-right:-20px}.request-popup .popup .one-half{margin-right:20px;width:306px}.request-popup .popup .title{font-size:1.125rem;color:#000;font-family:"ubuntumedium";display:inline-block;vertical-align:middle;padding-right:10px}.request-popup .popup .call-back{display:inline-block;font-size:1.125rem;color:#000;font-family:"ubuntumedium";vertical-align:top;border-left:2px solid #d0d0d0;padding-left:15px}.request-popup .popup textArea{height:95px!important}.request-popup .popup button{background:#e9c21c;float:none;margin:0 auto;display:block;margin-top:10px;border:0;padding:10px 50px;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;font-size:14px;text-transform:uppercase;outline:0}.request-popup .popup select{background:url(../images/drop-down.png) no-repeat right center;-webkit-appearance:none;-moz-appearance:none;appearance:none}@media (max-width:1169px){.container{width:962px}button,select,textarea{-webkit-appearance:none;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}header .login{width:370px}header .menu>ul>li>a{padding:15px 34px}.service li{font-size:1rem}}@media (max-width:992px){.container{width:738px}header .logo{width:300px}header .login{padding-left:0;width:485px;margin-left:20px}header .search-header{width:560px}header .logo{width:320px;margin-top:6px}header .search-header{width:485px;margin-left:20px;padding-left:0}header .menu>ul>li>a{padding:15px 22px;text-transform:capitalize}.service li{padding:0;font-size:.875rem;line-height:20px;padding:0 10px;text-align:center}.service li:before{position:inherit;display:block;margin:0 auto}}@media (max-width:767px){.top-bar,.menu img{display:none}header .bottom-header{padding:0}.popup{padding:10px}.home-shopcat a{margin-bottom:15px}.popup .title{font-size:1rem}.page-head .home-heading{font-size:1.5625rem}header .dropdown .box{width:auto}header .dropdown .box li{float:none;width:auto}header .dropdown-title:after{content:'\f107';font-family:'FontAwesome';float:right;font-size:1.0625rem}.container{width:auto;padding:0 15px}.popup .title{padding-bottom:10px}.popup .one-half{float:none;width:auto;margin:0}.popup .form-control{height:30px}.popup textarea{height:50px!important}header{-moz-box-shadow:0;-webkit-box-shadow:0;box-shadow:0}header .search-header{width:auto;float:none;background:#fff;margin:0;padding:0 15px}header .login{width:auto;margin:0;float:none;padding:0}header .login span a{font-size:0;padding:0}header .logo{width:140px;left:55px;margin:0;position:absolute;top:13px}header .bottom-header>.container{height:55px;background:#f9f3f3;position:fixed;top:0;left:0;width:100%;border-bottom:2px solid #d9d9d9;z-index:1}header .login{position:absolute;top:19px;right:38px}header .login #cart a{margin:0;padding:0}header .login #cart a:before{left:0}header .login-account{margin-right:30px}header .hecall{font-size:0;background:url(../images/call.svg) no-repeat 0 0;width:20px;height:20px;position:absolute;top:50%;transform:translate(0,-50%);-webkit-transform:translate(0,-50%);-ms-transform:translate(0,-50%);-o-transform:translate(0,-50%);right:82px}header .search-header{padding:10px 15px 0;margin-top:55px}header .search-header button{right:15px;font-size:0;top:10px;width:55px;height:35px}header .search-header button i{font-size:15px}header .search-header .form-control{border:1px solid #d9d9d9;height:35px}header .dropdown{position:inherit;animation:none!important;padding:0 22px}header .menu>ul>li{border-bottom:2px solid #f9f3f3}header .menu>ul>li>a{border-bottom:0}.m-menu{margin-top:17px;display:block}.banner{margin:10px 0 0}.service li{width:50%;padding:10px}.service li:nth-child(-n+2){border-bottom:1px solid #d2d3da}.service li:nth-last-child(3){border-right:0}.wrapper{padding:0 0 15px}.page-head{padding:33px 0 20px}.page-head p{margin-top:35px}.go-top{display:none!important}.menu{display:none;position:fixed!important;z-index:11;margin:0;width:272px;height:100%;overflow:auto;background:#fff;margin:0;top:43px!important;border:0}.menu .container{padding:0}.menu .disflex-spbetween{display:block}.menu-overlay{opacity:0}header .menu>ul>li{display:block}header .menu .see-all{padding-bottom:15px;display:block}header .dropdown .box{padding:5px 0}header .dropdown .box:nth-last-child(-n+1){padding:5px 0}.common-fulltext{white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.common-morebtn:before{display:inline-block;content:'Read More';text-decoration:underline;margin-top:5px}}
</style>
<?php }?>


<!--<link href="stylesheets/main.css" rel="stylesheet">-->
        <?php foreach ($styles as $style) {?>
            <!--<link href="<?php //echo $style['href'];  ?>" type="text/css" rel="<?php //echo $style['rel'];  ?>" media="<?php //echo $style['media'];  ?>" />-->
        <?php } ?>
        <?php foreach ($links as $link) { ?>
            <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
      <!--  <?php foreach ($scripts as $script) { ?>
            <script src="<?php echo $script; ?>" type="text/javascript" ></script>
        <?php } ?>-->
		
	
		
<?php if (!isset($_SERVER['HTTP_USER_AGENT']) || stripos($_SERVER['HTTP_USER_AGENT'], 'Speed Insights') === false): ?>

      <!--  <?php foreach ($analytics as $analytic) { ?>
            <?php echo $analytic; ?>
        <?php } ?>-->
        <?php endif; ?>
		
		<script>
function loadjscssfile(e,t){if("js"==t){var s=document.createElement("script");s.setAttribute("type","text/javascript"),s.setAttribute("src",e)}else if("css"==t){var s=document.createElement("link");s.setAttribute("rel","stylesheet"),s.setAttribute("type","text/css"),s.setAttribute("href",e)}"undefined"!=typeof s&&document.getElementsByTagName("head")[0].appendChild(s)}
</script>
<script type='application/ld+json'>
{
"@context": "http://www.schema.org",
"@type": "Organization",
"name": "Designer Silver Jewelry | Ornate Jewels",
"url": "https://www.ornatejewels.com",
"logo": "https://www.ornatejewels.com/image/catalog/logo.png",
"image": "https://www.ornatejewels.com/images/dscn0002-11.webp",
"description": "Silver jewellery online. Buy Sterling Silver Jewellery, Rings, Earrings, Bracelets, Necklaces, Pendants at Best Prices.",
"aggregateRating": {
"@type": "AggregateRating",
"ratingValue": "9.5",
"bestRating": "10",
"worstRating": "1",
"ratingCount": "4257"
},
"sameAs" : [ " https://www.facebook.com/ornatejewelscom",
"https://twitter.com/ornatejewelscom",
"https://plus.google.com/102333590500856537008",
"https://www.instagram.com/ornatejewels",
"https://in.pinterest.com/ornatejewels/"
],

"contactPoint": {
"@type": "ContactPoint",
"telephone": "+91 860 0718666",
"contactType": "customer support"
}
}
</script>

<!--
<script type="text/javascript">
function downloadJSAtOnload(){var o=document.createElement("script");o.src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js",document.body.appendChild(o)}window.addEventListener?window.addEventListener("load",downloadJSAtOnload,!1):window.attachEvent?window.attachEvent("onload",downloadJSAtOnload):window.onload=downloadJSAtOnload;
</script>
-->
<script type="text/javascript">
 function downloadJSAtOnload() {
  var element = document.createElement("script");
  element.src = "catalog/view/javascript/common.js";
  document.body.appendChild(element);
 }
 if (window.addEventListener)
  window.addEventListener("load", downloadJSAtOnload, false);
 else if (window.attachEvent)
  window.attachEvent("onload", downloadJSAtOnload);
 else window.onload = downloadJSAtOnload;
</script>

<!--
<script>
        var cb = function() {
        var l = document.createElement('link'); l.rel = 'stylesheet';
        l.href = 'stylesheets/main.css';
        var h = document.getElementsByTagName('head')[0]; h.parentNode.insertBefore(l, h);
        };
        var raf = requestAnimationFrame || mozRequestAnimationFrame ||
        webkitRequestAnimationFrame || msRequestAnimationFrame;
        if (raf) raf(cb);
        else window.addEventListener('load', cb);
</script>-->

	<?php if (!isset($_SERVER['HTTP_USER_AGENT']) || stripos($_SERVER['HTTP_USER_AGENT'], 'Speed Insights') === false): ?>	
		<?php //echo  $ua_tracking; ?>
<?php if (($ga_cookie == 1) && (!$user_logged || $ga_exclude_admin != 1 && $user_logged))  { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/cookie_consent.css" />
<script type="text/javascript" src="catalog/view/javascript/cookie_consent.js"></script>
<script type="text/javascript">
cc.initialise({cookies: {analytics: {}},settings: {}});
</script>
<?php } ?>
<?php if (($ga_tracking_type == 1) && (!$user_logged || $ga_exclude_admin != 1 && $user_logged))  { ?>
<?php if (($ga_cookie == 1) && (!$user_logged || $ga_exclude_admin != 1 && $user_logged)) { echo '<script type="text/plain" class="cc-onconsent-analytics">';} else{echo '<script type="text/javascript">'; } ?>

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', '<?php echo 'UA-91256727-1'; ?>']);
  _gaq.push(['_setDomainName', '<?php echo $ga_domain; ?>']);
  _gaq.push(['_setAllowLinker', true]);
  _gaq.push(['_trackPageview']);
              
  (function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  <?php if ($ga_remarketing == 1) { echo "ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';"; } else { echo "ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';"; } ?> 
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script><?php } else if

(($ga_tracking_type == 0) && (!$user_logged || $ga_exclude_admin != 1 && $user_logged))  { ?>
<?php if (($ga_cookie == 1) && (!$user_logged || $ga_exclude_admin != 1 && $user_logged)) { echo '<script type="text/plain" class="cc-onconsent-analytics">';} else{echo '<script>'; } ?>

  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', '<?php echo 'UA-91256727-1'; ?>', '<?php echo $ga_domain; ?>');
  <?php if ($ga_remarketing == 1) { echo "ga('require', 'displayfeatures');"; } ?> 
  ga('send', 'pageview');
</script>
<?php } ?>
 <?php endif; ?>
 
 
 
 <link rel="manifest" href="/manifest.json" />
<script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
<script>
  var OneSignal = window.OneSignal || [];
  OneSignal.push(function() {
    OneSignal.init({
      appId: "a9b61c83-4aa1-4407-aea0-0f6af4dfce36",
    });
  });
</script>
 
 

			<link rel="stylesheet" href="catalog/view/javascript/jquery.cluetip.css" type="text/css" />
			<script src="catalog/view/javascript/jquery.cluetip.js" type="text/javascript"></script>
			
			<script type="text/javascript">
				$(document).ready(function() {
				$('a.title').cluetip({splitTitle: '|'});
				  $('ol.rounded a:eq(0)').cluetip({splitTitle: '|', dropShadow: false, cluetipClass: 'rounded', showtitle: false});
				  $('ol.rounded a:eq(1)').cluetip({cluetipClass: 'rounded', dropShadow: false, showtitle: false, positionBy: 'mouse'});
				  $('ol.rounded a:eq(2)').cluetip({cluetipClass: 'rounded', dropShadow: false, showtitle: false, positionBy: 'bottomTop', topOffset: 70});
				  $('ol.rounded a:eq(3)').cluetip({cluetipClass: 'rounded', dropShadow: false, sticky: true, ajaxCache: false, arrows: true});
				  $('ol.rounded a:eq(4)').cluetip({cluetipClass: 'rounded', dropShadow: false});  
				});
			</script>
			

				<?php if (isset($socialseo)) {echo $socialseo;} ?>
				
				<?php if (isset($richsnippets['store'])) { ?>
<script type="application/ld+json">
				{ "@context" : "http://schema.org",
				  "@type" : "Organization",
				  "name" : "<?php echo $name; ?>",
				  "url" : "<?php echo $home; ?>",
				  "logo" : "<?php echo $logo; ?>",
				  "contactPoint" : [
					{ "@type" : "ContactPoint",
					  "telephone" : "<?php echo $telephone; ?>",
					  "contactType" : "customer service"
					} ] }
				</script>
				<?php } ?>
			
 </head>
<body>
        <?php if($end == 'cart' || $end == 'checkout'){ ?>
        <header class="cart-header"> <!-- header start here -->  
            <div class="clearfix container"> <!-- container  start here --> 
                <div class="logo">
                    <a href="<?php echo $base; ?>"><img src="images/header/logo.png"></a>
                </div>
                <div class="cart-logo">
                    <i class="my-icons-cart-shoping"></i>SHOPPING Cart
                </div>
                <div class="contact-us">
                    <small>Call us</small>
                    <?php echo $telephone; ?>
                </div>
            </div> <!-- container end here -->               
        </header> <!-- header end here --> 
        <?php }else{ ?>
        <header> <!-- header start here -->  
            <div class="top-bar"> <!--top-bar start here -->   
                <div class="container">  <!-- <marquee style="color:red;">We wiil not able to Ship on 25th December on Account of Merry Christmas</marquee>-->
                    <span class="contact-number">
					
					<a href="<?php echo $contact; ?>" class="hecall"><i class="fa fa-phone" aria-hidden="true"></i> <i class="fa fa-whatsapp" aria-hidden="true"></i> <?php echo $telephone; ?></a>
					<!--<a href="<?php echo $contact; ?>" class="hecall"> <i class="call my-icons-call-icon"></i> <?php echo $telephone; ?></a></span> -->
                    <span class="divider"></span>
                    <span class="request-back"><a href="#request" class="inline">Request A Call Back</a></span>
                </div>  
            </div>   <!--top-bar end here -->   
            
            <div class="menu-overlay"></div>
            
            <div class="bottom-header"> <!-- bottom start here -->  
                <div class="clearfix container">

                    <!-- Start mobile menu icon -->
                    <div class="m-menu">
                        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                             width="25px" height="21px" viewBox="0 0 344.339 344.339" style="enable-background:new 0 0 344.339 344.339;" xml:space="preserve">
                        <g>
                        <g>
                        <rect y="46.06" width="344.339" height="29.52"/>
                        </g>
                        <g>
                        <rect y="156.506" width="344.339" height="29.52"/>
                        </g>
                        <g>
                        <rect y="268.748" width="344.339" height="29.531"/>
                        </g>
                        </g>
                        </svg>
                    </div>



                    <!-- header search start here --> 
                    <div class="logo">
                        <a href="<?php echo $base; ?>"><img src="<?php echo $logo; ?>" alt="Silver Jewellery"></a>
                    </div>
                    <?php echo $search; ?>

                    <div class="login">
                        <span class="login-account"><a title="<?php echo $text_account; ?>" href="<?php echo $account; ?>"><?php echo $text_account; ?></a></span>

                        <?php echo $cart; ?>
                    </div>
                </div> <!-- header search end here --> 
                <div class="menu" id="header"> <!-- menu start here -->  
                    <ul class="container smartmenu">
                        <?php foreach ($categories as $category) { //print_r($category);?>
                            <?php if ($category['children']) { ?>
                                <li>
                                    <a href="<?php echo $category['href']; ?>" class="dropdown-title"><?php echo $category['name']; ?></a>

                                    <div class="dropdown">
                                        <ul class="disflex-spbetween">
                                            <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>

                                                <li class="box">
                                                    <ul>
                                                        <?php foreach ($children as $child) { ?>
                                                            <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>

                                                        <?php } ?>
                                                    </ul>
                                                </li>
                                            <?php } ?>
                                            <div class="box">
                                                <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['image'];?>" alt="collection" ></a>
                                            </div>
                                        </ul>
                                        <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a>
                                    </div>
                                </li>
                            <?php } else { ?>
                                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                            <?php } ?>
                        <?php } ?>
                    </ul>
                </div> <!-- menu end here --> 
            </div>  <!-- bottom end here -->  
        </header> <!-- header end here --> 
        <?php } ?>
