<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<title>Home</title>
</head>
<body>
	<h1>Board List</h1>
	<table border="1">
	<thead>
	<tr>
<<<<<<< HEAD
		<th>번호</th>
		<th>아이디</th>
		<th>음식번호</th>
		<th>레시피이름</th>
=======
		<th>레시피번호</th>
		<th>ID</th>
		<th>음식번호</th>
		<th>이름</th>
>>>>>>> branch 'develop' of https://github.com/soh29/meoka
		<th>작성일</th>
		<th>요리시간</th>
<<<<<<< HEAD
		<th>작성일</th>
=======
		<th>양</th>
>>>>>>> branch 'develop' of https://github.com/soh29/meoka
		<th>수준</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${list}">
		<tr>
			<td>${item.RECIPENO}</td>
			<td>${item.MEMBERID}</td>
			<td>${item.FOODNO}</td>
			<td>${item.RECIPENAME}</td>
			<td>${item.REGDATE}</td>
			<td>${item.COOKINGTIME}</td>
<<<<<<< HEAD
			<td>${item.PROTION}</td>
=======
			<td>${item.PORTION}</td>
>>>>>>> branch 'develop' of https://github.com/soh29/meoka
			<td>${item.RANKNO}</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
</body>
</html>
