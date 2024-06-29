<!-- BEGIN: main -->
<a href="{link_module}">{link_module_title}</a>
<br />
<script type="text/javascript">
    var de_del_cofirm = "{LANG.de_del_cofirm}";
    var de_duyet_cofirm = "{LANG.de_duyet_cofirm}";
    var ques_duyet_cofirm = "{LANG.ques_duyet_cofirm}";
    var nv_not_duyet = "{LANG.nv_not_duyet}";
    var doempty = "{LANG.doempty}";
</script>

<div class="text-center">
    <h3 class="text-danger">{LANG.detail_question}</h3>
    <h4><strong>{LANG.add_time}: {ORDER.addtime}</strong></h4>
</div>

<div class="table-responsive">
    <table class="table table-striped table-bordered table-hover">
        <caption><i class="fa fa-fw fa-file-o"></i>{LANG.detail_question}</caption>
        <colgroup>
            <col class="w200" />
        </colgroup>
        <tbody>
            <tr>
                <td><strong>{LANG.full_name}</strong></td>
                <td>{ORDER.cus_name}</td>
            </tr>
            <tr>
                <td><strong>{LANG.email_cus}</strong></td>
                <td><a href="mailto:{ORDER.cus_email}">{ORDER.cus_email}</a></td>
            </tr>
            <tr>
                <td><strong>{LANG.title}</strong></td>
                <td>{ORDER.title}</td>
            </tr>
            <tr>
                <td><strong>{LANG.cat}</strong></td>
                <td>{ORDER.cattitle}</td>
            </tr>
            <tr>
                <td><strong>{LANG.ndquestion}</strong></td>
                <td>{ORDER.question}</td>
            </tr>
            <!-- BEGIN: department -->
            <tr>
                <td><strong>{LANG.ques_department}</strong></td>
                <td>{DEPARTMENT}</td>
            </tr>
            <!-- END: department -->
            <tr>
                <td><strong>{LANG.critical_level}</strong></td>
                <td>{ORDER.critical_level}</td>
            </tr>
        </tbody>
    </table>
</div>

<!-- BEGIN: an -->
<form action="{ACTION_FILE}" method="post" name="list_post" id="list_post">
    <div class="well">
        <label><input name="check_all[]" type="checkbox" value="yes" onclick="nv_checkAll(this.form, 'idcheck[]', 'check_all[]',this.checked);" /><strong>{LANG.checkall}</strong></label>
        <span class="pull-right">{LANG.info_bill} (<strong class="text-danger">{num}</strong>)</span>
    </div>

    <!-- BEGIN: phanhoi -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <input type="checkbox" onclick="nv_UncheckAll(this.form, 'idcheck[]', 'check_all[]', this.checked);" value="{ROW.id}" name="idcheck[]" id ="idcheck[]"/>
            <strong>{ROW.cus_name}</strong> {LANG.detail_reply}:
            <span class="pull-right">
                (<!-- BEGIN: duyet --><a href="javascript:void(0);" onclick="nv_de_duyet({ROW.id}, {ORDER.qid});"><i class="fa fa-fw fa-check"></i>{LANG.duyet}</a> | <!-- END: duyet --><a href="{ROW.link_edit}" class="changeContent"><i class="fa fa-fw fa-edit"></i>{LANG.edit}</a> | <span > <a href="{ROW.link_del}" onclick="nv_de_dels({ROW.id}, {ORDER.qid});"><i class="fa fa-fw fa-trash"></i>{GLANG.delete}</a></span>)
                {ROW.addtime}
            </span>
        </div>
        <div class="panel-body">
            {ROW.answer}
            <!-- BEGIN: files -->
            <div class="clearfix">
                <span class="text-danger">{LANG.file}:</span> <a href="{ROW.fileLink}">{ROW.fileName}</a>
            </div>
            <!-- END: files -->
        </div>
    </div>
    <!-- END: phanhoi -->

    <div class="form-inline">
        <select id="action" class="form-control w100">
            <!-- BEGIN: action -->
            <option value="{key_action}">{value_action}</option>
            <!-- END: action -->
        </select>
        <input type="button" id="detailActionBtn" onclick="nv_detail_action(this.form, {ORDER.qid}, '{LANG.doempty}');" value="OK" class="btn btn-primary"/>
    </div>
</form>
<!-- END: an -->

<!-- BEGIN: queue_form -->
<div class="text-center form-inline">
    {LANG.selec_department}:
    <select class="form-control" id="chang_department_{ORDER.qid}" onchange="nv_chang_department('{ORDER.qid}');">
        <option value=""> --- </option>
        <!-- BEGIN: select_departmentid -->
        <option value="{OPTION.key}" {OPTION.selected}>{OPTION.title}</option>
        <!-- END: select_departmentid -->
    </select>
    <input type="button" class="btn btn-success" value="{LANG.duyetque}" id="detailQuestActQueue" onclick="nv_ques_duyet('{ORDER.qid}');"/>
</div>
<!-- END: queue_form -->

<!-- BEGIN: show_form -->
<hr />
<div id="form_area">
    <!-- BEGIN: error -->
    <div class="alert alert-danger">
        {ERROR}
    </div>
    <!-- END: error -->
    <form action="{FORM_ACTION}" method="post">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <caption><i class="fa fa-fw fa-pencil"></i>{TABLE_CAPTION}</caption>
                {FILE "form_answer.tpl"}
            </table>
        </div>
        <input type="submit" name="submit" value="{LANG.save}" class="btn btn-primary" />
    </form>
</div>

<script type="text/javascript">
    var uploads_dir_user = '{UPLOADS_DIR_USER}';
    var dir = '{UPLOAD_CURRENT}' + '/{DIR}';
    $(document).ready(function(){
        $("input[name=selectfile]").click(function() {
            var area = "file";
            var path = uploads_dir_user;
            var type = "file";
            nv_open_browse(script_name + "?" + nv_name_variable + "=upload&popup=1&area=" + area + "&path=" + path + "&type=" + type + "&currentpath=" + dir, "NVImg", 850, 420, "resizable=no,scrollbars=no,toolbar=no,location=no,status=no");
            return false;
        });
    });
</script>
<!-- END: show_form -->

<!-- BEGIN: scroll_form -->
<script type="text/javascript">
$(window).on('load', function() {
    $("html,body").delay(200).animate({scrollTop: $('#form_area').offset().top}, 100);
});
</script>
<!-- END: scroll_form -->

<!-- END: main -->