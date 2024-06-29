<!-- BEGIN: main -->
<link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css">

<script type="text/javascript">var de_del_cofirm = "{LANG.de_del_cofirm}";</script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>
<script src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.ui.datepicker-vi.js" type="text/javascript"></script>

<form action="{FORM_ACTION}" method="get" class="well form-inline">
    <input type="hidden" name="{NV_LANG_VARIABLE}" value="{NV_LANG_DATA}"/>
    <input type="hidden" name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}"/>
    <input type="hidden" name="{NV_OP_VARIABLE}" value="{OP}"/>

    <span class="text-middle pull-left">{LANG.from}</span>

    <div class="input-group pull-left" style="margin-left: 10px">
        <input name="f" id="from" value="{SEARCH.from}" style="width: 100px;" class="form-control" maxlength="10" readonly="readonly" type="text"/>
        <span class="input-group-btn pull-left">
            <button class="btn btn-default" type="button" id="from-btn">
                <em class="fa fa-calendar fa-fix">&nbsp;</em>
            </button>
        </span>
    </div>

    <span class="text-middle pull-left" style="margin-left: 10px">{LANG.to}</span>

    <div class="input-group pull-left" style="margin-left: 10px">
        <input name="t" id="to" value="{SEARCH.to}" style="width: 100px;" class="form-control" maxlength="10" readonly="readonly" type="text"/>
        <span class="input-group-btn pull-left">
            <button class="btn btn-default" type="button" id="to-btn">
                <em class="fa fa-calendar fa-fix">&nbsp;</em>
            </button>
        </span>
    </div>

    <select name="dpid" class="form-control pull-left" style="margin-left: 10px">
        <option value="0">{LANG.departmentid1}</option>
        <!-- BEGIN: department -->
        <option value="{DEPARTMENT.key}"{DEPARTMENT.selected}>{DEPARTMENT.title}</option>
        <!-- END: department -->
    </select>

    <select name="s" class="form-control pull-left" style="margin-left: 10px">
        <option value="-1">{LANG.statusselect}</option>
        <!-- BEGIN: status -->
        <option value="{STATUS.key}"{STATUS.selected}>{STATUS.title}</option>
        <!-- END: status -->
    </select>

    <input style="margin-left: 10px" type="submit" value="{LANG.detail}" class="btn btn-success" />
    <input style="margin-left: 10px" type="submit" value="{LANG.stat_download}" name="d" class="btn btn-primary" />
</form>
<!-- BEGIN: data -->
<form>
    <div class="table-responsive" style="margin-top: 10px">
        <table class="table table-striped table-bordered table-hover qa-table-stat">
            <caption><span class="text-danger">{LANG.stat_total}: {ALL_PAGE}</span></caption>
            <thead>
                <tr>
                    <th>{LANG.stat_qa_code}</th>
                    <th>{LANG.name_cus}</th>
                    <th>{LANG.ndquestion}</th>
                    <th>{LANG.stat_addtime}</th>
                    <th>{LANG.status}</th>
                    <th>{LANG.stat_antime}</th>
                    <th>{LANG.stat_ancontent}</th>
                </tr>
            </thead>
            <tbody>
                <!-- BEGIN: loop -->
                <tr>
                    <td class="qa-nowrap">{ROW.qa_code}</td>
                    <td class="qa-nowrap">{ROW.cus_name}</td>
                    <td>{ROW.question}</td>
                    <td>{ROW.addtime}</td>
                    <td class="qa-nowrap">{ROW.status}</td>
                    <td>{ROW.antime}</td>
                    <td>{ROW.ancontent}</td>
                </tr>
                <!-- END: loop -->
            </tbody>
            <!-- BEGIN: generate_page -->
            <tfoot>
                <tr>
                    <td colspan="8"> {GENERATE_PAGE} </td>
                </tr>
            </tfoot>
            <!-- END: generate_page -->
        </table>
    </div>
</form>
<!-- END: data -->
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