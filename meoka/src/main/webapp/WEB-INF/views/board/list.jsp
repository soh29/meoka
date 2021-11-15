<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../include/header.jsp"%>

<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Q&A PAGE</title>
<link href="/resources/css/swiper-bundle.min.css" rel="stylesheet"
	type="text/css" media="all">
<link href="/resources/css/tastebite-styles.css" rel="stylesheet"
	type="text/css" media="all">
	
<style>
   body {
   margin: auto;
}
</style>

</head>
<body>

	<h1
		style="font-size: 40px; font-weight: 600; font-family: inter, sans-serif;">
		Q&A PAGE</h1>



	<table class="table table-bordered" ;  border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th style="width: 300px">제목</th>
				<th>조회</th>
				<th style="width: 150px">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${map.list}">
				<tr>
					<td>${item.bno}</td>
					<td>${item.writer}</td>
					<td style=><c:if test="${item.depth > 0}">
							<span style="padding-left:${item.depth * 15}px">┖</span>
						</c:if> <a href="/board/readPage?bno=${item.bno}"
						style="text-decoration: none; color: black;"> ${item.title}
							[${item.commentcnt }]</a></td>
					<td>${item.viewcnt}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${item.regdate}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<br>
	<form role="form" method="get">


		<div class="input-group custom-input-group pl-0 pl-lg-5">



			<select class="form-control border"
				style="height: 50px; width: 100px" name="searchOption">
				<option value="title"
					<c:out value="${map.searchOption == 'title'?'selected':'' }"/>>Title</option>
				<option value="writer"
					<c:out value="${map.searchOption == 'writer'?'selected':'' }"/>>Writer</option>
				<option value="content"
					<c:out value="${map.searchOption == 'content'?'selected':'' }"/>>Content</option>
				<option value="all"
					<c:out value="${map.searchOption == 'all'?'selected':'' }"/>>All</option>
			</select> <input name="keyword" class="form-control border"
				style="height: 50px; width: 400px" placeholder="입력하세요"
				value="${map.keyword }">
			<button class="btn btn-primary" type="submit">검색</button>


			<!-- lab begin -->
			<c:if test="${not empty login}">
				<button class="btn btn-primary" type="button"
					onclick="location.href='/board/register'">글작성</button>
			</c:if>

			<c:if test="${empty login}">
				<button class="btn btn-primary" type="button"
					onclick="location.href='/board/list'">글작성</button>					
				</script>
			</c:if>
			<!-- lab end -->


		</div>
		<div style="display: block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a
					href="/board/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage}">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage}">
						<a
							href="/board/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a
					href="/board/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">&gt;</a>
			</c:if>
		</div>

	</form>
	<button class="accordion">자주 묻는 질문1</button>
	<div class="panel">
		<p>재료가 상했는지 확인 부탁드립니다</p>
	</div>

	<button class="accordion">자주 묻는 질문2</button>
	<div class="panel">
		<p>어떤 조리기구가 더 나을까요</p>
	</div>

	<button class="accordion">자주 묻는 질문3</button>
	<div class="panel">
		<p>알레르기 유발 재료를 알려주세요</p>


	</div>
	

<%@include file="../include/footer.jsp"%>

</html>
