<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<script>
document.title ="Buddy 수정페이지(관리자 전용)";
</script>

<!-- Contact Section Start -->
<section id="contact" class="section" style="margin-top: 40px;">
   <div class="contact-form">
      <div class="container">
         <div class="section-header">
            <h2 class="section-title">Buddy 수정페이지(관리자 전용)</h2>
         </div>
         <div class="row">
            <div class="col-lg-12 col-md-12 col-xs-12">
               <div class="contact-block">
                  <form id="contactForm" action="${pageContext.request.contextPath }/admin/buddy/modify" method="post"
                     role="form">
                     <!-- 페이징 추가 -->
                     <input type="hidden" name="pageNum" value='${cri.pageNum}'>
                     <input type="hidden" name="amount" value='${cri.amount}'>
                     <input type="hidden" name="type" value='${cri.type }'>
                     <input type="hidden" name="keyword" value='${cri.keyword }'>

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
                           </div>

                           <div class="form-group">
                              <input type="text" id="phone" name="phone"
                                 class="form-control phoneNumber" required
                                 data-error="연락처를 입력해주세요"
                                 value='<c:out value="${buddy.phone }"/>'
                                 placeholder="전화번호를 입력하세요">
                           </div>


                           <div class="form-group">
                              <input type="text" name="zipCode" id="zipCode"
                                 class="form-control"
                                 value='<c:out value="${buddy.zipCode }"/>'
                                 placeholder="우편번호를 입력하세요" readonly>
                           </div>

                           <div class="form-group">
                              <input type="button" class="btn btn-common btn-effect"
                                 onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                              <div class="help-block with-errors"></div>
                           </div>

                           <div class="form-group">
                              <input type="text" name="loc" id="loc" class="form-control"
                                 value='<c:out value="${buddy.loc }"/>'
                                 placeholder="주소를 입력하세요" readonly>
                           </div>
                           <div class="form-group">
                              <input type="text" name="inputLoc" id="inputLoc"
                                 class="form-control"
                                 value='<c:out value="${buddy.inputLoc }"/>'
                                 placeholder="상세주소를 입력하세요">
                           </div>

                           <div class="form-group">
                              <input type="text" name="servLoc" id="servLoc"
                                 class="form-control" required data-error="담당하고 싶은 지역을 입력해주세요"
                                 value='<c:out value="${buddy.servLoc }"/>'
                                 placeholder="담당하고 싶은 주소를 입력하세요">
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
                              <h1>사진</h1>
                              <p>* 기존 사진을 다시 지정하지 않으면 등록되지 않습니다.</p>
                              <img id="beforeImg" style="width: 100%; height: auto;"
                                 src="${pageContext.request.contextPath }/resources/img/buddy/<c:out value='${buddy.pic }'/>">
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
                           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </div>
                     </div>
                  </form>
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
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   //Daum Address JS
   function sample6_execDaumPostcode() {
      new daum.Postcode({
         oncomplete : function(data) {
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
            if (data.userSelectedType === 'R') {
               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                  extraAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if (data.buildingName !== '' && data.apartment === 'Y') {
                  extraAddr += (extraAddr !== '' ? ', '
                        + data.buildingName : data.buildingName);
               }
               // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if (extraAddr !== '') {
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
   $(document).ready(function() {

      var formObj = $("form[role='form']");
      $("button[type='submit']").on("click", function(e) {
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
         } else if ($('#zipCode').val() == '') {
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
         } else if ($('#input-file').val() == '') {
            alert("사진을 업로드해주세요.");
            return false;
         }
         console.log("submit clicked");
         alert("수정이 완료되었습니다.");
      });

      // 파일 업로드
      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 5242880; // 5MB

      function checkExtension(fileName, fileSize) {
         if (fileSize >= maxSize) {
            alert("파일 사이즈 초과");
            return false;
         }
         if (regex.test(fileName)) {
            alert("해당 종류의 파일은 업로드할 수 없습니다.");
            return false;
         }
         return true;
      }

      var token = $("meta[name='_csrf']").attr("content");
      var header = $("meta[name='_csrf_header']").attr("content");

      $("input[type='file']").change(function(e) {
         var formData = new FormData();
         var inputFile = $("input[name='pic']");
         var files = inputFile[0].files;
         console.log(files);
         for (var i = 0; i < files.length; i++) {
            if (!checkExtension(files[i].name, files[i].size)) {
               return false;
            }
            formData.append("pic", files[i]);
         }
         console.log(formData);
         $.ajax({
            url : "${pageContext.request.contextPath }/uploadAjaxAction",
            data : formData,
            dataType : 'json',
            processData : false,
            contentType : false,
            beforeSend : function(xhr) {
               xhr.setRequestHeader(header, token);
            },
            type : 'POST',
            success : function(result) {
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
</script>
<script>
$(document).on("keyup",".phoneNumber",function() {
   $(this).val($(this).val().replace(/[^0-9]/g, "")
      .replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,
      "$1-$2-$3").replace("--", "-"));
});
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>