<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>


<!-- Contact Section Start -->
<section id="contact" class="section" style="margin-top: 100px;">
	<div class="contact-form">
		<div class="container">
			<div class="section-header">
				<h2 class="section-title">Buddy 관리 페이지</h2>
			</div>
			<div class="row">


				<c:forEach items="${list}" var="buddy">
					<div class="col-lg-4 col-md-4 col-xs-12">

						<div class="item-boxes">
							<img src="../resources/img/buddy/<c:url value="${buddy.pic}"/>"
								class="per-pic" style="width: 100%; height= auto;">
							<div class="manage-form">
								<hr>
								지원번호 :
								<c:out value="${buddy.id }" />
								<br> 이름 :
								<c:out value="${buddy.name }" />
								<br> Buddy 채용날짜 :
								<fmt:formatDate pattern = "yyyy-MM-dd" value="${buddy.passDate }" />
								<br> 연락처 :
								<c:out value="${buddy.phone }" />
								<br> 우편번호 :
								<c:out value="${buddy.zipCode }" />
								<br> 주소 :
								<c:out value="${buddy.loc }" />
								<c:out value="${buddy.inputLoc }" />
								<br> 담당 지역 :
								<c:out value="${buddy.servLoc }" />
								<hr>
							</div>
							<div class="btn-manage">
								<button data-oper='modify' class="btn btn-common" value='<c:out value="${buddy.id}"/>'>수정</button>
								<button data-oper='remove' class="btn btn-common" value='<c:out value="${buddy.id}"/>'>삭제</button>
							</div>
							<form id='operForm<c:out value="${buddy.id}"/>' action="/buddy/modify" method="get">
								<input type='hidden' id='id<c:out value="${buddy.id}"/>' name='id' value='<c:out value="${buddy.id}"/>'>
								<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
								<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
							</form>
						</div>
					</div>
				</c:forEach>

				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal Title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">close</button>
								<button type="button" class="btn btn-primary">Save
									Changes</button>
							</div>
						</div>
					</div>
				</div>
				<!-- end Modal -->

			</div>
			<!-- row end -->

			<!-- paging start -->
			<div class="col-lg-12 col-md-12 col-xs-12">
				<div class="paging">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous">	
								<a href="${pageMaker.startPage -1}">◁ 이전</a>
							</li>
						</c:if>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						 <li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
						 <a href="${num}">${num}</a></li>
						 &nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next">	
								<a href="${pageMaker.endPage +1 }">다음 ▷</a>
							</li>
						</c:if>	
					</ul>
				</div>
				
				<form id="actionForm" action="/buddy/list" method="get">
					<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
					<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
				</form>	
				<!-- paging end -->
			
			</div>
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
		$("#operForm" + this.value).attr("action", "/buddy/remove").attr("method", "post").submit();
	});
	
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		console.log("click");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
});
</script>

<%@ include file="../includes/footer.jsp"%>