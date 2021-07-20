<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/line-icons.css">
<style type="text/css">
.dragAndDropDiv {
	border: 2px dashed #92AAB0;
	width: 650px;
	height: 100px;
	color: #92AAB0;
	text-align: center;
	vertical-align: middle;
	padding: 10px 0px 10px 10px;
	font-size: 14px;
	display: table-cell;
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}

.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 250px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 13px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
}
</style>
</head>
<body>

		<div class="modal fade" id="form" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="text-right cross">
								<i class="fa fa-times mr-2" data-dismiss="modal"></i>
							</div>
							<div class="card-body text-center">
								<img src="${pageContext.request.contextPath }/resources/img/good.jpg" height="100" width="100">
									<div class="comment-box text-center">
									<p style="font-size: 25px; padding: 20px;">서비스에 만족하셨나요?</p>
																
									<!-- 리뷰 작성 폼 action -->
									<input type="hidden" id="star" />
									<div class="rating">
									<input type="radio" name="star" value="5" id="5">
										<label for="5">☆</label> 
										<input type="radio" name="star" value="4" id="4"> 
										<label for="4">☆</label> 
										<input type="radio" name="star" value="3" id="3"> 
										<label for="3">☆</label>
										<input type="radio" name="star" value="2" id="2"> 
										<label for="2">☆</label> 
										<input type="radio" name="star" value="1" id="1"> 
										<label for="1">☆</label>
									</div>
									<div class="comment-area">
										<textarea class="form-control" id="contents" ame="contents" placeholder="리뷰를 작성해주세요." rows="4"></textarea>
									</div>
																
																
									<!-- 버튼 -->
								<div class="text-center mt-4">
									<button name="subBtn" type="submit"
										class="btn btn-success send px-4" onclick="insert();">
										작성 완료 <i class="fa fa-long-arrow-right ml-1"></i>
									</button>
								<button name="subBtn" type="button"
										class="btn btn-success send px-4" data-dismiss="modal">
										취소 <i class="fa fa-long-arrow-right ml-1"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

</body>
</html>