<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<!-- Contact Section Start -->
<section id="contact" class="section" style="margin-top: 40px;">
	<div class="contact-form">
		<div class="container">
			<div class="section-header">
				<h2 class="section-title">BFamily 수정 페이지(관리자 전용)</h2>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-xs-12">
					<div class="contact-block">
						<form id="contactForm" action="${pageContext.request.contextPath }/admin/bfamily/bfamilyModify" method="post"
							role="form">
							<!-- 페이징 추가 -->
							<input type="hidden" name="pageNum" value='${cri.pageNum}'>
							<input type="hidden" name="amount" value='${cri.amount}'>


							<div class="row">
								<div class="col-md-7 border-right">

									<div class="form-group">
										BFamily 번호 : <c:out value="${bflist.id }" />
										<input type="hidden" name="id" value="${bflist.id }">
									</div>
									
									<div class="form-group">
										BFamily 이름: <c:out value="${bflist.name }"/>
									</div>
									
									<div class="form-group">
										<input type="text" class="form-control" id="subItem" name="subName"
											value='<c:out value="${bflist.subName }"/>'
											placeholder="구독하시는 분의 성함">
									</div>
									
									<div class="form-group">
										<input type="text" class="form-control" id="subItem" name="subPhone"
											value='<c:out value="${bflist.subPhone }"/>'
											placeholder="구독하시는 분의 연락처">
									</div>

									<div class="form-group">
										<input type="text" class="form-control" id="subItem" name="subItem"
											value='<c:out value="${bflist.subItem }"/>'
											placeholder="수정하는 상품">
									</div>
									
									<div class="form-group">
										<input type="date" class="form-control" id="subStart" name="subStart"
											value='<c:out value="${bflist.subStart }"/>'
											placeholder="구독 시작 일">
									</div>
									
									<div class="form-group">
										<input type="date" class="form-control" id="subEnd" name="subEnd"
											value='<c:out value="${bflist.subEnd }"/>'
											placeholder="구독 종료 일 YYYY-MM-DD형식">
									</div>
									
									<div class="form-group">
										<input type="text" class="form-control" id="myBuddy" name="myBuddy"
											value='<c:out value="${bflist.myBuddy }"/>'
											placeholder="BFamily의 Buddy">
									</div>

									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

									<div class="submit-button" style="margin-top: 20px;">
										<button class="btn btn-common btn-effect" id="submit"
											type="submit">BFamily 정보 수정하기</button>
										<div id="msgSubmit" class="h3 hidden"></div>
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
</section>
<!-- Contact Section End -->

<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
	
<!-- Daum Address CDN -->
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	$("button[type='submit']").on("click", function(e){
		// e.preventDefault();
		console.log("submit clicked");
		alert("BFamily 정보가 수정되었습니다.");
	});
	
});
</script>

<script type="text/javascript">
    function inputYMDNumber(obj) {
    	
        // @see DELETE 키버튼이 눌리지 않은 경우에만 실행
        if(event.keyCode != 8) {
        	
            // @see 숫자와 하이픈(-)기호의 값만 존재하는 경우 실행
            if(obj.value.replace(/[0-9 \-]/g, "").length == 0) {
            	
                // @see 하이픈(-)기호를 제거한다.
                let number = obj.value.replace(/[^0-9]/g,"");
                let ymd = "";
                
                // @see 문자열의 길이에 따라 Year, Month, Day 앞에 하이픈(-)기호를 삽입한다.
                if(number.length < 4) {
                    return number;
                } else if(number.length < 6){
                    ymd += number.substr(0, 4);
                    ymd += "-";
                    ymd += number.substr(4);
                } else {
                    ymd += number.substr(0, 4);
                    ymd += "-";
                    ymd += number.substr(4, 2);
                    ymd += "-";
                    ymd += number.substr(6);
                }
                // @see 입력 가능 날짜 제한 기능 - 선택
                // if(ymd.length == 10) {
                //
                //     const birthDay = new Date(number.substr(0,4)+"/"+number.substr(4,2)+"/"+number.substr(6)+" 00:00:00");
                //     const limitDay = new Date("2000/10/04 23:59:59");
                //
                //     if(birthDay > limitDay) {
                //         alert("2000년 10월 04일 이후의 날짜는\n선택할 수 없습니다.");
                //         obj.value = "";
                //         obj.focus();
                //         return false;
                //     }
                // }



                obj.value = ymd;



            } else {
                alert("숫자 이외의 값은 입력하실 수 없습니다.");
                //@see 숫자와 하이픈(-)기호 이외의 모든 값은 삭제한다.
                obj.value = obj.value.replace(/[^0-9 ^\-]/g,"");

                return false;

            }

        } else {

            return false;

        }

    }

</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>