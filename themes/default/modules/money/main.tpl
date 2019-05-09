<!-- BEGIN: main -->
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.css" />
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2-bootstrap.min.css" />
<link type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<div class="well">
    <form action="{ACTION}" method="get">
        <input type="hidden" name="type" value="{SEARCH.type}" />
        <!-- BEGIN: no_rewrite -->
        <input type="hidden" name="{NV_LANG_VARIABLE}" value="{NV_LANG_DATA}" /> <input type="hidden" name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}" /> <input type="hidden" name="{NV_OP_VARIABLE}" value="{OP}" />
        <!-- END: no_rewrite -->
        <div class="row">
            <div class="col-xs-12 col-md-5">
                <div class="form-group">
                    <div class="input-group">
                        <input class="form-control" value="{SEARCH.daterange}" type="text" name="daterange" autocomplete="off" placeholder="{LANG.choice_time}" /><span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <em class="fa fa-calendar fa-fix">&nbsp;</em>
                            </button>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-3">
                <div class="form-group">
                    <input class="btn btn-primary" type="submit" value="{LANG.search_submit}" />
                </div>
            </div>
        </div>
    </form>
</div>
<!-- BEGIN: groupmanager_th2 -->
<form class="form-inline m-bottom">
    <select class="form-control" id="action-top">
        <!-- BEGIN: action_top -->
        <option value="{ACTION.key}">{ACTION.value}</option>
        <!-- END: action_top -->
    </select>
    <button class="btn btn-primary" onclick="nv_list_action( $('#action-top').val(), '{BASE_URL}', '{LANG.error_empty_data}' ); return false;">{LANG.perform}</button>
    <a class="btn btn-success" href="{URL_ADD}">{LANG.money_add}</a> <a class="btn btn-warning" href="{URL_LIST}">{LANG.money_type}</a>
</form>
<!-- END: groupmanager_th2 -->
<form action="{NV_BASE_SITEURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th class="text-center" width="50"><input name="check_all[]" type="checkbox" value="yes" onclick="nv_checkAll(this.form, 'idcheck[]', 'check_all[]',this.checked);"></th>
                    <th width="150">{LANG.money_date}</th>
                    <th>{LANG.money_value}</th>
                    <th>{LANG.note}</th>
                    <th width="150">{LANG.addtime}</th>
                    <th width="150">{LANG.money_userid}</th>
                    <!-- BEGIN: groupmanager_th -->
                    <th width="150">&nbsp;</th>
                    <!-- END: groupmanager_th -->
                </tr>
            </thead>
            <!-- BEGIN: generate_page -->
            <tfoot>
                <tr>
                    <td class="text-center" colspan="7">{NV_GENERATE_PAGE}</td>
                </tr>
            </tfoot>
            <!-- END: generate_page -->
            <tbody>
                <!-- BEGIN: loop -->
                <tr>
                    <td class="text-center">
                        <input type="checkbox" onclick="nv_UncheckAll(this.form, 'idcheck[]', 'check_all[]', this.checked);" value="{VIEW.id}" name="idcheck[]" class="post">
                    </td>
                    <td>{VIEW.date}</td>
                    <td>{VIEW.money}</td>
                    <td>{VIEW.note}</td>
                    <td>{VIEW.addtime}</td>
                    <td>{VIEW.fullname}</td>
                    <!-- BEGIN: groupmanager_td -->
                    <td class="text-center">
                        <!-- BEGIN: admin -->
                        <i class="fa fa-edit">&nbsp;</i> <a href="{VIEW.link_edit}">{LANG.edit}</a> - <em class="fa fa-trash-o">&nbsp;</em> <a href="{VIEW.link_delete}" onclick="return confirm(nv_is_del_confirm[0]);">{LANG.delete}</a>
                        <!-- END: admin -->
                    </td>
                    <!-- END: groupmanager_td -->
                </tr>
                <!-- END: loop -->
            </tbody>
            <tfoot>
                <tr>
                    <td class="text-center" colspan="2">{LANG.total_type}</td>
                    <td class="text-center" colspan="5">{VIEW.total}</td>
                </tr>
                <tr>
                    <td class="text-center" colspan="2">{LANG.total_money}</td>
                    <td class="text-center" colspan="5">{VIEW.total_money}</td>
                </tr>
            </tfoot>
        </table>
    </div>
</form>
<form class="form-inline m-bottom">
    <!-- BEGIN: groupmanager_th1 -->
    <select class="form-control" id="action-bottom">
        <!-- BEGIN: action_bottom -->
        <option value="{ACTION.key}">{ACTION.value}</option>
        <!-- END: action_bottom -->
    </select>
    <button class="btn btn-primary" onclick="nv_list_action( $('#action-bottom').val(), '{BASE_URL}', '{LANG.error_empty_data}' ); return false;">{LANG.perform}</button>
    <!-- END: groupmanager_th1 -->
</form>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.ui.datepicker-{NV_LANG_INTERFACE}.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript">
$(function() {
  $('input[name="daterange"]').daterangepicker({
      autoUpdateInput: false,
      showDropdowns: true,
      opens: "right",
      alwaysShowCalendars: true,
      locale: {
          cancelLabel: 'Clear',
          format: 'DD/MM/YYYY',
          separator: " - ",
          showWeekNumbers: true,
          applyLabel: "{LANG.applyLabel}",
          cancelLabel: "{LANG.cancelLabel}",
          fromLabel: "{LANG.fromLabel}",
          toLabel: "{LANG.toLabel}",
          customRangeLabel: "Custom",
          daysOfWeek: [
              "{LANG_GLOBAL.sun}",
              "{LANG_GLOBAL.mon}",
              "{LANG_GLOBAL.tue}",
              "{LANG_GLOBAL.wed}",
              "{LANG_GLOBAL.thu}",
              "{LANG_GLOBAL.fri}",
              "{LANG_GLOBAL.sat}"  
              ],
          monthNames: [
              "{LANG_GLOBAL.january}",
              "{LANG_GLOBAL.february}",
              "{LANG_GLOBAL.march}",
              "{LANG_GLOBAL.april}",
              "{LANG_GLOBAL.may}",
              "{LANG_GLOBAL.june}",
              "{LANG_GLOBAL.july}",
              "{LANG_GLOBAL.august}",
              "{LANG_GLOBAL.september}",
              "{LANG_GLOBAL.october}",
              "{LANG_GLOBAL.december}"  
              ]   
      }
  });
 
  $('input[name="daterange"]').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
  });
  $('input[name="daterange"]').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
  });
});
</script>
<!-- END: main -->