<!-- BEGIN: main -->
<!-- BEGIN: error -->
<div class="alert alert-warning">
	{ERROR}
</div>
<!-- END: error -->
<div class="panel panel-default">
	<div class="panel-body">
		<form class="form-horizontal" action="{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
			<div class="form-group">
				<label class="col-sm-5 col-md-4 control-label"><strong>{LANG.maillist}</strong> <span class="red">(*)</span></label>
				<div class="col-sm-19 col-md-20">
					<textarea class="form-control" style="height:100px;" cols="75" rows="5" name="maillist">{ROW.maillist}</textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 col-md-4 control-label"><strong>{LANG.title}</strong> <span class="red">(*)</span></label>
				<div class="col-sm-19 col-md-20">
					<input class="form-control" type="text" name="title" value="{ROW.title}" required="required" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 col-md-4 control-label"><strong>{LANG.content}</strong> <span class="red">(*)</span></label>
				<div class="col-sm-19 col-md-20">
					{ROW.content}
				</div>
			</div>
			<div class="form-group" style="text-align: center"><input class="btn btn-primary" name="submit" type="submit" value="{LANG.send}" />
			</div>
		</form>
	</div>
</div>
<!-- END: main -->