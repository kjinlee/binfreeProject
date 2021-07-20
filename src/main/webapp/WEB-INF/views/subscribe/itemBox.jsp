<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="table-responsive">
		<table class="data-table" id="my-orders-table">
			<col width="1">
			<col width="1">
			<col width="1">
			<col width="1">
			<col width="1">
			<col width="1">
			<thead>
				<tr class="first last">
					<th><span class="nobr">상품명</span></th>
					<th>옵션</th>
					<th>수량</th>
					<th>금액</th>
					<th>쿠폰할인</th>
					<th>&nbsp;</th>
				</tr>
			</thead>

			<c:if test="${sub.subItem ne null}">
				<tbody>
					<tr class="first odd">
						<td>${sub.subItem }구독</td>
						<td>${sub.subDuration }</td>
						<td>1</td>
						<td><span class="price">${sub.subPrice }</span></td>
						<td><em>-0</em></td>
						<td class="a-center last"><span class="nobr"> <a
								href="#">쿠폰 선택</a></td>
								
					</tr>
				</tbody>
			</c:if>
			<c:if test="${sub.subItem eq null}">
				<tbody>
					<tr class="first odd">
						<td>선택한 상품이 없습니다</td>
					</tr>
				</tbody>
			</c:if>

		</table>
	</div>

</body>
</html>