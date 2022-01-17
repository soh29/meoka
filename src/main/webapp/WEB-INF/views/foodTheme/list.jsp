<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0053)search-result.html -->
<html dir="ko" lang="UTF-8">
<head>
<link href="/resources/css/foodThemeList.css" rel="stylesheet"
	type="text/css" media="all">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<title>Tastebite - Search Result</title>

<style>
body{
	font-family: 'Gowun Dodum', sans-serif;
}
table {
border-width:2px;
}

</style>
</head>
<body>



	<div class="container">

		<section class="tstbite-components my-4 my-md-5">
			<h1
		style="font-size: 40px; font-weight: 600; margin-top: 5%; margin-bottom: 5%; text-align: center;font-family: inter,sans-serif;">
		FOOD-THEME PAGE</h1>
			<div>
				<table class="table table-bordered">
					<tr>
						<th>이름</th>
						<th>타입</th>
						<th>주제</th>
						<th>삭제</th>
					</tr>

					<c:forEach items="${list}" var="item">
						<tr>
						<td>${item.foodName}</td>
						<td>${item.themeType }</td>
						<td>${item.themeName }</td>
						<td><a
							href="/foodTheme/delete?foodNo=${item.foodNo}&themeNo=${item.themeNo }"
							class="btn btn-primary px-5 btn-hover">삭제</a></td>
					</tr>
					</c:forEach>
				</table>

			</div>
			<%-- 	<table>

				<c:forEach items="${list}" var="item">
					<tr>
						<td>${item.foodName}</td>
						<td>${item.themeType }</td>
						<td>${item.themeName }</td>
						<td><a
							href="/foodTheme/delete?foodNo=${item.foodNo}&themeNo=${item.themeNo }"
							class="btn btn-primary px-5">삭제</a></td>
					</tr>
				</c:forEach>

			</table> --%>
		</section>
	</div>

	<%@include file="../include/footer.jsp"%>
</body>
</html>