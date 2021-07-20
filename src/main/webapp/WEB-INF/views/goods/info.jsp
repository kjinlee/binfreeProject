<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE web-app PUBLIC
 "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
 "http://java.sun.com/dtd/web-app_2_3.dtd" >
<html>
<head>

<title>굿즈 상세 페이지</title>

<style>
.smallImg img {
	cursor: pointer;
	width: 10%;
	height: auto;
	margin: 0px 20px;
}

.smallImg {
	display: flex;
	justify-content: center;
}

.mainImg {
	width: 100%;
	height: auto;
}

.left-side {
	display: flex;
	justify-content: center;
}

.sub{
	height: 5%;
	width: 5%;
}

#content{
	border-radius: 30px;
}

.input-group{
	width: 70% !important;
	margin: 0 auto;
} 

.input-group.update{
	margin: 0;
}

.form-control.update{
	width: 180px !important;
}

.comment{
	border-bottom: 1px solid #dee2e6;
	padding-top: 3% !important;
	padding-bottom: 4px !important;
}

.commentList{
	width: 70%;
	margin: 0 auto;
}

.buttonArea{
	text-align: end;
}

.btn.btn-default.cmt {
	margin-top: 5px; 
	background-color: black;
	font-size: 8px;
	margin-right: 0 !important;
}

.commentContent{
	padding-top: 20px;
	color: #838383;
}

.date{
	padding-top: 20px;
	text-align: end;
}

.input-group>.custom-select:not(:last-child), .input-group>.form-control:not(:last-child){
	border-top-right-radius: 30px !important; 
    border-bottom-right-radius: 30px !important; 
	
}
</style>


</head>
 <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
   <script> 
     $(document).ready(function(){
       $(".smallImg>img").on({"click" : function(){
         var imgSrc = $(this).attr("src");
 
         $(".mainImg").attr("src", imgSrc);
       }});
       

	
     });
   </script>

</head>
<body>
	<!-- Header Section Start -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<script>
    $(document).ready(function(){
      $(".mainImg").change

    });
  </script>
  
  <br>
  <br>
  <br>
  <br>
  <br>
  
  




  <!-- Start Shopping Detail -->
   <div class="row">
    <div class="container">
      <div class="col-lg-12 col-md-12">
        <div class="row">
          <div class="col-lg-7 col-md-7 col-xs-12">
            <div class="left-side">
            
              <img src="${pageContext.request.contextPath }/resources/img/goods/${goods.pic}" alt="" class="mainImg" style="width:368px; height:369px; margin-top:30px;">
            </div>
            <br>
          </div>
			
		 
          <div class="col-lg-5 col-md-5 col-xs-12">
            <h1 style="font-size:30px; text-align:center; margin-top:20px;"><c:out value="${goods.goodsName }" /></h1>
            <hr>
            <p class="section-title" id="count" style="font-size:20px; color: black; text-align:center;"> </p>
            <hr>
            <br>
            <p style="font-size: 18px;  "> &nbsp;  &nbsp;  &nbsp; 상품옵션</p><br>
            <div >
              <select class="form-control" style="width: 100%; height: auto;">
                <option><c:out value="${goods.option1 }" /></option>
                <option><c:out value="${goods.option2 }" /></option>
                <option><c:out value="${goods.option3 }" /></option>
              </select>
            </div>
            <br>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
			<form id="updateForm" action="${pageContext.request.contextPath }/goods/update" method="get">
			<div>
              <button type="button" onclick="location.href='${pageContext.request.contextPath }/goods/update?id=${goods.id}' " class="btn btn-common btn-effect" style="width: 100%; border-color:#1abc9c; background:white; color:black; border-width:2px;">상품정보 변경
              </button>
            </div>
            </form>
		
		</sec:authorize>
		 <sec:authorize access="hasRole('ROLE_ADMIN')">
		 <form id="updateForm" action="${pageContext.request.contextPath }/goods/update" method="get">
			<div>
              <button type="button"  value="${goods.id }" onclick="DeleteId(this)" class="btn btn-common btn-effect" style="width: 100%; border-color:#1abc9c; background:white; color:black; border-width:2px;">상품 삭제
              </button>
            </div>
            </form>
		</sec:authorize>
		
		<!-- 로그인 안된 상태 -->
		 <sec:authorize access="isAnonymous()">
		<div>
			<p style="color: #1abc9c">  &nbsp; &nbsp; &nbsp; 로그인 후 , 굿즈 이벤트에 신청 가능합니다.</p>
		</div>
		<br>
		</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_KAKAO')">
            <div>
              <button class="btn btn-common btn-effect"  style="width: 100%; border-color:#1abc9c; background:white; color:black; border-width:2px;"  type="button" style="width: 100%;" onclick="draw();" >신청하기
              </button>
            </div>
            </sec:authorize>
            
         <!-- SNS버튼 시작 -->
		 <div style="width: 100%; text-align: right; margin-bottom: 30px; margin-top:20px; "> 
		 <!-- 페이스북 공유 버튼 --> 
		 <a href="" onclick="window.open(url_combine_fb, '', 'scrollbars=no, width=600, height=600'); return false;">
		 <img src="${pageContext.request.contextPath }/resources/img/goods/facebookLogo.png" title="페이스북으로 공유하기" class="sharebtn_custom" style="width: 32px;"></a> 
		 <!-- 트위터 공유 버튼 --> 
		 <a href="" onclick="window.open(url_combine_tw, '', 'scrollbars=no, width=600, height=600'); return false;">
		 <img src="${pageContext.request.contextPath }/resources/img/goods/twitterLogo.jpg" title="트위터로 공유하기" class="sharebtn_custom" style="width: 32px;"></a>
		  <!-- 카카오 스토리 공유 버튼 --> 
		  <a href="" onclick="window.open(url_combine_ks, '', 'scrollbars=no, width=600, height=600'); return false;">
		  <img src="${pageContext.request.contextPath }/resources/img/goods/kakaoLogo.jpg" title="카카오스토리로 공유하기" class="sharebtn_custom" style="width: 32px;"></a> 
		  <!-- 네이버 공유 버튼 --> 
		  <a href="" onclick="window.open(url_combine_naver, '', 'scrollbars=no, width=600, height=600'); return false;">
		  <img src="${pageContext.request.contextPath }/resources/img/goods/naverLogo.jpg" title="네이버로 공유하기" class="sharebtn_custom" style="width: 32px;"></a> 
 			 <!-- SNS버튼 끝 -->
 			 </div>
            <hr>
          </div>
        </div>
      </div>
    </div>
  </div>
 

  <br><br><br><br><br><br>

  <div class="row">
    <div class="container">
      <div class="col-lg-12 col-md-12">
        <div>
			<h3  class="section-title"  style="font-size: 30px; font-weight: none; text-align:center;">상품 상세</h3>
			<br>
			
            <textarea class="form-control" rows="10" name="contents"  style="height:450px; background-color: white; text-align:center;"   readonly><c:out value="${goods.contents }" />  </textarea>
        </div>
      </div>
    </div>
    </div>
  <hr>
<section>
  
  <div class="container" >
    	<div class="col-lg-12 col-md-12">
    	<div>
    	<h2 class="section-title" style="font-size: 20px; text-align:center;">안내사항</h2>
    	
 		
    	<div style="text-align:center;" >
    	
    	<ul style="font-size:10px;">
    	<li> * 이벤트 신청을 구독 회원에 한해서 1회만 가능합니다.</li><br>
    	<li> * 신청 횟수와 상관 없이 마지막 신청에 한해서만 신청이 등록 됩니다.</li><br>
    	<li> * 당첨된 회원에 한해서만 등록하신 전화번호로 메세지를 발송해드립니다.</li><br>
    	<li> * 배송기간은 주말 제외 2~3일 내에 발송되며, 비용은 전부 BFREE에서 부담합니다.</li>  
    	</ul>
    	
    
    	
    	</div>
    	</div>
    	</div>
    </div>
  </section>
	<hr>
	
	<!--  댓글  -->
	<div class="container">
		<sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_KAKAO')">
			<form name="commentInsertForm">
				<div class="input-group">
					<input type="hidden" name="bno" id="bno" value="${goods.id}" /> 
					<input type="hidden" name="writer" value="${userName}" /> 
					<input type="hidden" name="email" value="${email}" /> 
					<input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요."> <span class="input-group-btn">
						<button class="btn btn-default" type="button" name="commentInsertBtn"
							style="margin-top: 5px; margin-left: 10px; background-color: black;">등록</button>
					</span>
				</div>
			</form>
		</sec:authorize>
		</div>
		<div class="container">
			<table class="commentList" id="commentList">
				
			</table>
			
			<div class="more" align="center">
				<button id="addBtn" class="btn btn-default cmt" onclick="moreList();">더보기</button>
			</div>
			
		</div>

	<%@ include file="/WEB-INF/views/includes/commentModal.jsp"%>
	<%@ include file="/WEB-INF/views/comment/comment.jsp"%>
	<br>
	<br>
	<br>


	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>


	
	<script>
		var id = '';
		var id2 = '';
		/* 삭제할 리뷰 아이디값 찾기 */
		/* function DeleteId(object) {
			id2 = object.value;
			Delete();
		} */

		function DeleteId(object) {
			id2 = object.value;
			if (confirm("정말 삭제하시겠습니까?") == true) { //확인
				Delete();
			} else {
				return;
			}

		}

		/* 리뷰 삭제 */
		function Delete() {
			$.ajax({
				url : "${pageContext.request.contextPath }/goods/delete",
				type : "get",
				data : {
					'id' : id2
				},
				success : function(data) {
					alert("삭제가 완료되었습니다!");
					window.location.href = '${pageContext.request.contextPath }/goods/list';
				}
			})
		}
		
		<!-- SNS 공유용 주소 연결 용 --> 
		var url_default_ks = "https://story.kakao.com/share?url="; 
		var url_default_fb = "https://www.facebook.com/sharer/sharer.php?u=";
		var url_default_tw_txt = "https://twitter.com/intent/tweet?text="; 
		var url_default_tw_url = "&url="; 
		var url_default_band = "http://band.us/plugin/share?body="; 
		var url_route_band = "&route="; 
		var url_default_naver = "http://share.naver.com/web/shareView.nhn?url="; 
		var title_default_naver = "&title=";
		var url_this_page = location.href;
		var title_this_page = document.title; 
		var url_combine_ks = url_default_ks + url_this_page;
		var url_combine_fb = url_default_fb + url_this_page;
		var url_combine_tw = url_default_tw_txt + document.title + url_default_tw_url + url_this_page; 
		var url_combine_band = url_default_band + encodeURI(url_this_page)+ '%0A' + encodeURI(title_this_page)+'%0A' + '&route=tistory.com'; 
		var url_combine_naver = url_default_naver + encodeURI(url_this_page) + title_default_naver + encodeURI(title_this_page);

		// 남은날짜 계산 
		var dday = new Date("July 16, 2022, 0:00:00").getTime();

		setInterval(function() {
		  var today = new Date().getTime();
		  var gap = dday - today;
		  var day = Math.ceil(gap / (1000 * 60 * 60 * 24));
		  var hour = Math.ceil((gap % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		  var min = Math.ceil((gap % (1000 * 60 * 60)) / (1000 * 60));
		  var sec = Math.ceil((gap % (1000 * 60)) / 1000);

		  document.getElementById("count").innerHTML =   day + "일 " + hour + "시간 " + min + "분 " + sec  + "초" ;
		}, 1000);
		
		function draw(){
			alert("신청이 완료되었습니다.");
			window.location.href= '${pageContext.request.contextPath }/goods/list';
		}
		
		
		
		
	</script>
</body>
</html>