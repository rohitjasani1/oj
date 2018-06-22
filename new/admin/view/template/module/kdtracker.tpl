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

                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-account" class="form-horizontal">
                 <input type="hidden" name="kdtracker_status" value="1" />

                    <table class="form">

                        <div class="form-group required">

                            <label class="col-sm-2 control-label" for="input-owner"><?php echo $entry_key; ?></label>

                            <div class="col-sm-10">

                                <input type="text" name="kdtracker_key" value="<?php echo $kdtracker_key; ?>" placeholder="<?php echo $kdtracker_key; ?>" id="input-owner" class="form-control" />

                                <?php if ($error_code) { ?>

                                <div class="text-danger"><?php echo $error_code; ?></div>

                                <?php } ?>

                            </div>

                        </div>

                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-owner"><?php echo $kdtracker_email_entry; ?></label>
                            <div class="col-sm-10">
                                <select name="kdtracker_email_status" id="input-store" class="form-control">
                                    <?php foreach ($email_status as $status=>$tip) { ?>
                                        <?php if ($status == $kdtracker_email_status) { ?>
                                           <option value="<?php echo  $status; ?>" selected="selected"><?php echo $tip; ?></option>
                                        <?php } else { ?>
                                            <option value="<?php echo $status; ?>"><?php echo $tip; ?></option>
                                        <?php } ?>
                                    <?php } ?>
                                </select>
                                <?php if ($error_code1) { ?>

                                <div class="text-danger"><?php echo $error_code1; ?></div>

                                <?php } ?>
                            </div>
                        </div>

                    </table>


                </form>

                <!-- 帮助信息 -->

                <div class="support">

                    <h3><?php echo $help_info; ?></h3>

                    <ol style="line-height:20px;">

                        <li><b><?php echo $help_info_list1; ?></b></li>

                        <li><b><?php echo $help_info_list2; ?></b>

                            <?php echo $help_info_list3; ?></li>



                    </ol>




                </div>

                <!-- 支持的信息 -->







            </div> 

        </div> 

    </div> 

</div> 



<?php echo $footer; ?>