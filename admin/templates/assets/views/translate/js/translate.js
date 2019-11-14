$(document).ready(function() {

	//filter pages
	$('.search').keyup(function() {
		if ($(this).val().length > 2) {
			listLangs($(this).val());
		} else {
			listLangs();
		}
	});
	//save lang
	$(document).on('keyup', '.lang-textarea', function(event) {
		var e = event.currentTarget;
		if(e.delayTimer)
			clearTimeout(e.delayTimer);
		e.delayTimer = setTimeout(function() {
			updateLangs($(e));
		}, 2000);
	});
});
function listLangs(word) {
	$.ajax({
		url: ADMIN_URL + LANG + '/translate/getlangs/',
		type: 'POST',
		dataType: 'json',
		data: {
			ajax : true,
			word : word
		},
		success: function(data) {
			if (data.Status) {
				$('#langs-tbody').html(data.Data);
			}
		}
	});
}
function updateLangs(e) {
	$.ajax({
		url: ADMIN_URL + LANG + '/translate/update/',
		type: 'POST',
		dataType: 'json',
		data: {
			id : e.data('id'),
			lang : e.data('lang'),
			text : e.val(),
		},
		success: function(data) {
            $.notify("Saved!", {type: 'success'});
		}
	});
}

