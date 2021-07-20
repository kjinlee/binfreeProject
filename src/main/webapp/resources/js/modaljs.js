var action = '';
var url = '';
var type = '';
var bno = 0;

$(document).ready(function(){

	// 수정하기 버튼 클릭
	$("button[name='modify']").click(function(){
		action='modify';
		type = 'PUT';
		bno = this.value;

		// content 담기
		var row = $(this).parent().parent().parent();
		var tr = row.children();
		
		var userName = tr.eq(2).text();
		var contents = tr.eq(1).text();

		$("#modal-title").text("수정하기");

		$("#userName").val(userName);
		$("#contents").val(contents);
		
		$("#myModal").modal();
	});
	

	// Modal의 Submit 버튼 클릭
	$("#modalSubmit").click(function(){
		
		if(action == 'create'){
			bno = 0;
			url = '/board';
		}else if(action == 'modify'){
			url = '/board';
		}

		var data = {
			"bno" : bno,
			"userName" : $("#userName").val(),
			"contents" : $("#contents").val()
		};
		
		$.ajax({
			url : url,
			type : type,
			data : data
		})
		
		location.reload();
	});
	

});