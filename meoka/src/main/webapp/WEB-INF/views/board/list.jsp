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
		<th>��ȣ</th>
		<th>���̵�</th>
		<th>���Ĺ�ȣ</th>
		<th>�������̸�</th>
=======
		<th>�����ǹ�ȣ</th>
		<th>ID</th>
		<th>���Ĺ�ȣ</th>
		<th>�̸�</th>
>>>>>>> branch 'develop' of https://github.com/soh29/meoka
		<th>�ۼ���</th>
		<th>�丮�ð�</th>
<<<<<<< HEAD
		<th>�ۼ���</th>
=======
		<th>��</th>
>>>>>>> branch 'develop' of https://github.com/soh29/meoka
		<th>����</th>
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
