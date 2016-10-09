$(document).ready(function(){
	$('task_completed').on('click', function(event){
	var form = $(this).parent('form');

	event.preventDefault();

	$.ajax({
	type: "PUT",
	url: form.attr('action'),
	data: form.serialize(),
	success: function(data){
		if(data.completed == true) {
		$('#'+ data.id).html("true");
		}
		else{
		$('#'+ data.id).html("false");
		}
	},
	error: function(data){
		console.log('There seems to be some error.');
	},
	dataType: 'JSON'
	});
	});
});