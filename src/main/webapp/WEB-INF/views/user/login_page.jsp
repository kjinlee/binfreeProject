<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String success = (String) request.getAttribute("success");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="keywords"
	content="Bootstrap, Landing page, Template, Registration, Landing">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="author" content="Grayrids">
<title>로그인</title>


<script>
  	/* function login() {
  		var id = $('#email').val();
  		var pw = $('#password').val();
  		$.ajax({
  			type: 'post',
  			url: '/user/login',
  			dataType: 'json',
  			data: {'email' : id, 'password' : pw},
  			success: function() {
  				alert("로그인성공");
  			},
  			error: function(e){}
  		});
  	} */
  </script>

</head>

<body>
	<!-- Header Section Start -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!-- Header Section End -->


	<!-- Subcribe Section Start -->
	<div class="section"
		style="background-color: rgb(224, 241, 231); padding: 140px 0 70px 0;">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-2"></div>
				<div class="col-lg-6 col-md-8 col-xs-12">
					<div class="subscribe-form">
						<div class="form-wrapper">
							<div class="sub-title text-center " style="font-weight: normal;">
								<h3>로그인</h3>
								<h6>
									<c:out value="${error}" />
								</h6>
								<h6>
									<c:out value="${logout}" />
								</h6>
								<h6>
									<c:out value="${msg}" />
								</h6>
							</div>
							<form method='post' action="${pageContext.request.contextPath }/login">
								<div class="row">
									<div class="col-md-12 form-line">
										<div class="form-group">
											<input type="email" class="form-control" name="email" value="" id="id"
												placeholder="아이디" style="margin-bottom: 0px;">
												<div id="error_mail" class="result-email result-check"
												style="color: red; padding-left: 20px; padding-bottom: 7px"></div>
										</div>
									</div>
									<div class="col-md-12 form-line">
										<div class="form-group">
											<input type="password" class="form-control" name="password" id="password"
												placeholder="비밀번호" value="">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-submit">
											<button type="submit"
												class="btn btn-common btn-effect btn-login"
												style="background-color: #4b8a59" id="login" >로그인</button>
											<br>
											<!-- 	<div style="text-align: center; margin-bottom: 20px;">
												<a href="/user/findpw" style="color: black;">비밀번호를
													잊어버리셨습니까?</a>
											</div> -->
											<a class="btn btn-common btn-effect btn-kakao"
												href="https://kauth.kakao.com/oauth/authorize?client_id=858c3d8b6a1fe9814e96f3b2dbb03e09&redirect_uri=http://52.14.170.10:8080/${pageContext.request.contextPath }/user/kakao/callback&response_type=code">
												<img src="${pageContext.request.contextPath }/resources/img/kakao.png" height="21px"
												width="21px">&nbsp;카카오 로그인
											</a>
											<div style="text-align: center;">
												<a href="${pageContext.request.contextPath }/user/findpw" style="color: black;">비밀번호 찾기</a> | <a
													href="${pageContext.request.contextPath }/user/signup" style="color: black;">회원가입</a>
											</div>
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-2"></div>
			</div>
		</div>
	</div>
	<!-- Subcribe Section End -->



	<!-- Footer Section Start -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>


	<script type="text/javascript">
    $(document).ready(function(){
    	var success = '<%=success%>';
			if (success != null && success != 'null') {
				alert(success);
			}
			
			$("#login").click(function() {
				 if ($('#id').val() == '') {
			            alert("아이디를 입력해주십시오");
			            $('#id').focus();
			            return false;
			     } else if($('#password').val() == ''){
			            alert("비밀번호를 입력해주십시오");
			            $('#password').focus();
			            return false;
			     }
			
		});
    });
	</script>
	
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