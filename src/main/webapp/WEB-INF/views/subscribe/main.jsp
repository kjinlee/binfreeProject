<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE web-app PUBLIC
 "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
 "http://java.sun.com/dtd/web-app_2_3.dtd" >
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
<title>구독 페이지</title>

</head>

<body>
<!-- Header Section Start -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!-- Start Pricing Table Section -->
	<div id="pricing" class="section pricing-section">
		<div class="container" style="margin-top: 40px;">
			<div class="section-header">
				<h2 class="section-title">구독 상품을 확인해보세요</h2>
				<span></span>
				<p class="section-subtitle">합리적인 가격으로 만나는 구독 서비스</p>
			</div>

			<div class="row pricing-tables">

				<!-- 스타터 구독 -->
				<div class="col-lg-4 col-md-4 col-xs-12">
					<div class="pricing-table">
						<form id="sub1" method="get">
							<div class="pricing-details">
								<h2>${starter.subItem}구독</h2>
								<div class="price">
									${starter.subPrice}원 <br> <span>${starter.subDuration}</span>
								</div>
								<ul>
									<li>서비스 이용이 처음이신분들을 위해</li>
									<li>서비스를 가볍게 이용해보고 싶은 분들에게</li>
									<li>장기구독하기에는 부담스러운 분들에게</li>
									<li>월 이용료 3,900원에</li>
									<li>새로운 라이프스타일을 경험하세요.</li>
								</ul>
							</div>
							<input type="hidden" value="${starter.subItem }" name="subItem"  id="subItem"/>
							<input type="hidden" value="${starter.subPrice }" name="subPrice" id="subPrice"  />
							<input type="hidden" value="${starter.subDuration }"
								name="subDuration"  id="subDuration"/>
							<sec:authorize access="isAuthenticated()">
								<div class="plan-button">
									<input type="button" class="btn btn-common btn-effect sub"
										value="구독하기" onclick="subCheck1();" id="sub">
								</div>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<div class="plan-button">
									<a href="#myModalL" data-toggle="modal" data-target="#myModalL"
										class="btn btn-common btn-effect sub">구독하기</a>
								</div>
							</sec:authorize>
						</form>
					</div>
				</div>
				<!-- 스타터 구독 end -->

				<!-- 베스트 구독 -->
				<div class="col-lg-4 col-md-4 col-xs-12">
					<div class="pricing-table pricing-big">
						<form id="sub2" method="get">
							<div class="pricing-details">
								<h2>${best.subItem}구독</h2>
								<div class="price">
									${best.subPrice}원 <br> <span>${best.subDuration}</span>
								</div>
								<ul>
									<li>BFree 최고의 상품</li>
									<li>편리함을 넘어 사회적 기여까지</li>
									<li>최고의 소비를</li>
									<li>6개월 이용료 19,900원에</li>
									<li>최고의 가격으로 만나보세요.</li>
								</ul>
							</div>
							<input type="hidden" value="${best.subItem }" name="subItem" id="subItem"/>
							<input type="hidden" value="${best.subPrice }" name="subPrice" id="subPrice" />
							<input type="hidden" value="${best.subDuration }"
								name="subDuration"  id="subDuration"/>
							<sec:authorize access="isAuthenticated()">
								<div class="plan-button">
									<input type="button" class="btn btn-common btn-effect sub"
										value="구독하기" onclick="subCheck2();" id="sub">
								</div>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<div class="plan-button">
									<a href="#myModalL" data-toggle="modal" data-target="#myModalL"
										class="btn btn-common btn-effect sub">구독하기</a>
								</div>
							</sec:authorize>
						</form>
					</div>
				</div>
				<!-- 베스트 구독 end -->


				<!-- 프리미엄 구독 -->
				<div class="col-lg-4 col-md-4 col-xs-12">
					<div class="pricing-table">
						<form id="sub3" method="get">
							<div class="pricing-details">
								<h2>${primium.subItem}구독</h2>
								<div class="price">
									${primium.subPrice}원 <br> <span>${primium.subDuration}</span>
								</div>
								<ul>
									<li>가장 길고, 가장 저렴하게</li>
									<li>1년간의 최고의 경험</li>
									<li>그 동안의 구독으로는 부족했던 분들에게</li>
									<li>1년 이용료 34,900월에</li>
									<li>가장 합리적인 가격으로 만나보세요.</li>
								</ul>
							</div>
							<input type="hidden" value="${primium.subItem }" name="subItem" id="subItem"/>
							<input type="hidden" value="${primium.subPrice }" name="subPrice" id="subPrice" />
							<input type="hidden" value="${primium.subDuration }"
								name="subDuration"  id="subDuration"/>
							<sec:authorize access="isAuthenticated()">
								<div class="plan-button">
									<input type="button" class="btn btn-common btn-effect sub"
										value="구독하기" onclick="subCheck3();" >
								</div>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<div class="plan-button">
									<a href="#myModalL" data-toggle="modal" data-target="#myModalL"
										class="btn btn-common btn-effect sub">구독하기</a>
								</div>
							</sec:authorize>
						</form>
					</div>
				</div>
				<!-- 프리미엄 구독 end -->
			<input type="hidden" value="${email}" id="email"/>
			</div>
		</div>
	</div>
	<!-- End Pricing Table Section -->


	<div class="container">
		<div class="row subimg">
			<div class="col-sm-12">
				<img src="${pageContext.request.contextPath }/resources/img/friend/circle.png"
					style="max-width: 100%; height: auto; padding: 40px;">
			</div>
		</div>
	</div>



	<%@ include file="/WEB-INF/views/review/list.jsp"%>



	<!-- 로그인을 안했으면 로그인 후 접속 가능하게 팝업 띄우기 -->
	<div class="modal" id="myModalL" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<p class="modal-title" style="font-size: 20px;">구독 안내</p>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					<br />
					<p style="font-size: 18px;">
						구독서비스는 <strong>로그인</strong> 후 이용이 가능합니다. <br /> 비회원인 경우 <strong>회원가입</strong>
						후 이용바랍니다.
					</p>
					<br />
				</div>
				<div class="modal-footer justify-content-center">
					<div class="plan-button">
						<input type="button" class="btn btn-common btn-effect"
							onclick="goLogin();" value="로그인"> 
						<input type="button" class="btn btn-common btn-effect" data-dismiss="modal" value="취소">
					</div>

				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 구독 정보가 있을 시 알림 -->
	<div class="modal" id="myModalS" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<p class="modal-title" style="font-size: 20px;">구독 안내</p>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					<br />
					<p style="font-size: 18px;">
						이미 <strong> ' <c:out value="${subItem}"/> ' </strong>구독권이 존재합니다. <br /> <strong>마이페이지 > 구독 정보</strong>
						에서 확인 후<br/> 문의사항은 챗봇으로 주시기 바랍니다.
					</p>
					<br />
				</div>
				<div class="modal-footer justify-content-center">
					<div class="plan-button">
						<input type="button" class="btn btn-common btn-effect"
							onclick="location.href='${pageContext.request.contextPath }/user/mypage'" value="마이페이지"> 
						<input type="button" class="btn btn-common btn-effect" onclick="missS();" value="취소">
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- PC 카카오톡 상담 버튼 -->
	<%@ include file="/WEB-INF/views/includes/kakaochat.jsp"%>


	<!-- Footer Section Start -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

	<script>
		function goLogin() {
			self.location = "${pageContext.request.contextPath }/user/loginpage";
		}
		
		
		var token = $("meta[name='_csrf']").attr("content"); 
		var header = $("meta[name='_csrf_header']").attr("content");
		function subCheck1() {
			console.log("진입");
			var email = encodeURIComponent($("#email").val());
			console.log(email);
			
		           $.ajax({
		            	url: '${pageContext.request.contextPath }/subscribe/subCheck',
		            	type: 'post',
		            	beforeSend : function(xhr){
		            		xhr.setRequestHeader(header, token);},
		            	data: {'email' : email },
		            	success: function(data) {
		            		if(data == 'OK') {
		            			$("#sub1").attr("action", "${pageContext.request.contextPath }/subscribe/order");
		            			$("#sub1").submit();
		                    } else {
		                    	$("#myModalS").show();
		                    } 
		            	}, 
		            	error: function(e) {
		            		console.log(e);
		            	}
		            });
		    	
		        }   
		function subCheck2() {
			console.log("진입");
			var email = encodeURIComponent($("#email").val());
			console.log(email);
			
		           $.ajax({
		            	url: '${pageContext.request.contextPath }/subscribe/subCheck',
		            	type: 'post',
		            	beforeSend : function(xhr){
		            		xhr.setRequestHeader(header, token);},
		            	data: {'email' : email },
		            	success: function(data) {
		            		if(data == 'OK') {
		            			$("#sub2").attr("action", "${pageContext.request.contextPath }/subscribe/order");
		            			$("#sub2").submit();
		                    } else {
		                    	$("#myModalS").show();
		                    } 
		            	}, 
		            	error: function(e) {
		            		console.log(e);
		            	}
		            });
		    	
		        }   
		function subCheck3() {
			console.log("진입");
			var email = encodeURIComponent($("#email").val());
			console.log(email);
			
		           $.ajax({
		            	url: '${pageContext.request.contextPath }/subscribe/subCheck',
		            	type: 'post',
		            	beforeSend : function(xhr){
		            		xhr.setRequestHeader(header, token);},
		            	data: {'email' : email },
		            	success: function(data) {
		            		if(data == 'OK') {
		            			$("#sub3").attr("action", "${pageContext.request.contextPath }/subscribe/order");
		            			$("#sub3").submit();
		                    } else {
		                    	$("#myModalS").show();
		                    } 
		            	}, 
		            	error: function(e) {
		            		console.log(e);
		            	}
		            });
		    	
		        }   
		
		function missL(){
			$("#myModalL").modal('hide');
		}
		
		function missS(){
			$("#myModalS").hide();
		}
	</script>

</body>

</html>