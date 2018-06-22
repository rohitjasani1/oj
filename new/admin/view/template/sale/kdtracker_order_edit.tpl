﻿<?php echo $header; ?><?php echo $column_left; ?>

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

                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-account" class="form-horizontal">
                    <input type="hidden" name="order_id" value="<?php  echo $order_id; ?>" />
                    <table class="form">

                        <div class="form-group required">

                            <label class="col-sm-2 control-label" for="input-owner"><?php echo $entry_key; ?></label>

                            <div class="col-sm-10">

                                <input type="text" name="tracking_number" value="<?php echo $tracking_number; ?>" placeholder="<?php echo $tracking_number; ?>" id="input-owner" class="form-control" />

                                <?php if ($error_code) { ?>

                                <div class="text-danger"><?php echo $error_code; ?></div>

                                <?php } ?>

                            </div>

                        </div>

                    </table>


                </form>

                <!-- 帮助信息 -->

                <div class="support">

                    


                </div>

                <!-- 支持的信息 -->







            </div> 

        </div> 

    </div> 

</div> 



<?php echo $footer; ?>