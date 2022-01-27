<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0053)search-result.html -->
<html dir="ko" lang="UTF-8">
<head>
<script src='/resources/plugins/jQuery/jQuery-2.1.4.min.js'></script>
<link href="/resources/css/recipeList.css" rel="stylesheet"
	type="text/css" media="all">
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
		
		
		
		
		
		<!-- 검색기능 -->
				<div class="search">
					<select name="searchType" id="searchType" style="border: 1px solid gray; border-radius: 5px;"
					>
						<option value="fn"
							<c:out value="${scri.searchType eq 'fn' ? 'selected' : ''}"/>>음식</option>
						<option value="tt"
							<c:out value="${scri.searchType eq 'tt' ? 'selected' : ''}"/>>테마타입</option>
						<option value="tn"
							<c:out value="${scri.searchType eq 'tn' ? 'selected' : ''}"/>>테마이름</option>
					</select> <input type="text" name="keyword" id="keywordInput"
						value="${scri.keyword}" placeholder=" Search"
						class="input-group search-box" />

					<div class="button-8" id="searchBtn">
						<div class="eff-8"></div>
						<a href="#"> Search </a>
					</div>
					<script>
						$(function() {
							$('#searchBtn')
									.click(
											function() {
												//alert();
												self.location = "list"
														+ "?searchType="
														+ $("select option:selected").val()
														+ "&keyword="
														+ encodeURIComponent($('#keywordInput').val());
											});
						});
					</script>
				</div>
		
		
		
		
		
		
		
		
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