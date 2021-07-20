<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE web-app PUBLIC
 "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
 "http://java.sun.com/dtd/web-app_2_3.dtd" >
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="keywords"
	content="Bootstrap, Landing page, Template, Registration, Landing">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="author" content="Grayrids">

<title>리뷰 게시판</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/review.css">
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css' />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 



</head>
<body>
	
	<div class="container" style="padding:60px 0 25px 0;">
		<div class="section-header">
			<h2 class="section-title">BFree 사용 리뷰</h2>
			<p class="section-subtitle">
				실제 BFree를 사용해보신 고객들이 작성해주셨어요.
			</p>
		</div>
	</div> 

	<div class="container">
		<div class="row">
			<div class="col-6" style="padding-top: 3%;">
				<!-- 별점 평균 제목 -->
				<div class="rateTitle">
					<span class="sum" style="color: #0a8a8a; font-size: 22px;"><c:out value="${pageMaker.total }" /></span>명의
					BFree 회원이 평가한 평균별점
				</div>

				<!-- 별점 평균 출력 -->
				<!-- 별 출력 -->
				<div class="star-area">
					<div class="stars-outer rate">
						<div class="stars-inner rate"></div>
					</div>
					<span class="sum" style="color: #0a8a8a;"> <c:out value="${starSum}" />
					</span> <span class="total" >/ 5.0</span> <input type="hidden"
						value="${starSum}" id="reviewRate" />
				</div>

				<!-- 평균 점수 출력 -->
				<div class="col-4 rateNum"></div>
			</div>


			<div class="col-6">
				<div class="col-10">
					<!-- 별점별 개수 저장 -->
					<c:forEach items="${starNum}" var="list">
						<input type="hidden" value="${list.five}" id="five" />
						<input type="hidden" value="${list.four}" id="four" />
						<input type="hidden" value="${list.three}" id="three" />
						<input type="hidden" value="${list.two}" id="two" />
						<input type="hidden" value="${list.one}" id="one" />
						<div class="rating-right-part">
							<p>
								<i aria-hidden="true" class="fa fa-star"></i> 5점 <i
									style="padding-left: 74%;">${list.five}</i>
							</p>
							<div class="progress5">
								<div class="progress5After"></div>
							</div>
						</div>
						<div class="rating-right-part">
							<p>
								<i aria-hidden="true" class="fa fa-star"></i> 4점 <i
									style="padding-left: 74%;">${list.four}</i>
							</p>
							<div class="progress4">
								<div class="progress4After"></div>
							</div>
						</div>
						<div class="rating-right-part">
							<p>
								<i aria-hidden="true" class="fa fa-star"></i> 3점 <i
									style="padding-left: 74%;">${list.three}</i>
							</p>

							<div class="progress3">
								<div class="progress3After"></div>
							</div>
						</div>
						<div class="rating-right-part">
							<p>
								<i aria-hidden="true" class="fa fa-star"></i> 2점 <i
									style="padding-left: 74%;">${list.two}</i>
							</p>

							<div class="progress2">
								<div class="progress2After"></div>
							</div>
						</div>
						<div class="rating-right-part">
							<p>
								<i aria-hidden="true" class="fa fa-star"></i> 1점 <i
									style="padding-left: 74%;">${list.one}</i>
							</p>

							<div class="progress1">
								<div class="progress1After"></div>
							</div>

						</div>
						<div style="clear: both;"></div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>



	<div class="container list">
		<div class="row">
			<div class="col-md-6" style="padding-left: 100px; padding-top: 80px;"></div>
			<!-- 세션이 있을 시 리뷰 작성 링크 뜨게 하기 -->
			<sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_KAKAO')">
				<div class="col-md-6 writeLink" style="padding-top: 80px;">
					<a class="writeR" href="#myModal" data-toggle="modal"
						data-target="#myModal"> 리뷰 작성 </a>
				</div>
			</sec:authorize>

			<table class="table review">
				<thead>
					<tr>
						<div class="container">
							<div class="panel-group" id="accordion" style="">
								<div class="panel panel-default">
									<hr />
									<div class="panel-heading-two">
										<div class="row">
											<div class="col-md-6">
												<a class="accordion-toggle collapsed two"
													data-toggle="collapse" data-parent="#accordion"
													href="#collapseA" style="text-align: start;">리뷰 작성 시 주의
													사항</a>
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
											상품 정보와 관계가 없는 비방과 욕설은 제재하겠습니다.<br> 불만사항 및 건의사항이 있다면 고객센터
											혹은 챗봇으로 상담 문의 주세요.
										</div>
									</div>
								</div>
							</div>
						</div>
					</tr>
				</thead>
				<c:forEach items="${list}" var="ReviewVO">
					<tr>
						<td class="reviewList">
							<div class="row">
								<div class="col-md-6 col-6 star">
									<c:forEach begin="1" end="${ReviewVO.star }">
										<span class="stars-outer1"></span>
									</c:forEach>
									<c:forEach begin="1" end="${5 - ReviewVO.star }">
										<span class="stars-outer"></span>
									</c:forEach>
								</div>
								<c:if test="${ReviewVO.email == email }">
									<div class="col-md-6 col-6 buttonArea">
										<button type='button' class='btn-update' data-toggle="modal"
											data-target="#form" value="${ReviewVO.id }"
											onclick="UpdateId(this);">리뷰 수정</button>
										<button type='button' class='btn-delete'
											value="${ReviewVO.id }" onclick="DeleteId(this);">리뷰
											삭제</button>
									</div>
								</c:if>

								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<div class="col-md-6 col-6 buttonArea">
										<button type='button' class='btn-update' data-toggle="modal" 
											data-target="#form" value="${ReviewVO.id }"
											onclick="UpdateId(this);">리뷰 수정</button>
										<button type='button' class='btn-delete'
											value="${ReviewVO.id }" onclick="DeleteId(this);">리뷰
											삭제</button>
									</div>
								</sec:authorize>
							</div>
							<div id="reviewContent">
								<c:out value="${ReviewVO.contents }" />
							</div>
							<div class="row">
								<div class="col-md-6 nameItem">
									<!-- 이름 마스킹 -->
									<c:if test="${ReviewVO.userName ne null && ReviewVO.userName!=''}">
									${fn:substring(ReviewVO.userName,0,fn:length(ReviewVO.userName)-1)}*</c:if>
									|
									<c:out value="${ReviewVO.subItem }" />
								</div>
								<div class="col-md-6 day" style="text-align: end;">
									<c:out value="${ReviewVO.creDate}" />
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="container">
			<div class="row">
				<div class="pagination justify-content-center">
					<span class="pagination-inner"> 
					
					<!-- 이전페이지 버튼 -->
					 <c:if test="${pageMaker.prev}">
							<a class="pagination-newer" href="${pageMaker.startPage-1}"> ◀︎︎ </a>
						</c:if> 
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<a href="${num}">${num}</a>
						</c:forEach> 
						<!-- 다음페이지 버튼 --> 
						<c:if test="${pageMaker.next}">
							<a class="pagination-older" href="${pageMaker.endPage+1}"> ▶ </a>
						</c:if>
					</span>
				</div>
			</div>
		</div>

		<form id="moveForm" action="${pageContext.request.contextPath }/subscribe/main" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		</form>

	</div>
	
	
	
	
	<!-- 수정 모달 -->
	<div class="modal fade" id="form" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="text-right cross">
					<i class="fa fa-times mr-2" data-dismiss="modal"></i>
				</div>
				<div class="card-body text-center">
					<img src="${pageContext.request.contextPath }/resources/img/good.jpg" height="100" width="100">
					<div class="comment-box text-center">
						<p style="font-size: 25px; padding: 20px;">리뷰를 수정하시겠습니까?</p>
							
							<!-- 별 -->
							<input type="hidden" id="star" />
							<div class="rating">
								<input type="radio" name="star" value="5" id="5">
								<label for="5">☆</label> 
								<input type="radio" name="star" value="4" id="4"> 
								<label for="4">☆</label> 
								<input type="radio" name="star" value="3" id="3"> 
								<label for="3">☆</label>
								<input type="radio" name="star" value="2" id="2"> 
								<label for="2">☆</label> 
								<input type="radio" name="star" value="1" id="1"> 
								<label for="1">☆</label>
							</div>
							
							<!-- 리뷰 작성란 -->
							<div class="comment-area">
								<textarea class="form-control" id="contents" name="contents"
									placeholder="리뷰를 수정해주세요." rows="4"></textarea>
							</div>
							
							
							
							
							
							
							<!-- 버튼 -->
							<div class="text-center mt-4">
								<button name="submit" type="button"
									class="btn btn-success send px-4" onclick="update();">
									수정 완료 
								</button>
								<button name="subBtn" type="button"
									class="btn btn-success send px-4" data-dismiss="modal">
									취소 
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	

	<!-- 리뷰 작성 모달 -->
	<div class="modal" id="myModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<p class="modal-title" style="font-size: 20px;">리뷰 작성 안내</p>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;">
				<br/>
				<p style="font-size: 17px;">마이페이지 > 구독정보 하단에서<br/> <strong>'구독 리뷰 작성 버튼'</strong>을 통해 작성 가능합니다.</p>
				<br/>
				</div>
				<div class="modal-footer justify-content-center">
				<div class="plan-button">
				<input type="button" class="btn btn-common btn-effect" onclick="goMypage();" value="마이페이지">
				<input type="button" class="btn btn-common btn-effect" data-dismiss="modal" value="취소">
				</div>
			
				</div>
			</div>
		</div>
	</div>
	
	<!-- PC 카카오톡 상담 버튼 -->
	<%@ include file="/WEB-INF/views/includes/kakaochat.jsp"%>
	
	<%-- <%@ include file="/WEB-INF/views/includes/footer.jsp"%> --%>

	<script type="text/javascript" src="/resources/js/review.js"></script>


	<script>
		var id = '';
		var id2 = '';

		/* 페이징 */
		$(document).ready(function() {
			var moveForm = $('#moveForm');

			$(".pagination-inner a").on( "click", function(e) {
				console.log("찍힘")
				e.preventDefault();
				moveForm.find("input[name='pageNum']").val(
				$(this).attr("href"));
				//moveForm.attr("action", "/review/list");
				moveForm.submit();

							});
				});


		/* 삭제할 리뷰 아이디값 찾기 */
		function DeleteId(object) {
			id2 = object.value;
			if (confirm("정말 삭제하시겠습니까?") == true){    //확인
				Delete();
			}else{   
			    return;
			}
		}

		/* 리뷰 삭제 */
		function Delete() {
			$.ajax({
				url : "${pageContext.request.contextPath }/review/delete",
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

		/* 수정할 리뷰 아이디값 찾기 */
		function UpdateId(object) {
			id = object.value;
		}
		
		
		/* 리뷰 수정 */
		function update() {
			$('input[name="star"]').each(function() {
				if ($(this).prop('checked')) {
					$('#star').val(this.value);
				}
			});
			
			console.log(id);
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			
			var star = $('#star').val();
			var contents = $('#contents').val();
			
			$.ajax({
				url : "${pageContext.request.contextPath }/review/update",
				method : "post",
				beforeSend : function(xhr) {
					/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					xhr.setRequestHeader(header, token);
				},
				data : {
					'id' : id,
					'star' : star,
					'contents' : contents,
				}, 
				success : function(data) {
					$('#modal').modal('hide');
					alert("수정이 완료되었습니다!");
					window.location.reload();

				}
				
			});
		}
		
		function goMypage(){
			self.location = "${pageContext.request.contextPath }/user/mypage";
		}

		// 별점 평균별로 별 색깔 변하기

		// 처음 별점
		const ratings = $("#reviewRate").val();
		console.log(ratings);
		// 총 별점
		const starsTotal = 5;

		// 돔이 로딩될때 가져온 별
		document.addEventListener('DOMContentLoaded', getRatings);

		// 가져온 별점
		function getRatings() {
			/* for(let rating in ratings){ */
			// 별점 평균 메기기
			const starPercentage = (ratings / starsTotal) * 100;
			console.log(starPercentage);

			// 10에 가까운 것
			/* const starPercentageRounded = `${Math.round(starPercentage / 10) * 10}%`; */
			console.log(Math.round(starPercentage / 10));
			const starPercentageRounded = Math.round(starPercentage / 10) * 10
					+ '%';
			console.log(starPercentageRounded);

			// 별 세팅하기
			document.querySelector(`.rate.stars-inner.rate`).style.width = starPercentageRounded;
		}

		// 별점별 개수에 따른 퍼센테이지 계산

		// 처음 별점
		var progress5 = $('#five').val();
		var progress4 = $('#four').val();
		var progress3 = $('#three').val();
		var progress2 = $('#two').val();
		var progress1 = $('#one').val();

		document.addEventListener('DOMContentLoaded', Ratings);

		function Ratings() {
			document.querySelector(`.progress5After`).style.width = progress5;
			document.querySelector(`.progress4After`).style.width = progress4;
			document.querySelector(`.progress3After`).style.width = progress3;
			document.querySelector(`.progress2After`).style.width = progress2;
			document.querySelector(`.progress1After`).style.width = progress1;
		}

		$('.pagination-inner a').on('click', function() {
			$(this).siblings().removeClass('pagination-active');
			$(this).addClass('pagination-active');
		})
		
	</script>
</body>
</html>