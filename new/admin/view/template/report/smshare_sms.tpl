<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bar-chart"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        
        
        
        <div class="row center-block text-center">
        
          
          <div class="col-sm-3">
              <div class="panel panel-primary" style="border-color: #337ab7; border-radius: 4px">
                  <div class="panel-heading" style="color: #fff; background-color: #337ab7; border-color: #337ab7;">  <h3 class="panel-title">Spent today</h3></div>
                  <div class="panel-body">
                    <?php echo $spent_today; ?>
                  </div>
              </div>
          </div>
          
          <div class="col-sm-3">
              <div class="panel panel-primary" style="border-color: #337ab7; border-radius: 4px">
                  <div class="panel-heading" style="color: #fff; background-color: #337ab7; border-color: #337ab7;">  <h3 class="panel-title">Spent this week</h3></div>
                  <div class="panel-body">
                    <?php echo $spent_this_week; ?>
                  </div>
              </div>
          </div>
          
          <div class="col-sm-3">
              <div class="panel panel-primary" style="border-color: #337ab7; border-radius: 4px">
                  <div class="panel-heading" style="color: #fff; background-color: #337ab7; border-color: #337ab7;">  <h3 class="panel-title">Spent this month</h3></div>
                  <div class="panel-body">
                    <?php echo $spent_this_month; ?>
                  </div>
              </div>
          </div>
          
          <div class="col-sm-3">
              <div class="panel panel-primary" style="border-color: #337ab7; border-radius: 4px">
                  <div class="panel-heading" style="color: #fff; background-color: #337ab7; border-color: #337ab7;">  <h3 class="panel-title">Spent this year</h3></div>
                  <div class="panel-body">
                    <?php echo $spent_this_year; ?>
                  </div>
              </div>
          </div>
            
        </div>

        
        
        
        <div class="well">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-date-start"><?php echo $entry_date_start; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <div class="form-group">
                <label class="control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
            </div>
            
            <div class="col-sm-6">
            
              <div class="form-group">
                <label class="control-label" for="input-reference"><?php echo "Sent from (reference)"; ?></label>
                <div class="input-group col-xs-12">
                  <input type="text" name="filter_reference" value="<?php echo $filter_reference; ?>" placeholder="<?php echo "E.g Marketing"; ?>" id="input-reference" class="form-control" />
                </div>
              </div>
              
              <div class="form-group">
                <label class="control-label" for="input-username"><?php echo "User"; ?></label>
                <div class="input-group col-xs-12">
                  <input type="text" name="filter_username" value="<?php echo $filter_username; ?>" placeholder="<?php echo "E.g admin"; ?>" id="input-username" class="form-control" />
                </div>
              </div>
              
            </div>
            
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-comment"><?php echo "Comment"; ?></label>
                <div class="input-group col-xs-12">
                  <input type="text" name="filter_comment" value="<?php echo $filter_comment; ?>" id="input-comment" class="form-control" />
                </div>
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-left"><?php echo $column_to; ?></td>
                <td class="text-left"><?php echo $column_price; ?></td>
                <td class="text-right"><?php echo $column_from; ?></td>
                <td class="text-right"><?php echo $column_comment; ?></td>
                <td class="text-right"><?php echo $column_user; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($smsBeans) { ?>
              <?php foreach ($smsBeans as $smsBean) { ?>
              <tr>
                <td class="text-left"><?php echo $smsBean['to']; ?></td>
                <td class="text-left"><?php echo $smsBean['price']; ?></td>
                <td class="text-right"><?php echo $smsBean['reference']; ?></td>
                <td class="text-right"><?php echo $smsBean['comment']; ?></td>
                <td class="text-right"><?php echo $smsBean['username']; ?></td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        
        <div class="row">
          <div class="col-sm-6 text-left"></div>
          <div class="col-sm-6 text-right">
            <h3>
                <span class="label label-primary">Total:</span>
                <span> <?php echo $price_total ?></span>
            </h3>
          </div>
        </div>
        
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=report/smshare_sms&token=<?php echo $token; ?>';
	
	var filter_date_start = $('input[name=\'filter_date_start\']').val();
	
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}

	var filter_date_end = $('input[name=\'filter_date_end\']').val();
	
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}
	
	var filter_reference = $('input[name=\'filter_reference\']').val();
	
	if (filter_reference) {
		url += '&filter_reference=' + encodeURIComponent(filter_reference);
	}
	
	var filter_username = $('input[name=\'filter_username\']').val();
	
	if (filter_username) {
		url += '&filter_username=' + encodeURIComponent(filter_username);
	}
	
	var filter_comment = $('input[name=\'filter_comment\']').val();
	
	if (filter_comment) {
		url += '&filter_comment=' + encodeURIComponent(filter_comment);
	}
	
	

	location = url;
});
//--></script> 
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script></div>
<?php echo $footer; ?>