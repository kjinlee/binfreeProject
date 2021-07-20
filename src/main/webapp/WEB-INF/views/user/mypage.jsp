<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>

<!-- security token -->
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<meta name="keywords"
	content="Bootstrap, Landing page, Template, Registration, Landing">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="author" content="Grayrids">
<title>마이페이지</title>

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
</style>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
function findAddress() {
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("inputLoc").value = extraAddr;
            
            } else {
                document.getElementById("inputLoc").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipCode').value = data.zonecode;
            document.getElementById("loc").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("inputLoc").focus();
        }
    }).open();
}
</script>

<script>

function modify_userInfo(){
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	var email = $('#email').val();
	var phone = $('#phone').val();
	
	console.log(email);
	console.log(phone);	
			
	$.ajax({
		
		type: 'post',
		url:'${pageContext.request.contextPath }/user/modify_userInfo',
		beforeSend : function(xhr)
        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			xhr.setRequestHeader(header, token);
        },
		contentType : "application/json; charset=UTF-8",
		data : JSON.stringify({'email' : email, 'phone' : phone}),
		dataType: 'text',
		success: function(){
			alert("나의 정보가 수정 되었습니다.");
			window.location.reload();
		},
		error:function(e){
			console.log(e);
		}
	});
}

function modify_pwd2(){
		alert("카카오로그인 사용자는 비밀번호를 변경할 수 없습니다")
	}

function modify_subInfo() {
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	var subName = $('#sub_name').val();
	var subPhone = $('#sub_phone').val();
	var zipCode = $('#zipCode').val();
	var loc = $('#loc').val();
	var inputLoc = $('#inputLoc').val(); 			

	$.ajax({
		type: 'post',
		url: '${pageContext.request.contextPath }/user/modify_subInfo',
		beforeSend : function(xhr) {   
			xhr.setRequestHeader(header, token);
        },
		contentType : "application/json; charset=UTF-8",
		dataType: 'text',
		data: JSON.stringify({'subName' : subName, 'subPhone' : subPhone, 'zipCode' : zipCode, 'loc' : loc, 'inputLoc' : inputLoc}),
		success: function() {
			alert("수정되었습니다.");
			window.location.replace();
			console.log("리플레이스??");
		},
		error: function(e){console.log(e);}
	});
}  


function password_check(password) {    
	   // 특수문자 체크 정규식      
	    var regex= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	    if(!regex.test(password)){
	         return false;
	    } else {
	       return true;
	    }
	}



	function modify_pwd() {
	    
	   var token = $("meta[name='_csrf']").attr("content");
	   var header = $("meta[name='_csrf_header']").attr("content");
	    
	   var password = $('#pwd').val();
	   
	   if( password == '' || password == 'undefined') {
	      alert("공백은 비밀번호로 사용하실 수 없습니다.")
	      return;
	   }
	   if(! password_check(password)){

	      alert("수정하실 수 없습니다. 비밀번호를 확인하세요.");
	      
	      $("button[name=submitPwd]").blur(function(){
	      
	         /* var password = $('#pwd').val(); */
	         
	          if(! password_check(password) ) {
	                 $("#error-password").text('영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.');
	               /*  $(this).focus(); */               
	              }else {
	               $("#error-password").text('');
	              }
	      });
	   } else {
	      
	      $.ajax({
	         
	         type: 'post',
	         url:'${pageContext.request.contextPath }/user/modify_pwd',
	         beforeSend : function(xhr)
	           {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	            xhr.setRequestHeader(header, token);
	           },
	         contentType : "application/json; charset=UTF-8",
	         data : password,
	         dataType: 'text',
	         success: function(){
	            alert("비밀번호가 수정되었습니다.");
	            window.location.reload();
	         },
	         error:function(e){
	            console.log(e);
	         }
	      });
	   }
	   
	      
	 }


 function bye_user() {
	 
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	 
	 var email = $('#email').val();
	 
	 if(confirm("정말 탈퇴 하시겠습니까?") == true){
		 $.ajax({			
			 type: 'post',
			 url: '${pageContext.request.contextPath }/user/bye_user',
			 beforeSend : function(xhr) {   
					xhr.setRequestHeader(header, token);
		      },
			 contentType : 'application/json; charset=UTF-8',
			 dataType: 'text',
			 data: email,
			 success: function(){
				 location.replace("/");
			 }, error: function(e){console.log(e);}
		 });
		 
	 }else {
		 window.opener.location.reload();
		 self.close();
	 }	 
	 
 }
 </script>



</head>

<body>
	<!-- Header Section Start -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!-- Header Section End -->

	<!-- Mypage Section Start -->
	<section id="tabs">
		<div class="container">
			<h6 class="section-title h1">&nbsp</h6>
			<div class="row">
				<div class="col-xs-12 col-md-12">
					<!-- col-md-12 추가 -->
					<nav>
						<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-home-tab"
								data-toggle="tab" href="#nav-myinfo" role="tab"
								aria-controls="nav-home" aria-selected="true">내정보</a> <a
								class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
								href="#nav-subinfo" role="tab" aria-controls="nav-profile"
								aria-selected="false">구독 정보</a>
						</div>
					</nav>
					<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-myinfo"
							role="tabpanel" aria-labelledby="nav-home-tab">
							<div class="row">
								<c:choose>
									<c:when test="${userInfo.password == null}">
										<div class="container">
											<div class="row">
												<div class="col-md-12">
													<!--matching image div-->
													<div class="p-3 py-5" style="margin-top: 100px;">
														<div class="mt-5 text-center">
															<img src="${pageContext.request.contextPath }/resources/img/portfolio/nosub.png" alt="" />
														</div>
														<div class="mt-5 text-center">
															<p>
																<br />
															</p>
															<h2 class="section-title" style="font-size: 20px;">카카오
																로그인 중입니다.</h2>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<!-- myinfo Start -->
										<div class="col-md-7 border-right" id="myinfo">
											<!--border-right-->
											<div class="p-3 py-5">
												<div
													class="d-flex justify-content-between align-items-center mb-3">
													<h6 class="text-right">내 정보</h6>
												</div>
												<div class="row mt-2">
													<div class="col-md-12">
														<label class="labels">이름</label><input type="text"
															class="form-control" value="${userInfo.name }" id="name"
															readonly="true" />
													</div>
													<div class="col-md-12">
														<label class="labels">전화번호</label><input type="text"
															class="form-control phoneNumber" id="phone"
															value="${userInfo.phone }" maxlength="13" />
													</div>
													<div class="col-md-12">
														<label class="labels">이메일 ID</label><input type="text"
															class="form-control" id="email" value="${userInfo.email}"
															readonly="true" />
													</div>
												</div>
												<div class="mt-5 text-center">
													<button class="btn btn-common btn-effect"
														id="userinfo_submit" onclick="modify_userInfo()">내
														정보 수정</button>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<button class="btn btn-common btn-effect" id="submit"
														onclick="bye_user()">회원 탈퇴</button>
												</div>
											</div>
										</div>
										<sec:authorize access="hasRole('ROLE_MEMBER')">
										 <div class="col-md-4">
				                  <div class="p-3 py-5">
				                    <div class="d-flex justify-content-between align-items-center mb-3">
				                      <h6 class="text-right">비밀번호</h6>
				                    </div>
		
				         
				                    <div class="row mt-2">
				                      <div class="col-md-12"><label class="labels">현재 비밀번호</label><input type="password"
				                          class="form-control" value="${userInfo.password }" readonly="true" /></div>
				                    </div>
				                    <div class="row mt-2">
				                      <div class="col-md-12"><label class="labels">수정할 비밀번호</label><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                  <input type="button" id="sbutton" value="보이기" class="btn" 
                                  style="margin-bottom: 10px; position: relative; z-index: 1; padding: 5px 5px; border-radius: 15px; background-color: white; color: #1ABC9C; border-color: #1ABC9C;"/>
                                  <input type="password" class="form-control" id="pwd" name="password" value="" placeholder="현재 비밀번호는 암호화 되어 있습니다."></div>
                                  <div id="error-password" class=" result-check" style="color: red; padding-left: 20px; padding-bottom: 7px"></div>
                                </div>
				                  </div>
				                  <div class="mt-2 text-center">
				                    <button class="btn btn-common btn-effect" id="submit_pwd" name="submitPwd" onclick="modify_pwd()">비밀번호 수정</button>                    
				                  </div>
				                </div>
				                </sec:authorize>
				                
				                 <!-- 카카오 회원 비밀번호수정 제한 -->
										 <sec:authorize access="hasRole('ROLE_KAKAO')">
										 <div class="col-md-4">
				                  <div class="p-3 py-5">
				                    <div class="d-flex justify-content-between align-items-center mb-3">
				                      <h6 class="text-right">비밀번호</h6>
				                    </div>
		
				         
				                    <div class="row mt-2">
				                      <div class="col-md-12"><label class="labels">현재 비밀번호</label><input type="password"
				                          class="form-control" value="${userInfo.password }" readonly="true" /></div>
				                    </div>
				                    <div class="row mt-2">
				                      <div class="col-md-12"><label class="labels">수정할 비밀번호</label><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                  <input type="button" id="sbutton" value="보이기" class="btn" 
                                  style="margin-bottom: 10px; position: relative; z-index: 1; padding: 5px 5px; border-radius: 15px; background-color: white; color: #1ABC9C; border-color: #1ABC9C;"/>
                                  <input type="password" readonly="true" class="form-control" id="pwd" name="password" value="" placeholder="현재 비밀번호는 암호화 되어 있습니다."></div>
                                  <div id="error-password" class=" result-check" style="color: red; padding-left: 20px; padding-bottom: 7px"></div>
                                </div>
				                  </div>
				                  <div class="mt-2 text-center">
				                    <button class="btn btn-common btn-effect" id="submit_pwd" name="submitPwd" onclick="modify_pwd2()">비밀번호 수정</button>                    
				                  </div>
				                </div>
				                </sec:authorize>
									</c:otherwise>
								</c:choose>
							</div>
							<!-- div class="row"end -->
						</div>
						<!-- div class="tab-pane fade show active" end  -->
						<!-- myinfo End -->

						<!-- subinfo Start -->
						<div class="tab-pane fade" id="nav-subinfo" role="tabpanel"
							aria-labelledby="nav-profile-tab">
							<div class="row">
								<c:choose>
									<c:when test="${userInfo.zipCode == null}">
										<div class="container">
											<div class="row">
												<div class="col-md-12">

													<!--matching image div-->
													<div class="p-3 py-5" style="margin-top: 100px;">
														<div class="mt-5 text-center">
															<img src="${pageContext.request.contextPath }/resources/img/portfolio/nosub.png" alt="" />
														</div>
														<div class="mt-5 text-center">
															<p>
																<br />
															</p>
															<h2 class="section-title" style="font-size: 20px;">구독중인
																binFree 서비스가 없습니다.</h2>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="col-md-7 border-right" id="subinfo">
											<!--border-right-->
											<div class="p-3 py-5">
												<div
													class="d-flex justify-content-between align-items-center mb-3">
													<h6 class="text-right">구독 정보</h6>
												</div>
												<div class="row mt-2">
													<div class="col-md-8">
														<label class="labels">구독 상품</label> <input type="text"
															class="form-control" value="${userInfo.subItem }"
															id="subItem" disabled />
													</div>
													<div class="col-md-6">
														<label class="labels">구독 시작</label> <input type="text"
															class="form-control" value="${userInfo.subStart}"
															readonly="true" />
													</div>
													<div class="col-md-6">
														<label class="labels">구독 종료</label> <input type="text"
															class="form-control" value="${userInfo.subEnd }"
															readonly="true" />
													</div>
													<div class="col-md-6">
														<label class="labels">구독자</label><input id="sub_name"
															type="text" class="form-control"
															value="${userInfo.subName }" />
													</div>
													<div class="col-md-6">
														<label class="labels">구독자 연락처</label><input id="sub_phone"
															type="text" class="form-control phoneNumber"
															value="${userInfo.subPhone }" />
													</div>
												</div>
												<br> <br>
												<div
													class="d-flex justify-content-between align-items-center mb-3">
													<h6 class="text-right">구독 주소</h6>
												</div>
												<div class="row mt-2">
													<div class="col-md-6">
														<label class="labels">우편번호</label><input type="text"
															class="form-control" id="zipCode"
															value="${userInfo.zipCode }" readonly="true" />
													</div>
													<div class="col-md-6">
														<button class="btn btn-common btn-effect btn-loc"
															onclick="findAddress()" id="submit"
															style="margin-top: 29px;">주소 찾기</button>
													</div>
													<div class="col-md-12">
														<label class="labels">기본 주소</label><input type="text"
															class="form-control" id="loc" value="${userInfo.loc }"
															readonly="true" />
													</div>
													<div class="col-md-12">
														<label class="labels">상세 주소</label><input type="text"
															class="form-control" id="inputLoc"
															value="${userInfo.inputLoc }" />
													</div>
												</div>
												<div class="mt-5 text-center">
													<button class="btn btn-common btn-effect" id="sub_submit"
														onclick="modify_subInfo()">구독 정보 수정</button>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn btn-common"
														data-toggle="modal" data-target="#form">구독 리뷰 작성</button>
												</div>
											</div>
											<%-- </form:form> --%>
										</div>


										<!-- 리뷰 작성 모달 -->
										<%@ include file="/WEB-INF/views/includes/insertReviewModal.jsp"%>



										<!-- mybuddyinfo Start -->
										<div class="col-md-4">
											<div class="p-3 py-5">
												<div
													class="d-flex justify-content-between align-items-center mb-3">
													<h6 class="text-right">나의 Buddy</h6>
												</div>
												<div class="d-flex flex-row mt-3 exp-container">
													<img
														src="${pageContext.request.contextPath }/resources/img/buddy/<c:out value="${myBuddyInfo.pic }" />"
														width="350" height="460">
												</div>
												<div class="d-flex flex-row mt-3 exp-container">
													<div class="work-experience ml-1">
														<span class="font-weight-bold" style="font-size: larger;"><c:out
																value="${myBuddyInfo.name }"></c:out></span><span>Buddy</span><span
															class="d-block text-black-50 labels"><c:out
																value="${myBuddyInfo.phone }" /></span>
														<!-- <span class="d-block text-black-50 labels">March,2017 -   May 2020</span> -->
													</div>
												</div>
												<hr>
											</div>
										</div>
										<!-- mybuddyinfo End -->
									</c:otherwise>
								</c:choose>
							</div>
							<!-- div class="row" end  -->
						</div>
						<!-- div class="tab-pane fade" end -->
						<!-- subinfo End -->
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Mypage Section End -->


	<!-- Footer Section Start -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

	<script type="text/javascript">
	/* 리뷰 작성 */
	function insert() {
		$('input[name="star"]').each(function() {
	        if($(this).prop('checked')) {
	            $('#star').val(this.value);
	        }
	    });
	
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		var email = $('#email').val();
		var star = $('#star').val();
		var contents = $('#contents').val();
		var userName = $('#name').val();
		var subItem = $('#subItem').val();
		console.log(contents);
		$.ajax({
			url: "${pageContext.request.contextPath }/review/insert",
			method:"post",
			beforeSend : function(xhr)
	        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader(header, token);
	        },
			data: {'email': email, 'star' : star, 'contents' : contents, 'userName':userName, 'subItem':subItem},
			dataType: 'text',
			success: function(data){
				alert("리뷰 등록이 완료되었습니다!");
				$('#modal').modal('hide');
				window.location.href='${pageContext.request.contextPath }/subscribe/main';
			}
		});
	}
	
	$(document).ready(function() {
			console.log(${list});
		});
		$('.starRev span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			$('#star').val(this.value);
			return false;
		});
		 $('#modal').modal("hide");
		 
		 
		window.onload = function() {
			
			function show() {
			    var p = document.getElementById('pwd');
			    p.setAttribute('type', 'text');
			    
			}
			
			function hide() {
			    var p = document.getElementById('pwd');
			    p.setAttribute('type', 'password');
			    
			}
			
			var pwShown = 0;
			
			document.getElementById("sbutton").addEventListener("click", function () {
			    if (pwShown == 0) {
			        pwShown = 1;
			        show();
				    this.setAttribute('value', '숨기기');  

			    } else {
			        pwShown = 0;
			        hide();
				    this.setAttribute('value', '보이기');  
			
			    }
			}, false);	
		   
		$(document).on("keyup", ".phoneNumber", function() { 
		    $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("—", "-") ); 
		 	 });
			}
		 
		    
	</script>
</body>

</html>