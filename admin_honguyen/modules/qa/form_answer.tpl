<colgroup>
    <col class="w200" />
</colgroup>
<tbody>
	<tr>
		<td><strong>{LANG.an_username}</strong></td>
		<td class="form-inline"><input type="text" value="{DATA.an_cus_name}" name="an_cus_name" class="form-control w300"/> {LANG.auto_get_fadmin}</td>
	</tr>
	<tr>
		<td><strong>{LANG.an_email}</strong></td>
		<td class="form-inline"><input type="text" value="{DATA.an_cus_email}" name="an_cus_email" class="form-control w300"/> {LANG.auto_get_fadmin}</td>
	</tr>
    <!-- BEGIN: show_info -->
    <tr>
        <td><strong>{LANG.show_answer_info}</strong></td>
        <td>
            <select name="show_info" class="form-control w200">
                <!-- BEGIN: loop -->
                <option value="{SHOW_INFO.key}"{SHOW_INFO.selected}>{SHOW_INFO.title}</option>
                <!-- END: loop -->
            </select>
        </td>
    </tr>
    <!-- END: show_info -->
    <tr>
        <td><strong>{LANG.ndanswer}</strong></td>
        <td>
            {HTMLAS}
        </td>
    </tr>
    <tr>
        <td><strong>{LANG.file}</strong></td>
        <td>
            <input class="w300 form-control pull-left" type="text" name="file" id="file" value="{DATA.file}" style="margin-right: 5px"/>
            <input type="button" value="Browse server" name="selectfile" class="btn btn-info"/>
        </td>
    </tr>
</tbody>
