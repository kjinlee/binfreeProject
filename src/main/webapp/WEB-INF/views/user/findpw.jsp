<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String msg = (String) request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$("#findBtn").click(function() {
			var name = $("#name").val();
			var email = $("#email").val();
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");

			$.ajax({
				url : "${pageContext.request.contextPath }/user/findpw",
				type : "POST",
				beforeSend : function(xhr) {
					/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					xhr.setRequestHeader(header, token);
				},
				data : {
					"name" : name,
					"email" : email
				},
				success : function(data) {
					console.log(data);
					if (data == 'emailNull') {
						alert("등록되지 않은 이메일입니다.");
					} else if (data == 'nameNull') {
						alert("등록되지 않은 이름입니다.");
					} else {
						alert("이메일로 임시 비밀번호를 발송하였습니다.");
					}
				},
			})
		});
	})
</script>
<style type="text/css">
.mybtn {
	width: 150px;
	height: 40px;
	padding: 0;
	display: inline;
	border-radius: 4px;
	background: #212529;
	color: #fff;
	margin-top: 20px;
	border: solid 2px #212529;
	transition: all 0.5s ease-in-out 0s;
}

.mybtn:hover .mybtn:focus {
	background: white;
	color: #212529;
	text-decoration: none;
}

.form-group label{
	margin-left: 20px;
}

.col-md-12.f{
	text-align: center;
}
</style>
<title>비밀번호 찾기</title>
</head>
<body>
	<!-- Header Section Start -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<div class="section"
		style="background-color: rgb(224, 241, 231); padding: 140px 0 70px 0;">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-2"></div>
				<div class="col-lg-6 col-md-8 col-xs-12">
					<div class="subscribe-form">
						<div class="form-wrapper">
							<div class="sub-title text-center">
								<h3>비밀번호 찾기</h3>
								<p>이름과 이메일이 일치하는 정보가 있을 시 <br/>기재한 이메일로 임시 비밀번호를 전송해드립니다.</p>
							</div>
							<div class="row">
								<div class="col-md-12 form-line">
									<div class="form-group">
										<label>이름</label> 
										<input class="form-control" type="text" id="name" name="name" placeholder="회원가입 시 기재한 이름을 입력하세요 (예:홍길동)" required>
									</div>
								</div>
								<div class="col-md-12 form-line">
									<div class="form-group">
										<label>이메일</label> 
										<input class="form-control" type="email" id="email" name="email" placeholder="회원가입 시 기재한 이메일주소를 입력하세요 (예:a@a.com)"
											required>
									</div>
								</div>
								<div class="col-md-12 f">
									<button type="button" id="findBtn"
										class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">찾기</button>
									<button type="button" onclick="history.go(-1);"
										class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">로그인으로</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-2"></div>
			</div>
		</div>
	</div>
	<!-- Footer Section Start -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
	
	<script>
			function email_check( email ) {    
			    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			    return (email != '' && email != 'undefined' && regex.test(email)); 
			}

			$("input[type=email]").blur(function(){
			  var email = $(this).val();
			  if( email == '' || email == 'undefined') return;
			  if(! email_check(email) ) {
			  	$(".result-email").text('이메일 형식으로 적어주세요');
			    $(this).focus();
			    return false;
			  }else {
				$(".result-email").text('');
			  }
			});
			
		</script>
</body>
</html>