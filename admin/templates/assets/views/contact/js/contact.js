$(document).ready(function(){
	$(".gllpLatlonPicker").each(function() {
		$(document).gMapsLatLonPicker().init($(this));
	});
});


