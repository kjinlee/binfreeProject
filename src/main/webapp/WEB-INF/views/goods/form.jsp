<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE web-app PUBLIC
 "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
 "http://java.sun.com/dtd/web-app_2_3.dtd" >
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="keywords"
	content="Bootstrap, Landing page, Template, Registration, Landing">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="author" content="Grayrids">

<title>굿즈 상품 등록</title>





<style>
.dragAndDropDiv {
	border: 2px dashed #92AAB0;
	width: 800px;
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
	<!-- Header Section Start -->
	<%@ include file="/WEB-INF/views/includes/header.jsp"%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<%-- 입력 폼 --%>
	<form id= "writerAction" action="${pageContext.request.contextPath }/goods/insert" method="post" role="form">
	<div class="container col-md-7" >	
		<div class="subscribe-form">
		<div class="form-wrapper">
		<div class="sub-title text-center">
				<h3>상품 등록</h3>
		</div>
		
		<!-- 상품명 입력 -->
		<div>
		<h6 style="padding-left:40px;">상품명</h6>
		<input type="text" name="goodsName" class="form-control"  placeholder="상품명을 입력해주세요.">
		</div>
		
		<!-- 부제목 입력 -->
		<div>
		<h6 style="padding-left:40px;">부제목</h6>
		<input type="text" name="subName" class="form-control"  placeholder="부제목을 입력해주세요.">
		</div>
				
		<!-- 옵션  입력 -->
		<div>
		<h6 style="padding-left:40px;">옵션</h6>		
		<input type="text" name="option1" class="form-control" placeholder="상품 옵션1 을 입력해주세요.">
		<input type="text" name="option2" class="form-control" placeholder="상품 옵션2 을 입력해주세요.">
		<input type="text" name="option3" class="form-control" placeholder="상품 옵션3 을 입력해주세요."> 
		</div>
		
		<!-- 토큰 -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
		<!-- 내용 입력 -->
		<div class="form-group">
		<h6 style="padding-left:40px;">내용</h6>
			<textarea class="form-control" rows="10" name="contents"	placeholder="내용을 입력해주세요"></textarea>
		</div>
		
		<!-- 파일업로드 -->
		<div class="row">
			<div class="col-12" style="padding-bottom:15px">
				<div id="fileUpload" class="dragAndDropDiv">
					<i class="lni-files" style="font-size: 20px; "></i>	<br/>								
					마우스로 첨부할 파일을 끌거나 창을 눌러 이미지를 추가할 수 있습니다.
				</div>
		<input type="file" name="fileUpload" id="fileUpload" style="display: none;"/> 
		</div>
		</div>
		<br/>
		<br/>
		<button type="submit" class="btn btn-common btn-effect sub"  style="width:100%;"> 상품등록</button>
		
	</div>
	</div>
	</div>
	</form>
	
	<!-- 푸터 -->	
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>


<!-- 파일 업로드 -->
<script type="text/javascript">
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	$(document).ready(
		function() {
		var objDragAndDrop = $(".dragAndDropDiv");
		
		$(document).on("dragenter", ".dragAndDropDiv",function(e) {
			e.stopPropagation();
			e.preventDefault();
			$(this).css('border', '2px solid #0B85A1');
		});
		
		$(document).on("dragover", ".dragAndDropDiv", function(e) {
			e.stopPropagation();
			e.preventDefault();
		});
		
		$(document).on("drop", ".dragAndDropDiv", function(e) {
			$(this).css('border', '2px dotted #0B85A1');
			e.preventDefault();
			var files = e.originalEvent.dataTransfer.files;
		
			handleFileUpload(files, objDragAndDrop);
		});

		$(document).on('dragenter', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});
		
		$(document).on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
			objDragAndDrop.css('border', '2px dotted #0B85A1');
		});
		
		$(document).on('drop', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});
		
		//drag 영역 클릭시 파일 선택창
						
		objDragAndDrop.on('click', function(e) {
			$('input[type=file]').trigger('click');
		});

		$('input[type=file]').on('change', function(e) {
			var files = e.originalEvent.target.files;
			handleFileUpload(files, objDragAndDrop);
			
		});

		function handleFileUpload(files, obj) {
			
			for (var i = 0; i < files.length; i++) {
				var fd = new FormData();
				fd.append('file', files[i]);
				var status = new createStatusbar(obj); //Using this we can set progress.
				status.setFileNameSize(files[i].name, files[i].size);
				sendFileToServer(fd, status);

					}
		}
				
		var rowCount = 0;
		function createStatusbar(obj) {
			rowCount++;
			var row = "odd";
			if (rowCount % 2 == 0)
				row = "even";
				if(rowCount < 2){
				this.statusbar = $("<div class='statusbar "+row+"'></div>");
				this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
				this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
				this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
				this.abort = $("<div class='abort'> 삭제 </div>").appendTo(this.statusbar);

				obj.after(this.statusbar);
				} else {
					alert("최대 1장까지만 업로드 가능합니다!");
				}

				this.setFileNameSize = function(name, size) {
					var sizeStr = "";
					var sizeKB = size / 1024;
					if (parseInt(sizeKB) > 1024) {
						var sizeMB = sizeKB / 1024;
						sizeStr = sizeMB.toFixed(2) + " MB";
						
					} else {
						sizeStr = sizeKB.toFixed(2) + " KB";

					}

					this.filename.html(name);
					this.size.html(sizeStr);
				}

				this.setProgress = function(progress) {
					var progressBarWidth = progress * this.progressBar.width() / 100;
					this.progressBar.find('div').animate({width : progressBarWidth }, 10).html(progress + "% ");
					if (parseInt(progress) >= 100) {
								}
							}

					this.setAbort = function(jqxhr) {
					var sb = this.statusbar;
					this.abort.click(function() {
						jqxhr.abort();
						sb.hide();
					});
				}
			}

				function sendFileToServer(formData, status) {
					var jqXHR = $
					.ajax({
						xhr : function() {
						var xhrobj = $.ajaxSettings.xhr();
						if (xhrobj.upload) {
							xhrobj.upload.addEventListener(
								'progress',
							function(event) {
								var percent = 0;
								var position = event.loaded|| event.position;
								var total = event.total;
									if (event.lengthComputable) {
											percent = Math.ceil(position/ total* 100);
										}
									//Set progress
									status.setProgress(percent);}, false);
											
						}
						
						return xhrobj;
						
						},
						url : "/goods/upload",
						type : "POST",
						contentType : false,
						processData : false,
						cache : false,
						beforeSend : function(xhr) {
						/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
							xhr.setRequestHeader(header, token);
						},
						data : formData,
						success : function(data) {
						status.setProgress(100);
 						//$("#status1").append("File upload Done<br>");           
										}
									});

						status.setAbort(jqXHR);
						}

					});

	
	</script>
	
	
</body>
</html>