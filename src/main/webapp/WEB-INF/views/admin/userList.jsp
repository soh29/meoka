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
<link href="/resources/css/foodThemeList.css" rel="stylesheet"
   type="text/css" media="all">

<style>
body {
	font-family: 'Gowun Dodum', sans-serif;
	margin: auto;
}

table {
	width:100%;
	table-layout:fixed;
}
th:first-child, th:last-child {
	width:24%;
}
</style>


</head>

<body>

<h5
		class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">회원 목록</h5>

<c:if test="${login.memberId == 'meoka'}">
<table class="table table-bordered">
	<tbody>
	<tr>
		<th style="background-color: #ffc1ab">이름</th>
		<th style="background-color: #ffc1ab">아이디</th>		
		<th style="background-color: #ffc1ab">이메일</th>
	</tr>
	
	<c:forEach items="${userList}" var="user">			
		<tr>
			<td><a href="${path}/admin/getUserDetail?memberId=${user.memberId}">${user.name}&nbsp;</a></td>
			<td>${user.memberId}</td>			
			<td>${user.email}</td>
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