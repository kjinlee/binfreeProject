<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<script>
document.title = "BFamily 구독자 관리";
</script>

<!-- Contact Section Start -->
<section id="contact" class="section" >
	<div class="contact-form">
		<div class="container">
			<div class="row">
			
			<div class="col-lg-4 col-md-4 col-xs-12 adminpage">
			<a href="${pageContext.request.contextPath }/admin/bfamily/list">BFamily 구독자 관리</a>
			</div>
			
			<div class="col-lg-4 col-md-4 col-xs-12 adminpage" >
			<a href="${pageContext.request.contextPath }/admin/buddy/list" style="color: gray;" >Buddy 직원 관리</a>
			</div>
			
			<div class="col-lg-4 col-md-4 col-xs-12 adminpage" >
			<a href="${pageContext.request.contextPath }/admin/form/list" style="color: gray;">Buddy 지원자 이력서 관리</a>
			</div>
			
			</div>
			
			<div class="section-header">
				<h2 class="section-title">BFamily 구독자 관리</h2>
			</div>
			
			<div class="row">

				<c:forEach items="${bflist}" var="bflist">
					<div class="col-lg-4 col-md-4 col-xs-12">

						<div class="item-boxes">
							<div class="manage-form">
								회원번호 :
								<c:out value="${bflist.id }" />
								<br> - 회원 이름 :
								<c:out value="${bflist.name }" />
								<br> - 회원 연락처 :
								<c:out value="${bflist.phone }" />
								<br> - 회원 우편번호 :
								<c:out value="${bflist.zipCode }" />
								<br> - 회원 주소 :
								<c:out value="${bflist.loc }" />
								<c:out value="${bflist.inputLoc }" />
								<br> - 구독 장소의 거주자 이름 :
								<c:out value="${bflist.subName }" />
								<br> - 구독 장소 연락처 :
								<c:out value="${bflist.subPhone }" />
								<br> - 구독 상품 : 
								<c:out value="${bflist.subItem }" />
								<br> - 구독 시작 일 : 
								<c:out value="${bflist.subStart }" />
								<br> - 구독 종료 일 : 
								<c:out value="${bflist.subEnd }" />
								<br> - 담당 Buddy :
								<c:out value="${bflist.myBuddy }" />
								<hr>
							</div>
							<div class="btn-manage">
								<button data-oper='modify' class="btn btn-common" style="padding: 12px 21px;" value='<c:out value="${bflist.id}"/>'>수정</button>
								<button data-oper='remove' class="btn btn-common" style="padding: 12px 21px;" value='<c:out value="${bflist.id}"/>'>삭제</button>
							</div>

							<form id='operForm<c:out value="${bflist.id}"/>' action="${pageContext.request.contextPath }/admin/bfamily/bfamilyModify" method="get">
								<input type='hidden' id='id<c:out value="${bflist.id}"/>' name='id' value='<c:out value="${bflist.id}"/>'>
								<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
								<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
								<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }"/>'>
								<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</form>
							
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- row end -->
			
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

					<form id="actionForm" action="${pageContext.request.contextPath }/admin/bfamily/list" method="get">
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
					<form id='search' action="${pageContext.request.contextPath }/admin/bfamily/list" method="get">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<select name="type"
									style="width: 135px; padding: 15px 15px 15px 25px; border-radius: 30px 0 0 30px; border: none; background: #f5f5f5; display: flex; justify-content: center;">
									<div class="dropdown-menu">
										<option value=""
											<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>전체</option>
										<option value="I"
											<c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>회원번호</option>
										<option value="NS"
											<c:out value="${pageMaker.cri.type eq 'NS'?'selected':''}"/>>이름</option>
										<option value="LT"
											<c:out value="${pageMaker.cri.type eq 'LT'?'selected':''}"/>>주소</option>
										<option value="M"
											<c:out value="${pageMaker.cri.type eq 'M'?'selected':''}"/>>담당 Buddy</option>
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

	$("button[data-oper='modify']").on("click", function(e){
		$("#operForm" + this.value).submit();
	});

	$("button[data-oper='remove']").on("click", function(e){
		
		if(confirm("정말로 삭제하시겠습니까?")){
			$("#operForm" + this.value).attr("action", "${pageContext.request.contextPath }/admin/bfamily/remove").attr("method", "post").submit();
			alert("회원번호 " + this.value + "번이 삭제되었습니다.");
		}else{
			
		}
	});
	
	
	var actionForm = $("#actionForm");
	
	$(".page_nation a").on("click", function(e){
		e.preventDefault();
		console.log("click");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
});
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

