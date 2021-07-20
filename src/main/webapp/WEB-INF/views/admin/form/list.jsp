<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<script>
	document.title = "Buddy 지원자 이력서 관리";
</script>

<!-- Contact Section Start -->
<section id="contact" class="section">
	<div class="contact-form">
		<div class="container">

			<div class="row">

				<div class="col-lg-4 col-md-4 col-xs-12 adminpage">
					<a href="${pageContext.request.contextPath }/admin/bfamily/list" style="color: gray;">BFamily 구독자
						관리</a>
				</div>

				<div class="col-lg-4 col-md-4 col-xs-12 adminpage">
					<a href="${pageContext.request.contextPath }/admin/buddy/list" style="color: gray;">Buddy 직원 관리</a>
				</div>

				<div class="col-lg-4 col-md-4 col-xs-12 adminpage">
					<a href="${pageContext.request.contextPath }/admin/form/list">Buddy 지원자 이력서 관리</a>
				</div>

			</div>

			<div class="section-header">
				<h2 class="section-title">Buddy 지원자 이력서 관리</h2>
			</div>

			<div class="row">


				<c:forEach items="${list}" var="form">
					<div class="col-lg-4 col-md-4 col-xs-12">

						<div class="item-boxes">
							<img src="${pageContext.request.contextPath }/resources/img/buddy/<c:url value="${form.pic}"/>"
								class="per-pic" style="width: 100%;">
							<div class="manage-form">
								<hr>
								지원번호 :
								<c:out value="${form.id }" />
								<br> 이름 :
								<c:out value="${form.name }" />
								<br> 지원일 :
								<fmt:formatDate pattern="yyyy-MM-dd" value="${form.appDate }" />
								<br> 지원서 수정일 :
								<fmt:formatDate pattern="yyyy-MM-dd" value="${form.updateDate }" />
								<br> 연락처 :
								<c:out value="${form.phone }" />
								<br> 우편번호 :
								<c:out value="${form.zipCode }" />
								<br> 주소 :
								<c:out value="${form.loc }" />
								<c:out value="${form.inputLoc }" />
								<br> 담당하고 싶은 지역 :
								<c:out value="${form.servLoc }" />
								<hr>
							</div>
							<div class="btn-manage">
								<button data-oper='modify' class="btn btn-common"
									style="padding: 12px 21px;" value='<c:out value="${form.id}"/>'>수정</button>
								<button data-oper='remove' class="btn btn-common"
									style="padding: 12px 21px;" value='<c:out value="${form.id}"/>'>삭제</button>
								<button data-oper='buddyRegister' class="btn btn-common"
									style="padding: 12px 21px;" value='<c:out value="${form.id}"/>'>채용</button>
							</div>
							<form id='operForm<c:out value="${form.id}"/>'
								action="${pageContext.request.contextPath }/admin/form/modify" method="get">
								<input type='hidden' name='id' value='<c:out value="${form.id}"/>'>
								<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
								<input type="hidden" name="amount"	value='${pageMaker.cri.amount}'> 
								<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }"/>'>
								<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</form>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- list row end -->
			<br>

			<div class="row">
				<!-- paging start -->
				<div class="col-lg-12 col-md-12 col-xs-12">
					<div class="page_warp">
						<div class="page_nation">
							<c:if test="${pageMaker.prev}">
								<a class="arrow prev" href="${pageMaker.startPage -1}"></a>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<a href="${num}" class="${pageMaker.cri.pageNum == num ? "active":""} ">${num}</a>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<a class="arrow next" href="${pageMaker.endPage +1 }"></a>
							</c:if>
						</div>
					</div>

					<form id="actionForm" action="${pageContext.request.contextPath }/admin/form/list" method="get">
						<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'> 
						<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
						<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }"/>'>
						<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
					</form>
					<!-- paging end -->

				</div>
			</div>
			<!-- paging row end -->
			<br>
			<br>

			<div class="row">
				<div class="col-lg-3 col-md-3"></div>
				<div class="search-box col-lg-6 col-md-6 col-xs-12">
					<form id='search' action="${pageContext.request.contextPath }/admin/form/list" method="get">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<select name="type"
									style="width: 118px; padding: 15px 15px 15px 25px; border-radius: 30px 0 0 30px; border: none; background: #f5f5f5; display: flex; justify-content: center;">
									<div class="dropdown-menu">
										<option value=""
											<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>전체</option>
										<option value="I"
											<c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>지원번호</option>
										<option value="N"
											<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>이름</option>
										<option value="L"
											<c:out value="${pageMaker.cri.type eq 'L'?'selected':''}"/>>지원지역</option>
									</div>
								</select>
							</div>
							<input type="text" class="form-control" name="keyword" aria-label="Search input with dropdown button" value="${pageMaker.cri.keyword }">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
							<div class="input-group-append">
								<button class="btn btn-common btn-effect">검색</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- Search row End -->
			<br>

		</div>
	</div>
</section>
<!-- Contact Section End -->



<script type="text/javascript">
	$(document).ready(function() {
		$("button[data-oper='modify']").on("click", function(e) {
			$("#operForm" + this.value).submit();
		});
			$("button[data-oper='remove']").on("click",function(e) {
				if(confirm("정말로 삭제하시겠습니까?")){
				$("#operForm" + this.value).attr("action","${pageContext.request.contextPath }/admin/form/remove")
				.attr("method", "post").submit();
				alert("지원번호 " + this.value + "번이 삭제되었습니다.");								
				}else{
					
				}
			});
			$("button[data-oper='buddyRegister']").on("click",function(e) {
				$("#operForm" + this.value).attr("action","${pageContext.request.contextPath }/admin/form/buddyRegister")
				.attr("method","get").submit();
			});

			var actionForm = $("#actionForm");

			$(".page_nation a").on("click",function(e) {
				e.preventDefault();
				console.log("click");
				actionForm.find("input[name='pageNum']").val(
				$(this).attr("href"));
				actionForm.submit();
			});

			var search = $("#search");

				$("#search button").on("click", function(e) {
					search.find("input[name='pageNum']").val("1");
					e.preventDefault();
					search.submit();
				});
			});
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
