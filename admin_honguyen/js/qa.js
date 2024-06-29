/**
 * @Project NUKEVIET 4.x
 * @Author VINADES., JSC (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES ., JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Dec 3, 2010 12:48:35 PM
 */

function nv_chang_cat_weight(catid) {
	var nv_timer = nv_settimeout_disable('weight' + catid, 2000);
	var newpos = document.getElementById('weight' + catid).options[document.getElementById('weight' + catid).selectedIndex].value;
	$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=cat&nocache=' + new Date().getTime(), 'changeweight=1&catid=' + catid + '&new=' + newpos + '&num=' + nv_randomPassword(8), function(res) {
		if (res != 'OK') {
			alert(nv_is_change_act_confirm[2]);
		}
		clearTimeout(nv_timer);
		location.reload();
		return;
	});
}

function nv_chang_cat_status(catid) {
	var nv_timer = nv_settimeout_disable('change_status' + catid, 2000);
	$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=cat&nocache=' + new Date().getTime(), 'changestatus=1&catid=' + catid + '&num=' + nv_randomPassword(8), function(res) {
		if (res != 'OK') {
			alert(nv_is_change_act_confirm[2]);
			location.reload();
		}
		return;
	});
	return;
}

function nv_category_del(id) {
	if (confirm(de_del_cofirm)) {
		window.location.href = script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=cat&del=1&id=' + id;
	}
	return false;
}

function nv_category_del_result(res) {
	if (res == 'OK') {
		location.reload();
	} else {
		alert(nv_is_del_confirm[2]);
	}
	return false;
}

function nv_status(sid) {
	var nv_timer = nv_settimeout_disable('sta_' + sid, 2000);
	var new_status = document.getElementById('sta_' + sid).options[document.getElementById('sta_' + sid).selectedIndex].value;

	$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=main&nocache=' + new Date().getTime(), 'id=' + sid + '&new=' + new_status + '&changesta=1&num=' + nv_randomPassword(8), function(res) {
		if (res != 'OK') {
			alert("error!");
		}
		clearTimeout(nv_timer);
		location.reload();
		return;
	});
}

function nv_de_del(id) {
	if (confirm(de_del_cofirm)) {
    	$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=main&nocache=' + new Date().getTime(), 'id=' + id  + '&del=1&num=' + nv_randomPassword(8), function(res) {
    		if (res != 'OK') {
    			alert("error!");
    		}
    		location.reload();
    	});
	}
}

function nv_de_del_result(res) {
	if (res == 'OK') {
		location.reload();
	} else {
		alert(nv_is_del_confirm[2]);
	}
	return false;
}

function nv_main_action(oForm, msgnocheck) {
	var fa = oForm['idcheck[]'];
	var listid = '';
	if (fa.length) {
		for (var i = 0; i < fa.length; i++) {
			if (fa[i].checked) {
				listid = listid + fa[i].value + ',';
			}
		}
	} else {
		if (fa.checked) {
			listid = listid + fa.value + ',';
		}
	}

	if (listid != '') {
		var action = document.getElementById('action').value;
		if (action == 'delete') {
			if (!confirm(nv_is_del_confirm[0])) {
				return true;
			}
		}
        var actionAj = (action == 'delete') ? 'del' : 'queueaccept';
    	var nv_timer = nv_settimeout_disable('mainactionbtn', 10000);
        $.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=main&nocache=' + new Date().getTime(), 'id=' + listid + '&' + actionAj + '=1&num=' + nv_randomPassword(8), function(res) {
    		if (res != 'OK') {
    			alert("error!");
    		}
    		location.reload();
    		return;
    	});
	} else {
		alert(msgnocheck);
	}
	return false;
}

function nv_detail_action(oForm, qid, msgnocheck) {
	var fa = oForm['idcheck[]'];
	var listid = '';
	if (fa.length) {
		for (var i = 0; i < fa.length; i++) {
			if (fa[i].checked) {
				listid = listid + fa[i].value + ',';
			}
		}
	} else {
		if (fa.checked) {
			listid = listid + fa.value + ',';
		}
	}

	if (listid != '') {
		var action = document.getElementById('action').value;
		if (action == 'delete') {
			if (!confirm(nv_is_del_confirm[0])) {
				return true;
			}
		}
        var actionAj = (action == 'delete') ? 'del' : 'duyet';
    	var nv_timer = nv_settimeout_disable('detailActionBtn', 10000);
        $.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=detail&nocache=' + new Date().getTime(), 'qid=' + qid + '&id=' + listid + '&' + actionAj + '=1&num=' + nv_randomPassword(8), function(res) {
    		if (res != 'OK') {
    			alert("error!");
    		}
    		location.reload();
    		return;
    	});
	} else {
		alert(msgnocheck);
	}
	return false;
}

function nv_level_ress(res) {
	if (res == 'OK') {
		alert(nv_is_change_act_confirm[2]);
	}

	location.reload();
	return;
}

function nv_download_files(file) {
	$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=down&nocache=' + new Date().getTime(), 'check=1&file=' + file + '&num=' + nv_randomPassword(8), function(res) {
		if (res != "") {
			window.location.href = nv_base_siteurl + "index.php?" + nv_lang_variable + "=" + nv_lang_data + "&" + nv_name_variable + "=" + nv_module_name + "&" + nv_fc_variable + "=down&file=" + res;
		} else {
			alert('File does not exist in the system. Maybe BQT previously deleted files.');
		}
	});
}

function nv_de_dels(id, qid) {
	if (confirm(de_del_cofirm)) {
		$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=detail&nocache=' + new Date().getTime(), 'del=1&qid=' + qid + '&id=' + id + '&num=' + nv_randomPassword(8), function(res) {
			if (res == 'OK') {
				location.reload();
			} else {
				alert(res);
			}
		});
	}
	return false;
}

function nv_de_duyet(id, qid) {
	if (confirm(de_duyet_cofirm)) {
		$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=detail&nocache=' + new Date().getTime(), 'duyet=1&qid=' + qid + '&id=' + id + '&num=' + nv_randomPassword(8), function(res) {
			if (res == 'OK') {
				location.reload();
			} else {
				alert(res);
			}
		});
	}
	return false;
}

function nv_ques_duyet(qid) {
	if (confirm(ques_duyet_cofirm)) {
        var timer = nv_settimeout_disable('detailQuestActQueue', 10000);
		$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=main&nocache=' + new Date().getTime(), 'queueaccept=1&id=' + qid + '&num=' + nv_randomPassword(8), function(res) {
			if (res == 'OK') {
				location.reload();
			} else {
				alert(res);
			}
		});
	}
	return false;
}

function nv_level_resss(res) {

	if (res == 'OK') {
		alert(nv_is_change_act_confirm[2]);
	}

	location.reload();
	return;
}

function nv_chang_department(vid) {
	var nv_timer = nv_settimeout_disable('chang_department_' + vid, 5000);
	var new_department = $('#chang_department_' + vid).val();
	$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=main&nocache=' + new Date().getTime(), 'chang_department=1&qid=' + vid + '&new_department=' + new_department, function(res) {
		nv_chang_weight_res(res);
	});
	return;
}

function nv_chang_weight(vid) {
	var nv_timer = nv_settimeout_disable('change_weight_' + vid, 5000);
	var new_weight = $('#change_weight_' + vid).val();
	$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=change_weight&nocache=' + new Date().getTime(), 'qid=' + vid + '&new_weight=' + new_weight, function(res) {
		nv_chang_weight_res(res);
	});
	return;
}

function nv_chang_weight_res(res) {
	var r_split = res.split("_");
	if (r_split[0] != 'OK') {
		alert(nv_is_change_act_confirm[2]);
		clearTimeout(nv_timer);
	} else {
		location.reload();
	}
	return;
}

function nv_search_tag(tid) {
	$("#module_show_list").html('<p class="text-center"><img src="' + nv_base_siteurl + 'assets/images/load_bar.gif" alt="Waiting..."/></p>').load(script_name + "?" + nv_lang_variable + "=" + nv_lang_data + "&" + nv_name_variable + "=" + nv_module_name + "&" + nv_fc_variable + "=tags&q=" + rawurlencode($("#q").val()) + "&num=" + nv_randomPassword(10));
	return false;
}

function nv_del_tags(tid) {
	if (confirm(nv_is_del_confirm[0])) {
		$("#module_show_list").html('<p class="text-center"><img src="' + nv_base_siteurl + 'assets/images/load_bar.gif" alt="Waiting..."/></p>').load(script_name + "?" + nv_lang_variable + "=" + nv_lang_data + "&" + nv_name_variable + "=" + nv_module_name + "&" + nv_fc_variable + "=tags&del_tid=" + tid + "&num=" + nv_randomPassword(10));
	}
	return false;
}

function nv_del_check_tags(oForm, checkss, msgnocheck) {
	var fa = oForm['idcheck[]'];
	var listid = '';
	if (fa.length) {
		for (var i = 0; i < fa.length; i++) {
			if (fa[i].checked) {
				listid = listid + fa[i].value + ',';
			}
		}
	} else {
		if (fa.checked) {
			listid = listid + fa.value + ',';
		}
	}

	if (listid != '') {
		if (confirm(nv_is_del_confirm[0])) {
			$("#module_show_list").html('<p class="text-center"><img src="' + nv_base_siteurl + 'assets/images/load_bar.gif" alt="Waiting..."/></p>').load(script_name + "?" + nv_lang_variable + "=" + nv_lang_data + "&" + nv_name_variable + "=" + nv_module_name + "&" + nv_fc_variable + "=tags&q=" + rawurlencode($("#q").val()) + "&del_listid=" + listid + "&checkss=" + checkss+"&num=" + nv_randomPassword(10));
		}
	} else {
		alert(msgnocheck);
	}
	return false;
}

function split(val) {
	return val.split(/,\s*/);
}

function extractLast(term) {
	return split(term).pop();
}

function nv_add_element( idElment, key, value ){
   var html = "<span title=\"" + value + "\" class=\"uiToken removable\" ondblclick=\"$(this).remove();\">" + value + "<input type=\"hidden\" value=\"" + key + "\" name=\"" + idElment + "[]\" autocomplete=\"off\"><a onclick=\"$(this).parent().remove();\" href=\"javascript:void(0);\" class=\"remove uiCloseButton uiCloseButtonSmall\"></a></span>";
    $("#" + idElment).append( html );
	return false;
}

$(document).ready(function() {
	// Tags
	$("#select-img-tag").click(function() {
		var area = "image";
		var path = CFG.upload_path;
		var currentpath = CFG.upload_current;
		var type = "image";
		nv_open_browse(script_name + "?" + nv_name_variable + "=upload&popup=1&area=" + area + "&path=" + path + "&type=" + type + "&currentpath=" + currentpath, "NVImg", 850, 420, "resizable=no,scrollbars=no,toolbar=no,location=no,status=no");
		return false;
	});
    if ($("#keywords-search").length) {
    	$("#keywords-search").bind("keydown", function(event) {
    		if (event.keyCode === $.ui.keyCode.TAB && $(this).data("ui-autocomplete").menu.active) {
    			event.preventDefault();
    		}

            if(event.keyCode==13){
                var keywords_add= $("#keywords-search").val();
                keywords_add = trim( keywords_add );
                if( keywords_add != '' ){
                    nv_add_element( 'keywords', keywords_add, keywords_add );
                    $(this).val('');
                }
                return false;
        	}

    	}).autocomplete({
    		source : function(request, response) {
    			$.getJSON(script_name + "?" + nv_name_variable + "=" + nv_module_name + "&" + nv_fc_variable + "=tagsajax", {
    				term : extractLast(request.term)
    			}, response);
    		},
    		search : function() {
    			// custom minLength
    			var term = extractLast(this.value);
    			if (term.length < 2) {
    				return false;
    			}
    		},
    		focus : function() {
    		  //no action
    		},
    		select : function(event, ui) {
    			// add placeholder to get the comma-and-space at the end
    			if(event.keyCode!=13){
    	            nv_add_element( 'keywords', ui.item.value, ui.item.value );
    	            $(this).val('');
    	           }
                return false;
    		}
    	});

        $("#keywords-search").blur(function() {
    		// add placeholder to get the comma-and-space at the end
            var keywords_add= $("#keywords-search").val();
            keywords_add = trim( keywords_add );
            if( keywords_add != '' ){
                nv_add_element( 'keywords', keywords_add, keywords_add );
                $(this).val('');
            }
            return false;
    	});
        $("#keywords-search").bind("keyup", function(event) {
    		var keywords_add= $("#keywords-search").val();
            if(keywords_add.search(',') > 0 )
            {
                keywords_add = keywords_add.split(",");
                for (i = 0; i < keywords_add.length; i++) {
                    var str_keyword = trim( keywords_add[i] );
                    if( str_keyword != '' ){
                        nv_add_element( 'keywords', str_keyword, str_keyword );
                    }
                }
                $(this).val('');
            }
            return false;
    	});
    }
});
