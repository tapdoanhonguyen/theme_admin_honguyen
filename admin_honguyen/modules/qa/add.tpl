<!-- BEGIN: main -->

<!-- BEGIN: error -->
<div class="alert alert-danger">{error}</div>
<!-- END: error -->

<form action="{FORM_ACTION}" name="frm" method="post">
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <caption><i class="fa fa-fw fa-question-circle" aria-hidden="true"></i>{LANG.cauhoi_info}</caption>
            <colgroup>
                <col class="w200" />
            </colgroup>
            <tbody>
                <tr>
                    <td><strong>{LANG.title} <span class="red">*</span></strong></td>
                    <td>
                        <input type="text" value="{DATA.title}" id="title" name="title" class="form-control" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <strong>{LANG.cat} <span class="red">*</span></strong>
                    </td>
                    <td>
                        <select name="catid" class="form-control w200">
                            <!-- BEGIN: catid -->
                            <option value="{LISTCATS.id}"{LISTCATS.selected}>{LISTCATS.title}</option>
                            <!-- END: catid -->
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><strong>{LANG.critical_level}</strong></td>
                    <td>
                        <select name="critical_level" class="form-control w200">
                            <!-- BEGIN: critical_level -->
                            <option value="{CRITICAL_LEVEL.key}" {CRITICAL_LEVEL.selected}>{CRITICAL_LEVEL.title}</option>
                            <!-- END: critical_level -->
                        </select>
                    </td>
                </tr>
				<tr>
					<td><strong>{LANG.full_name}</strong></td>
					<td class="form-inline"><input type="text" value="{DATA.cus_name}" name="cus_name" class="form-control w300"/> {LANG.auto_get_fadmin}</td>
				</tr>
				<tr>
					<td><strong>{LANG.email}</strong></td>
					<td class="form-inline"><input type="text" value="{DATA.cus_email}" name="cus_email" class="form-control w300"/> {LANG.auto_get_fadmin}</td>
				</tr>
                <!-- BEGIN: showmail -->
                <tr>
                    <td><strong>{LANG.show_asker_info}</strong></td>
                    <td>
                        <select name="showmail" class="form-control w200">
                            <!-- BEGIN: loop -->
                            <option value="{SHOWMAIL.key}"{SHOWMAIL.selected}>{SHOWMAIL.title}</option>
                            <!-- END: loop -->
                        </select>
                    </td>
                </tr>
                <!-- END: showmail -->
                <tr>
                    <td><strong>{LANG.ndquestion} <span class="red">*</span></strong></td>
                    <td>
                        {HTMLQS}
                    </td>
                </tr>
                <tr>
                    <td><strong>{LANG.selec_department}</strong></td>
                    <td class="form-inline">
                        <select name="departmentid" class="form-control w300">
                            <option value="0">--</option>
                            <!-- BEGIN: department -->
                            <option value="{DEPARTMENT.key}"{DEPARTMENT.selected}>{DEPARTMENT.title}</option>
                            <!-- END: department -->
                        </select>
                        <i>{LANG.add_departmenti_no_notice}</i>.
                    </td>
                </tr>
                <tr>
                    <td><strong>{LANG.tags1}</strong></td>
                    <td>
						<div class="message_body" style="overflow: auto">
							<div class="clearfix uiTokenizer uiInlineTokenizer">
	                            <div id="keywords" class="tokenarea">
	                                <!-- BEGIN: keywords -->
	                                <span class="uiToken removable" title="{KEYWORDS}" ondblclick="$(this).remove();">
	                                    {KEYWORDS}
	                                    <input type="hidden" autocomplete="off" name="keywords[]" value="{KEYWORDS}" />
	                                    <a onclick="$(this).parent().remove();" class="remove uiCloseButton uiCloseButtonSmall" href="javascript:void(0);"></a>
	                                </span>
	                                <!-- END: keywords -->
	                            </div>
	                            <div class="uiTypeahead">
	                                <div class="wrap">
	                                    <input type="hidden" class="hiddenInput" autocomplete="off" value="" />
	                                    <div class="innerWrap">
	                                        <input id="keywords-search" type="text" placeholder="{LANG.input_keyword_tags}" class="form-control textInput" style="width: 100%;" />
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                	</div>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- BEGIN: tableadd -->
        <table class="table table-striped table-bordered table-hover">
            <caption><i class="fa fa-fw fa-reply-all" aria-hidden="true"></i>{LANG.ndan_info}</caption>
            {FILE "form_answer.tpl"}
        </table>
        <!-- END: tableadd -->
    </div>
    <input type="submit" name="submit" value="{LANG.save}" class="btn btn-primary" />
</form>
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
<link type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>
<!-- END: main -->