<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BFree 소개</title>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css' />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.btn.btn-common.btn-effect.sub {
	color: white;
}

#subContent {
	width: 100%;
	height: 60%;
	padding-top: calc(100vh - 40px);
	background: url('${pageContext.request.contextPath }/resources/img/subContent.jpeg') no-repeat;
	background-size: 100vw;  
	position: relative;
	margin-top: 40px;
}

#subContent .subContent-container {
	position: absolute;
	bottom: 0;
	top: 0;
	left: 0;
	right: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	text-align: center;
	height: 440px;
}

#subContent .subContent-container .textbox {
	position: absolute;
	right: 10%;
	top: 50%;
	text-align: left;
	line-height: normal;
	margin: 0 0 10px 0;
	font-size: 30px;
	font-family: sans-serif;
	font-weight: 320;
	color: white;
}

#subContent .subContent-container .textbox p {
	color: lightgrey;
}

.facts-item {
	text-align: center;
	font-size: 20px;
	line-height: 10px;
	font-weight: 200;
}

.facts-item1 {
	font-size: 20px;
	font-weight: 200;
}

.facts-item1 p {
	font-size: 25px;
	font-weight: 500;
}

.facts-item1 .title {
	font-weight: 800;
	font-size: 20px;
}

.facts-item .icon p {
	font-size: 30px;
	font-weight: 500;
}

.facts-item .icon.emoji {
	padding-top: 23px;
	font-size: 90px;
}

.facts-item .icon .sub {
	font-size: 50px;
}

.facts-item .icon .title {
	padding-top: 30px;
}

.step {
	padding-bottom: 10%;
}

.btn.btn-common.btn-effect{
	margin-right: 0 !important;
	
}

.btn.btn-common.btn-effect.sub:hover {
	background-color: #0a8a8a;
}

</style>

</head>
<body>
	<!-- Header Section Start -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!-- Header Section End -->


	<div class="container">
		<div class="row subimg">
			<div class="col-sm-12">
				<div
					style="max-width: 100%; height: auto; margin: 20% 0 25% 0; font-size: 39px; font-weight: 200;">
					<div style="font-size: 29px; color: #0a8a8a;">
						BIN<span style="font-size: 21px; color: black;"> 쓰레기</span> + FREE<span
							style="font-size: 21px; color: black;"> 자유</span> = BFree
					</div>
					<br /> <b>우리</b>는 세상의 쓰레기를 줄이고, <br />더 많은 사람들의 <span
						style="color: #0a8a8a;">현명하고 건강한 소비</span>를 <br />돕기 위해 탄생했습니다.
				</div>
			</div>
		</div>
	</div> 

	<div id="subContent">
		<div class="subContent-container">
			<div class="textbox">
				<div style="font-size: 2.2vw;">재활용, 올바르게 하고 계신가요?</div>
				<br />
				<p>
					담배꽁초나 쓰레기가 들어간 플라스틱병, <br />음식물이 잔뜩 묻어있는 비닐장갑과 비닐봉지,<br /> 시뻘건
					고춧가루 물이 든 스티로폼, 이물질 잔뜩하고 곰팡이까지 핀 <br />플라스틱 용기가 버젓이 재활용품으로 분리
					배출됩니다. <br /> 지저분한 재활용품들은 업체에서 가지고 가지 않으려 하고,<br /> 품목별로 선별한
					재활용품들은 재위탁 업체에서 사 가고 있는데, <br />그렇지 못한 것들은 죄다 쓰레기로 전락하고 있습니다.<br />
					이러한 일을 해결하기 위해 BFree가 존재합니다.
				</p>

			</div>
		</div>
	</div>

	<section class="call-action section">
		<div class="container">
			<div class="row justify-content-center"
				style="width: 100%; padding-bottom: 10%;">
				<div class="col-10">
					<div class="cta-trial text-center">

						<p
							style="font-size: 40px; font-weight: 200; padding: 10% 0 10% 0;">구독을
							하면 무엇이 좋나요?</p>

					</div>
					<br />
					<div class="container">
						<div class="row">
							<div class="col-sm-4">
								<div class="facts-item">
									<div class="icon">
										<i class="fas fa-diagnoses sub"></i>
										<div class="title">바쁜 현대시대에</div>
										<br />
										<p>편리해져요</p>
										<hr />
										<div style="font-size: 15px; line-height: 30px;">
											직접 분리수거할 필요 없이,<br /> 한 곳에 모두 담아 문 앞에 <br />내놓기만 하면 끝나요.
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="facts-item">
									<div class="icon sub">
										<i class="fas fa-globe-americas sub"></i>
										<div class="title">바른 재활용으로</div>
										<br />
										<p>환경을 지켜요</p>
										<hr />
										<div style="font-size: 15px; line-height: 30px;">
											매년 잘못된 분리수거로 인해<br /> 오염되어 가는 지구를 <br />지킬 수 있어요.
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="facts-item">
									<div class="icon sub">
										<i class="fas fa-users sub"></i>
										<div class="title">일자리 창출에</div>
										<br />
										<p>도움이 되요</p>
										<hr />
										<div style="font-size: 15px; line-height: 30px;">
											고용 사각지대에 놓인<br /> 시니어, 장애우 등 을<br />우선 채용합니다.
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="call-action section" style="background: #F3FBE4;">
		<div class="container">
			<div class="row justify-content-center"
				style="width: 100%; padding-bottom: 10%;">
				<div class="col-10">
					<div class="cta-trial text-center">

						<p
							style="font-size: 40px; font-weight: 200; padding: 10% 0 10% 0;">
							어떻게 진행되나요?</p>

					</div>
					<br />
					<div class="container">
						<div class="row step">
							<div class="col-sm-6">
								<div class="facts-item">
									<div class="icon emoji">
										<i class="far fa-calendar-check"></i>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="facts-item1">
									<div class="icon">
										<div class="title">STEP 1</div>
										<p>구독 개월 수를 결정하세요.</p>
										<br />
										<div style="font-size: 15px; line-height: 25px;">
											1개월, 6개월, 1년 등 구독하고 싶은<br />개월 수를 정해주세요.
										</div>
									</div>
								</div>
							</div>

						</div>

						<div class="row step">
							<div class="col-sm-6">
								<div class="facts-item">
									<div class="icon emoji">
										<i class="fas fa-shipping-fast"></i>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="facts-item1">
									<div class="icon">
										<div class="title">STEP 2</div>
										<p>Buddy가 찾아갑니다.</p>
										<br />
										<div style="font-size: 15px; line-height: 25px;">
											매주 화요일, 토요일에 구독 신청 시 작성했던 주소로<br />매칭된 Buddy가 재활용품을 수거하러
											찾아갑니다.

										</div>
										<br />
									</div>
								</div>
							</div>

						</div>
						<div class="row step">
							<div class="col-sm-6">
								<div class="facts-item">
									<div class="icon emoji">
										<i class="fas fa-recycle"></i>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="facts-item1">
									<div class="icon">
										<div class="title">STEP 3</div>
										<p>올바르게 분리수거합니다.</p>
										<br />
										<div style="font-size: 15px; line-height: 25px;">
											올바른 재활용 방법으로 재사용성을 잃어가는<br />쓰레기를 줄이고, 재사용률을 높입니다.
										</div>
										<br />
									</div>
								</div>
							</div>
						</div>
						<br /> <br />
						<div class="plan-button" style="text-align: center; padding-left: 5%;">
							<input type="button" class="btn btn-common btn-effect sub"
								onclick="goSub();" value="구독하러 가기">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer Section Start -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

	<script type="text/javascript">
		function goSub() {
			location.href = "${pageContext.request.contextPath }/subscribe/main";
		}
	</script>

</body>
</html>