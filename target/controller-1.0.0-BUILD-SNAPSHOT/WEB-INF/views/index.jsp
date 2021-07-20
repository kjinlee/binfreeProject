<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%-- <% UserVO userVO = session.getAttribute("userVO"); %> --%>
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
  <!-- css -->
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/line-icons.css">
  <link rel="stylesheet" href="/resources/css/owl.carousel.css">
  <link rel="stylesheet" href="/resources/css/owl.theme.css">
  <link rel="stylesheet" href="/resources/css/nivo-lightbox.css">
  <link rel="stylesheet" href="/resources/css/magnific-popup.css">
  <link rel="stylesheet" href="/resources/css/animate.css">
  <link rel="stylesheet" href="/resources/css/menu_sideslide.css">
  <link rel="stylesheet" href="/resources/css/main.css">
  <link rel="stylesheet" href="/resources/css/responsive.css">

  <script src="https://code.jquery.com/jquery-latest.js"></script>
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script>
    componentDidMount(){
      Kakao.init('2a351a8d6b54e936968fb3673fae2a42');
    }
  </script>

</head>

<body>
  <!-- Header Section Start -->
  <header id="slider-area">
    <nav class="navbar navbar-expand-md fixed-top scrolling-navbar bg-white">
      <div class="container">
        <a class="navbar-brand" href="#"><span><img src="/resources/img/logo.png"></span></a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
          aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <i class="lni-menu"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto w-100 justify-content-end">
            <li class="nav-item">
              <a class="nav-link page-scroll" href="/review/subscribe">구독</a>
            </li>
            <li class="nav-item">
              <a class="nav-link page-scroll" href="buddy.html">구인</a>
            </li>
            <li class="nav-item">
              <a class="nav-link page-scroll" href="service.html">고객센터</a>
            </li>
           
			<c:choose>
				<c:when test="${loginUserVO.userLogin == true}">
		            <li class="nav-item">
		              <a class="nav-link page-scroll" href="user/mypage">${loginUserVO.name} 님 마이페이지</a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link page-scroll" href="user/logout">로그아웃</a>
		            </li>
           		 </c:when>
	            <c:otherwise> 
		            <li class="nav-item">
		              <a class="nav-link page-scroll" href="user/login">로그인</a>
		            </li>
	            </c:otherwise>
            </c:choose>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Main Carousel Section -->
    <div id="carousel-area" style="max-width:100%; height: auto;">
      <div class="carousel-inner" role="listbox">
        <div class="carousel-item active">
          <img src="/resources/img/slider/Recycling_Bin_GIF_Header.gif" width="150%" height="100%" style="padding-top: 60px;" alt="">
          <div class="carousel-caption text-left">
            <h3 class="wow fadeInRight" data-wow-delay="0.2s">
              </h1>
              <h2 class="wow fadeInRight" data-wow-delay="0.4s">분리수거</h2>
              <h4 class="wow fadeInRight" data-wow-delay="0.6s">편하고 정확한 분리수거로 지구를 지킬 수 있어요.</h4>
              <a href="friends.html" class="btn btn-lg btn-common btn-effect wow fadeInRight"
                data-wow-delay="0.9s">구독하기</a>
              <a href="buddy.html" class="btn btn-lg btn-border wow fadeInRight" data-wow-delay="1.2s">버디 지원하기</a>
          </div>
        </div>
      </div>
    </div>

  </header>
  <!-- Header Section End -->

  <!-- Services Section Start -->
  <section id="services" class="section">
    <div class="container">
      <div class="item-boxes">
        <div class="row">
          <div class="col-md-6">
            <img src="/resources/img/main/earth1.jpg" style="max-width:100%; height: auto;">
          </div>
          <div class="col-md">
          </div>
          <div class="col-md-4">
            <br><br>
            <h4 style="font-size: 500%; font-family: 맑은고딕; font-weight: bold;">For Earth</h4>
            <br><br>
            <p style="font-size:180%; line-height: 30px; color: gray;"> "환경을 생각합니다"</p>
            <p style="font-size:180%; line-height: 50px; color: gray;">그린박스 하나에 전부 담으면 끝!</p><br><br><br>
            <h4 style="font-size:180%; line-height: 10px;">#전문성</h4>
            <p style="font-size:120%; line-height: 30px;">잘못된 분리수거는 재활용품이 될 수 없다는 사실!<br>이제 재활용 전문가에게 맡기세요.</p>
          </div>
          <div class="col-md">
          </div>
        </div>
      </div>
      <div class="item-boxes">
        <div class="row">
          <div class="col-md">
          </div>
          <div class="col-md-4">
            <br><br><br>
            <h4 style="font-size: 500%; font-family: 맑은고딕; font-weight: bold;">For Local</h4>
            <p style="font-size:180%; line-height: 30px; color:gray;">"지역 상생을 추구합니다"</p><br><br><br>
            <h4 style="font-size:180%; line-height: 10px;">#비대면</h4>
            <p style="font-size:120%; line-height: 30px;">코로나19 때문에 외부인과의 접촉이 걱정되셨나요?<br> 버디를 부르고 문앞에 놓기만 하세요.</p>
          </div>
          <div class="col-md">
          </div>
          <div class="col-md-6">
            <img src="/resources/img/main/senior.jpeg" style="max-width:100%; height:auto;">
          </div>
        </div>
      </div>
      <div class="item-boxes">
        <div class="row">
          <div class="col-md-6">
            <img src="/resources/img/main/4.jpeg" style="max-width:100%; height:auto;">
          </div>
          <div class="col-md">
          </div>
          <div class="col-md-4">
            <br><br><br>
            <h4 style="font-size: 500%; font-family: 맑은고딕; font-weight: bold;">For Life</h4>
            <p style="font-size: 180%;line-height: 30px; color:gray;">"라이프 스타일을 제안합니다"</p><br><br><br>
            <h4 style="font-size: 180%;">#시간절약 #공간절약</h4>
            <p style="font-size: 120%; line-height: 30px;">커다란 분리수거함에 하나하나 분리할 필요 없어요. 그린박스 하나에 전부 담으면 끝!</p>
          </div>
          <div class="col-md">
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Services Section End -->

  <!-- Start Video promo Section -->
  <section class="video-promo section">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-sm-12">
          <div class="video-promo-content text-center">
            <a href="https://www.youtube.com/embed/rU5nV_jmZlg" class="video-popup"><i class="lni-film-play"></i></a>
            <h2 class="wow zoomIn" data-wow-duration="1000ms" data-wow-delay="100ms">B free를 통한 바이소셜 실현!</h2>
            <p class="wow zoomIn" data-wow-duration="1000ms" data-wow-delay="100ms">위 영상을 클릭해 확인해 보세요.</p>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- End Video Promo Section -->

  <!-- Counter Section Start -->
  <div class="counters section bg-defult">
    <div class="container">
      <div class="row">
        <div class="col-sm-6 col-md-6 col-lg-3">
          <div class="facts-item">
            <div class="icon">
              <i class="lni-users"></i>
            </div>
            <div class="fact-count">
              <h3><span class="counter">105</span></h3>
              <h4>현재 구독 회원수</h4>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-6 col-lg-3">
          <div class="facts-item">
            <div class="icon">
              <i class="lni-write"></i>
            </div>
            <div class="fact-count">
              <h3><span class="counter">63</span></h3>
              <h4>현재 작성된 리뷰수</h4>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-6 col-lg-3">
          <div class="facts-item">
            <div class="icon">
              <i class="lni-emoji-smile"></i>
            </div>
            <div class="fact-count">
              <h3><span class="counter">160</span></h3>
              <h4>함께하는 버디 직원수</h4>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-6 col-lg-3">
          <div class="facts-item">
            <div class="icon">
              <i class="lni-heart"></i>
            </div>
            <div class="fact-count">
              <h3><span class="counter">98</span>%</h3>
              <h4>고객 만족도</h4>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Counter Section End -->

  <!-- Testimonial Section Start -->
  <section class="testimonial section">
    <div style="text-align: center; margin-bottom: 40px;">
      <h2 style="font-family: Malgun Gothic ;">B-Family 리뷰</h2>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div id="testimonials" class="touch-slider owl-carousel">
            <div class="item">
              <div class="testimonial-item">
                <div class="author">
                  <div class="author-info">
                    <h2>김덕배</h2>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <!-- <span>Marketing Head Matrix media</span> -->
                  </div>
                </div>
                <div class="content-inner">
                  <p class="description">유튜브 프리미엄 같은 녀석...</p>
                </div>
              </div>
            </div>
            <div class="item">
              <div class="testimonial-item">
                <div class="author">
                  <div class="img-thumb">
                  </div>
                  <div class="author-info">
                    <h2>삼콩</h2>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <!-- <span>Marketing Head Matrix media</span> -->
                  </div>
                </div>
                <div class="content-inner">
                  <p class="description">있다 없으니깐... 한달만 쓰고 취소 했었는데 다시 구독해버렸습니당 ㅜㅜ</p>
                </div>
              </div>
            </div>
            <div class="item">
              <div class="testimonial-item">
                <div class="author">
                  <div class="img-thumb">
                  </div>
                  <div class="author-info">
                    <h2>쓰레기가 너무 많아</h2>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star"></i></span>
                    <span><i class="lni-star"></i></span>
                    <!-- <span>Marketing Head Matrix media</span> -->
                  </div>
                </div>
                <div class="content-inner">
                  <p class="description">집에 쓰레기가 너무 많아서 매일매일 분리수거가 필요했는데 이거 구독하고 너무 편해요 ㅋㅋ 강추 </p>
                </div>
              </div>
            </div>
            <div class="item">
              <div class="testimonial-item">
                <div class="author">
                  <div class="img-thumb">
                  </div>
                  <div class="author-info">
                    <h2>궝진몽</h2>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star"></i></span>
                    <!-- <span>Marketing Head Matrix media</span> -->
                  </div>
                </div>
                <div class="content-inner">
                  <p class="description">커피 한잔 값으로 편리함뿐만 아니라 사회적인 기여까지 할 수 있다는게 놀랍네요. 단순히 상업적인것이 목표가 아닌것에 박수치고 갑니다 짝짝!
                  </p>
                </div>
              </div>
            </div>
            <div class="item">
              <div class="testimonial-item">
                <div class="author">
                  <div class="img-thumb">
                  </div>
                  <div class="author-info">
                    <h2>비트컴프</h2>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star-filled"></i></span>
                    <span><i class="lni-star"></i></span>
                    <!-- <span>Marketing Head Matrix media</span> -->
                  </div>
                </div>
                <div class="content-inner">
                  <p class="description">사람들이 분리수거를 안해서 스트레스였는데 단 돈 3,900원으로 개꿀 ㅋㅋ 빨리쓰셈</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Testimonial Section End -->

  <!-- Footer Section Start -->
  <footer>
    <!-- Footer Area Start -->
    <section class="footer-Content">
      <div class="container">
        <div class="row">      
          <div class="col-sm-12">
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
  <!-- <script src="js/color-switcher.js"></script> -->
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