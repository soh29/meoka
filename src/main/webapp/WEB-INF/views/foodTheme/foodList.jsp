<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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


			<div class="search">
				   <select name="searchType" >
			         <option value="n"
			            <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
			         <option value="t"
			            <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>이름</option>
			         <option value="w"
			            <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>유형</option>
			         <option value="tc"
			            <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>이름+유형</option>
			      </select> 
		
					<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" placeholder="Search" class="input-group search-box"/>
			
					<button id="searchBtn" >검색</button>

			</div>
				
				<table>
				
					<c:forEach items="${list}" var="item">
						<tr>
							<td>${item.foodNo}</td>
							<td><a href="#" data-foodNo = ${item.foodNo}>${item.foodName}</a></td>
						</tr>	
					</c:forEach>
				
				</table>	
				
			<div>
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a
							href="foodList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>
		
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
							var="idx">
						<a href="foodList${pageMaker.makeSearch(idx)}">[${idx}]</a>
					</c:forEach>
			
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="foodList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>	


<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
				<script>
					$(function() {
						$('#searchBtn').click(
								function() {
									self.location = "foodList"
											+ '${pageMaker.makeQuery(1)}'
											+ "&searchType="
											+ $("select option:selected").val()
											+ "&keyword="
											+ encodeURIComponent($('#keywordInput')
													.val());
								});
					});
				</script>
				
<script>
$('table a').click(function(){
	if (window.opener != null && !window.opener.closed) {
    	const foodName = $(this).html();
    	const foodNo = $(this).attr('data-foodNo');
    	
        window.opener.$('#foodName').val(foodName);
        window.opener.$('#foodNo').val(foodNo);
    }
    window.close();
})

</script>


<%@include file="../include/footer.jsp"%>