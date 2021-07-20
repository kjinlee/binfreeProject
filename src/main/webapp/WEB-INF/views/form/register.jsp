<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<script>
document.title = "Buddy 구인 페이지";
</script>

<!-- Contact Section Start -->
<section id="contact" class="section" style="margin-top: 40px;">
	<div class="contact-form">
		<div class="container">
			<div class="section-header">
				<h2 class="section-title">Buddy가 되어주세요</h2>
				<p class="section-subtitle">
					만 15세 이상이라면 누구나 지원 가능합니다<br> 당신의 연락을 기다리고 있을게요
				</p>
				<p>* 주의사항 : 지원버튼을 누르고 나서는 수정이 불가능합니다!!</p>
			</div>

			<div class="row">
				<div class="col-lg-12 col-md-12 col-xs-12">

					<div class="contact-block">
						<form id="contactForm" action="${pageContext.request.contextPath }/admin/form/register" method="post"
							role="form">
							<div class="row">
								<div class="col-md-7 border-right">

									<div class="form-group">
										<input type="text" class="form-control" id="name" name="name"
											placeholder="이름을 입력하세요" required data-error="이름을 입력해주세요">
										<div class="help-block with-errors"></div>
									</div>

									<div class="form-group">
										<input type="text" placeholder="연락처를 입력하세요" id="phone"
											name="phone" class="form-control phoneNumber" maxlength="13"
											required data-error="연락처를 입력해주세요">
										<div class="help-block with-errors"></div>
									</div>


									<div class="form-group">
										<input type="text" placeholder="우편번호를 입력하세요" name="zipCode"
											id="zipCode" class="form-control" readonly> <input
											type="button" class="btn btn-common btn-effect"
											onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										<div class="help-block with-errors"></div>
									</div>


									<div class="form-group">
										<input type="text" placeholder="주소를 입력하세요" name="loc" id="loc"
											class="form-control" readonly>
										<div class="help-block with-errors"></div>
									</div>

									<div class="form-group">
										<input type="text"
											placeholder="상세주소를 입력하세요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ex)건물명, 동, 호수"
											name="inputLoc" id="inputLoc" class="form-control">
										<div class="help-block with-errors"></div>
									</div>

									<div class="form-group">
										<input type="text" placeholder="담당하고 싶은 지역을 입력해주세요"
											name="servLoc" id="servLoc" class="form-control" required
											data-error="담당하고 싶은 지역을 입력해주세요">
										<div class="help-block with-errors"></div>
									</div>

									<div class="submit-button" style="margin-top: 20px;">
										<button class="btn btn-common btn-effect" id="submit"
											type="submit">Buddy 지원하기!</button>
										<div id="msgSubmit" class="h3 hidden"></div>
										<div class="clearfix"></div>
									</div>
								</div>

								<div class="col-md-5">
								
									<div style="text-align: center">
										<h1>사진</h1>
										<img id="beforeImg" style="width: 100%; height: auto;"
											src="${pageContext.request.contextPath }/resources/img/buddy/pic.png">
									</div>

									<div style="margin-top: 10px; text-align: center;">
										<input type="file" id="input-file" name="pic" accept="image/*"
											style="display: none;">
									</div>
									<div style="margin-top: 17.5px; text-align: center;">
										<label class="btn btn-common btn-effect" for="input-file"
											id="picSelect">사진 선택</label>
										<div class="clearfix"></div>
									</div>
									
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="container">
				<div class="panel-group" id="accordion">
					<div class="panel panel-default" style="padding-top: 5px;">
						<hr />
						<div class="panel-heading-two">
							<div class="row">
								<div class="col-md-6">

									<a class="accordion-toggle collapsed two"
										data-toggle="collapse" data-parent="#accordion"
										href="#collapseA" style="text-align: start;">개인정보 처리 동의 안내</a>
								</div>
								<div class="col-md-6" style="text-align: end;">
									<a class="accordion-toggle collapsed button"
										data-toggle="collapse" data-parent="#accordion"
										href="#collapseA">▼</a>
								</div>
							</div>
						</div>
						<hr />
						<div id="collapseA" class="panel-collapse collapse">
							<div class="panel-body">
								개인정보 수집 및 이용에 대한 안내<br> <br> 비프리는 버디 지원을 위해 최소한의 개인정보를
								처리하고 있으며, 사전 동의 없이는 목적 외로 이용하지 않습니다.<br> <br> 1. 수집하는
								항목 : 이름, 연락처, 생년월일<br> 2. 개인정보 수집 이용 목적 : 버디 인재채용<br>
								3. 개인정보의 보유 및 이용 기간 : 입사 지원서에 작성하신 개인정보는 회사의 인재 채용을 위한 인재풀로 활용될
								예정으로 <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;채용전형 결과 통보일로부터 1년까지
								보관됩니다. <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지원자께서 삭제를 요청하실 경우
								해당 개인정보는 삭제됩니다.
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- PC 카카오톡 상담 버튼 -->
	<%@ include file="/WEB-INF/views/includes/kakaochat.jsp"%>

</section>

<!-- Contact Section End -->

<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<!-- Daum Address CDN -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
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
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	$("button[type='submit']").on("click", function(e){
		// e.preventDefault();
	   console.log("submit clicked");
	   if ($('#name').val() == '') {
            alert("이름을 입력하세요!");
            $('#name').focus();
            return false;
  	   } else if ($('#phone').val() == '') {
            alert("연락처를 입력하세요!");
            $('#phone').focus();
            return false;
   	   } else if($('#zipCode').val() == ''){
			alert('우편번호를 입력하세요!');
			$('#zipCode').focus();
			return false;
  	   } else if ($('#loc').val() == '') {
            alert("주소를 입력하세요!");
            $('#loc').focus();
            return false;
  	   } else if ($('#servLoc').val() == '') {
           alert("담당하고 싶은 지역을 입력하세요!");
           $('#servLoc').focus();
           return false;
  	   }else if ($('#input-file').val() == '') {
           alert("사진을 업로드해주세요.");
           return false;
  	   }
		
	   alert("지원되었습니다.");
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; // 5MB
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	$("input[type='file']").change(function(e){
		var formData = new FormData();
		var inputFile = $("input[name='pic']");
		var files = inputFile[0].files;
		console.log(files);
		for(var i = 0; i < files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("pic", files[i]);
		}
		console.log(formData);
		$.ajax({
			url: "${pageContext.request.contextPath }/uploadAjaxAction",
			data: formData,
			dataType:'json',
			processData: false,
			contentType: false,
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
			},
			type: 'POST',
				success: function(result){
					console.log(result);
					// 업로드 결과 처리 함수
					// showUploadResult(result);
				}
		});
	
	});
	
	// 이미지 변경
	$("#input-file").change(function() {
		setImgFromFile(this, "#beforeImg");
	});

	function setImgFromFile(input, expression) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$(expression).attr("src", e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
});


/* 전화번호 -형식 넣기  */
window.onload = function() {

$(document).on("keyup", ".phoneNumber", function() { 
  $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("—", "-") ); 
	 });
}


</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

