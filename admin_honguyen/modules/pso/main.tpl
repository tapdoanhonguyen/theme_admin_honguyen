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
            <col class="w120" />
            <col />
            <col span="2" class="w120" />
        </colgroup>
        <thead>
            <tr>
                <th>{LANG.code}</th>
                <th>{LANG.num_decision}</th>
                <th>{LANG.title}</th>
                <th class="text-center">{LANG.status}</th>
                <th class="text-center">{LANG.feature}</th>
            </tr>
        </thead>
        <tbody>
            <!-- BEGIN: loop -->
            <tr>
                <td><strong>{DATA.code}</strong></td>
                <td><strong>{DATA.num_decision}</strong></td>
                <td><a href="{DATA.url_view}" target="_blank" title="{DATA.title}">{DATA.title}</a></td>
                <td class="text-center">
                <select class="form-control" id="status_{DATA.id}" name="status[]" onchange="nv_change_status({DATA.id});">
                    <option value="0">{LANG.status0}</option>
                    <option value="1"{DATA.selected}>{LANG.status1}</option>
                </select></td>
                <td class="text-center"><em class="fa fa-edit fa-lg">&nbsp;</em><a href="{DATA.url_edit}">{GLANG.edit}</a> - <em class="fa fa-trash-o fa-lg">&nbsp;</em><a href="javascript:void(0);" onclick="nv_delete_pso({DATA.id});">{GLANG.delete}</a></td>
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
            <label class="sr-only">{LANG.catParent}</label>
            <select class="form-control select2" name="cid">
                <option value="">---{LANG.catParent}---</option>
                <!-- BEGIN: catParent -->
                <option value="{CATOPT.id}">{CATOPT.name}</option>
                <!-- END: catParent -->
            </select>
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
            <label class="sr-only">{LANG.levelSel}</label>
            <!-- BEGIN: levelopt -->
            <input class="form-control" type="radio" name="lid" id="lid" value="{LEVELOPT.id}"/>{LEVELOPT.title}
            <!-- END: levelopt -->
        </div>
        <div class="form-group">
            <label class="sr-only">{LANG.typeSel}</label>
            <select class="form-control select2" name="tid">
                <option value="">---{LANG.typeSel}---</option>
                 <!-- BEGIN: tlist -->
                 <option value="{TYPEOPT.id}"{TYPEOPT.selected}>{TYPEOPT.title}</option>
                 <!-- END: tlist -->
            </select>
        </div>
        <div class="form-group">
            <label class="sr-only">{LANG.signer}</label>
            <select class="form-control select2" name="sgid">
                <option value="">---{LANG.signer}---</option>
                <!-- BEGIN: sglist -->
                <option value="{SGLIST.id}">{SGLIST.title}</option>
                <!-- END: sglist -->
            </select>
        </div>
        <div class="form-group">
            <button class="btn btn-primary" onclick="nv_search_pso(); return false;">{LANG.search}</button>
        </div>
    </form>
</div>

<div style="text-align: left; margin-bottom:10px;">
    <input name="submit" onclick="window.location='{ADD_LINK}';" type="button" value="{LANG.add_pso}" class="btn btn-primary" />
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
        var cid = $('select[name="cid"]').val();
        var aid = $('select[name="aid"]').val();
        var sid = $('select[name="sid"]').val();
        var sgid = $('select[name="sgid"]').val();

        if( keywords == '' && cid == '' && aid == '' && sid == '' && sgid == '' )
        {
            alert( '{LANG.search_error}' );
        }
        else
        {
            $('#psolist').html('<div style="text-align: center"><em class="fa fa-spinner fa-spin fa-4x">&nbsp;</em><br />{LANG.wait}</div>');
            $('#psolist').load('{BASE_LOAD}&keywords=' + keywords + '&cat=' + cid + '&aid=' + aid + '&sid=' + sid + '&sgid=' + sgid);
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
                                <td>{LANG.code} <span class="red">*</span></td>
                                <td><input title="{LANG.code}" class="form-control" style="width: 400px" type="text" name="code" value="{DATA.code}" maxlength="255" /></td>
                            </tr>
                            <tr>
                                <td>{LANG.num_decision} <span class="red">*</span></td>
                                <td><input title="{LANG.num_decision}" class="form-control" style="width: 400px" type="text" name="num_decision" value="{DATA.num_decision}" maxlength="255" /></td>
                            </tr>
                            <tr>
                                <td>{LANG.level} <span class="red">*</span></td>
                                <td>                               
                                    <!-- BEGIN: levelopt -->
                                    <input class="form-control" type="radio" name="lid" id="lid" value="{LEVELOPT.id}"/>{LEVELOPT.title}
                                    <!-- END: levelopt -->
                                </td>

                                
                            </tr>
                            <tr>
                                <td>{LANG.type} <span class="red">*</span></td>
                                <td>
                                <select class="form-control select2" style="width: 400px" title="{LANG.typeSel}" name="tid" id="tid">
                                    <!-- BEGIN: typeopt -->
                                    <option value="{TYPEOPT.id}"{TYPEOPT.selected}>{TYPEOPT.title}</option>
                                    <!-- END: typeopt -->
                                    </select>
                                </td>
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
                            <tr>
                                <td style="vertical-align:top">{LANG.note}</td>
                                <td><textarea class="form-control" rows="5" name="note" id="note">{DATA.note}</textarea></td>
                            </tr>
                            <tr>
                                <td style="vertical-align:top">{LANG.introtext}</td>
                                <td colspan="2">{CONTENT_I}</td>
                            </tr>
							<tr>
                                <td style="vertical-align:top">{LANG.delegate}</td>
                                <td colspan="2">{CONTENT_D}</td>
                            </tr>
							<tr>
                                <td style="vertical-align:top">{LANG.ingredient}</td>
                                <td><textarea class="form-control" rows="5" name="ingredient" id="ingredient">{DATA.ingredient}</textarea></td>
                            </tr>
							<tr>
                                <td style="vertical-align:top">{LANG.leadtime}</td>
                                <td><textarea class="form-control" rows="5" name="leadtime" id="leadtime">{DATA.leadtime}</textarea></td>
                            </tr>
<!-- Bỏ 2 trường này		<tr>
                                <td style="vertical-align:top">{LANG.subjects}</td>
                                <td><textarea class="form-control" rows="5" name="subjects" id="subjects">{DATA.subjects}</textarea></td>
                            </tr>
							<tr>
                                <td style="vertical-align:top">{LANG.result}</td>
                                <td><textarea class="form-control" rows="5" name="result" id="result">{DATA.result}</textarea></td>
                            </tr>  -->
							<tr>
                                <td style="vertical-align:top">{LANG.fees}</td>
                                <td colspan="2">{CONTENT_F}</td>
                            </tr>
							<tr>
                                <td style="vertical-align:top">{LANG.declarationform}</td>
                                <td><textarea class="form-control" rows="5" name="declarationform" id="declarationform">{DATA.declarationform}</textarea></td>
                            </tr>
							<tr>
                                <td style="vertical-align:top">{LANG.legalbasis}</td>
                                <td><textarea class="form-control" rows="5" name="legalbasis" id="legalbasis">{DATA.legalbasis}</textarea></td>
                            </tr>
                            <tr>
							     <td style="vertical-align:top">{LANG.bodytext}</td>
                                 <td><textarea class="form-control" rows="5" name="bodytext" id="bodytext">{DATA.bodytext}</textarea></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-sm-24 col-md-6">
                <table class="table table-striped table-bordered table-hover">
                    <tbody>
                        <tr>
                            <td>{LANG.catSel} <span class="red">*</span></td>
                        </tr>
                        <tr>
                            <td>
                            <select class="form-control select2" title="{LANG.catSel}" name="cid" id="cid">
                                <!-- BEGIN: catopt -->
                                <option value="{CATOPT.id}"{CATOPT.selected}>{CATOPT.name}</option>
                                <!-- END: catopt -->
                            </select>
                            </td>
                        </tr>
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
                            <td>{LANG.signer} <span class="red">*</span></td>
                        </tr>
                        <tr>
                            <td>
                            <select class="form-control" title="{LANG.signer}" name="sgid" id="signer">
                                <!-- BEGIN: singers -->
                                <option value="{SINGER.id}"{SINGER.selected}>{SINGER.title}</option>
                                <!-- END: singers -->
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
        $('#signer').select2({
            tags: true,
            multiple: false,
            tokenSeparators: [',']
        });

        $("#replacementSearch").click(function() {
            nv_open_browse("{NV_BASE_ADMINURL}index.php?" + nv_name_variable + "=" + nv_module_name + "&" + nv_fc_variable + "=getlid&area=replacement", "NVImg", "850", "600", "resizable=no,scrollbars=no,toolbar=no,location=no,status=no");
            return false;
        });
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

        
        if (trim($("[name=code]").val()) == "") {
            alert("{LANG.errorAreaYesCode}");
            $("[name=code]").select();
            return !1;
        }

        
        if (trim($("[name=num_decision]").val()) == "") {
            alert("{LANG.errorAreaYesNum_decision}");
            $("[name=num_decision]").select();
            return !1;
        }

        if (trim($("[name=level]").val()) == "") {
            alert("{LANG.errorAreaYesLevel}");
            $("[name=level]").select();
            return !1;
        }

        if (trim($("[name=type]").val()) == "") {
            alert("{LANG.errorAreaYesType}");
            $("[name=type]").select();
            return !1;
        }

        if( nv_is_editor == '1' )
        {
            $("textarea[name=introtext]").val(CKEDITOR.instances.{MODULE_DATA}_introtext.getData());
        }

        if( nv_is_editor == '1' )
        {
            $("textarea[name=delegate]").val(CKEDITOR.instances.{MODULE_DATA}_delegate.getData());
        }

        if( nv_is_editor == '1' )
        {
            $("textarea[name=fees]").val(CKEDITOR.instances.{MODULE_DATA}_fees.getData());
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
                    window.location = "{MODULE_URL}";
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