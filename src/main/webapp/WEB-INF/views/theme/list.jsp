<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0053)search-result.html -->
<html dir="ko" lang="UTF-8">
<head>
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


<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<title>Tastebite - Search Result</title>
<link
	href="assets/images/favicon.ico"
	rel="shortcut icon" type="image/x-icon">

<link href="../resources/css/tastebite-styles.css" rel="stylesheet"
	type="text/css" media="all">
</head>
<body>

	

		
		<div class="container">

			<section class="tstbite-components my-4 my-md-5">
				<h5 class="py-3 mb-0">Search results</h5>
				<!-- <div class="input-group search-box">
					<input type="text" name="Search" placeholder="Search"
						class="form-control bg-white" id="Search2"> <span
						class="mt-2 mr-1">(98 Recipes)</span>
					<button type="button">
						<img src="../resources/img/close.svg" alt="img">
					</button>
				</div>
				 -->


		
	</div>
				 	<div class="search">
	   <select name="searchType" >
         <option value="n"
            <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
         <option value="t"
            <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>테마 이름</option>
         <option value="w"
            <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>테마 종류</option>
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
				 
				 
				 
				 
				 
				 
				<div class="">
				<table>
						<tr>
								<th>번호</th>
								<th>이름</th>
								<th>주제</th>
						</tr>
				<script>
				
				
				
				
				</script>
				<c:forEach items="${list}" var="item">
							<tr>
								<td>${item.themeNo}</td>
								<td>${item.themeName}</td>
								<td>${item.themeType}</td>

    								<c:if test="${item.count == 0}">
										<td>
											<a href="/theme/delete?themeNo=${item.themeNo}"class="btn btn-primary px-5">테마 삭제</a>
										</td>
							    	</c:if>
							    	 <c:if test="${item.count != 0}">
										<td>
											<a class="btn btn-primary px-5">삭제 불가</a>
										</td>
							    	</c:if>
							</tr>
				</c:forEach>
				</table>
					<!-- <div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu118.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Tripple
									Chocolate Mousse Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu119.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Cranberry
									Curd Layered Sponge Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu120.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Orange
									and Lemon Curd Tartlets</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu121.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Creamt
									Chocolate Nutella Fudge Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu122.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Homemade
									Mixed Berries Wedding Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu123.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Black
									Forest Birthday Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu124.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Double
									Thick Layered Sponge Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu125.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Lemon
									Cake with Chocolate Ganache</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu126.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Cranberry
									Macaroon Ice Cream Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu127.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">No
									Bake Cheesecake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu128.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Almond
									Cinnamon Sponge Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu129.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Mixed
									Candy Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu130.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Cherry
									Ice Cream Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu131.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Four
									Layer Coffee Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu132.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Oreo
									Brownie Ice Cream Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu133.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Caramel
									Glaze Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu134.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">No
									Bake Cinnamon Cheesecake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu135.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Apple
									Cinnamon Bundt Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu136.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Rainbow
									Explosion Birthday Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu137.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Chocolate
									Peanut Butter Mini Cupcakes</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu138.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">M&amp;Mâs
									Chocolate Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu139.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Strawberry
									Cream Cake Bites</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu140.jpg" class="w-100" alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Tiramisu
									Cheescake</a>
							</figcaption>
						</figure>
					</div>
					-->
				</div>
					<div>
	</div>
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
			</section>
			
		</div>



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

<%@include file="../include/footer.jsp"%>
</html>