<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   

<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>Home</title>
</head>
<body>
	<h1>Board List</h1>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>제목</th>
				<th>조회</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${map.list}">
				<tr>
					<td>${item.bno}</td>
					<td>${item.writer}</td>
					<td style=>
					<c:if test="${item.depth > 0}">
						<span style="padding-left:${item.depth * 15}px">┖</span>
					</c:if>
					
					<a href="/board/readPage?bno=${item.bno}" style="text-decoration: none;color:black;">
							${item.title} [${item.commentcnt }]</a></td>
					<td>${item.viewcnt}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${item.regdate}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<form role="form" method="get">
		<select name="searchOption">
			<option value="title" <c:out value="${map.searchOption == 'title'?'selected':'' }"/>>Title</option>
			<option value="writer" <c:out value="${map.searchOption == 'writer'?'selected':'' }"/>>Writer</option>
			<option value="content" <c:out value="${map.searchOption == 'content'?'selected':'' }"/>>Content</option>
			<option value="all" <c:out value="${map.searchOption == 'all'?'selected':'' }"/>>All</option>
		</select>
		<input name="keyword" value="${map.keyword }">
		<button type="submit">검색</button>
		<button type="button" onclick="location.href='/board/register'">글 작성</button>
		
		<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/board/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/board/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/board/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">&gt;</a>
		</c:if>
	</div>
		
	</form>
</body>
</html>
