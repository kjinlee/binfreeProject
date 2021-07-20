<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
<title>버디 매칭 중</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/line-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nivo-lightbox.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/color-switcher.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/menu_sideslide.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive.css">

</head>

<body style="background-color: #f9f9f9;">

	<!-- Portfolio Section -->
	<section id="portfolios" class="section">
		<!-- Container Starts -->
		<div class="container">
			<div class="section-header">
				<h2 class="section-title">결제 완료</h2>
				<span>payment success!</span>
				<p class="section-subtitle"></p>
			</div>
			<div class="row">
				<div class="col-md-12">
					<!--matching image div-->
					<div class="p-3 py-5">
						<div class="mt-5 text-center">
							<img src="${pageContext.request.contextPath }/resources/img/portfolio/matching.gif" alt="" />
						</div>
						<div class="mt-5 text-center">
							<p>
								<br />
							</p>
							<h2 class="section-title" style="font-size: 20px;">나의 Buddy를
								확인하고 있습니다. 잠시만 기다려 주세요.</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Container Ends -->
	</section>
	<!-- Portfolio Section Ends -->
	
	<input type="hidden" value="${email}" id="email"/>
	<input type="hidden" value="${zipCode}" id="zipCode"/>
		
		


	<!-- jQuery first, then Tether, then Bootstrap JS. -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery-min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/classie.js"></script>
	<!-- <script src="js/color-switcher.js"></script> -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery.mixitup.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/nivo-lightbox.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.stellar.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.nav.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/scrolling-nav.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.easing.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/wow.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.vide.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.counterup.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/form-validator.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/contact-form-script.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

	<script>
		var email = $("#email").val();
		var zipCode = $("#zipCode").val();
		
		$(document).ready(function() {
			window.setTimeout(function(){location.href='${pageContext.request.contextPath }/subscribe/match?zipCode='+zipCode+'&email='+email},2500);	
				
		});
		</script>

</body>
</html>