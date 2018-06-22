<?php echo $header; ?>
<div class="signup-main"> <!--signup-main start here -->
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
        
              <div class="heading">   <!--headin start  here -->
                    <h1 class="title">Sign in</h1>
                    <span>Don't have one? <a href="<?php echo $register; ?>">Create an account</a></span>
                </div>    <!--heading end  here -->

        <div class="in sign-in clearfix">  <!--sign-in start  here -->
            <form class="form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="form-group">
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" class="form-control">
                </div>
                <div class="form-group">
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" class="form-control">
                </div>
                <a href="<?php echo $forgotten; ?>" class="forgot">Forgot Password?</a>
                <button type="submit" class="btn-yellow">sign in</button>
                <span class="or-tag">OR</span>
                <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            </form>
            <div class="btngroup"><?php echo $content_top; ?>
           
            </div>
        </div>   <!--sign-in end  here -->
      <?php echo $content_bottom; ?>
    <?php echo $column_right; ?>
</div>
</div>
<?php echo $footer; ?>