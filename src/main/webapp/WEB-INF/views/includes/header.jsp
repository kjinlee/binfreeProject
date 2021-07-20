<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>
<html lang="en">

<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="keywords"
	content="Bootstrap, Landing page, Template, Registration, Landing">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="author" content="Grayrids">
<title>Bin-Free Homepage</title>

<!-- Bootstrap CSS -->
<!-- css -->

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/shop-homepage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/line-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nivo-lightbox.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/menu_sideslide.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/adminpage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/kakao.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/pagenation.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/review.css">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css' />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<style type="text/css">

.logout{
	color: black !important;
	cursor: pointer;
}

.dropdown-menu{
	min-width: 0 !important;
}


</style>

</head>

<body>
	<!-- Header Section Start -->
	<header id="slider-area">
		<nav
			class="navbar navbar-expand-md fixed-top scrolling-navbar bg-white">
			<div class="container">
				<a class="navbar-brand" href="${pageContext.request.contextPath }/"><span><img
						src="${pageContext.request.contextPath }/resources/img/logo.png"></span></a>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarCollapse" aria-controls="navbarCollapse"
					aria-expanded="false" aria-label="Toggle navigation">
					<i class="lni-menu"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav mr-auto w-100 justify-content-end">
						<li class="nav-item"><a class="nav-link page-scroll"
							href="${pageContext.request.contextPath }/intro">소개</a></li>
						<li class="nav-item"><a class="nav-link page-scroll"
							href="${pageContext.request.contextPath }/subscribe/main">구독</a></li>
						<li class="nav-item"><a class="nav-link page-scroll"
							href="${pageContext.request.contextPath }/form/register">구인</a></li>
						<li class="nav-item"><a class="nav-link page-scroll"
							href="${pageContext.request.contextPath }/goods/list">굿즈</a></li>

						<li class="nav-item"><a class="nav-link page-scroll"
							href="${pageContext.request.contextPath }/service">고객센터</a></li>

						<li class="nav-item">
							<!-- 로그인 안된 상태 --> <sec:authorize access="isAnonymous()">
								<a class="nav-link page-scroll"
									href='<c:url value="/user/loginpage"/>'>로그인</a>
							</sec:authorize>

						</li>

						<sec:authorize access="hasAnyRole('ROLE_MEMBER', 'ROLE_KAKAO')">

							<ul class="navbar-nav">
								<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
									<strong><sec:authentication property="principal.name" /></strong>님</a>
									
									<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
										<li><a class="dropdown-item" href="${pageContext.request.contextPath }/user/mypage">마이페이지</a></li>
										<li><a class="dropdown-item logout" onclick="document.getElementById('logout').submit();" >
												로그아웃</a></li>
										
										
										
										<sec:authentication property="principal.email" var="email" /> 
										<sec:authentication property="principal.name" var="userName" /> 
										<sec:authentication property="principal.subItem" var="subItem" /> 
										<sec:authentication property="principal.phone" var="phone" />
										<sec:authentication property="principal.auth" var="auth" />
									</ul>
								</li>
							</ul>
							
							<form id="logout" action="${pageContext.request.contextPath }/logout" method="POST">
								<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
							</form> 
						</sec:authorize>

						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<ul class="navbar-nav">
								<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
									<strong><sec:authentication property="principal.name" /></strong>님</a>
									
									<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
										<li><a class="dropdown-item" href="${pageContext.request.contextPath }/admin/bfamily/list">구독자 관리</a></li>
										<li><a class="dropdown-item" href="${pageContext.request.contextPath }/admin/buddy/list">직원 관리</a></li>
										<li><a class="dropdown-item" href="${pageContext.request.contextPath }/admin/form/list">지원서 관리</a></li>
										<li><a class="dropdown-item logout" onclick="document.getElementById('logout').submit();" >
												로그아웃</a></li>
										
									</ul>
								</li>
							</ul>
							
							<form id="logout" action="${pageContext.request.contextPath }/logout" method="POST">
								<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
							</form> 
						</sec:authorize>
					</ul>
				</div>
			</div>
		</nav>