<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-responsive-slideshow" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-responsive-slideshow" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner"><?php echo $entry_banner; ?></label>
            <div class="col-sm-10">
              <select name="banner_id" id="input-banner" class="form-control">
                <?php foreach ($banners as $banner) { ?>
                <?php if ($banner['banner_id'] == $banner_id) { ?>
                <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
		  <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-effect"><?php echo $entry_effect; ?></label>
            <div class="col-sm-10">
              <select name="effect" id="input-effect" class="form-control">
				<option value="">-- Please Select --</option>
				<option value="shift" <?php if ( $effect == 'shift' ) echo 'selected="selected"'; ?>>shift</option>
				<option value="lines" <?php if ( $effect == 'lines' ) echo 'selected="selected"'; ?>>lines</option>
				<option value="turn" <?php if ( $effect == 'turn' ) echo 'selected="selected"'; ?>>turn</option>
				<option value="tv" <?php if ( $effect == 'tv' ) echo 'selected="selected"'; ?>>tv</option>
				<option value="bubbles" <?php if ( $effect == 'bubbles' ) echo 'selected="selected"'; ?>>bubbles</option>
				<option value="brick" <?php if ( $effect == 'brick' ) echo 'selected="selected"'; ?>>brick</option>
				<option value="dribbles" <?php if ( $effect == 'dribbles' ) echo 'selected="selected"'; ?>>dribbles</option>
				<option value="collage" <?php if ( $effect == 'collage' ) echo 'selected="selected"'; ?>>collage</option>
				<option value="louvers" <?php if ( $effect == 'louvers' ) echo 'selected="selected"'; ?>>louvers</option>
				<option value="seven" <?php if ( $effect == 'seven' ) echo 'selected="selected"'; ?>>seven</option>
				<option value="cube over" <?php if ( $effect == 'cube over' ) echo 'selected="selected"'; ?>>cube over</option>
				<option value="carousel" <?php if ( $effect == 'carousel' ) echo 'selected="selected"'; ?>>carousel</option>
				<option value="parallax" <?php if ( $effect == 'parallax' ) echo 'selected="selected"'; ?>>parallax</option>
				<option value="photo" <?php if ( $effect == 'photo' ) echo 'selected="selected"'; ?>>photo</option>
				<option value="kenburns" <?php if ( $effect == 'kenburns' ) echo 'selected="selected"'; ?>>kenburns</option>
				<option value="rotate" <?php if ( $effect == 'rotate' ) echo 'selected="selected"'; ?>>rotate</option>
				<option value="blinds" <?php if ( $effect == 'blinds' ) echo 'selected="selected"'; ?>>blinds</option>
				<option value="cube" <?php if ( $effect == 'cube' ) echo 'selected="selected"'; ?>>cube</option>
				<option value="domino" <?php if ( $effect == 'domino' ) echo 'selected="selected"'; ?>>domino</option>
				<option value="basic" <?php if ( $effect == 'basic' ) echo 'selected="selected"'; ?>>basic</option>
				<option value="blur" <?php if ( $effect == 'blur' ) echo 'selected="selected"'; ?>>blur</option>
				<option value="slices" <?php if ( $effect == 'slices' ) echo 'selected="selected"'; ?>>slices</option>
				<option value="basic linear" <?php if ( $effect == 'basic linear' ) echo 'selected="selected"'; ?>>basic linear</option>
				<option value="book" <?php if ( $effect == 'book' ) echo 'selected="selected"'; ?>>book</option>
				<option value="blast" <?php if ( $effect == 'blast' ) echo 'selected="selected"'; ?>>blast</option>
				<option value="fade" <?php if ( $effect == 'fade' ) echo 'selected="selected"'; ?>>fade</option>
				<option value="fly" <?php if ( $effect == 'fly' ) echo 'selected="selected"'; ?>>fly</option>
				<option value="stack" <?php if ( $effect == 'stack' ) echo 'selected="selected"'; ?>>stack</option>
				<option value="flip" <?php if ( $effect == 'flip' ) echo 'selected="selected"'; ?>>flip</option>
				<option value="stack vertical" <?php if ( $effect == 'stack vertical' ) echo 'selected="selected"'; ?>>stack vertical</option>
				<option value="squares" <?php if ( $effect == 'squares' ) echo 'selected="selected"'; ?>>squares</option>
              </select>
				<?php if ($error_effect) { ?>
					<div class="text-danger"><?php echo $error_effect; ?></div>
				<?php } ?>
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-duration"><?php echo $entry_duration; ?></label>
            <div class="col-sm-5">
              <input type="text" name="duration" value="<?php echo $duration; ?>" placeholder="<?php echo $entry_duration; ?>" id="input-duration" class="form-control" />
            </div>
			<div class="col-sm-5">
              <input type="text" name="duration1" value="<?php echo $duration1; ?>" placeholder="<?php echo $entry_duration; ?>" id="input-duration1" class="form-control" />
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-delay"><?php echo $entry_delay; ?></label>
            <div class="col-sm-5">
              <input type="text" name="delay" value="<?php echo $delay; ?>" placeholder="<?php echo $entry_delay; ?>" id="input-delay" class="form-control" />
            </div>
			<div class="col-sm-5">
              <input type="text" name="delay1" value="<?php echo $delay1; ?>" placeholder="<?php echo $entry_delay; ?>" id="input-delay1" class="form-control" />
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_autoplay; ?></label>
                <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($autoplay) { ?>
                      <input type="radio" name="autoplay" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="autoplay" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$autoplay) { ?>
                      <input type="radio" name="autoplay" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="autoplay" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_playpause; ?></label>
                <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($playpause) { ?>
                      <input type="radio" name="playpause" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="playpause" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$playpause) { ?>
                      <input type="radio" name="playpause" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="playpause" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_stoponhover; ?></label>
                <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($stoponhover) { ?>
                      <input type="radio" name="stoponhover" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="stoponhover" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$stoponhover) { ?>
                      <input type="radio" name="stoponhover" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="stoponhover" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_loop; ?></label>
                <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($loop) { ?>
                      <input type="radio" name="loop" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="loop" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$loop) { ?>
                      <input type="radio" name="loop" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="loop" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
                <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($caption) { ?>
                      <input type="radio" name="caption" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="caption" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$caption) { ?>
                      <input type="radio" name="caption" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="caption" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_controls; ?></label>
                <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($controls) { ?>
                      <input type="radio" name="controls" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="controls" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$controls) { ?>
                      <input type="radio" name="controls" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="controls" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_controlsthumb; ?></label>
                <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($controlsthumb) { ?>
                      <input type="radio" name="controlsthumb" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="controlsthumb" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$controlsthumb) { ?>
                      <input type="radio" name="controlsthumb" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="controlsthumb" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>