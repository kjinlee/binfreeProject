<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>Bin-Free Homepage</title>

<!-- Bootstrap CSS -->
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
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css' />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Manrope:wght@200&display=swap')
	;

.cross {
	padding: 10px;
	color: #1abc9c;;
	cursor: pointer;
	font-size: 23px
}

.cross i {
	margin-top: -5px;
	cursor: pointer
}

.comment-box {
	padding: 5px
}

.comment-area textarea {
	resize: none;
	border: 1px solid #1abc9c;
}

.form-control:focus {
	color: #495057;
	background-color: #fff;
	border-color: #ffffff;
	outline: 0;
	box-shadow: 0 0 0 1px #1abc9c !important
}

.send {
	color: #fff;
	background-color: #1abc9c;
	border-color: #1abc9c;
}

.send:hover {
	color: #fff;
	background-color: #1abc9c;
	border-color: #1abc9c;
}

.rating {
	display: inline-flex;
	margin-top: -10px;
	flex-direction: row-reverse
}

.rating>input {
	display: none
}

.rating>label {
	position: relative;
	width: 28px;
	font-size: 35px;
	color: #1abc9c;
	cursor: pointer
}

.rating>label::before {
	content: "\2605";
	position: absolute;
	opacity: 0
}

.rating>label:hover:before, .rating>label:hover ~label:before {
	opacity: 1 !important
}

.rating>input:checked ~label:before {
	opacity: 1
}

.rating:hover>input:checked ~label:before {
	opacity: 0.4
}

.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}

.table.review {
	line-height: 40px;
	font-family:
}

.col-md-6.nameItem {
	color: #838383;
}

#reviewContent {
	font-size: 18px;
	font-weight: 350;
}

.stars-outer {
	position: relative;
	display: inline-block;
}

.stars-inner {
	position: absolute;
	top: 0;
	left: 0;
	white-space: nowrap;
	overflow: hidden;
	width: 0;
}

.stars-outer::before {
	/* 별 모양 */
	content: "\f005";
	font-family: 'Font Awesome 5 Free';
	/* 별 빈 정도 (두께) */
	font-weight: 900;
	color: #ccc;
}

.stars-outer1::before {
	/* 별 모양 */
	content: "\f005";
	font-family: 'Font Awesome 5 Free';
	/* 별 빈 정도 (두께) */
	font-weight: 900;
	color: #f8ce0b;
}

.buttonArea {
	text-align: end;
}

button {
	width: 90px;
	border: none;
	border-radius: 50px;
	margin-top: 5px;
	cursor: pointer;
}

.btn-update {
	color: white;
	background-color: #0a8a8a;
}

.btn-delete {
	color: #0a8a8a;
}

.creDate {
	position: absoulte;
	text-align: end;
}

.writeLink {
	text-align: end;
	padding-right: 20px;
	font-size: 18px;
}

.writeR {
	color: #0a8a8a;
}
</style>



</head>

<body>
	<!-- Header Section Start -->
	<header id="slider-area"> <nav
		class="navbar navbar-expand-md fixed-top scrolling-navbar bg-white">
	<div class="container">
		<a class="navbar-brand" href="../"><span><img
				src="/resources/img/logo.png"></span></a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<i class="lni-menu"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav mr-auto w-100 justify-content-end">
				<li class="nav-item"><a class="nav-link page-scroll"
					href="friends.html">구독</a></li>
				<li class="nav-item"><a class="nav-link page-scroll"
					href="buddy.html">구인</a></li>
				<li class="nav-item"><a class="nav-link page-scroll"
					href="service.html">고객센터</a></li>
				<c:choose>
					<c:when test="${loginUserVO.userLogin == true}">
						<li class="nav-item"><a class="nav-link page-scroll"
							href="user/mypage">${loginUserVO.name} 님 마이페이지</a></li>
						<li class="nav-item"><a class="nav-link page-scroll"
							href="user/logout">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link page-scroll"
							href="user/login">로그인</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	</nav> </header>
	<!-- Header Section End -->


	<!-- Start Pricing Table Section -->
	<div id="pricing" class="section pricing-section">
		<div class="container" style="margin-top: 40px;">
			<div class="section-header">
				<h2 class="section-title">구독 상품을 확인해보세요</h2>
				<span></span>
				<p class="section-subtitle">합리적인 가격으로 만나는 구독 서비스</p>
			</div>

			<div class="row pricing-tables">
				<div class="col-lg-4 col-md-4 col-xs-12">
					<div class="pricing-table">
						<div class="pricing-details">
							<h2>스타터 구독</h2>
							<div class="price">
								3,900원 <br> <span>1개월</span>
							</div>
							<ul>
								<li>서비스 이용이 처음이신분들을 위해</li>
								<li>서비스를 가볍게 이용해보고 싶은 분들에게</li>
								<li>장기구독하기에는 부담스러운 분들에게</li>
								<li>월 이용료 3,900원에</li>
								<li>새로운 라이프스타일을 경험하세요.</li>
							</ul>
						</div>
						<div class="plan-button">
							<a href="order.html" class="btn btn-common btn-effect">구독하기</a>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-4 col-xs-12">
					<div class="pricing-table pricing-big">
						<div class="pricing-details">
							<h2>베스트 구독</h2>
							<div class="price">
								19,900원 <br> <span>6개월</span>
							</div>
							<ul>
								<li>BFree 최고의 상품</li>
								<li>편리함을 넘어 사회적 기여까지</li>
								<li>최고의 소비를</li>
								<li>6개월 이용료 19,900원에</li>
								<li>최고의 가격으로 만나보세요.</li>
							</ul>
						</div>
						<div class="plan-button">
							<a href="order.html" class="btn btn-common btn-effect">구독하기</a>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-4 col-xs-12">
					<div class="pricing-table">
						<div class="pricing-details">
							<h2>프리미엄 구독</h2>
							<div class="price">
								34,900원 <br> <span>1년</span>
							</div>
							<ul>
								<li>가장 길고, 가장 저렴하게</li>
								<li>1년간의 최고의 경험</li>
								<li>그 동안의 구독으로는 부족했던 분들에게</li>
								<li>1년 이용료 34,900월에</li>
								<li>가장 합리적인 가격으로 만나보세요.</li>
							</ul>
						</div>
						<div class="plan-button">
							<a href="order.html" class="btn btn-common btn-effect">구독하기</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- End Pricing Table Section -->

	<div class="container">
		<div class="row subimg">
			<div class="col-sm-12">
				<img src="/resources/img/friend/circle.png"
					style="max-width: 100%; height: auto; padding: 40px;">
			</div>
		</div>
	</div>


	<div class="container">
		<div class="panel-group" id="accordion">
			<div class="panel panel-default" style="padding-top: 50px;">
				<hr />
				<div class="panel-heading-two">
					<div class="row">
						<div class="col-md-6">
							<a class="accordion-toggle collapsed two" data-toggle="collapse"
								data-parent="#accordion" href="#collapseA"
								style="text-align: start;">리뷰 작성 시 주의 사항</a>
						</div>
						<div class="col-sm-6" style="text-align: end;">
							<a class="accordion-toggle collapsed button"
								data-toggle="collapse" data-parent="#accordion"
								href="#collapseA">▾</a>
						</div>
					</div>
				</div>
				<hr />
				<div id="collapseA" class="panel-collapse collapse">
					<div class="panel-body">
						상품 정보와 관계가 없는 비방과 욕설은 제재하겠습니다.<br> 불만사항 및 건의사항이 있다면 고객센터 혹은
						챗봇으로 상담 문의 주세요.
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="padding: 100px;">
		<div class="section-header">
			<h2 class="section-title">BFree 사용 리뷰</h2>
			<p class="section-subtitle">
				실제 BFree를 사용해보신 고객들이 작성해주셨어요.<br> <strong>숨김없이 날 것
					그대로!</strong>
			</p>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-6" style="padding-left: 100px;"></div>
			<!-- 세션이 있을 시 리뷰 작성 링크 뜨게 하기 -->
			<c:choose>
				<c:when test="${loginUserVO.userLogin == true}">
					<div class="col-md-6 writeLink">
						<a class="writeR" href="#form" data-toggle="modal"
							data-target="#form"> 리뷰 작성 </a>
					</div>
				</c:when>
			</c:choose>
			<br /> <br />
			<table class="table review">
				<c:forEach items="${list}" var="ReviewVO">
					<tr>
						<td>
							<div class="row">
								<div class="col-md-6 col-6 star">
									<c:forEach begin="1" end="${ReviewVO.star }">
										<span class="stars-outer1"></span>
									</c:forEach>
									<c:forEach begin="1" end="${5 - ReviewVO.star }">
										<span class="stars-outer"></span>
									</c:forEach>
								</div>
								<c:choose>
									<c:when test="${loginUserVO.email == ReviewVO.email}">
										<div class="col-md-6 col-6 buttonArea">
											<button type='button' class='btn-update' data-toggle="modal"
												data-target="#updateForm" value="${ReviewVO.id }"
												onclick="UpdateId(this);">리뷰 수정</button>
											<button type='button' class='btn-delete'
												value="${ReviewVO.id }" onclick="DeleteId(this);">리뷰
												삭제</button>
										</div>
									</c:when>
								</c:choose>
							</div>
							<div id="reviewContent">
								<c:out value="${ReviewVO.contents }" />
							</div>
							<div class="row">
								<div class="col-md-6 nameItem">
									<c:out value="${ReviewVO.userName }" />
									|
									<c:out value="${ReviewVO.subItem }" />
								</div>
								<div class="col-md-6 day" style="text-align: end;">
									<c:out value="${ReviewVO.creDate}" />
								</div>
								<!-- </td> -->
								<!-- <td> -->
							</div>
						</td>
					</tr>
				</c:forEach>
				<div class="w3-bar">
					<a href="#" class="w3-button">&laquo;</a> <a href="#"
						class="w3-button">1</a> <a href="#" class="w3-button">2</a> <a
						href="#" class="w3-button">3</a> <a href="#" class="w3-button">4</a>
					<a href="#" class="w3-button">&raquo;&raquo;</a>
				</div>
			</table>
		</div>
	</div>

	<div class="modal fade" id="updateForm" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="text-right cross">
					<i class="fa fa-times mr-2" data-dismiss="modal"></i>
				</div>
				<div class="card-body text-center">
					<img src="/resources/img/good.jpg" height="100" width="100">
					<div class="comment-box text-center">
						<p style="font-size: 25px; padding: 20px;">서비스에 만족하셨나요?</p>
						<form method="post" id="insert-form">
							<input type="hidden" id="userName" value="${loginUserVO.name}" />
							<input type="hidden" id="subItem" value="${loginUserVO.subEnd}" />
							<input type="hidden" id="star" />
							<div class="rating">
								<input type="radio" name="star" value="5" id="5"><label
									for="5">☆</label> <input type="radio" name="star" value="4"
									id="4"> <label for="4">☆</label> <input type="radio"
									name="star" value="3" id="3"> <label for="3">☆</label>
								<input type="radio" name="star" value="2" id="2"> <label
									for="2">☆</label> <input type="radio" name="star" value="1"
									id="1"> <label for="1">☆</label>
							</div>
							<div class="comment-area">
								<textarea class="form-control" id="contents" name="contents"
									placeholder="리뷰를 작성해주세요." rows="4"></textarea>
							</div>
							<div class="text-center mt-4">
								<button name="submit" type="button"
									class="btn btn-success send px-4" onclick="update();">
									수정 완료 <i class="fa fa-long-arrow-right ml-1"></i>
								</button>
								<button name="subBtn" type="button"
									class="btn btn-success send px-4" data-dismiss="modal">
									취소 <i class="fa fa-long-arrow-right ml-1"></i>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- <div class='RatingStar'>
    <div class='RatingScore'>
      <div class='outer-star'>
        <div class='inner-star'></div>
      </div>
    </div>
  </div> -->


	<!-- Footer Section Start -->
	<footer> <!-- Footer Area Start --> <section
		class="footer-Content">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="widget">
					<br>
					<h3 class="block-title">Bin-Free</h3>
					<ul class="contact-footer">
						<li><span>상호명 : 비트캠프 D풀이 | 사업자 등록번호 : 123-45-67890</span> <span>통신판매업
								신고번호 : 2021-서울서초-0524</span> <span>대표자 : D풀이 | 소재지 : 서울특별시 서초구
								강남대로 459(백암빌딩 구관)</span> <span>문의 : bitcamp@test.com</span></li>
						<li><span>Copyright©2021 BFree. All rights reserved.</span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</section> <!-- Footer area End --> <!-- Copyright Start  -->
	<div id="copyright">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="site-info float-left">
						<p>
							Crafted by <a href="#" rel="nofollow">D풀이</a>
						</p>
					</div>
					<div class="float-right">
						<ul class="nav nav-inline">
							<li class="nav-item"><a class="nav-link" href="#">이용안내</a></li>
							<li class="nav-item"><a class="nav-link" href="#">사업자정보확인</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="#">이용약관</a></li>
							<li class="nav-item"><a class="nav-link" href="#">개인정보처리방침</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Copyright End --> </footer>
	<!-- Footer Section End -->

	<!-- Go To Top Link -->
	<a href="#" class="back-to-top"> <i class="lni-arrow-up"></i>
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
	<script type="text/javascript" src="/resources/js/review.js"></script>

	<script>
		var id = '';
		var id2 = '';
		/* 		$('#btnDelete').click(function() {
		 alert("삭제가 완료되었습니다!");

		 })
		 */
		$('.starRev span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			return false;
		});

		/* var userScore = ${ReviewVO.star};
		userScore.change(function(){
			var userScoreNum = $(this).vale();
			
		}) */

		function UpdateId(object) {
			id = object.value;
		}

		function DeleteId(object) {
			id2 = object.value;
			Delete();
		}

		function Delete() {
			$.ajax({
				url : "/review/delete",
				type : "get",
				data : {
					'id' : id2
				},
				success : function(data) {
					alert("삭제가 완료되었습니다!");
					window.location.reload();
				}
			})
		}

		function update() {
			$('input[name="star"]').each(function() {
				if ($(this).prop('checked')) {
					$('#star').val(this.value);
				}
			});
			console.log(id);
			var star = $('#star').val();
			var contents = $('#contents').val();
			$.ajax({
				url : "/review/update",
				type : "post",
				data : {
					'id' : id,
					'star' : star,
					'contents' : contents,
				},
				success : function(data) {
					$('#modal').modal('hide');
					alert("수정이 완료되었습니다!");
					window.location.reload();

				},
				error : function(e) {
					console.log(e);
				}
			});
		}
	</script>





</body>

</html>