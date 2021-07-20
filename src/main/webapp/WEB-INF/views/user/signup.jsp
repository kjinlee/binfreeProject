<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String msg = (String) request.getAttribute("msg");
%>

<!DOCTYPE html>
<html lang="en">

<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<head>
<!-- Required meta tags -->
<meta charset="UTF">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="keywords"
	content="Bootstrap, Landing page, Template, Registration, Landing">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="author" content="Grayrids">
<title>회원가입</title>


<!-- javascript 시작 / goLogin() function 추가 -->
<script type="text/javaScript">
	function goLogin() {
		var array_test = document.getElementsByClassName("form-control");

		array_test.submit;

		// for(var i=0; i<array_test.length; i++){
		//   alert(array_test[i].value);
		// }

		location.href = "./login.html";

	}
</script>

<script src="http://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
	
</script>
<style>

    .emailCheck :after!important{
    content: '';
    position: absolute;
    width: 0;
    height: 100%;
    z-index: 1;
    left: 0;
    top: 0;
    background: #e2f4e6!important;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    transition: all 0.3s ease;
	}
	
</style>



</head>

<body>
	<!-- Header Section Start -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!-- Header Section End -->

	<!-- Subcribe Section Start -->
	<div id="subscribe" class="section" style="padding: 80px 0 70px 0;">
		<div class="container" style="margin-top: 70px;">
			<div class="row">
				<div class="col-lg-2"></div>
				<div class="col-lg-8 col-md-12 col-xs-12">
					<div class="subscribe-form">
						<div class="form-wrapper">
							<div class="sub-title text-center">
							<br><br>
								<h3>회원가입</h3>
								<!-- <p>BFree</p> -->
							</div>
							<form id="join_form" method="post" accept-charset="UTF-8">
								<div class="row">
									<div class="col-md-8">
										<div class="form-group" id="id_input_box">
											<input type="email" class="form-control" name="email"
												id="id_input" placeholder="이메일을 입력해주세요" method="post" style="margin-bottom: 0px;">
											<div id="error_mail" class="result-email result-check"
												style="color: red; padding-left: 20px; padding-bottom: 7px"></div>

										</div>


										<!-- <span class="id_input_re_1" style="color: green; display: none;">사용 가능한 이메일입니다.</span> 
										<span class="id_input_re_2" style="color: red; display: none;">이메일이 이미 존재합니다.</span> -->
									</div>


									<div class="col-md-4">
										<div class="form-group">
											<button type="button" id="email_check" 
												class="btn btn-common btn-effect btn-email emailcheck"
												onclick="emailCheck();" style="color:black; :after{hover{background:green}}; ">이메일 중복 확인</button>
										</div>
									</div>
									<br>
									<div class="col-md-12 form-line">
										<div class="form-group">
											<input type="password" class="form-control" name="password"
												id="pwd1" placeholder="비밀번호를 입력해주세요" method="post" style="margin-top: 10px; margin-bottom: 0px;">
											<div id="error-password" class=" result-check"
												style="color: red; padding-left: 20px; padding-bottom: 7px"></div>

											<input type="password" class="form-control" name="pwd"
												id="pwd2" style="margin-bottom: 0; margin-top:15px;"
												placeholder="비밀번호를 다시 입력해주세요" method="post">


											<div id="success" style="color: green; padding-left: 20px;">비밀번호가
												일치합니다.</div>
											<div id="danger" style="color: red; padding-left: 20px;">비밀번호가
												일치하지 않습니다.</div>
											<input type="text" class="form-control" name="name" id="name"
												style="margin-top: 20px;" placeholder="이름을 입력해주세요">
											<input type="text" class="form-control phoneNumber"
												name="phone" id="phone" maxlength="13"
												placeholder="연락처를 입력해주세요(예: 01012341234)" method="post">
										</div>
									</div>
									<br>
									<div class="col-md-12">
										<div class="form-submit">
											<div>
											<br>
												&nbsp;&nbsp;&nbsp;<input type="checkbox" name="chk_info"
													value="HTML" id="checkbox"> 개인정보 처리안내 확인하고 동의하기
												&nbsp;&nbsp;


												<!-- HK Modal Start -->
												<!-- Trigger the modal with a button -->
												<button type="button" data-toggle="modal"
													data-target="#myModal" style="border: 0;">이용약관</button>
												<br> <br>

												<!-- Modal -->
												<div id="myModal" class="modal fade" role="dialog">
													<div class="modal-dialog modal-lg">

														<!-- Modal content-->
														<div class="modal-content">
															<div class="modal-header" style="text-align: center">
																<h4 class="modal-title">이용약관</h4>
																<button type="button" class="close" data-dismiss="modal">&times;</button>
															</div>
															<div class="modal-body">
																<p style="font-family: Malgun Gothic;">
																<p class="ls2 lh6 bs5 ts4">
																	<em class="emphasis">
																		<(주)BFree>('https://bfree.com'이하 'BFree') </em>은(는) 「개인정보
																	보호법」 제30조에 따라 정부주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할
																	수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.
																</p>
																<p class="ls2">
																	○ 이 개인정보처리방침은 <em class="emphasis">2021</em>년 <em
																		class="emphasis">1</em>월 <em class="emphasis">1</em>부터
																	적용됩니다.
																</p>
																</br>
																<p class='lh6 bs4'>
																	<strong>제1조(개인정보의 처리 목적)<br /> <br /> <em
																		class="emphasis">
																			<(주)BFree>('https://bfree.com'이하 'BFree') </em>은(는) 다음의
																		목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는
																		이용되지 않으며 이용 목적이 변경되는 겨우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를
																		받는 등 필요한 조치를 이행할 예정입니다.
																	</strong>
																</p>
																<ul class="list_indent2 mgt10">
																	<p class="ls2">1. 홈페이지 회원가입 및 관리</p>
																	<p class="ls2">회원 가입의사 확인, 회원자격 유지·관리, 만14세 미만 아동의
																		개인정보 처리 시 법정대리인의 동의여부 확인 목적으로 개인정보를 처리합니다.</p>
																	</br>
																	<p class="ls2">2. 재화 또는 서비스 제공</p>
																	<p class="ls2">서비스 제공, 요금결제·정산을 목적으로 개인정보를 처리합니다.</p>
																	</br>
																	<p class="ls2">3. 마케팅 및 광고에의 활용</p>
																	<p class="ls2">신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성
																		정보 제공 및 참여기회 제공 , 서비스의 유효성 확인 등을 목적으로 개인정보를 처리합니다.</p>
																	</br>
																	<p class="ls2">4. 개인영상정보</p>
																	<p class="ls2">범죄의 예방 및 수사 등을 목적으로 개인정보를 처리합니다.</p>
																	</br>
																</ul>
																</br> </br>
																<p class='lh6 bs4'>
																	<strong>제2조(개인정보의 처리 및 보유 기간)</strong></br> </br>① <em
																		class="emphasis"> <(주)BFree> </em>은(는) 법령에 따른 개인정보
																	보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서
																	개인정보를 처리·보유합니다.</br> </br>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
																</p>
																<ul class='list_indent2 mgt10'>
																	<li class='tt'>1.<홈페이지 회원가입 및 관리></li>
																	<li class='tt'><홈페이지 회원가입 및 관리>와 관련한 개인정보는
																		수집.이용에 관한 동의일로부터<지체없이 파기>까지 위 이용목적을 위하여
																		보유.이용됩니다. </li>
																	<li>보유근거 : 대리 분리수거 서비스 제공을 위함</li>
																	<li>관련법령 : 1)신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년</br>2) 소비자의
																		불만 또는 분쟁처리에 관한 기록 : 3년</br>
																	</li>
																	<li>예외사유 :</li>
																</ul>
																</br> </br>
																<p class='lh6 bs4'>
																	<strong>제3조(개인정보의 제3자 제공)</strong></br> </br> ① <em
																		class="emphasis"> <(주)BFree> </em>은(는) 개인정보를 제1조(개인정보의
																	처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보
																	보호법」 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
																</p>
																<p class="sub_p mgt10">
																	② <span class="colorLightBlue"> <(주)BFree> </span>은(는)
																	다음과 같이 개인정보를 제3자에게 제공하고 있습니다.
																</p>
																<ul class="list_indent2 mgt10">
																	<li class="tt">1. <(주)BFree></li>
																	<li>개인정보를 제공받는 자 : (주)BFree</li>
																	<li>제공받는 자의 개인정보 이용목적 : 이메일, 자택주소, 자택전화번호, 비밀번호
																		질문과 답, 비밀번호, 로그인ID, 이름</li>
																	<li>제공받는 자의 보유.이용기간: 지체없이 파기</li>
																</ul>
																</br> </br>
																<p class='lh6 bs4'>
																	<strong>제4조(개인정보처리 위탁)</strong></br> </br> ① <em class="emphasis">
																		<(주)BFree> </em>은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를
																	위탁하고 있습니다.
																</p>
																<ul class='list_indent2 mgt10'>
																	<li class='tt'>1. <(주)BFree></li>
																	<li>위탁받는 자 (수탁자) : (주)BFree</li>
																	<li>위탁하는 업무의 내용 : 구매 및 요금 결제, 물품배송 또는 청구서 등 발송,
																		회원제 서비스 이용에 따른 본인확인, 불만처리 등 민원처리, 고지사항 전달, 신규 서비스(제품)
																		개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공</li>
																	<li>위탁기간 : 지체없이 파기</li>
																</ul>
																<p class='sub_p mgt10'>
																	② <span class='colorLightBlue'> <(주)BFree> </span>은(는)
																	위탁계약 체결시 「개인정보 보호법」 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지,
																	기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을
																	계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.
																</p>
																<p class='sub_p mgt10'>③ 위탁업무의 내용이나 수탁자가 변경될 경우에는
																	지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</p>
																<br /> <br />
																<p class="lh6 bs4">
																	<strong>제5조(정보주체와 법정대리인의 권리·의무 및 그 행사방법)</strong>
																</p>
																<p class="ls2">
																	<br /> <br />① 정보주체는 (주)BFree에 대해 언제든지 개인정보
																	열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.
																</p>
																<p class='sub_p'>② 제1항에 따른 권리 행사는(주)BFree에 대해 「개인정보
																	보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수
																	있으며 (주)BFree은(는) 이에 대해 지체 없이 조치하겠습니다.</p>
																<p class='sub_p'>③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을
																	받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한
																	고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</p>
																<p class='sub_p'>④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」
																	제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.</p>
																<p class='sub_p'>⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가
																	수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</p>
																<p class='sub_p'>⑥ (주)BFree은(는) 정보주체 권리에 따른 열람의 요구,
																	정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를
																	확인합니다.</p>
																</br> </br>
																<p class='lh6 bs4'>
																	<strong>제6조(처리하는 개인정보의 항목 작성) </strong></br> </br> ① <em
																		class="emphasis"> <(주)BFree> </em>은(는) 다음의 개인정보 항목을
																	처리하고 있습니다.
																</p>
																<ul class='list_indent2 mgt10'>
																	<li class='tt'>1< 홈페이지 회원가입 및 관리></li>
																	<li>필수항목 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 로그인ID, 이름</li>
																	<li>선택항목 : 휴대전화번호, 자택전화번호, 성별, 생년월일</li>
																</ul>
																</br> </br>
																<p class='lh6 bs4'>
																	<strong>제7조(개인정보의 파기)<em class="emphasis"></strong>
																</p>
																<p class='ls2'>
																	</br>① <(주)BFree></em> 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게
																	되었을 때에는 지체없이 해당 개인정보를 파기합니다.</br> </br>② 정보주체로부터 동의받은 개인정보 보유기간이
																	경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는
																	경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.</br>1.
																	법령 근거 :</br>2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜</br> </br>③ 개인정보 파기의 절차 및 방법은
																	다음과 같습니다.</br>1. 파기절차</br> <(주)BFree> 은(는) 파기 사유가 발생한 개인정보를 선정하고,
																	<(주)BFree> 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.</br>
																</p>
																<p class='sub_p mgt10'>2. 파기방법</p>
																<p class='sub_p'>전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을
																	사용합니다.</p>
																종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다
																</p>
																</br> </br>
																<p class='lh6 bs4'>
																	<strong>제8조(개인정보의 안전성 확보 조치)<em
																		class="emphasis"></br> </br> <(주)BFree> </em>은(는) 개인정보의 안전성 확보를
																		위해 다음과 같은 조치를 취하고 있습니다.
																	</strong>
																</p>
																<p class='sub_p mgt10'>
																	1. 개인정보 취급 직원의 최소화 및 교육</br> 개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜
																	최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.</br> </br>2. 해킹 등에 대비한 기술적 대책</br> <<em
																		class="emphasis">(주)BFree</em>>('<em class="emphasis">BFree</em>')은
																	해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고
																	주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시
																	및 차단하고 있습니다.</br> </br>3. 개인정보의 암호화</br> 이용자의 개인정보는 비밀번호는 암호화 되어 저장 및
																	관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일
																	잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</br> </br>4. 접속기록의 보관 및 위변조 방지</br>
																	개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및
																	도난, 분실되지 않도록 보안기능 사용하고 있습니다.</br> </br>5. 개인정보에 대한 접근 제한</br> 개인정보를
																	처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를
																	위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고
																	있습니다.</br> </br>6. 비인가자에 대한 출입 통제</br> 개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고
																	이에 대해 출입통제 절차를 수립, 운영하고 있습니다.</br> </br>
																</p>
																</br> </br>
																<p class="lh6 bs4">
																	<strong>제9조(개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항)</strong>
																</p>
																<p class="ls2">
																	<br /> <br />(주)BFree 은(는) 정보주체의 이용정보를 저장하고 수시로 불러오는
																	‘쿠키(cookie)’를 사용하지 않습니다.
																<p class='sub_p mgt30'>
																	<strong>제10조 (개인정보 보호책임자) </strong>
																</p>
																<p class='sub_p mgt10'>
																	① <span class='colorLightBlue'>(주)BFree</span> 은(는)
																	개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및
																	피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
																</p>
																<ul class='list_indent2 mgt10'>
																	<li class='tt'>▶ 개인정보 보호책임자</li>
																	<li>성명 :(주)BFree</li>
																	<li>직책 :(주)BFree</li>
																	<li>직급 :(주)BFree</li>
																	<li>연락처 :010-1234-1234, bfree@bfree.com,
																		02-234-1234</li>
																</ul>
																<p class='sub_p'>※ 개인정보 보호 담당부서로 연결됩니다.</p>
																<ul class='list_indent2 mgt10'>
																	<li class='tt'>▶ 개인정보 보호 담당부서</li>
																	<li>부서명 :(주)BFree</li>
																	<li>담당자 :(주)BFree</li>
																	<li>연락처 :010-1234-1234, bfree@bfree.com,
																		02-234-1234</li>
																</ul>
																<p class='sub_p'>② 정보주체께서는 (주)BFree 의 서비스(또는 사업)을
																	이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보
																	보호책임자 및 담당부서로 문의하실 수 있습니다. (주)BFree 은(는) 정보주체의 문의에 대해
																	지체 없이 답변 및 처리해드릴 것입니다.</p>
																<p class='sub_p mgt30'>
																	<strong>제11조(개인정보 열람청구)</br> 정보주체는 ｢개인정보 보호법｣ 제35조에
																		따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.<br /> <(주)BFree></span>은(는)
																		정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.
																	</strong>
																</p>
																<ul class='list_indent2 mgt10'>
																	<li class='tt'>▶ 개인정보 열람청구 접수·처리 부서</li>
																	<li>부서명 : (주)BFree</li>
																	<li>담당자 : (주)BFree</li>
																	<li>연락처 : 02-234-1234, bfree@bfree.com,
																		02-234-1234</li>
																</ul>
																</br> </br>
																<p class='lh6 bs4'>
																	<strong>제12조(권익침해 구제방법)<em class="emphasis"></em></strong>
																</p>
																<br /> <br />정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회,
																한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타
																개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다.<br /> <br />
																1. 개인정보분쟁조정위원회 : (국번없이) 1833-6972 (www.kopico.go.kr)<br />
																2. 개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr)<br />
																3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr)<br /> 4. 경찰청 :
																(국번없이) 182 (cyberbureau.police.go.kr)<br /> <br />
																「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의
																처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리
																또는 이익의 침해를 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다.<br />
																<br /> ※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr)
																홈페이지를 참고하시기 바랍니다.</br> </br>
																<p class='lh6 bs4'>
																	<strong>제13조(개인정보 처리방침 변경)<em class="emphasis"></em></strong>
																</p>
																<br />
																</p>
																<p class='sub_p'>① 이 개인정보처리방침은 2021년 1월 1부터 적용됩니다.</p>
																<p class='sub_p'></p>
																<p class='sub_p'></p>
																<p class='sub_p'>② 이전의 개인정보 처리방침은 아래에서 확인하실 수 있습니다.
																</p>
																<p class='sub_p'></p>
																<p class='sub_p'></p>
																<p class='sub_p'>예시 ) - 20XX. X. X ~ 20XX. X. X 적용
																	(클릭)</p>
																<p class='sub_p'></p>
																<p class='sub_p'></p>
																<p class='sub_p'>예시 ) - 20XX. X. X ~ 20XX. X. X 적용
																	(클릭)</p>
																<p class='sub_p'></p>
																<p class='sub_p'></p>
																<p class='sub_p'>예시 ) - 20XX. X. X ~ 20XX. X. X 적용
																	(클릭)</p>
																</p>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal" style="color: black;">Close</button>
															</div>
														</div>

													</div>
												</div>
												<!-- HK Modal End -->
												<br>
												<button type="button"
													class="btn btn-common btn-effect btn-sub" id="join_button">가입신청</button>
										</div>
										<br>
									</div>
								</div>
						</div>

						<input type="hidden" id='token' name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<%-- <input type="hidden" id='header'
							name="header" value="${_csrf.headerName}" />  --%>

						</form>
					</div>
				</div>
				<div class="col-lg-2"></div>
				<!-- </div> -->
			</div>
		</div>
	</div>
	</div>
	<!-- Subcribe Section End -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>


	
		<!--이메일 형식 체크-->
		<script>
			function email_check( email ) {    
			    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			    return (email != '' && email != 'undefined' && regex.test(email)); 
			}

			$("input[type=email]").blur(function(){
			  var email = $(this).val();
			  if( email == '' || email == 'undefined') return;
			  if(! email_check(email) ) {
			  	$(".result-email").text('이메일 형식으로 적어주세요');
			    $(this).focus();
			    return false;
			  }else {
				$(".result-email").text('');
			  }
			});
			
		</script>
		
		
	<!-- 비밀번호 일치 불일치 체크 -->
	<script type="text/javascript">
			$(function() {
				$("#success").hide();
				$("#danger").hide();
				$("input").keyup(function() {
					var pwd1 = $("#pwd1").val();
					var pwd2 = $("#pwd2").val();
					if (pwd1 != "" || pwd2 != "") {
						if (pwd1 == pwd2) {
							$("#success").show();
							$("#danger").hide();
							$("#submit").removeAttr("disabled");
						} else if (pwd1 == "" || pwd2 == "") {
							$("#success").hide();
							$("#danger").hide();
						} else {
							$("#success").hide();
							$("#danger").show();
							$("#submit").attr("disabled", "disabled");
						}
					}
				});
			});
		</script>
			
	

	<!-- 이메일 중복 체크 -->
	<script type="text/javascript">
			function emailCheck() {
				console.log("진입");
				var email = $("#id_input").val();
				var token = $("meta[name='_csrf']").attr("content"); 
				var header = $("meta[name='_csrf_header']").attr("content");
			    if(email.search(/\s/) != -1) { 
			        alert("아이디에는 공백이 들어갈 수 없습니다.");        
			    } else { 
			    	if(email.trim().length != 0) {
			            $.ajax({
			            	type: 'post',
			            	url: 'emailCheck',
			            	data: email,
			            	dataType: 'text',
			            	contentType: "application/json; charset=UTF-8",
			            	beforeSend : function(xhr){
			            		xhr.setRequestHeader(header, token);},
			            	success: function(data) {
			            		if(data == 'OK') {
			            			alert('사용가능한 아이디입니다.');
			                    } else {
			                    	alert('중복된 아이디가 존재합니다.');
			                    } 
			            	}, 
			            	error: function(e) {
			            		console.log(e);
			            	}
			            });
			    	}  else {
			            alert("아이디를 입력해주세요.");
			        }   
			    }
			}
				
				
		</script>

	<!-- 비밀번호 유효성 검사 -->
	<script type="text/javascript">
		
		function password_check(password) {    
			   // 원하는 특수문자 추가 제거		
	        var regex= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	        if(!regex.test(password)){
				return false;
	        } else {
	        	return true;
	        }
		}
		
		$("input[name=password]").blur(function(){
			var password = $('#pwd1').val();
			 if( password == '' || password == 'undefined') return;
			console.log(password);
			 if(! password_check(password) ) {
				  	$("#error-password").text('영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.');
				    $(this).focus();
				  }else {
					$("#error-password").text('');
				  }
			
		});
	        
		</script>

	
				
	<!-- 비밀번호 유효성 검사 -->
	<script>
		$(document).ready(function() {
			var msg = '<%=msg%>';
			if(msg != null && msg != 'null') {
				alert(msg);
			}
			$("#join_button").click(function() {
				
				 if ($('#id_input').val() == '') {
			            alert("아이디를 입력해주십시오");
			            $('#id_input').focus();
			            return false;
			     } else if ($('#pwd1').val() == '') {
			            alert("비밀번호를 입력해주십시오");
			            $('#pwd1').focus();
			            return false;
			     } else if($('#name').val() == ''){
						$('#name').focus();
						alert('이름을 입력해주십시오.');
						return false;
			     } else if ($('#phone').val() == '') {
			            alert("연락처를 입력해주십시오");
			            $('#phone').focus();
			            return false;
			     } else {
			    	 
			    	 if ($("#checkbox").is(":checked")) {
						$("#join_form").attr("action", "${pageContext.request.contextPath }/user/join");
						$("#join_form").submit();
						alert("회원가입이 완료되었습니다.");
						
						
					}
					 else {
						alert("개인정보 동의에 체크해주세요!");

					}
			     }
			});
		});
	</script>


	<script>
	window.onload = function() {
   
   $(document).on("keyup", ".phoneNumber", function() { 
      $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("—", "-") ); 
  	 });
	}
	</script>



</body>

</html>