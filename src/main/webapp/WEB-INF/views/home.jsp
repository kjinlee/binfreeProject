<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
</head>

<body>
    <!-- Header Section Start -->
  <%@ include file="/WEB-INF/views/includes/header.jsp" %>

    <!-- Main Carousel Section -->
    <div id="carousel-area" style="max-width:100%; height: auto;">
      <div class="carousel-inner" role="listbox">
        <div class="carousel-item active">
          <img src="${pageContext.request.contextPath }/resources/img/slider/Recycling_Bin_GIF_Header.gif" width="150%" height="700px" style="padding-top: 60px;" alt="">
          <div class="carousel-caption text-left">
            <h3 class="wow fadeInRight" data-wow-delay="0.2s">
              </h1>
              <h2 class="wow fadeInRight" data-wow-delay="0.4s">분리수거,<br/> 맡겨보세요</h2>
              <h4 class="wow fadeInRight" data-wow-delay="0.6s">편하고 정확한 분리수거로 지구를 지킬 수 있어요.</h4>
              <a href="${pageContext.request.contextPath }/subscribe/main" class="btn btn-lg btn-common btn-effect wow fadeInRight"
                data-wow-delay="0.9s">구독하기</a>
              <a href="${pageContext.request.contextPath }/form/register" class="btn btn-lg btn-border wow fadeInRight" data-wow-delay="1.2s">버디 지원하기</a>
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
            <img src="${pageContext.request.contextPath }/resources/img/main/earth1.jpg" style="max-width:100%; height: auto;">
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
            <p style="font-size:110%; line-height: 30px;">코로나19 때문에 외부인과의 접촉이 걱정되셨나요?<br> 버디를 부르고 문앞에 놓기만 하세요.</p>
          </div>
          <div class="col-md">
          </div>
          <div class="col-md-6">
            <img src="${pageContext.request.contextPath }/resources/img/main/senior.jpeg" style="max-width:100%; height:auto;">
          </div>
        </div>
      </div>
      <div class="item-boxes">
        <div class="row">
          <div class="col-md-6">
            <img src="${pageContext.request.contextPath }/resources/img/main/4.jpeg" style="max-width:100%; height:auto;">
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
              <h3><span class="sum" style="font-size: 40px; color: #fff; font-weight: 400; line-height: 40px;"><c:out value="${userTotal }" /></span>명</h3>
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
              <h3><span class="counter"><c:out value="${pageMaker.total }" /></span></h3>
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
              <h3><span class="counter"><c:out value="${buddyTotal }" /></span>명</h3>
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
              <h3><span class="counter"><c:out value="${starSum * 20 }" /></span>%</h3>
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
            <c:forEach items='${list}' var="list">
            <div class="item">
              <div class="testimonial-item">
                <div class="author">
                  <div class="author-info">
                    <h2><c:out value="${list.userName }"></c:out></h2>
                    <c:forEach var="i" begin="1" end="${list.star }">
                    <span><i class="lni-star-filled"></i></span>
                    </c:forEach>
                  </div>
                </div>
                <div class="content-inner">
                  <p class="description"><c:out value="${list.contents }"></c:out></p>
                </div>
              </div>
            </div>
            </c:forEach>
         
    </div>
  </section>
  <!-- Testimonial Section End -->

	<!-- PC 카카오톡 상담 버튼 -->
	<%@ include file="/WEB-INF/views/includes/kakaochat.jsp"%>


  <!-- Footer Section Start -->
  <%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>

</html>