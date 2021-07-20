<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!-- Contact Section Start -->
  <section id="contact" class="section" style="margin-top: 40px;">
    <div class="contact-form">
      <div class="container">
        <div class="section-header">
          <h2 class="section-title">담당 BFamily 현황</h2>
          <p class="section-subtitle"><br></p>
        </div>
        <div class="row">
          <div class="col-lg-12 col-md-12 col-xs-12">
              <!-- Div using .table-responsive class-->  
              <div class="table-responsive">  
                  <!--Bootstrap Table using .table class-->  
                  <table class="table">  
                      <thead>  
                          <tr>  
                              <th>No.</th>  
                              <th>구독자</th>  
                              <th>연락처</th>  
                              <th>시군구</th>
                              <th>상세주소</th>
                          </tr>  
                      </thead>  
                      <tbody>
                      	<c:forEach items="${list }" var="bflist" varStatus="status">
                          <tr>  
                              <c:set var="curPage" value="${pageMaker.cri.pageNum}"/>
                              <c:set var="amount" value="${pageMaker.cri.amount}"/>
                              <td><c:out value="${(total-status.index) -((curPage-1) * amount)}"/></td>  
                              <td><c:out value="${bflist.subName }"/></td>  
                              <td><c:out value="${bflist.subPhone }"/></td>  
                              <td><c:out value="${bflist.loc }"/></td>
                              <td><c:out value="${bflist.inputLoc }"/></td>
                          </tr>
                        </c:forEach>  
                      </tbody>  
                  </table>
		    <!-- paging start -->
                  <br/><br/>
                  <%-- <div class="paging">
                  <ul class="pagination" style="justify-content: center;">
                     <c:if test="${pageMaker.prev}">
                        <li class="paginate_button previous"><a
                           href="${pageMaker.startPage -1}">◁ 이전</a></li>
                     </c:if>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
                     <c:forEach var="num" begin="${pageMaker.startPage}"
                        end="${pageMaker.endPage}">
                        <li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
                           <a href="${num}">${num}</a>
                        </li>
                   &nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
                  </c:forEach>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <c:if test="${pageMaker.next}">
                        <li class="paginate_button next"><a href="${pageMaker.endPage +1 }">다음 ▷</a></li>
                     </c:if>
                  </ul>
		             <form id="actionForm" action="/admin/buddy/withbfamily" method="get">
		                <input type="hidden" name="id" value='<c:out value="${id }"/>'/>
		                <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"/>'/> 
		                <input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }"/>'/>
		            </form>
             </div> --%>
          </div>
        </div>
      </div>
    </div>
    </div>
   <!-- paging end -->
   
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

               <form id="actionForm" action="${pageContext.request.contextPath }/admin/buddy/withbfamily" method="get">
               	  <input type="hidden" name="id" value='<c:out value="${id }"/>'/>
                  <input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'> 
                  <input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
               </form>
               <!-- paging end -->

            </div>
        </div> 
   <!-- searchbar start -->
  <br/><br/><br/><br/>
  <div class="row">
  <div class="col-lg-4 col-md-4"></div>
            <div class="col-lg-8 col-md-8 col-xs-12">
    <div class="search-box col-md-6">               
        <form id="searchForm" action="${pageContext.request.contextPath }/admin/buddy/withbfamily" method="get">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                <select name="type" style="width: 118px; padding: 15px 15px 15px 25px; border-radius: 30px 0 0 30px; border: none; background: #f5f5f5; display: flex; justify-content: center;">
                    <div class="dropdown-menu" >
                      <%-- <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>></option> --%>
                      <option value="ALL" <c:out value="${pageMaker.cri.type eq 'ALL'?'selected':'' }"/>>전체</option>
                      <option value="N" <c:out value="${pageMaker.cri.type eq 'N'?'selected':'' }"/>>구독자</option>
                      <option value="P" <c:out value="${pageMaker.cri.type eq 'P'?'selected':'' }"/>>연락처</option>
                      <option value="L" <c:out value="${pageMaker.cri.type eq 'L'?'selected':'' }"/>>시군구</option>    
                      <option value="I" <c:out value="${pageMaker.cri.type eq 'I'?'selected':'' }"/>>상세주소</option>    
                      <!-- <a class="dropdown-item" href="#"> -->                 
                    </div>
                </select>
                </div>
                <input type="text" class="form-control" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>' aria-label="Search input with dropdown button" />
                <input type="hidden" name="id" value='<c:out value="${id }"/>'/>
                <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"/>'/> 
                <input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount }"/>'/>
                <div class="input-group-append">
                    <button class="btn btn-common btn-effect">검색</button>
                </div>
            </div>
        </form>        
    </div>
  </div>
  </div>
    <br/><br/><br/><br/><br/><br/>
   <!-- searchbar end  -->   
    
  </section>
  <!-- Contact Section End -->

    
	
<script type="text/javascript">
   $(document).ready(
         function() {

            var actionForm = $("#actionForm");

            $(".page_nation a").on("click", function(e) {
                     e.preventDefault();
                     console.log("click");
                     actionForm.find("input[name='pageNum']").val($(this).attr("href")); 
                     actionForm.submit();
                  });
            
            var searchForm = $("#searchForm");
            
            $("#searchForm button").on("click", function(e) {
               	if(!searchForm.find("option:selected").val()){
               		alert("검색 종류를 선택하세요.")
               		return false;
               	}
               	if(!searchForm.find("input[name='keyword']").val()){
               		alert("검색단어를 입력하세요.")
               		return false;
               	}
               	searchForm.find("input[name='pageNum']").val("1");
               	e.preventDefault();
               	
               	searchForm.submit();
             });
            
         });
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>