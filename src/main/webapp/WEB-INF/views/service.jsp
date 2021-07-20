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
  </script>

</head>

<body>
  <!-- Header Section Start -->
  <%@ include file="/WEB-INF/views/includes/header.jsp" %>




  <!-- Call to Action Start -->
  <section class="call-action section">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-10">
          <div class="cta-trial text-center">
            <br />
            <br />
            <h2>도움이 필요하신가요?</h2>
            <br />
            <p style="font-size: 16px">평일 09:30 - 18:00</p>
          </div>
          <br />
          <div class="container">
            <div class="row">
              <div class="col-sm-3">
                <div class="icon">
                </div>
              </div>
              <div class="col-sm-3">
                <div class="facts-item" style="text-align: center; font-size: 20px; line-height: 50px;"
                  onclick="location.href='#'">
                  <div class="icon">
                    <div class="lni-phone-handset"></div>
                    <div>전화 상담</div>
                    <div style="font-size: 15px; line-height: 30px;">010-1234-1234</div>
                  </div>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="facts-item" style="text-align: center; font-size: 20px; line-height: 50px;"
                  onclick="location.href='#;'">
                  <div class="icon">
                    <div class="lni-comments"></div>
                    <div>이메일 상담</div>
                    <div style="font-size: 15px; line-height: 30px;">bitcamp@test.com</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Call to Action End -->

  <!-- Features Section Start -->
  <section id="features" class="section">
    <div class="container">
      <div class="section-header">
        <h2 class="section-title">자주 묻는 질문</h2>
        <span>Q&A</span>
        <p class="section-subtitle">아래 카테고리를 통해 BFree에 대한 궁금증을 빠르게 해결해보세요.</p>
      </div>
      <div class="panel-group" id="accordion">
        <div class="faqHeader">회원정보</div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                href="#collapseOne">회원가입은 어떻게 할 수 있나요?</a>
            </h4>
          </div>
          <div id="collapseOne" class="panel-collapse collapse">
            <div class="panel-body">
              상단 메뉴바의 로그인을 클릭하신 후 회원가입 또는 카카오톡 간편 회원가입을 통해 가능합니다.
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                href="#collapseTwo">이미 가입된 이메일주소라고 합니다. 어떻게 해야하나요?</a>
            </h4>
          </div>
          <div id="collapseTwo" class="panel-collapse collapse">
            <div class="panel-body">
              <strong>이미 가입된 이메일은 사용하실 수 없습니다.</strong>
              <br />
              <br />
              새로운 이메일 주소를 입력해주시거나, 고객센터로 연락 주시면 확인 후 안내드리겠습니다.
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                href="#collapseThree">회원정보를 변경하고 싶어요.</a>
            </h4>
          </div>
          <div id="collapseThree" class="panel-collapse collapse">
            <div class="panel-body">
              <strong>마이페이지 내 정보 수정에서 변경 가능합니다.</strong>
              <br />
              <br />
              회원정보는 BFree 홈페이지 마이페이지 내 정보 수정에서 변경 가능합니다. 정보가 변경된 경우 꼭 회원정보를 변경해주세요!
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                href="#collapseFour">회원탈퇴는 어디서 하나요?</a>
            </h4>
          </div>
          <div id="collapseFour" class="panel-collapse collapse">
            <div class="panel-body">
              <strong>마이페이지 내 정보 하단에 회원 탈퇴를 눌러주세요.</strong>
              <br />
              <br />
              홈페이지 마이페이지 내 정보 수정 하단에 회원 탈퇴 버튼을 클릭해주세요. 구독 중인 고객님은 탈퇴 시 더이상 구독 해지 및 연장이 불가능합니다. 문제가 있는 경우, 고객센터로 문의해주세요.
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                href="#collapseFive">리뷰 작성은 어떻게 하나요?</a>
            </h4>
          </div>
          <div id="collapseFive" class="panel-collapse collapse">
            <div class="panel-body">
              <strong>로그인 후 구독 페이지 하단에서 리뷰를 작성할 수 있습니다.</strong>
              <br />
              <br />
              리뷰 정책상 욕설이나 도배글 등 다른 고객에게 불쾌감을 줄 수 있는 내용이 포함되는 경우 임의로 삭제될 수 있습니다.
            </div>
          </div>
        </div>

        <div class="faqHeader">결&nbsp;제</div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                href="#collapseSix">어떤 방법으로 결제할 수 있나요?</a>
            </h4>
          </div>
          <div id="collapseSix" class="panel-collapse collapse">
            <div class="panel-body">
              <strong>다양한 방법을 통해 결제할 수 있습니다.</strong>
              <br />
              <br />
              신용카드, 체크카드, 카카오페이로 결제가 가능합니다.
            </div>
          </div>
        </div>
       <!--  <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                href="#collapseEight">결제를 취소하고 싶어요.</a>
            </h4>
          </div>
          <div id="collapseEight" class="panel-collapse collapse">
            <div class="panel-body">
              <strong>마이페이지- 나의 구독 조회에서 결제를 취소할 수 있습니다.</strong>
              <br />
              <br />
              BFree 홈페이지 마이페이지 내의 나의 구독 조회에서 구독 취소를 통해 결제를 취소할 수 있습니다.
              <br />
              다만, 일정 기간이 지난 후에는 취소가 불가능합니다. 더 궁금한 점은 고객센터로 문의바랍니다.
            </div>
          </div>
        </div> -->
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                href="#collapseEight">어떤 방식으로 환불이 진행되나요?</a>
            </h4>
          </div>
          <div id="collapseEight" class="panel-collapse collapse">
            <div class="panel-body">
              <strong>결제하셨던 결제 수단으로 환불이 진행됩니다.</strong>
              <br />
              <br />
              영업일 기준으로 1~5일 정도 소요됩니다.
              <br />
              환불 후 입금 및 처리는 결제 수단 고객센터(카드사)로 연락 주시면 더욱 빠른 확인 가능합니다.
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                href="#collapseNine">결제했던 수단 말고 다른 방법으로 환불 받을 수 있나요?</a>
            </h4>
          </div>
          <div id="collapseNine" class="panel-collapse collapse">
            <div class="panel-body">
              결제하셨던 수단으로만 환불이 가능하며, 다른 방법으로 환불은 어렵습니다.
            </div>
          </div>
        </div>
        <div class="faqHeader">구직 신청</div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                href="#collapseTen">구직 신청은 어디서 하나요?</a>
            </h4>
          </div>
          <div id="collapseTen" class="panel-collapse collapse">
            <div class="panel-body">
              <strong>상단 메뉴에 구인 탭을 통해 신청 가능합니다.</strong>
              <br />
              <br />
              구인 탭에 Buddy 신청 폼을 작성하여 제줄해주시면 담당자들이 신청서 확인 후 개별적으로 연락드립니다.
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                href="#collapseEleven">지원서 작성 후 채용 결과는 어떻게 알 수 있나요?</a>
            </h4>
          </div>
          <div id="collapseEleven" class="panel-collapse collapse">
            <div class="panel-body">
              <strong>지원서 확인 후 작성해주신 연락처로 2주 안에 개별연락드립니다.</strong>
              <br />
              <br />
              신청서 확인 및 위치 배정 후(약 2주 소요) 신청서 폼에 작성한 연락처 기준으로 연락드리오니 반드시 정확한 연락처 기재 부탁드립니다.
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Features Section End -->


		<!-- PC 카카오톡 상담 버튼 -->
	<%@ include file="/WEB-INF/views/includes/kakaochat.jsp"%>

	<!-- Footer Section Start -->
  <%@ include file="/WEB-INF/views/includes/footer.jsp"%>
	
</body>
</html>