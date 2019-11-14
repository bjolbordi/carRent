
//jquery sortable
$('.sortable').sortable({
	connectWith: '.sortable',
	helper: fixWidthHelper,
	placeholder: 'ui-state-highlight',
	//axis: 'y',
	cursor: 'move',
	update: function (event, ui) {
		if (this === ui.item.parent()[0]) {
			saveOrder();
		}
	}
}).disableSelection();

$(document).ready(function () {
	var view = $('#views').val();
	getContent(view);
});

$(document).on('change', '#views', function () {
	var view = $(this).val();
	getContent(view);
});

function getContent(view){
	var id = $('#content').data('id');
	$.ajax({
		type: 'POST',
		data: {ajax:'ajax', view:view, id:id},
		url: ADMIN_URL + LANG + '/menu/getcontent/',
		success: function(data){
			var data = $.parseJSON(data);
			if(data.Status && data.Data != ''){
				$('#content').html(data.Data);
			}

		}
	});
}
function fixWidthHelper(e, ui) {
	ui.children().each(function() {
		$(this).width($(this).width());
	});
	return ui;
}
function saveOrder() {
	var data = [];
	//
	if($("ul.level-1 > li").length)
		data[0] = [];
	$("ul.level-1 > li").each(function (i) {
		var id = $(this).attr('data-id');
		data[0].push(id);
		//
		if($(this).find('ul.level-2 > li').length)
			data[id]= [];
		$(this).find('ul.level-2 > li').each(function (i) {
			var id2 = $(this).attr('data-id');
			data[id].push(id2);
			//
			if($(this).find('ul.level-3 > li').length)
				data[id2]= [];

			$(this).find('ul.level-3 > li').each(function (i) {
				var id3 = $(this).attr('data-id');
				data[id2].push(id3);
			});
		});
	});
	$.ajax({
		type: 'POST',
		data: {ajax: true, data: data},
		url: ADMIN_URL + LANG + '/menu/savesort/',
		success: function(data){
            $.notify("Saved!", {type: 'success'});
		}
	});

}