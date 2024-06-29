<!-- BEGIN: main -->
<link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css">

<script type="text/javascript">var de_del_cofirm = "{LANG.de_del_cofirm}";</script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>
<script src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.ui.datepicker-vi.js" type="text/javascript"></script>

<form action="{FORM_ACTION}" method="get" class="well form-inline">
    <input type="hidden" name ='nv' value={MODULE_NAME}>
    <input type="hidden" name ='op' value={OP}>

    <div class="form-group pull-left">
        <input type="text" class="form-control" name="keywords" value="{SEARCH.keywords}" placeholder="{LANG.keywords}, {LANG.stat_qa_code1}" />
    </div>

    <div class="input-group pull-left" style="margin-left: 10px">
        <input name="from" id="from" value="{SEARCH.from}" style="width: 100px;" class="form-control" maxlength="10" readonly="readonly" type="text"/>
        <span class="input-group-btn pull-left">
            <button class="btn btn-default" type="button" id="from-btn">
                <em class="fa fa-calendar fa-fix">&nbsp;</em>
            </button>
        </span>
    </div>

    <span class="text-middle pull-left" style="margin-left: 10px">{LANG.to}</span>

    <span class="text-middle pull-left">{LANG.dateselect}</span>
    <div class="input-group pull-left" style="margin-left: 10px">
        <input name="to" id="to" value="{SEARCH.to}" style="width: 100px;" class="form-control" maxlength="10" readonly="readonly" type="text"/>
        <span class="input-group-btn pull-left">
            <button class="btn btn-default" type="button" id="to-btn">
                <em class="fa fa-calendar fa-fix">&nbsp;</em>
            </button>
        </span>
    </div>

    <!-- BEGIN: search_status -->
    <select name="status" class="form-control pull-left" style="margin-left: 10px">
        <option value="">{LANG.statusselect}</option>
        <!-- BEGIN: psopt3 -->
        <option value="{OPTION3.id}" {OPTION3.selected}>{OPTION3.name}</option>
        <!-- END: psopt3 -->
    </select>
    <!-- END: search_status -->

    <select name="cri" class="form-control pull-left" style="margin-left: 10px">
        <option value="-1">{LANG.critical_level_alias}</option>
        <!-- BEGIN: critical_level -->
        <option value="{CRITICAL_LEVEL.key}" {CRITICAL_LEVEL.selected}>{CRITICAL_LEVEL.title}</option>
        <!-- END: critical_level -->
    </select>

    <input style="margin-left: 10px" name="ok" type="submit" value="{LANG.search}" class="btn btn-success" />
</form>
<form>
    <div class="table-responsive" style="margin-top: 10px">
        <table class="table table-striped table-bordered table-hover">
            <caption>
                {TABLE_CAPTION}
            </caption>
            <thead>
                <tr>
                    <!-- BEGIN: col_check --><th class="text-center w50"><input name="check_all[]" type="checkbox" value="yes" onclick="nv_checkAll(this.form, 'idcheck[]', 'check_all[]',this.checked);" /></th><!-- END: col_check -->
                    <!-- BEGIN: col_weight --><th class="w100">{LANG.weight}</th><!-- END: col_weight -->
                    <th>{LANG.title}</th>
                    <th class="w150">{LANG.name_cus}</th>
                    <th class="w150">{LANG.email_cus}</th>
                    <th class="w150">{LANG.time_order}</th>
                    <!-- BEGIN: col_status --><th class="w100">{LANG.status} <a href="#" title="{LANG.status_note_admin}" data-toggle="tooltip"><i class="fa fa-info-circle"></i></a></th><!-- END: col_status -->
                    <!-- BEGIN: col_department --><th class="w150"> {LANG.selec_department} </th><!-- END: col_department -->
                    <th class="w200 text-center">{LANG.feature}</th>
                </tr>
            </thead>
            <tbody>
                <!-- BEGIN: loop -->
                <tr>
                    <!-- BEGIN: col_check -->
                    <td class="text-center"><input type="checkbox" onclick="nv_UncheckAll(this.form, 'idcheck[]', 'check_all[]', this.checked);" value="{ROW.qid}" name="idcheck[]" id ="idcheck[]"></td>
                    <!-- END: col_check -->
                    <!-- BEGIN: col_weight -->
                    <td>
                        <select id="change_weight_{ROW.qid}" onchange="nv_chang_weight('{ROW.qid}');" class="form-control newWeight">
                            <!-- BEGIN: option -->
                            <option value="{NEWWEIGHT.value}"{NEWWEIGHT.selected}>{NEWWEIGHT.value}</option>
                            <!-- END: option -->
                        </select>
                    </td>
                    <!-- END: col_weight -->
                    <td>{ROW.critical_level_text}<a target="_blank" href="{ROW.link}">{ROW.title}</a></td>
                    <td> {ROW.cus_name} </td>

                    <td> {ROW.cus_email} </td>
                    <td> {ROW.addtime} </td>
                    <!-- BEGIN: col_status -->
                    <td>
                        <select id='sta_{ROW.qid}' name='sta' onchange="nv_status('{ROW.qid}')" class="form-control w150">
                            <!-- BEGIN: status -->
                            <option value={STATUS.id} {STATUS.selected}>{STATUS.name}</option>
                            <!-- END: status -->
                        </select>
                    </td>
                    <!-- END: col_status -->
                    <!-- BEGIN: col_department -->
                    <td>
                        <select class="form-control" id="chang_department_{ROW.qid}" onchange="nv_chang_department('{ROW.qid}');">
                            <option value=""> --- </option>
                            <!-- BEGIN: select_departmentid -->
                            <option value="{OPTION.key}" {OPTION.selected}>{OPTION.title}</option>
                            <!-- END: select_departmentid -->
                        </select>
                    </td>
                    <!-- END: col_department -->
                    <td class="text-center">
                        <div class="btn-group">
                            <a class="btn btn-xs btn-default" href="{ROW.detail_url}"><i class="fa fa-fw fa-search"></i>{LANG.detail}</a>
                            <a class="btn btn-xs btn-default" href="{ROW.edit_url}"><i class="fa fa-fw fa-edit"></i>{GLANG.edit}</a>
                            <a class="btn btn-xs btn-danger" href="javascript:void(0);" onclick="nv_de_del({ROW.qid});"><i class="fa fa-fw fa-trash"></i>{GLANG.delete}</a>
                        </div>
                    </td>
                </tr>
                <!-- END: loop -->
            </tbody>
            <!-- BEGIN: generate_page -->
            <tfoot>
                <tr>
                    <td colspan="7"> {GENERATE_PAGE} </td>
                </tr>
            </tfoot>
            <!-- END: generate_page -->
        </table>
    </div>
    <!-- BEGIN: actions -->
    <div class="alert alert-warning">{LANG.duyetque_notice}</div>
    <table class="table table-striped table-bordered table-hover">
        <tbody>
            <tr>
                <td>
                    <select id="action" class="form-control w100 pull-left">
                        <!-- BEGIN: action -->
                        <option value="{key_action}">{value_action}</option>
                        <!-- END: action -->
                    </select>
                    <input id="mainactionbtn" type="button" onclick="nv_main_action(this.form, '{LANG.doempty}');" value="OK" class="btn btn-warning" style="margin-left: 10px"/>
                </td>
            </tr>
        </tbody>
    </table>
    <!-- END: actions -->
</form>

<script type="text/javascript">
    //<![CDATA[
    $(document).ready(function() {
        $("#to,#from").datepicker({
            showOn : "both",
            dateFormat : "dd.mm.yy",
            changeMonth : true,
            changeYear : true,
            showOtherMonths : true,
            buttonImageOnly : true
        });

        $('#from-btn').click(function() {
            $("#from").datepicker('show');
        });

        $('#to-btn').click(function() {
            $("#to").datepicker('show');
        });
    });
    //]]>
</script>

<!-- END: main -->