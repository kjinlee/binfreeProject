<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script>
	var bno = '${goods.id}'; //게시글 번호
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var startNum = 5;

	$('[name=commentInsertBtn]').click(function() { //댓글 등록 버튼 클릭시 
		var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
		commentInsert(insertData); //Insert 함수호출(아래)
	});
	

	//댓글 목록 
	function commentList() {
		$.ajax({
			url : '${pageContext.request.contextPath }/comment/list',
			type : 'get',
			beforeSend : function(xhr) {
				/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader(header, token);
			},
			data : {
				'bno' : bno,
				'startNum' : startNum
			},
			success : function(data) {
				if(data.length < 5){
					document.getElementById("addBtn").style.display = "none";

				}
				console.log("${email}")
				  var a =''; 
				  $.each(data, function(key, value){ 
					  a += '<tr>';
					  a += '<td class="comment">';
				  	  a += '<div class="row">';
				  	  a += '	<div class="col-md-8 col-8 writer">';
				      a += '		<div class="commentContent'+value.cno+'">'+value.content +'</div>';
					  a += '	</div>';

				      if('${email}' == value.email){
					  a += '	<div class=" col-md-4 col-4 buttonArea">';
					  a += '		<a data-target="#myModal" data-toggle="modal" onclick="commentUpdate('+value.cno+',\''+value.content+'\');" type="button" class="btn btn-default cmt"> 수정 </a>';
				      a += '		<a onclick="commentDelete('+value.cno+');" type="button" class="btn btn-default cmt"> 삭제 </a>';
				      a += '	</div>'; 
				      }
				      
				      if('${auth}' == "ROLE_ADMIN"){
					  a += '	<div class=" col-md-6 col-6">';
				      a += '		<a data-target="#myModal" data-toggle="modal" onclick="commentUpdate('+value.cno+',\''+value.content+'\');" type="button" class="btn btn-default cmt"> 수정 </a>';
				      a += '		<a onclick="commentDelete('+value.cno+');" type="button" class="btn btn-default cmt"> 삭제 </a>';
				      a += '	</div>'; 
				      }
				      a += '</div>';
				      
				      a += '<div class="row">'
				      a += '	<div class="col-md-6 col-6 commentContent">';
				      a += '		<div class="commentInfo '+value.cno+'">'+value.writer+'</div>';
				      a += '	</div>';
				      a += '	<div class="col-md-6 col-6 date">';
				      a += '		<div class="commentInfo '+value.cno+'">'+value.reg_date+'</div>';
				      a += '	</div>';
				      a += '</div>';
				      a += '</td>';
				      a += '</tr>';
				  });
				  
				  $(".commentList").html(a); 
			}
		});
	}
	
	//댓글 더보기
	function moreList(){
		console.log(111);
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var bno = $('#bno').val();
		
		startNum += 5;
		var a = '';
		console.log("startNum========"+ startNum);
		
		$.ajax({
			url:"${pageContext.request.contextPath }/comment/list",
			type:"get",
			dataType:"json",
			data:{
					"startNum" : startNum,
				 	"bno"	   : bno,
				 	
				 },
			success : function(data){
					/* $("#commentList").html(""); */
					var a = '';
					
					if(data.length > 0){
						console.log("${email}")
						
						for(var i=0; i< data.length; i++){
							  a += '<tr>';
							  a += '<td class="comment">';
						  	  a += '<div class="row">';
						  	  a += '	<div class="col-md-8 col-8 writer">';
						      a += '		<div class="commentContent'+data[i].cno+'">'+data[i].content +'</div>';
							  a += '	</div>'  

						      if('${email}' == data[i].email){
							  a += '	<div class=" col-md-4 col-4 buttonArea">';
						      a += '		<a data-target="#myModal" data-toggle="modal" onclick="commentUpdate('+data[i].cno+',\''+data[i].content+'\');" type="button" class="btn btn-default cmt"> 수정 </a>';
						      a += '		<a onclick="commentDelete('+data[i].cno+');" type="button" class="btn btn-default cmt"> 삭제 </a>';
						      a += '	</div>'; 
						      }
						      
						      if('${auth}' == "ROLE_ADMIN"){
							  a += '	<div class=" col-md-6 col-6">';
						      a += '		<a data-target="#myModal" data-toggle="modal" onclick="commentUpdate('+data[i].cno+',\''+data[i].content+'\');" type="button" class="btn btn-default cmt"> 수정 </a>';
						      a += '		<a onclick="commentDelete('+data[i].cno+');" type="button" class="btn btn-default cmt"> 삭제 </a>';
						      a += '	</div>'; 
						      }
						      a += '</div>';
						      
						      a += '<div class="row">'
						      a += '	<div class="col-md-6 col-6 commentContent">';
						      a += '		<div class="commentInfo '+data[i].cno+'">'+data[i].writer+'</div>';
						      a += '	</div>';
						      a += '	<div class="col-md-6 col-6 date">';
						      a += '		<div class="commentInfo '+data[i].cno+'">'+data[i].reg_date+'</div>';
						      a += '	</div>';
						      a += '</div>';
						      a += '</td>';
						      a += '</tr>';
						}
						$("#commentList").append(a);
					}
					if(data.length < startNum){
						document.getElementById("addBtn").style.display = "none";
						
					}
				
			},
			error: function(e) {
				console.log(e);
			}
			
		});
		
	}



	//댓글 등록
	function commentInsert(insertData) {
		console.log(insertData);
		$.ajax({
			url : '${pageContext.request.contextPath }/comment/insert',
			type : 'post',
			beforeSend : function(xhr) {
				/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader(header, token);
			},
			data : insertData,
			success : function(data) {
				if (data == 1) {
					commentList(); //댓글 작성 후 댓글 목록 reload
					$('[name=content]').val('');
				}
			}
		});
	}

	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
 	function commentUpdate(cno, content) {
		$("#myModal").on('show.bs.modal', function(event){
			$(".modal-body #contents").val(content);
			$(".modal-body #cno").val(cno);
		})
	} 

	//댓글 수정
	function commentUpdateProc(cno) {
		var updateContent = $("#contents").val();
		
		if (confirm("정말 수정하시겠습니까?") == true) { //확인
		$.ajax({
			url : '${pageContext.request.contextPath }/comment/update',
			type : 'post',
			beforeSend : function(xhr) {
				/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader(header, token);
			},
			data : {
				'content' : updateContent,
				'cno' : cno
			},
			success : function(data) {
				
				$("#myModal").modal('hide');
				if (data == 1)
					commentList(bno); //댓글 수정후 목록 출력 
			}
		});
		}else {
			return;
		}
	}

	//댓글 삭제 
	function commentDelete(cno) {
		if (confirm("정말 삭제하시겠습니까?") == true) { //확인
			$.ajax({
				url : '${pageContext.request.contextPath }/comment/delete/' + cno,
				type : 'post',
				beforeSend : function(xhr) {
					/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					xhr.setRequestHeader(header, token);
				},
				success : function(data) {
					if (data == 1)
						commentList(bno); //댓글 삭제후 목록 출력 
				}
			});
		} else {
			return;
		}

		
		
	}

	$(document).ready(function() {
		commentList(); //페이지 로딩시 댓글 목록 출력 
	});
</script>


