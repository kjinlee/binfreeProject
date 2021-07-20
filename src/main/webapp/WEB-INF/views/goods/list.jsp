<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

<title>굿즈</title>


</head>
<body>
	<!-- Header Section Start -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<br>
	<br>

	
		  <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel" style="width:100%;" >
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active" >
              <img class="d-block img-fluid" src="${pageContext.request.contextPath }/resources/img/goods/main3.png" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="${pageContext.request.contextPath }/resources/img/goods/event 2.png" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="${pageContext.request.contextPath }/resources/img/goods/main2.png" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
    
    <br>
    <br>
    <br>
    <br>
    <div class="sub-title text-center">
   		<h3> Goods List </h3>
   	</div>
    <br>
    <br>
    <br>
    

	<div class="container col-lg-10">
        <div class="row" >
		<c:forEach items="${list }" var="goods">
          <div class=" col-md-4 " style="margin-bottom:50px;" >
            <div class="card h-100">
              <a href="${pageContext.request.contextPath }/goods/info?id=${goods.id }">
              <img class="card-img-top" src="${pageContext.request.contextPath }/resources/img/goods/${goods.pic}" style="width:100%; height:369px;">
              </a>
           	  <div class="card-body">
              
                  <a href="${pageContext.request.contextPath }/goods/info?id=${goods.id }" style ="font-color : black"><c:out value="${goods.goodsName }" /></a>
                <br>
                <p class="card-text"><c:out value="${goods.subName }" /></p>
              </div>
            </div>
          </div>
          
		</c:forEach>
		
        </div>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div class="plan-button" style="text-aligh: end;">
			<a href="/goods/form">
			
				<input type="button" value="상품 등록" class="btn btn-common btn-effect sub">
				
			</a>
		</div>
		</sec:authorize>
      </div>
    

	<div class="container">
		<div class="row">
			<div class="pagination justify-content-center">
				<span class="pagination-inner"> <!-- 이전페이지 버튼 --> <c:if
						test="${pageMaker.prev}">
						<a class="pagination-newer" href="${pageMaker.startPage-1}">
							◀︎︎ </a>
					</c:if> <c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<a href="${num}">${num}</a>
					</c:forEach> <!-- 다음페이지 버튼 --> <c:if test="${pageMaker.next}">
						<a class="pagination-older" href="${pageMaker.endPage+1}"> ▶ </a>
					</c:if>
				</span>
			</div>
	</div>

	<form id="moveForm" action="${pageContext.request.contextPath }/goods/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	</form>

	</div>
	
	<!-- PC 카카오톡 상담 버튼 -->
	<%@ include file="/WEB-INF/views/includes/kakaochat.jsp"%>


	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>



</body>

<script type="text/javascript">
$(document).ready(function() {
	var moveForm = $('#moveForm');

	$(".pagination-inner a").on( "click", function(e) {
		console.log("찍힘")
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val(
		$(this).attr("href"));
		moveForm.submit();

					});
		});
	

</script>


</html>