<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<script>
   document.title = "Buddy 직원 관리";
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
               <a href="${pageContext.request.contextPath }/admin/buddy/list">Buddy 직원 관리</a>
            </div>

            <div class="col-lg-4 col-md-4 col-xs-12 adminpage">
               <a href="${pageContext.request.contextPath }/admin/form/list" style="color: gray;">Buddy 지원자 이력서
                  관리</a>
            </div>

         </div>

         <div class="section-header">
            <h2 class="section-title">Buddy 직원 관리</h2>
         </div>
         <div class="row">


            <c:forEach items="${list}" var="buddy">
               <div class="col-lg-4 col-md-4 col-xs-12">

                  <div class="item-boxes">
                     <img src="${pageContext.request.contextPath }/resources/img/buddy/<c:url value="${buddy.pic}"/>"
                        class="per-pic" style="width: 100%;">
                     <div class="manage-form">
                        <hr>
                        Buddy 번호 :
                        <c:out value="${buddy.id }" />
                        <br> 이름 :
                        <c:out value="${buddy.name }" />
                        <br> Buddy 채용날짜 :
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${buddy.passDate }" />
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
                        <button data-oper='modify' class="btn btn-common"
                           style="padding: 12px 21px;" value='<c:out value="${buddy.id}"/>'>수정</button>
                        <button data-oper='remove' class="btn btn-common"
                           style="padding: 12px 21px;" value='<c:out value="${buddy.id}"/>'>삭제</button>
                        <button data-oper='withbfamily' class="btn btn-common"
                           style="padding: 12px 21px;" value='<c:out value="${buddy.id}"/>'>현황</button>
                     </div>
                     <form id='operForm<c:out value="${buddy.id}"/>'
                        action="${pageContext.request.contextPath }/admin/buddy/modify" method="get">
                        <input type='hidden' id='id<c:out value="${buddy.id}"/>' name='id' value='<c:out value="${buddy.id}"/>'>
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
         <br>

         <div class="row">
            <!-- paging start -->
            <div class="col-lg-12 col-md-12 col-xs-12">
               <div class="page_warp">
                  <div class="page_nation">
                     <c:if test="${pageMaker.prev}">
                        <a class="arrow prev" href="${pageMaker.startPage -1}"></a>
                     </c:if>
                     <c:forEach var="num" begin="${pageMaker.startPage}"
                        end="${pageMaker.endPage}">
                        <a href="${num}" class="${pageMaker.cri.pageNum == num ? "active":""} ">${num}</a>
                     </c:forEach>
                     <c:if test="${pageMaker.next}">
                        <a class="arrow next" href="${pageMaker.endPage +1 }"></a>
                     </c:if>
                  </div>
               </div>

               <form id="actionForm" action="${pageContext.request.contextPath }/admin/buddy/list" method="get">
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
               <form id='search' action="${pageContext.request.contextPath }/admin/buddy/list" method="get">
                  <div class="input-group mb-3">
                     <div class="input-group-prepend">
                        <select name="type"
                           style="width: 135px; padding: 15px 15px 15px 25px; border-radius: 30px 0 0 30px; border: none; background: #f5f5f5; display: flex; justify-content: center;">
                           <div class="dropdown-menu">
                              <option value=""
                                 <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>모두</option>
                              <option value="I"
                                 <c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>Buddy 번호</option>
                              <option value="N"
                                 <c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>이름</option>
                              <option value="L"
                                 <c:out value="${pageMaker.cri.type eq 'L'?'selected':''}"/>>담당지역</option>
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
   $(document).ready(
         function() {

            $("button[data-oper='modify']").on("click", function(e) {
               $("#operForm" + this.value).submit();
            });
            
            $("button[data-oper='withbfamily']").on(
                    "click",
                    function(e) {
                       $("#operForm" + this.value).attr("action", "${pageContext.request.contextPath }/admin/buddy/withbfamily").
                       attr("method", "get").submit();
                    });

            $("button[data-oper='remove']").on(
                  "click",
                  function(e) {
                     if(confirm("정말로 삭제하시겠습니까?")){
                        $("#operForm" + this.value).attr("action",
                              "${pageContext.request.contextPath }/admin/buddy/remove").attr("method",
                              "post").submit();
                        alert("Buddy 번호 " + this.value + "번이 삭제되었습니다.");
                     }else{
                        
                     }
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