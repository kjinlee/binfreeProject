<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<!-- Contact Section Start -->
<section id="contact" class="section" style="margin-top: 40px;">
	<div class="contact-form">
		<div class="container">
			<div class="section-header">
				<h2 class="section-title">Buddy 지원서 수정페이지(관리자 전용)</h2>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-xs-12">
					<div class="contact-block">
						<form id="contactForm" action="/buddy/modify" method="post"
							role="form">
							<!-- 페이징 추가 -->
							<input type="hidden" name="pageNum" value='${cri.pageNum}'>
							<input type="hidden" name="amount" value='${cri.amount}'>


							<div class="row">
								<div class="col-md-7">

									<div class="form-group">
										채용번호 :
										<c:out value="${buddy.id }" />
										<input type="hidden" name="id" value="${buddy.id }">
									</div>

									<div class="form-group">
										<input type="text" class="form-control" id="name" name="name"
											required data-error="이름을 입력해주세요"
											value='<c:out value="${buddy.name }"/>'
											placeholder="이름을 입력하세요">
										<div class="help-block with-errors"></div>
									</div>

									<div class="form-group">
										<input type="text" id="msg_subject" name="phone"
											class="form-control" required data-error="연락처를 입력해주세요"
											value='<c:out value="${buddy.phone }"/>'
											placeholder="전화번호를 입력하세요">
										<div class="help-block with-errors"></div>
									</div>


									<div class="form-group">
										<input type="text" name="zipCode" id="sample6_postcode"
											class="form-control"
											value='<c:out value="${buddy.zipCode }"/>'
											placeholder="우편번호를 입력하세요">
										<div class="help-block with-errors"></div>
									</div>
									
									<div class="form-group"> 
										<input type="button" class="btn btn-common btn-effect" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										<div class="help-block with-errors"></div>
									</div>
									
									<div class="form-group">
										<input type="text" name="loc" id="sample6_address"
											class="form-control" value='<c:out value="${buddy.loc }"/>'
											placeholder="주소를 입력하세요">
										<div class="help-block with-errors"></div>
									</div>
									<div class="form-group">
										<input type="text" name="inputLoc" id="sample6_extraAddress"
											class="form-control"
											value='<c:out value="${buddy.inputLoc }"/>'
											placeholder="상세주소를 입력하세요">
										<div class="help-block with-errors"></div>
									</div>

									<div class="form-group">
										<input type="text" name="servLoc" id="msg_subject"
											class="form-control" required data-error="담당하고 싶은 지역을 입력해주세요"
											value='<c:out value="${buddy.servLoc }"/>'
											placeholder="담당하고 싶은 주소를 입력하세요">
										<div class="help-block with-errors"></div>
									</div>

									<div class="submit-button" style="margin-top: 20px;">
										<button class="btn btn-common btn-effect" id="submit"
											type="submit">Buddy 정보 수정하기</button>
										<div id="msgSubmit" class="h3 hidden"></div>
										<div class="clearfix"></div>
									</div>

								</div>

								<div class="col-md-5">
									<div style="text-align: center">
										<h1>변경 전 사진</h1>
										<img style="width: 100%; height: auto;"
											src="../resources/img/buddy/<c:out value='${buddy.pic }'/>">
									</div>

									<div style="text-align: center">
										<h1>수정할 사진</h1>
										<p>* 사진 클릭시 삭제됩니다.</p>
										<p>* 변경 전 사진은 다시 설정해 주어야 합니다.</p>
									</div>

									<div style="margin-top: 10px; text-align: center;">
										<input type="file" id="input-file" name="pic"
											style="display: none;"
											onchange="previewImage(this, 'View_area')"> <span
											id='View_area'
											style='position: relative; color: black; border: 0px solid black;'></span>
									</div>
									<div style="margin-top: 17.5px; text-align: center;">
										<label class="btn btn-common btn-effect" for="input-file"
											id="picSelect">사진 선택</label>
										<div class="clearfix"></div>
									</div>

								</div>
							</div>
						</form>
					</div>
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

								<a class="accordion-toggle collapsed two" data-toggle="collapse"
									data-parent="#accordion" href="#collapseA"
									style="text-align: start;">개인정보 처리 동의 안내</a>
							</div>
							<div class="col-sm-6" style="text-align: end;">
								<a class="accordion-toggle collapsed button"
									data-toggle="collapse" data-parent="#accordion"
									href="#collapseA">▼</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Contact Section End -->

<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
	
<!-- Daum Address CDN -->
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

var fileArr;
var fileInfoArr=[];

//썸네일 클릭시 삭제.
function fileRemove(index) {
    console.log("index: "+index);
    fileInfoArr.splice(index,1);
 
    var imgId="#img_id_"+index;
    $(imgId).remove();
    console.log(fileInfoArr);
}

//썸네일 미리보기.
function previewImage(targetObj, View_area) {
    var files=targetObj.files;
    fileArr=Array.prototype.slice.call(files);
    
    var preview = document.getElementById(View_area); //div id
    var ua = window.navigator.userAgent;
 
    //ie일때(IE8 이하에서만 작동)
    if (ua.indexOf("MSIE") > -1) {
        targetObj.select();
        try {
            var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
            var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);
 
 
            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error가 있으면 delete
            }
 
            var img = document.getElementById(View_area); //이미지가 뿌려질 곳
 
            //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + View_area)) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + View_area;
                info.innerHTML = e.name;
                preview.insertBefore(info, null);
            }
        }
        //ie가 아닐때(크롬, 사파리, FF)
    } else {
        var files = targetObj.files;
        for ( var i = 0; i < files.length; i++) {
            var file = files[i];
            fileInfoArr.push(file);
 
            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
            if (!file.type.match(imageType))
                continue;
            // var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
            // if (prevImg) {
            //     preview.removeChild(prevImg);
            // }
 
            var span=document.createElement('span');
            span.id="img_id_" +i;
            span.style.width = '100%';
            span.style.height = 'auto';
            preview.appendChild(span);
 
            var img = document.createElement("img");
            img.className="addImg";
            img.classList.add("obj");
            img.file = file;
            img.style.width='inherit';
            img.style.height='inherit';
            img.style.cursor='pointer';
            const idx=i;
            img.onclick=()=>fileRemove(idx);
           
            span.appendChild(img);
 
            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                var reader = new FileReader();
                reader.onloadend = (function(aImg) {
                    return function(e) {
                        aImg.src = e.target.result;
                    };
                })(img);
                reader.readAsDataURL(file);
            } else { // safari is not supported FileReader
                //alert('not supported FileReader');
                if (!document.getElementById("sfr_preview_error_"
                    + View_area)) {
                    var info = document.createElement("p");
                    info.id = "sfr_preview_error_" + View_area;
                    info.innerHTML = "not supported FileReader";
                    preview.insertBefore(info, null);
                }
            }
        }
    }
}
</script>

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
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>

<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	$("button[type='submit']").on("click", function(e){
		// e.preventDefault();
		consolelog("submit clicked");
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
		
	$.ajax({
		url: "/uploadAjaxAction",
		processData: false,
		contentType: false, 
		data: formData,
		type: 'POST',
		dataType:'json',
			success: function(result){
				console.log(result);
				// 업로드 결과 처리 함수
				// showUploadResult(result);
			}
	});
	
	});
	
});
</script>

<%@ include file="../includes/footer.jsp"%>