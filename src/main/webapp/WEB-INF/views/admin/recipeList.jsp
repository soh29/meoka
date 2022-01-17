<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header_admin.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Find id</title>
<link href="/resources/css/swiper-bundle.min.css" rel="stylesheet"
	type="text/css" media="all">
<link href="/resources/css/testbite-style.css" rel="stylesheet"
	type="text/css" media="all">

<style>
body {
	margin: auto;
	font-family: 'Gowun Dodum', sans-serif;
}
</style>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<style>
table {
	width:100%;
	table-layout:fixed;
}
th:first-child, th:last-child {
	width:15%;
}

</style>
</head>

<body>

<h5
		class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">레시피 목록</h5>

<c:if test="${login.memberId == 'meoka'}">	
<table class="table table-bordered">
	<tbody>
	<tr>
		<th style="background-color: #ffc1ab">레시피번호</th>
		<th style="background-color: #ffc1ab">레시피이름</th>		
		<th style="background-color: #ffc1ab">작성자</th>
	</tr>
	
	<c:forEach items="${recipeList}" var="recipe">			
		<tr>
			<td>${recipe.RECIPENO}</td>
			<td><a href="${path}/admin/getRecipeDetail?RECIPENO=${recipe.RECIPENO}">${recipe.RECIPENAME}&nbsp;</a></td>			
			<td>${recipe.MEMBERID}</td>
		</tr>
		
	</c:forEach>
	</tbody>
</table>

</c:if>

<c:if test="${empty login || login.memberId != 'meoka'}">
	<p class="f-size-24 font-weight-regular" style="text-align:center">
	관리자 페이지에 접속하려면 로그인하세요.</p>
</c:if>

</body>

<%@include file="../include/footer.jsp"%>

</html>