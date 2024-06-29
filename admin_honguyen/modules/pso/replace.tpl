<!-- BEGIN: msg -->
<div class="alert alert-info text-center">
    <p><strong>{LANG.msg1} {TYPE} {LANG.msg2}. <a href="{HREF}">{LANG.msg3}</a> {LANG.msg4}</strong></p>
	{LANG.msg5}
</div>
<!-- END: msg -->

<!-- BEGIN: list -->
<div class="table-responsive">
    <table class="table table-striped table-bordered table-hover">
        <colgroup>
            <col class="w120" />
            <col />
            <col span="2" class="w120" />
        </colgroup>
        <thead>
            <tr>
                <th>{LANG.num_decision}</th>
                <th>{LANG.title}</th>
                <th class="text-center">{LANG.status}</th>
                <th class="text-center">{LANG.feature}</th>
            </tr>
        </thead>
        <tbody>
            <!-- BEGIN: loop -->
            <tr>
                <td><strong>{DATA.num_decision}</strong></td>
                <td><a href="{DATA.url_view}" target="_blank" title="{DATA.title}">{DATA.title}</a></td>
                <td class="text-center">
                <select class="form-control" id="status_{DATA.id}" name="status[]" onchange="nv_change_status({DATA.id});">
                    <option value="0">{LANG.status0}</option>
                    <option value="1"{DATA.selected}>{LANG.status1}</option>
                </select></td>
                <td class="text-center"><em class="fa fa-edit fa-lg">&nbsp;</em><a href="{DATA.url_edit}">{GLANG.edit}</a> - <em class="fa fa-trash-o fa-lg">&nbsp;</em><a href="javascript:void(0);" onclick="nv_delete_replace({DATA.id});">{GLANG.delete}</a></td>
            </tr>
            <!-- END: loop -->
        </tbody>
    </table>
</div>
<div class="text-center">
    {NV_GENERATE_PAGE}
</div>
<!-- END: list -->

<!-- BEGIN: main -->
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.css">
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/i18n/{NV_LANG_DATA}.js"></script>

<div class="well">
    <form class="form-inline">
        <div class="form-group">
            <label class="sr-only">{LANG.keywords}</label>
            <input type="text" name="keywords" class="form-control" placeholder="{LANG.keywords}" />
        </div>
        <div class="form-group">
            <label class="sr-only">{LANG.areaSel}</label>
            <select class="form-control select2" name="aid">
                <option value="">---{LANG.areaSel}---</option>
                <!-- BEGIN: alist -->
                <option value="{ALIST.id}">{ALIST.name}</option>
                <!-- END: alist -->
            </select>
        </div>
        <div class="form-group">
            <label class="sr-only">{LANG.subjectSel}</label>
            <select class="form-control select2" name="sid">
                <option value="">---{LANG.subjectSel}---</option>
                <!-- BEGIN: slist -->
                <option value="{SLIST.id}">{SLIST.title}</option>
                <!-- END: slist -->
            </select>
        </div>
        <div class="form-group">
            <button class="btn btn-primary" onclick="nv_search_pso(); return false;">{LANG.search}</button>
        </div>
    </form>
</div>

<div style="text-align: left; margin-bottom:10px;">
    <input name="submit" onclick="window.location='{ADD_LINK}';" type="button" value="{LANG.add_pso_replace}" class="btn btn-primary" />
</div>

<div id="psolist">
    <div style="text-align: center"><em class="fa fa-spinner fa-spin fa-4x">&nbsp;</em><br />{LANG.wait}</div>
</div>

<script type="text/javascript">
    $('.select2').select2();

    function nv_load_pso(url, area) {
        $('#psolist').load(rawurldecode(url));
    }

    function nv_search_pso(){
        var keywords = $('input[name="keywords"]').val();
        var aid = $('select[name="aid"]').val();
        var sid = $('select[name="sid"]').val();

        if( keywords == '' && aid == '' && sid == '' )
        {
            alert( '{LANG.search_error}' );
        }
        else
        {
            $('#psolist').html('<div style="text-align: center"><em class="fa fa-spinner fa-spin fa-4x">&nbsp;</em><br />{LANG.wait}</div>');
            $('#psolist').load('{BASE_LOAD}&keywords=' + encodeURIComponent(keywords) + '&aid=' + aid + '&sid=' + sid);
        }
    }

    $(window).on('load', function() {
        $('#psolist').load('{BASE_LOAD}');
    });
</script>
<!-- END: main -->

<!-- BEGIN: add -->
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css">
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/i18n/{NV_LANG_DATA}.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.ui.datepicker-{NV_LANG_INTERFACE}.js"></script>
<div id="pageContent">
    <form id="addRow" action="{DATA.action_url}" method="post">
        <h3 class="myh3">{DATA.ptitle}</h3>
        <div class="row">
            <div class="col-sm-24 col-md-18">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover">
                        <col style="width:200px" />
                        <tbody>
                            <tr>
                                <td>{LANG.title} <span class="red">*</span></td>
                                <td>
                                <input title="{LANG.title}" class="form-control" style="width: 400px" type="text" name="title" value="{DATA.title}" maxlength="255" />
                                </td>
                            </tr>
                            <tr>
                                <td>{LANG.num_decision} <span class="red">*</span></td>
                                <td><input title="{LANG.num_decision}" class="form-control" style="width: 400px" type="text" name="num_decision" value="{DATA.num_decision}" maxlength="255" /></td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top">{LANG.fileupload} <strong>[<a onclick="nv_add_files('{NV_BASE_ADMINURL}','{UPLOADS_DIR_USER}','{GLANG.delete}','Browse server');" href="javascript:void(0);" title="{LANG.add}">{LANG.add}]</a></strong></td>
                                <td>
                                    <div id="filearea">
                                        <!-- BEGIN: files -->
                                        <div id="fileitem_{FILEUPL.id}" style="margin-bottom: 5px">
                                            <input title="{LANG.fileupload}" class="form-control w400 pull-left" type="text" name="files[]" id="fileupload_{FILEUPL.id}" value="{FILEUPL.value}" style="margin-right: 5px" />
                                             <input onclick="nv_open_browse( '{NV_BASE_ADMINURL}index.php?{NV_NAME_VARIABLE}=upload&popup=1&area=fileupload_{FILEUPL.id}&path={UPLOADS_DIR_USER}&type=file', 'NVImg', '850', '500', 'resizable=no,scrollbars=no,toolbar=no,location=no,status=no' );return false;" type="button" value="Browse server" class="selectfile btn btn-primary" />
                                              <input onclick="nv_delete_datacontent('fileitem_{FILEUPL.id}');return false;" type="button" value="{GLANG.delete}" class="selectfile btn btn-danger" />
                                        </div>
                                        <!-- END: files -->
                                    </div>
                                </td>
                            </tr>
                            <tr class="form-inline">
                                <td> {LANG.publtime} </td>
                                <td><label>
                                <input class="form-control" name="publtime" id="publtime" value="{DATA.publtime}" style="width: 110px;" maxlength="10" type="text" />
                                &nbsp;({LANG.prm})</label></td>
                            </tr>
                            <tr>
                                <td>{LANG.intro}</td>
                                <td><textarea class="form-control" rows="5" name="introtext" id="introtext">{DATA.introtext}</textarea></td>
                            </tr>
							
                            <tr>
							     <td style="vertical-align:top">{LANG.body}</td>
                                <td colspan="2">{CONTENT}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-sm-24 col-md-6">
                <table class="table table-striped table-bordered table-hover">
                    <tbody>
                        <tr>
                            <td>{LANG.areaSel} <span class="red">*</span></td>
                        </tr>
                        <tr>
                            <td>
                                <div style="height: 200px; overflow: scroll">
                                    <!-- BEGIN: areaopt -->
                                    <label class="show"><input type="checkbox" name="aid[]" value="{AREAOPT.id}" {AREAOPT.checked} />{AREAOPT.name}</label>
                                    <!-- END: areaopt -->
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>{LANG.subjectSel} <span class="red">*</span></td>
                        </tr>
                        <tr>
                            <td>
                            <select class="form-control select2" title="{LANG.subjectSel}" name="sid">
                                <!-- BEGIN: subopt -->
                                <option value="{SUBOPT.id}"{SUBOPT.selected}>{SUBOPT.title}</option>
                                <!-- END: subopt -->
                            </select></td>
                        </tr>
                        
                        <tr>
                            <td>{LANG.who_view}</td>
                        </tr>
                        <tr>
                            <td><!-- BEGIN: group_view -->
                            <div class="row">
                                <label>
                                    <input name="groups_view[]" type="checkbox" value="{GROUPS_VIEWS.id}" {GROUPS_VIEWS.checked} />
                                    {GROUPS_VIEWS.title}</label>
                            </div><!-- END: group_view --></td>
                        </tr>
                        <tr>
                            <td>{LANG.who_download}</td>
                        </tr>
                        <tr>
                            <td><!-- BEGIN: groups_download -->
                            <div class="row">
                                <label>
                                    <input name="groups_download[]" type="checkbox" value="{GROUPS_DOWNLOAD.id}" {GROUPS_DOWNLOAD.checked} />
                                    {GROUPS_DOWNLOAD.title}</label>
                            </div><!-- END: groups_download --></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <input type="hidden" name="save" value="1" />
        <input class="btn btn-primary" name="submit" type="submit" value="{LANG.save}" />
    </form>
</div>
<script type="text/javascript">
    //<![CDATA[
    $("#publtime,#startvalid").datepicker({
        showOn : "both",
        yearRange: "2000:2025",
        dateFormat : "dd.mm.yy",
        changeMonth : true,
        changeYear : true,
        showOtherMonths : true,
        buttonImage : nv_base_siteurl + "assets/images/calendar.gif",
        buttonImageOnly : true
    });

    var nv_num_files = '{NUMFILE}';
    var nv_is_editor = '{IS_EDITOR}';

    $(document).ready(function() {
        $('.select2').select2();
        $("#amendmentSearch").click(function() {
            nv_open_browse("{NV_BASE_ADMINURL}index.php?" + nv_name_variable + "=" + nv_module_name + "&" + nv_fc_variable + "=getlid&area=amendment", "NVImg", "850", "600", "resizable=no,scrollbars=no,toolbar=no,location=no,status=no");
            return false;
        });
        $("#supplementSearch").click(function() {
            nv_open_browse("{NV_BASE_ADMINURL}index.php?" + nv_name_variable + "=" + nv_module_name + "&" + nv_fc_variable + "=getlid&area=supplement", "NVImg", "850", "600", "resizable=no,scrollbars=no,toolbar=no,location=no,status=no");
            return false;
        });
    });
    $("form#addRow").submit(function() {
        var a = $("[name=title]").val();
        a = trim(a);
        $("[name=title]").val(a);
        if (a.length < 2) {
            alert("{LANG.errorIsEmpty}: {LANG.title}");
            $("[name=title]").select();
            return !1;
        }

        if (trim($("[name=num_decision]").val()) == "") {
            alert("{LANG.errorAreaYesNum_decision}");
            $("[name=num_decision]").select();
            return !1;
        }

        if( nv_is_editor == '1' )
        {
            $("textarea[name=bodytext]").val(CKEDITOR.instances.{MODULE_DATA}_bodytext.getData());
        }

        a = $(this).serialize();
        var b = $(this).attr("action");
        $("[type=submit]").attr("disabled", "disabled");
        $.ajax({
            type : "POST",
            url : b,
            data : a,
            success : function(c) {
                if (c == "OK") {
                    window.location = "{MODULE_URL}=replace";
                } else {
                    alert(c);
                }
                $("[type=submit]").removeAttr("disabled");
            }
        });
        return !1;
    });
    //]]>
</script>
<!-- END: add -->