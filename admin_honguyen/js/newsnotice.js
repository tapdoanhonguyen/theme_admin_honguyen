/**
 * @Project NUKEVIET 4.x
 * @Author Tập Đoàn TMS Holdings (contact@thuongmaiso.vn)
 * @Copyright (C) 2021 Tập Đoàn TMS Holdings. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Wed, 19 Mar 2021 13:32:54 GMT
 */

function nv_chang_status(vid){
	var nv_timer = nv_settimeout_disable( 'change_status_' + vid, 5000 );
	var new_status = document.getElementById( 'change_status_' + vid ).options[document.getElementById( 'change_status_' + vid ).selectedIndex].value;
	$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=change_status&nocache=' + new Date().getTime(), 'id=' + vid + '&new_status=' + new_status, function(res) {
		nv_chang_weight_res(res);
	});
	return;
}

function nv_chang_weight_res(res)
{
	var r_split = res.split( "_" );
	if( r_split[0] != 'OK' ){
		alert( nv_is_change_act_confirm[2] );
		clearTimeout( nv_timer );
	}else{
		window.location.href = window.location.href;
	}
	return;
}

function nv_module_del(did){
	if (confirm(nv_is_del_confirm[0])){
		$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=delete&nocache=' + new Date().getTime(), 'id=' + did, function(res) {
			nv_module_del_result(res);
		});
	}
	return false;
}

function nv_module_del_stack(did){
	if (confirm(nv_is_del_confirm[0])){
		$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=del_stack&nocache=' + new Date().getTime(), 'id=' + did, function(res) {
			nv_module_del_result(res);
		});
	}
	return false;
}

function nv_module_del_result(res){
	var r_split = res.split( "_" );
	if(r_split[0] == 'OK'){
		window.location.href = window.location.href;
	}else{
		alert(nv_is_del_confirm[2]);
	}
	return false;
}