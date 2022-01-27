<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0053)search-result.html -->
<html dir="ko" lang="UTF-8">
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/css/recipeList.css" rel="stylesheet"
	type="text/css" media="all">

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body {
	font-family: 'Gowun Dodum', sans-serif;
}

.paging {
	text-align: center;
	wodtj: 50%
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
</style>
</head>
<body>




	<div class="container">

		<section class="tstbite-components my-4 my-md-5">
			<h1
				style="font-size: 40px; font-weight: 600; margin-top: 5%; margin-bottom: 5%; text-align: center; font-family: inter, sans-serif;"">
				SUGGESTION LIST</h1>

			<!-- 검색기능 -->
			<div class="search">
				<select name="searchType" id ="searchType" >
					<option value="n"
						<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					<option value="t"
						<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					<option value="i"
						<c:out value="${scri.searchType eq 'i' ? 'selected' : ''}"/>>재료</option>
					<option value="w"
						<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					<option value="tc"
						<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+수준</option>
				</select> <input type="text" name="keyword" id="keywordInput"
					value="${scri.keyword}" placeholder="Search"
					class="input-group search-box" />

				<div class="button-8" id="searchBtn">
					<div class="eff-8"></div>
					<a href="#"> Search </a>
				</div>

			</div>






			<div class="row">
				<c:forEach items="${list}" var="list">
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="/recipe/view?RECIPENO=${list.RECIPENO}"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="${list.PHOTO}" class="w-100" alt="Menu"
								style="width: 280px !important; height: 300px !important">
							</a>
							<figcaption class="mt-2">
								<a href="/recipe/view?RECIPENO=${list.RECIPENO}"><strong>${list.RECIPENAME}</strong></a><br>
								<small>${list.MEMBERID}</small> <small> <c:forEach
										var="i" begin="1" end="${list.point}">
										<i class='fa fa-star active'></i>
									</c:forEach> <c:forEach var="i" begin="${list.point+1}" end="5">
										<i class='fa fa-star'></i>
									</c:forEach>
								</small>
							</figcaption>
						</figure>
					</div>
				</c:forEach>


			</div>





			<div class="paging">
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<a  href="list${pageMaker.makeSearch(idx)}">[${idx}]</a>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</section>
	</div>
	<script>
		$(function() {
			$('#searchBtn').click(
					function() {
						self.location = "list" + '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select option:selected").val()
								+ "&keyword="
								+ encodeURIComponent($('#keywordInput').val());
					});
		});
	</script>

	<%@include file="../include/footer.jsp"%>

</body>
</html>