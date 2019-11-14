function saveOrder(obj) {
	var order = "ajax=true&data=";
	var i = 0;
	$(".sortable tbody tr").each(function (i) {
		if (i == 0)
			order += $(this).attr('data-id');
		else
			order += "," + $(this).attr('data-id');
		i++;
	});
	$.ajax({
		type: 'POST',
		data: order,
		url: ADMIN_URL + LANG + '/' + $(obj).data('url') + '/savesort/',
		success: function(data){
            $.notify("Saved!", {type: 'success'});
		}
	});
}