<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<p id="modal-title" class="modal-title">댓글 수정</p>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<td style="border-top: none !important;"><textarea class="form-control" id="contents" rows="5" style="margin: 0 !important; padding: 0;" placeholder="${content }"></textarea></td>
						<input type="hidden" id="cno">
					</tr>					
				</table>
			</div>
			<div class="modal-footer">
				<button id="modalSubmit" type="button" class="btn btn-success" onclick="commentUpdateProc(cno.value, contents.value);" style="background-color: black;">수정하기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

