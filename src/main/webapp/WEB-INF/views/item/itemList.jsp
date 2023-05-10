<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ include file="/WEB-INF/views/admin/adminPage.jsp" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
	<title>상품 목록 페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<style>

.header__logo {
	align:left;
}


tr{
	text-align: center;
	border:1px solid ;
}
table{
	width:100%;
	border:1px solid ;
}
#container {
	margin:60px;
}

</style>

<script src="https://code.jquery.com/jquery-3.6.3.js"> </script>
<script>
	$(document).ready(function () {
		$("img").each(function (idx, data) {
			var r = $(this).attr('src')
			u = r.replaceAll('\\', '/')
			$(this).attr('src', u)
		})
		$("button#deletebtn").each(function (idx, data) {
			$(this).click(function (e) {
				var confirmation = confirm("정말로 삭제하시겠습니까?");
				if (confirmation) {
					// 확인 버튼 클릭 시 동작
					alert("동작을 시작합니다.");
				} else {
					// 취소 버튼 클릭 시 동작
					e.preventDefault();
					alert("동작을 취소했습니다.");
				}
			})
		})

	})
</script>

<body>
<div id="container">
<h1>상품 관리</h1>
	<table  class="table table-striped">
		<tr>
		  <th scope="col">상품 번호</th>
		  <th scope="col">상품 사진</th>
		  <th scope="col">상품 분류</th>
		  <th scope="col">상품 이름</th>
		  <th scope="col">상품 가격</th>
		  <th scope="col">수정 여부</th>
		  <th scope="col">삭제 여부</th>
		</tr>
				
		<c:forEach var="list" items="${list}">
			<tr class="table-light">
				<td>${list.itemid}</td>	
		
				<td data-label=""><img src="/display?fileName=/${list.attachList[0].uploadPath}/s_${list.attachList[0].uuid}_${list.attachList[0].fileName}" /></td>
				
				<td>${list.category}</td>
				
				<td><a href="detail?itemid=${list.itemid}">${list.name}</a></td>
				
				<td>${list.price}</td>
				
				<td><a href="update?itemid=${list.itemid}"><button id="updatebtn" type="button" class="btn btn-primary">수정</button></a></td>
				
				<td><a href="delete?itemid=${list.itemid}" id="delete"><button id="deletebtn" type="button" class="btn btn-danger">삭제</button></a></td>
			</tr>
		</c:forEach>	
	</table>
</div>
</body>
</html>