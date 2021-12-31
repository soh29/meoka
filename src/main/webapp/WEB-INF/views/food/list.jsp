<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0053)search-result.html -->
<html dir="ko" lang="UTF-8">
<head>

<title>Tastebite - Search Result</title>

<link href="/resources/css/recipeList.css" rel="stylesheet"
	type="text/css" media="all">
<style>
  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>


<body>

	
	

		<div class="tstbite-search">
			<div class="container">
				<div class="input-group search-box">
					<input type="text" name="Search" placeholder="Search"
						class="form-control" id="Search">
					<button type="button">
						<img src="../resources/img/close.svg" alt="img">
					</button>
				</div>
				<div class="search-results" id="SearchList">
					<div class="tstbite-search-list">
						<a href="search-result.html#0">
							<figure>
								<img src="../resources/img/menu111.png"
									class="rounded-circle" alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Cake</strong> <span class="tiny">Category</span>
							</div>
						</a>
					</div>
					<div class="tstbite-search-list">
						<a href="search-result.html#0">
							<figure>
								<img src="../resources/img/menu112.jpg" class="rounded-2"
									alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Black Forest Birthday Cake</strong>
							</div>
						</a>
					</div>
					<div class="tstbite-search-list">
						<a href="search-result.html#0">
							<figure>
								<img src="../resources/img/menu113.jpg" class="rounded-2"
									alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Double Thick Layered Sponge Cake</strong>
							</div>
						</a>
					</div>
					<div class="tstbite-search-list">
						<a href="search-result.html#0">
							<figure>
								<img src="../resources/img/menu114.jpg" class="rounded-2"
									alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Cranberry Macaroon Ice cream Cake</strong>
							</div>
						</a>
					</div>
					<div class="tstbite-search-list">
						<a href="search-result.html#0">
							<figure>
								<img src="../resources/img/menu115.jpg" class="rounded-2"
									alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Almond Cinnamon Sponge Cake</strong>
							</div>
						</a>
					</div>
					<div class="tstbite-search-list">
						<a href="search-result.html#0">
							<figure>
								<img src="../resources/img/menu116.jpg" class="rounded-2"
									alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Four Mini Birthday Cupcakes</strong>
							</div>
						</a>
					</div>
					<div class="text-center py-4">
						<a href="search-result.html#0"
							class="btn btn-sm btn-outline-dark px-4 py-2">See all 343
							results</a>
					</div>
				</div>
			</div>
		</div>
		
		<section class="tstbite-components my-4 my-md-5">
				<h3 class="py-3 mb-0" id="title">Food type List</h3>
		
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
		<script>
			$(function() {
				$('#searchBtn').click(
						function() {
							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val());
						});
			});
			
			
		</script>
	</div>
		
		<div class="container">

			<section class="tstbite-components my-4 my-md-5">
		
				<table>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>유형</th>
						</tr>
					<c:forEach items="${list}" var="item">
						<tr>
							<td>${item.foodNo}</td>
							<td>${item.foodName}</td>
							<td>${item.foodType}</td>
								<c:if test="${item.count1==0&&item.count2==0}">
						   		 	<td><a href = "/food/delete?foodNo=${item.foodNo}" class="btn btn-primary px-5" onclick="if(!confirm('삭제 하시겠습니까?')){return false;}">삭제</a></td>
						   		</c:if>	
						</tr>
					</c:forEach>
				</table>
				<div>
					<ul>
						<c:if test="${pageMaker.prev}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>
			
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
							var="idx">
							<a href="list${pageMaker.makeSearch(idx)}">[${idx}]</a>
						</c:forEach>
			
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</section>
		</div>
	
	</section>
<%@include file="../include/footer.jsp"%>
	<script src="../resources/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/html5.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/sticky.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/swiper-bundle.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/masonry.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/tastebite-scripts.js"
		type="text/javascript"></script>
	<script defer="" src="../resources/js/beacon.min.js"
		data-cf-beacon="{&quot;rayId&quot;:&quot;6a50d5b1f8402079&quot;,&quot;version&quot;:&quot;2021.10.0&quot;,&quot;r&quot;:1,&quot;token&quot;:&quot;9ae02b4a12234f118cf01e6f25c04e9d&quot;,&quot;si&quot;:100}"></script>

</body>
</html>