<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="keywords" content="Bootstrap, Landing page, Template, Registration, Landing">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="author" content="Grayrids">
  <title>Bin-Free Homepage</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/line-icons.css">
  <link rel="stylesheet" href="/resources/css/owl.carousel.css">
  <link rel="stylesheet" href="/resources/css/owl.theme.css">
  <link rel="stylesheet" href="/resources/css/nivo-lightbox.css">
  <link rel="stylesheet" href="/resources/css/magnific-popup.css">
  <link rel="stylesheet" href="/resources/css/animate.css">
  <link rel="stylesheet" href="/resources/css/color-switcher.css">
  <link rel="stylesheet" href="/resources/css/menu_sideslide.css">
  <link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="/resources/css/responsive.css">
  
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
  <header id="slider-area">
    <nav class="navbar navbar-expand-md fixed-top scrolling-navbar bg-white">
      <div class="container">
        <a class="navbar-brand" href="home.html"><span><img src="/resources/img/logo.png"></span></a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
          aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <i class="lni-menu"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto w-100 justify-content-end">
            <li class="nav-item">
              <a class="nav-link page-scroll" href="friends.html">구독</a>
            </li>
            <li class="nav-item">
              <a class="nav-link page-scroll" href="buddy.html">구인</a>
            </li>



            <li class="nav-item">
              <a class="nav-link page-scroll" href="service.html">고객센터</a>
            </li>

            <li class="nav-item">
              <a class="nav-link page-scroll" href="login.html">로그인</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
  <!-- Header Section End -->



  <!-- Subcribe Section Start -->
  <div class="section" style="background-color: rgb(224, 241, 231); padding: 140px 0 70px 0;">
    <div class="container">
      <div class="row">
        <div class="col-lg-3 col-md-2"></div>
        <div class="col-lg-6 col-md-8 col-xs-12">
          <div class="subscribe-form">
            <div class="form-wrapper">
              <div class="sub-title text-center">
                <h3>로그인</h3>
              </div>
              <%-- <form> --%>
              <form:form action="login" method="post" modelAttribute="tempLoginUserVO">
                <div class="row">
                  <div class="col-md-12 form-line">
                    <div class="form-group">
                    	<form:input path="email" type="email" class="form-control" name="email" placeholder="아이디"/>
                      <!-- <input type="email" class="form-control" name="email" placeholder="아이디"> -->
                    </div>
                  </div>
                  <div class="col-md-12 form-line">
                    <div class="form-group">
                    <form:input path="password" type="password" class="form-control" name="password" placeholder="비밀번호"/>
                      <!-- <input type="password" class="form-control" name="password" placeholder="비밀번호"> -->
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="form-submit">
                      <form:button type="submit" class="btn btn-common btn-effect btn-login" style="background-color:#4b8a59">로그인</form:button>
                      <br>
                      <!-- <button type="submit" class="btn btn-common btn-effect btn-login" style="background-color:#4b8a59">로그인</button> -->
                      <div style="text-align: center; margin-bottom: 20px;">
                        <a href="#"col style="color: black;">아이디 찾기</a>
                        <a href="#" style="color: black;">|</a>
                        <a href="#"col style="color: black;">비밀번호 찾기</a>
                      </div>
                      <button class="btn btn-common btn-effect btn-kakao"><img src="/resources/img/kakao.png" height="21px" width="21px">&nbsp;카카오 로그인</button>
                      <div style="text-align: center;"><a href="/user/signup" style="color: black;">회원가입</a></div>
                    </div>
                  </div>
                </div>
              <%-- </form> --%>
            </form:form>
            </div>
          </div>
      </div>
      <div class="col-lg-2 col-md-2"></div>
    </div>
  </div>
  </div>
  <!-- Subcribe Section End -->
  


  <!-- Footer Section Start -->
  <footer>
    <!-- Footer Area Start -->
    <section class="footer-Content">
      <div class="container">
        <div class="row">        
          <div class="col-md-12">
            <div class="widget">
              <br>
              <h3 class="block-title">Bin-Free</h3>
              <ul class="contact-footer">
                <li>
                  <span>상호명 : 비트캠프 D풀이 | 사업자 등록번호 : 123-45-67890</span>
                  <span>통신판매업 신고번호 : 2021-서울서초-0524</span>
                  <span>대표자 : D풀이 | 소재지 : 서울특별시 서초구 강남대로 459(백암빌딩 구관)</span>
                  <span>문의 : bitcamp@test.com</span>
                </li>
                <li>
                  <span>Copyright©2021 BFree. All rights reserved.</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Footer area End -->

    <!-- Copyright Start  -->
    <div id="copyright">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="site-info float-left">
              <p>Crafted by <a href="#" rel="nofollow">D풀이</a></p>
            </div>
            <div class="float-right">
              <ul class="nav nav-inline">
                <li class="nav-item">
                  <a class="nav-link" href="#">이용안내</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">사업자정보확인</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">이용약관</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">개인정보처리방침</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Copyright End -->

  </footer>
  <!-- Footer Section End -->

  <!-- Go To Top Link -->
  <a href="#" class="back-to-top">
    <i class="lni-arrow-up"></i>
  </a>

  <div id="loader">
    <div class="spinner">
      <div class="double-bounce1"></div>
      <div class="double-bounce2"></div>
    </div>
  </div>

  <!-- jQuery first, then Tether, then Bootstrap JS. -->
  <script src="/resources/js/jquery-min.js"></script>
  <script src="/resources/js/popper.min.js"></script>
  <script src="/resources/js/bootstrap.min.js"></script>
  <script src="/resources/js/classie.js"></script>
  <script src="/resources/js/color-switcher.js"></script>
  <script src="/resources/js/jquery.mixitup.js"></script>
  <script src="/resources/js/nivo-lightbox.js"></script>
  <script src="/resources/js/owl.carousel.js"></script>
  <script src="/resources/js/jquery.stellar.min.js"></script>
  <script src="/resources/js/jquery.nav.js"></script>
  <script src="/resources/js/scrolling-nav.js"></script>
  <script src="/resources/js/jquery.easing.min.js"></script>
  <script src="/resources/js/wow.js"></script>
  <script src="/resources/js/jquery.vide.js"></script>
  <script src="/resources/js/jquery.counterup.min.js"></script>
  <script src="/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/js/waypoints.min.js"></script>
  <script src="/resources/js/form-validator.min.js"></script>
  <script src="/resources/js/contact-form-script.js"></script>
  <script src="/resources/js/main.js"></script>

</body>

</html>