<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>구독 정보 입력</title>

<style type="text/css">
/* Table css start*/
.data-table {
	border: 1px solid #E5E5E5;
	border-spacing: 0;
	text-align: left;
	width: 100%;
	font-size: 14px;
}

.data-table thead tr, .data-table tfoot tr {
	background-color: #f5f5f5;
}

.data-table thead th:first-child {
	background-color: #f5f5f5;
	border-radius: 3px 0px 0 3px;
}

.data-table thead th {
	background-color: #f5f5f5;
	color: #333;
}

.data-table th {
	line-height: 20px;
	padding: 10px;
	font-weight: 600;
	font-size: 14px;
	text-transform: uppercase;
}

.data-table td {
	line-height: 20px;
	padding: 10px;
	vertical-align: top;
}

.data-table p {
	text-align: center
}

.data-table thead td, .data-table tfoot th, .data-table tfoot td, .cart .totals table th,
	.cart .totals table td {
	border-bottom: 1px solid #e5e5e5;
}

.cart-table .btn-update, .cart-table .btn-empty {
	float: right;
	margin-left: 8px;
}

.data-table tbody th, .data-table tbody td {
	border-right: 0px solid #eaeaea;
	border-bottom: 1px solid #eaeaea;
	padding: 10px 10px 6px;
}

.shopping-cart-table-total td {
	border: none;
}
/*---------- Table css end ---------- */
.bs-wizard {
	margin-top: 40px;
}

/*Form Wizard*/
.bs-wizard {
	border-bottom: solid 0px #e0e0e0;
	padding: 0 0 10px 0;
}

.bs-wizard>.bs-wizard-step {
	padding: 0;
	position: relative;
}

.bs-wizard>.bs-wizard-step+.bs-wizard-step {
	
}

.bs-wizard>.bs-wizard-step .bs-wizard-stepnum {
	color: #595959;
	font-size: 16px;
	margin-bottom: 5px;
}

.bs-wizard>.bs-wizard-step .bs-wizard-info {
	color: #999;
	font-size: 14px;
}

.bs-wizard>.bs-wizard-step>.bs-wizard-dot {
	position: absolute;
	width: 30px;
	height: 30px;
	display: block;
	background: #1abc9c;
	top: 45px;
	left: 50%;
	margin-top: -15px;
	margin-left: -15px;
	border-radius: 50%;
}

.bs-wizard>.bs-wizard-step>.bs-wizard-dot:after {
	content: ' ';
	width: 14px;
	height: 14px;
	background: #fbbd19;
	border-radius: 50px;
	position: absolute;
	top: 8px;
	left: 8px;
}

.bs-wizard>.bs-wizard-step>.progress {
	position: relative;
	border-radius: 0px;
	height: 8px;
	box-shadow: none;
	margin: 20px 0;
}

.bs-wizard>.bs-wizard-step>.progress>.progress-bar {
	width: 0px;
	box-shadow: none;
	background: #1abc9c;
}

.bs-wizard>.bs-wizard-step.complete>.progress>.progress-bar {
	width: 100%;
}

.bs-wizard>.bs-wizard-step.active>.progress>.progress-bar {
	width: 50%;
}

.bs-wizard>.bs-wizard-step:first-child.active>.progress>.progress-bar {
	width: 0%;
}

.bs-wizard>.bs-wizard-step:last-child.active>.progress>.progress-bar {
	width: 100%;
}

.bs-wizard>.bs-wizard-step.disabled>.bs-wizard-dot {
	background-color: #f5f5f5;
}

.bs-wizard>.bs-wizard-step.disabled>.bs-wizard-dot:after {
	opacity: 0;
}

.bs-wizard>.bs-wizard-step:first-child>.progress {
	left: 50%;
	width: 50%;
}

.bs-wizard>.bs-wizard-step:last-child>.progress {
	width: 50%;
}

.bs-wizard>.bs-wizard-step.disabled a.bs-wizard-dot {
	pointer-events: none;
}
/*END Form Wizard*/
</style>
<script src="https://use.fontawesome.com/0f7c16f922.js"></script>

<!--Joo-->
<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/css/3.1.0.css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>

<body>
	<!-- Header Section Start -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!-- Header Section End -->


	<br />
	<br />
	<br />
	<br />
	<br />
	<!-- Start Pricing Table Section -->
	<!-- steps start -->
	<div class="container">
		<div class="row bs-wizard">
			<div class="col-xs-4 bs-wizard-step complete">
				<div class="text-center bs-wizard-stepnum">Step 1</div>
				<div class="progress">
					<div class="progress-bar"></div>
				</div>
				<a href="#" class="bs-wizard-dot"></a>
				<div class="bs-wizard-info text-center">
					구독신청 정보와 <br>구독자 정보를 확인해주세요.
				</div>
			</div>

			<div class="col-xs-4 bs-wizard-step disabled">
				<!-- complete -->
				<div class="text-center bs-wizard-stepnum">Step 2</div>
				<div class="progress">
					<div class="progress-bar"></div>
				</div>
				<a href="#" class="bs-wizard-dot"></a>
				<div class="bs-wizard-info text-center">
					결제 수단을 선택하고 <br>결제를 진행해주세요.
				</div>
			</div>

			<div class="col-xs-4 bs-wizard-step disabled">
				<!-- active -->
				<div class="text-center bs-wizard-stepnum">Step 3</div>
				<div class="progress">
					<div class="progress-bar"></div>
				</div>
				<a href="#" class="bs-wizard-dot"></a>
				<div class="bs-wizard-info text-center">
					잠시만 기다려주시면 <br>당신의 버디가 매칭됩니다!
				</div>
			</div>
		</div>





	</div>
	<!-- steps end -->
	
<form id="pay_form" method="get">
	<div class="container rounded bg-white mt-15 mb-5"
		style="margin-top: 70px">

		<div class="row">
			<div class="col-main col-sm-12">
				<div class="p-3 py-4">

					<div class="page-title" style="margin-top: 10px">
						<h1 style="font-size: 25px;">구독상품 정보</h1>
					</div>
					<div class="my-account">
						<div class="dashboard">
							<p></p>
							<br>
						</div>
						<!-- <div class="recent-orders"> -->
						<div class="title-buttons">
							<strong> </strong>
						</div>
						<input type="hidden" value="${sub.subItem}" name="subItem" />
						<input type="hidden" value="${sub.subDuration}" name="subDuration" />
						<input type="hidden" value="${sub.subPrice}" name="subPrice" />
						<input type="hidden" value="${email }" name="email"/>
							<%@ include file="/WEB-INF/views/subscribe/itemBox.jsp"%>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-12 ">
			<div class="p-3 py-4">
				<div class="d-flex justify-content-between align-items-center mb-3">
					<h4 class="text-right" style="font-size: 25px;">
						<br>구독자 정보 입력
					</h4>
					<br>
					<br>
				</div>
				<div class="row mt-2">
					<div class="col-md-6">
						<input type="text" class="form-control" placeholder="이름을 입력해주세요"
							id="subName" name="subName">
					</div>
					<div class="col-md-6">
						<input type="text" class="form-control" id="subPhone" name="subPhone"
							placeholder="연락처를 입력해주세요">
					</div>

					<div class="col-md-2">
						<input type="button" class="btn btn-common btn-effect"
						onclick="sample6_execDaumPostcode();" value="우편번호 찾기" id="post">
						<div class="help-block with-errors"></div>
					</div>
					<div class="col-md-10">
						<input type="text" placeholder="우편번호를 입력하세요" name="zipCode"
						id="sample6_postcode" class="form-control" readonly="true">
					</div>
					<div class="col-md-12">
						<input type="text" class="form-control" placeholder="기본주소" name="loc" id="sample6_address">
					</div>
					<div class="col-md-12">
						<input type="text" class="form-control" placeholder="상세주소를 입력해주세요"
							name="inputLoc" id="sample6_extraAddress">
					</div>
				</div>
				
				
				<div style="text-align: center;">
					<div class="welcome-msg">
						<br>
						<br>
						<br>
						<strong>주문 내역을 확인해주세요<br>
						<br></strong> 
						<button class="btn btn-common btn-effect" id="goPay" type="button" onclick="nullCheck();">결제페이지로 이동</button>
						<p>
							<br>
						</p>


					</div>
				</div>
			</div>

		</div>
	</div>
	</form>

	<!-- Footer Section Start -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
	<!-- Footer Section End -->
	
	<!-- Daum Address CDN -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script type="text/javascript">
	// 개인정보 입력 안했을 때 안넘어가게 하기
	function nullCheck() {
		
		 if ($('#subName').val() == '') {
	            alert("구독하려는 분의 이름을 작성해주세요.");
	            $('#subName').focus();
	            return false;
	     } else if ($('#subPhone').val() == '') {
	            alert("구독하려는 분의 연락처를 입력해주십시오.");
	            $('#subPhone').focus();
	            return false;
	     } else if ($('#sample6_extraAddress').val() == '') {
	            alert("구독하려는 분의 주소를 입력해주세요.");
	            
	     } else if($('#inputLoc').val() == ''){
	    		alert("구독하려는 분의 상세주소를 입력해주세요.");
	            $('#inputLoc').focus();
	            return false;
	     } else{
	    	 $("#pay_form").attr("action", "${pageContext.request.contextPath }/subscribe/pay");
			 $("#pay_form").submit();
	    	 }
	     }
	
	
	
	//Daum Address JS
	function sample6_execDaumPostcode() {
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
	                document.getElementById("sample6_extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("sample6_extraAddress").value = '';
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample6_postcode').value = data.zonecode;
	            document.getElementById("sample6_address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("sample6_extraAddress").focus();
	        }
	    }).open();
	}
	

	
	
	
	</script>
	
	
	

</body>
</html>