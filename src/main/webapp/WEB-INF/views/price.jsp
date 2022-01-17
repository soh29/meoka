<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="include/header.jsp"%>

<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Q&A PAGE</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">


	

<style>
body {
	font-family: 'Gowun Dodum', sans-serif;
}
table {
	width:100%;
	table-layout:fixed;
}
th:first-child, th:last-child {
	width:24%;
}

th {
	background-color: #ff80c0
}

.paging {
	text-align: center;
}

.paging a {
	display: inline-block;
	font-weight: bold;
	text-decoration: none;
	padding: 5px 8px;
	border: 1px solid #ccc;
	color: #f3f3f3;
	background-color: #ffc1ab;
}
/* 현재 페이징에 select 클래스를 적용한다*/
.paging a.select {
	color: #fff;
	background-color: #FFA7A7;
}
</style>

</head>
<body style="margin:0px;padding:0px;overflow:hidden"> 
<iframe src="http://192.168.0.36:3000/" frameborder="0" style="overflow:hidden;overflow-x:hidden;overflow-y:hidden;height:100%;width:100%;position:absolute;top:150px;margin-bottom: -150px; padding-bottom:150px; left:0px;right:0px;bottom:0px" height="100%" width="100%">
</iframe> 


</body>

<%@include file="include/footer.jsp"%>
</html>
