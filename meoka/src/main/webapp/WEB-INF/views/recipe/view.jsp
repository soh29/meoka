<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<!-- saved from url=(0057)recipe-full-width.html -->
<html dir="ltr" lang="en-US">
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="description" content="Tastebite">
<meta name="keywords" content="Tastebite">
<meta name="author" content="Tastebite">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Tastebite - Recipe</title>
	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	
<link
	href="assets/images/favicon.ico"
	rel="shortcut icon" type="image/x-icon">

<link href="../resources/css/swiper-bundle.min.css"
	rel="stylesheet" type="text/css" media="all">
<link href="../resources/css/tastebite-styles.css"
	rel="stylesheet" type="text/css" media="all">
	
    <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
<style>
#modDiv {
	width: 300px;
	height: 100px;
	background-color: gray;
	position: fixed;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}

.pagination {
	width: 100%;
}

.pagination li {
	list-style: none;
	float: left;
	padding: 3px;
	border: 1px solid blue;
	margin: 3px;
}

.pagination li a {
	margin: 3px;
	text-decoration: none;
}

.rating {
  width: 180px;
}

.rating__star {
  cursor: pointer;
  color: #dabd18b2;
}
</style>
</head>
<body>

	<section class="tstbite-section p-0">
		<div class="container">

			<header class="tstbite-header bg-white">
				<nav class="navbar navbar-expand-lg has-header-inner px-0">
					<a class="navbar-brand"
						href="index.html"> <img
						src="../resources/img/brand4.svg"
						style="max-width: 161px;" alt="Tastebite">
					</a>
					<div
						class="tstbite-header-links d-flex align-items-center ml-auto order-0 order-lg-2">
						<a href="javascript:void(0);" class="search-link"> <svg
								xmlns="http://www.w3.org/2000/svg" width="26.667"
								height="26.667" viewBox="0 0 26.667 26.667">
<path
									d="M24.39,26.276l-4.9-4.9a12.012,12.012,0,1,1,1.885-1.885l4.9,4.9a1.334,1.334,0,0,1-1.886,1.886ZM2.666,12a9.329,9.329,0,0,0,15.827,6.7,1.338,1.338,0,0,1,.206-.206A9.332,9.332,0,1,0,2.666,12Z"></path>
</svg>
						</a> <a
							href="recipe-full-width.html"
							class="ml-4 ml-md-4 mr-2 mr-md-0 circle"><img
							src="../resources/img/avatar1.png" alt="Avatar"></a>
					</div>
					<button class="navbar-toggler pr-0 ml-2 ml-md-3" type="button"
						data-toggle="collapse" data-target="#menu-4"
						aria-controls="menu-4" aria-expanded="false"
						aria-label="Toggle navigation">
						<svg data-name="Icon/Hamburger" xmlns="http://www.w3.org/2000/svg"
							width="24" height="24" viewBox="0 0 24 24">
<path data-name="Icon Color"
								d="M1.033,14a1.2,1.2,0,0,1-.409-.069.947.947,0,0,1-.337-.207,1.2,1.2,0,0,1-.216-.333,1.046,1.046,0,0,1-.072-.4A1.072,1.072,0,0,1,.072,12.6a.892.892,0,0,1,.216-.321.947.947,0,0,1,.337-.207A1.2,1.2,0,0,1,1.033,12H22.967a1.206,1.206,0,0,1,.409.069.935.935,0,0,1,.336.207.9.9,0,0,1,.217.321,1.072,1.072,0,0,1,.072.391,1.046,1.046,0,0,1-.072.4,1.206,1.206,0,0,1-.217.333.935.935,0,0,1-.336.207,1.206,1.206,0,0,1-.409.069Zm0-6a1.2,1.2,0,0,1-.409-.069.934.934,0,0,1-.337-.207,1.189,1.189,0,0,1-.216-.333A1.046,1.046,0,0,1,0,6.989,1.068,1.068,0,0,1,.072,6.6a.9.9,0,0,1,.216-.322.947.947,0,0,1,.337-.207A1.2,1.2,0,0,1,1.033,6H22.967a1.206,1.206,0,0,1,.409.068.935.935,0,0,1,.336.207.9.9,0,0,1,.217.322A1.068,1.068,0,0,1,24,6.989a1.046,1.046,0,0,1-.072.4,1.193,1.193,0,0,1-.217.333.923.923,0,0,1-.336.207A1.206,1.206,0,0,1,22.967,8Zm0-6a1.2,1.2,0,0,1-.409-.068.947.947,0,0,1-.337-.207,1.193,1.193,0,0,1-.216-.334A1.039,1.039,0,0,1,0,.988,1.068,1.068,0,0,1,.072.6.892.892,0,0,1,.288.276.934.934,0,0,1,.625.069,1.2,1.2,0,0,1,1.033,0H22.967a1.206,1.206,0,0,1,.409.069.923.923,0,0,1,.336.207A.9.9,0,0,1,23.928.6,1.068,1.068,0,0,1,24,.988a1.039,1.039,0,0,1-.072.4,1.2,1.2,0,0,1-.217.334.935.935,0,0,1-.336.207A1.206,1.206,0,0,1,22.967,2Z"
								transform="translate(0 5)" fill="#000"></path>
</svg>
					</button>
					<div class="collapse navbar-collapse" id="menu-4">
						<ul class="navbar-nav m-auto pt-3 pt-lg-0">
							<li class="nav-item dropdown"><a class="nav-link"
								href="recipe-full-width.html"
								role="button" id="HomePage" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <span>Home
										Page</span> <svg xmlns="http://www.w3.org/2000/svg" width="9.333"
										height="5.333" viewBox="0 0 9.333 5.333">
<path
											d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</a>
								<div class="dropdown-menu" aria-labelledby="HomePage">
									<a class="dropdown-item"
										href="index.html">Home
										V1</a> <a class="dropdown-item"
										href="home-v2.html">Home
										V2</a> <a class="dropdown-item"
										href="home-v3.html">Home
										V3</a>
								</div></li>
							<li class="nav-item dropdown"><a class="nav-link"
								href="recipe-full-width.html"
								role="button" id="RecipePage" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <span>Recipe
										Page</span> <svg xmlns="http://www.w3.org/2000/svg" width="9.333"
										height="5.333" viewBox="0 0 9.333 5.333">
<path
											d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</a>
								<div class="dropdown-menu" aria-labelledby="RecipePage">
									<a class="dropdown-item"
										href="..recipe/list">Recipe list</a> <a class="dropdown-item"
										href="recipe-sidebar.html">Sidebar</a>
								</div></li>
							<li class="nav-item dropdown"><a class="nav-link"
								href="recipe-full-width.html"
								role="button" id="Pages" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <span>Pages</span>
									<svg xmlns="http://www.w3.org/2000/svg" width="9.333"
										height="5.333" viewBox="0 0 9.333 5.333">
<path
											d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</a>
								<div class="dropdown-menu" aria-labelledby="Pages">
									<a class="dropdown-item"
										href="category.html">Category</a>
									<a class="dropdown-item"
										href="archive.html">Archive</a>
									<a class="dropdown-item"
										href="favorites.html">Favorites</a>
									<a class="dropdown-item"
										href="profile.html">Profile</a>
									<a class="dropdown-item"
										href="about.html">About</a>
									<a class="dropdown-item"
										href="blog.html">Blog
										Page</a> <a class="dropdown-item"
										href="search-result.html">Search
										Results</a>
								</div></li>
							<li class="nav-item"><a class="nav-link"
								href="elements.html">Elements</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								href="https://fabrx.co/tastebite-food-recipes-website-template/"
								target="_blank">Buy</a></li>
						</ul>
					</div>
				</nav>
			</header>
		</div>

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
						<a
							href="recipe-full-width.html">
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
						<a
							href="recipe-full-width.html">
							<figure>
								<img src="../resources/img/menu112.jpg"
									class="rounded-2" alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Black Forest Birthday Cake</strong>
							</div>
						</a>
					</div>
					<div class="tstbite-search-list">
						<a
							href="recipe-full-width.html">
							<figure>
								<img src="../resources/img/menu113.jpg"
									class="rounded-2" alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Double Thick Layered Sponge Cake</strong>
							</div>
						</a>
					</div>
					<div class="tstbite-search-list">
						<a
							href="recipe-full-width.html">
							<figure>
								<img src="../resources/img/menu114.jpg"
									class="rounded-2" alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Cranberry Macaroon Ice cream Cake</strong>
							</div>
						</a>
					</div>
					<div class="tstbite-search-list">
						<a
							href="recipe-full-width.html">
							<figure>
								<img src="../resources/img/menu115.jpg"
									class="rounded-2" alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Almond Cinnamon Sponge Cake</strong>
							</div>
						</a>
					</div>
					<div class="tstbite-search-list">
						<a
							href="recipe-full-width.html">
							<figure>
								<img src="../resources/img/menu116.jpg"
									class="rounded-2" alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Four Mini Birthday Cupcakes</strong>
							</div>
						</a>
					</div>
					<div class="text-center py-4">
						<a
							href="recipe-full-width.html"
							class="btn btn-sm btn-outline-dark px-4 py-2">See all 343
							results</a>
					</div>
				</div>
			</div>
		</div>
		<div class="container">

			<section class="tstbite-components my-4 my-md-5">
				<div class="d-sm-flex">
					<div class="tstbite-svg order-sm-2 ml-auto">
						<div class="tstbite-feature pt-0">
							<a
								href="recipe-full-width.html">
								<svg data-name="feather-icon/share"
									xmlns="http://www.w3.org/2000/svg" width="32" height="32"
									viewBox="0 0 32 32">
<rect data-name="Bounding Box" width="32" height="32"
										fill="rgba(255,255,255,0)"></rect>
<path
										d="M4,29.333a4,4,0,0,1-4-4V14.666a1.333,1.333,0,1,1,2.666,0V25.333A1.333,1.333,0,0,0,4,26.666H20a1.333,1.333,0,0,0,1.333-1.333V14.666a1.333,1.333,0,1,1,2.666,0V25.333a4,4,0,0,1-4,4Zm6.667-10.666V4.552L7.609,7.609A1.333,1.333,0,0,1,5.724,5.724L11.057.39a1.333,1.333,0,0,1,.307-.229h0l.025-.013.008,0,.018-.009.015-.007.011-.005.024-.011h0a1.338,1.338,0,0,1,1.062,0h0l.024.011.011,0,.016.008L12.6.143l.008,0,.025.013h0a1.333,1.333,0,0,1,.307.229l5.333,5.334a1.333,1.333,0,1,1-1.885,1.885L13.333,4.552V18.667a1.333,1.333,0,0,1-2.666,0Z"
										transform="translate(4 1.333)"></path>
</svg>
							</a> <a
								href="recipe-full-width.html">
								<svg data-name="feather-icon/share copy"
									xmlns="http://www.w3.org/2000/svg" width="32" height="32"
									viewBox="0 0 32 32">
<rect data-name="Bounding Box" width="32" height="32"
										fill="rgba(255,255,255,0)"></rect>
<path
										d="M20,26.669a1.318,1.318,0,0,1-.77-.251l-8.558-6.113L2.108,26.418a1.319,1.319,0,0,1-.77.251A1.362,1.362,0,0,1,.41,26.3,1.314,1.314,0,0,1,0,25.333V4A4,4,0,0,1,4,0H17.333a4,4,0,0,1,4,4V25.333A1.34,1.34,0,0,1,20,26.669Zm-9.329-9.336a1.329,1.329,0,0,1,.776.248l7.225,5.161V4a1.335,1.335,0,0,0-1.334-1.333H4A1.335,1.335,0,0,0,2.666,4V22.742l7.225-5.161A1.324,1.324,0,0,1,10.666,17.333Z"
										transform="translate(5.333 2.667)"></path>
</svg>
							</a>
						</div>
					</div>
					<div>
						<strong> <svg data-name="feather-icon/trending-up"
								xmlns="http://www.w3.org/2000/svg" width="20" height="20"
								viewBox="0 0 20 20">
<rect data-name="Bounding Box" width="20" height="20"
									fill="rgba(255,255,255,0)"></rect>
<path
									d="M.244,11.423a.834.834,0,0,1,0-1.178L6.494,3.994a.834.834,0,0,1,1.178,0L11.25,7.571l5.9-5.9H14.167a.833.833,0,1,1,0-1.667h5A.833.833,0,0,1,20,.833v5a.834.834,0,0,1-1.667,0V2.845L11.839,9.339a.834.834,0,0,1-1.179,0L7.083,5.761l-5.66,5.661a.834.834,0,0,1-1.179,0Z"
									transform="translate(0 4.167)" fill="#ff642f"></path>
</svg> <span class="ml-2 caption font-weight-medium">85% would make
								this again</span>
						</strong>
						<!-- 제목 -->
						<h5 class="py-3 mb-0 h2">${view.RECIPENAME}</h5>
					</div>
				</div>
				<div class="d-flex flex-wrap">
					<div class="my-2 mr-4">
						<!--<img src="../resources/img/avatar11.png"
							class="rounded-circle" alt="Avatar">--> 
							<small class="pl-1">${view.MEMBERID}</small>
					</div>
					<div class="my-2 mr-4">
						<svg xmlns="http://www.w3.org/2000/svg" width="13.333"
							height="14.666" viewBox="0 0 13.333 14.666">
<path
								d="M2,14.666a2,2,0,0,1-2-2V3.333a2,2,0,0,1,2-2H3.334V.667a.667.667,0,0,1,1.333,0v.667h4V.667A.667.667,0,0,1,10,.667v.667h1.333a2,2,0,0,1,2,2v9.334a2,2,0,0,1-2,2Zm-.667-2A.667.667,0,0,0,2,13.333h9.334A.667.667,0,0,0,12,12.667v-6H1.333ZM12,5.333v-2a.667.667,0,0,0-.667-.667H10v.667a.667.667,0,0,1-1.334,0V2.666h-4v.667a.667.667,0,1,1-1.333,0V2.666H2a.667.667,0,0,0-.667.667v2Z"></path>
</svg>
						<small>${view.REGDATE}</small>
					</div>
					<!-- 댓글 수? -->
					<div class="my-2 mr-4">
						<svg xmlns="http://www.w3.org/2000/svg" width="13.333"
							height="13.335" viewBox="0 0 13.333 13.335">
<path
								d="M.672,13.335a.687.687,0,0,1-.464-.183A.655.655,0,0,1,0,12.667V2A2,2,0,0,1,2,0h9.334a2,2,0,0,1,2,2V8.666a2,2,0,0,1-2,2H3.61L1.138,13.138A.657.657,0,0,1,.672,13.335ZM2,1.333A.667.667,0,0,0,1.333,2v9.058L2.862,9.529a.671.671,0,0,1,.472-.195h8A.668.668,0,0,0,12,8.666V2a.667.667,0,0,0-.667-.667Z"></path>
</svg>
						<small>25</small>
					</div>
					<!-- 별 -->
					<div class="my-2">
						<div class="w-100 float-left">
							<div class="float-left">
								<div class="fabrx-ratings has-rating rating">
								<!-- 별점 평균 -->

								
								<script>
								var avg= ${avg};
								var ratingStr= "<div>";
								for(var i = 0; i < avg; i++)	{
									ratingStr += "<i class='fa fa-star active'></i>";
								}
								for(var i = 0; i < 5 - avg; i++)	{
									ratingStr += "<i class='fa fa-star'></i>";
								}
								ratingStr += "</div>";
								
								
								$("div.fabrx-ratings").append($(ratingStr));
								</script>
								
								
								
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="blog-detail">
					<hr>
					<!-- 소개 글 -->
					<!--  <p>One thing I learned living in the Canarsie section of
						Brooklyn, NY was how to cook a good Italian meal. Here is a recipe
						I created after having this dish in a restaurant. Enjoy!</p>
					<br>-->
					<!-- 처음 케이크 나오는거 -->
					<div
						class="rounded-12 overflow-hidden position-relative tstbite-svg">
						
						<div class="overlay-box">
							<a href="javascript:void(0);"> <svg
									xmlns="http://www.w3.org/2000/svg" width="85.334"
									height="106.685" viewBox="0 0 85.334 106.685">
<path
										d="M5.347,106.685a5.436,5.436,0,0,1-3.715-1.5A5.261,5.261,0,0,1,0,101.343v-96A5.324,5.324,0,0,1,8.218.855l74.669,48a5.338,5.338,0,0,1,0,8.976l-74.669,48A5.311,5.311,0,0,1,5.347,106.685Zm5.318-91.575V91.575L70.138,53.343Z"
										fill="#fff"></path>
</svg>
							</a>
						</div>
					</div>
					<br>
					<img src="${show}" class="w-100" style="width:320px!important"/>
					<div ><!-- class="row mt-0 mt-md-5" -->
						<div class="col-md-12">
						<h6>요리정보</h6>
							<ul class="list-unstyled component-list tstbite-svg">
								<li><small>조리시간</small>  <span>${view.COOKINGTIME}</span></li>
								<li><small>수준</small> <span>${view.RANKNO } </span></li>
								<li><small>양</small> <span>${view.PORTION } </span></li>
								<li><a
									href="recipe-full-width.html">
										<svg data-name="feather-icon/printer"
											xmlns="http://www.w3.org/2000/svg" width="20" height="22.041"
											viewBox="0 0 20 22.041">
<rect data-name="Bounding Box" width="20" height="22.041"
												fill="rgba(255,255,255,0)"></rect>
<path
												d="M4.166,20.2a.88.88,0,0,1-.833-.918V16.531H2.5A2.636,2.636,0,0,1,0,13.776V9.184A2.636,2.636,0,0,1,2.5,6.429h.833V.918A.879.879,0,0,1,4.167,0h10A.878.878,0,0,1,15,.918v5.51h.833a2.636,2.636,0,0,1,2.5,2.755v4.592a2.636,2.636,0,0,1-2.5,2.755H15v2.755a.88.88,0,0,1-.834.918ZM5,18.367h8.333v-5.51H5v2.718c0,.012,0,.025,0,.038s0,.025,0,.037Zm10.834-3.673a.879.879,0,0,0,.833-.918V9.184a.878.878,0,0,0-.833-.918H2.5a.879.879,0,0,0-.833.918v4.592a.879.879,0,0,0,.833.918h.833V11.938a.88.88,0,0,1,.833-.918h10a.88.88,0,0,1,.834.918v2.756Zm-2.5-8.265V1.837H5V6.429Z"
												transform="translate(0.833 0.918)"></path>
</svg>
								</a></li>
							</ul>
						</div>
								</div>
							
							</div>
							<div class="row mt-4 g-0">
								<div class="col-lg-8">
									<div class="rounded-12 bg-lightest-gray p-4">
										<h6> 도 구 </h6>
										<div id="view">
											<c:forEach items="${getUtensilList}" var="UtensilVO">
												<ul class="Nutrition-list list-unstyled">
												<li><input type="checkbox" id="dropsblue" name="dropsblue"
											class="form-check-input">${UtensilVO.utensilName }</li>
												</ul>
											</c:forEach>
										</div>
										<h6> 재 료 </h6>
										<div id="view">
											<c:forEach items="${getIngredientList}" var="IngredientVO">
												<ul class="Nutrition-list list-unstyled">
												<li>
												<strong><input type="checkbox" id="dropsblue" name="dropsblue"class="form-check-input"> 
												이름 </strong>: ${IngredientVO.ingredientName}
												</li>
												<li><strong> 양 </strong>: ${IngredientVO.amount}</li>
												<li><strong> 필수여부 </strong>: ${IngredientVO.required}<br></li>
												<li>
												<strong> 종류 </strong>: ${IngredientVO.ingredientType}   
												<strong> 유통기한 </strong>: ${IngredientVO.bestBefore}   
												<strong> 효능 </strong>: ${IngredientVO.efficacy}   
												<strong> 가격 </strong>: ${IngredientVO.price}
												</li>
												</ul>
												<br>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="container">
							<div class="mt-5">
								<h6>조리 방법</h6>
									<div id="recipedetailview">
										<c:forEach items="${list}" var="RecipeDetailVO">
											<ul class="instruction-list list-unstyled">
												<li><span>${RecipeDetailVO.RECIPEDETAILNO}</span> 
															${RecipeDetailVO.RECIPEDETAIL}</li>
												<li><img src="${RecipeDetailVO.PHOTO}"/></li>
												
											</ul>
										</c:forEach>
									</div>
							</div>
						</div>
						
						<div class="container">
							<a href="/recipe/modify?RECIPENO=${view.RECIPENO}" class="btn btn-primary px-5">레시피 수정</a>
							<a href="/recipe/delete?RECIPENO=${view.RECIPENO}"class="btn btn-primary px-5">레시피 삭제</a>
						</div>
				</section>
				
				
				
								<!-- 후기시작 -->
				
				
				<div class="my-5 pt-0 pt-md-3 container">

				
					<div class="border-bottom mb-4 pb-3">
						<h2 class="d-inline-block">후기</h2>
					</div>
					
				<!-- 후기 수정 누렀을 때 -->
					 <div id='modDiv' style="display: none;">
		<div class='modal-title'></div>
		<div>
		  <div id="ratingOnModal" class="rating">  
        	<i class = "rating__star fa fa-star active" aria-hidden = "true" id = "st1"></i>  
       		<i class = "rating__star fa fa-star active" aria-hidden = "true" id = "st2"></i>  
       		<i class = "rating__star fa fa-star active" aria-hidden = "true" id = "st3"></i>  
      		 <i class = "rating__star fa fa-star active" aria-hidden = "true" id = "st4"></i>  
       		<i class = "rating__star fa fa-star" aria-hidden = "true" id = "st5"></i>  
      	 </div>  
			<input type='text' id='comments'>
		</div>
		<div>
			<button type="button" id="valuationModBtn">Modify</button>
			<button type="button" id="valuationDelBtn">DELETE</button>
			<button type="button" id='closeBtn'>Close</button>
		</div>
	</div>
					
					<div>
						<input type='hidden' name='recipeno' id='recipeno' value='${RecipeRequest.recipeno}'>
						<input type='hidden' id='curRecipeno'>
						<input type='hidden' id='curMemberid'>
					</div>
					
					
					<ul class="tstbite-comments list-unstyled mb-0">
					
				<!-- 후기 작성 -->
					
				<div class="write-comment">
					<div class="d-sm-flex align-items-center flex-wrap">
						<h6>Write a comment</h6>
						<!-- 나중에 로그인한 아이디로 바꾸기 -->
								 <br>
					</div>
						작성자: <input type='text' name='memberid' id='newMemberId' value='${RecipeRequest.memberid}'>

	

       <div id="rating" class="rating">  
        <i class = "rating__star fa fa-star active" aria-hidden = "true" id = "st1"></i>  
       <i class = "rating__star fa fa-star active" aria-hidden = "true" id = "st2"></i>  
       <i class = "rating__star fa fa-star active" aria-hidden = "true" id = "st3"></i>  
       <i class = "rating__star fa fa-star active" aria-hidden = "true" id = "st4"></i>  
       <i class = "rating__star fa fa-star" aria-hidden = "true" id = "st5"></i>  
       </div>  
	<style>
	.fa.active {
	color: orange;
	}
	.fa {
	color: black;
	}
	</style>
	    <script>  
	    const ratingStars = [...document.getElementsByClassName("rating__star")];

	    function executeRating(stars) {
	      const starClassActive = "rating__star fa fa-star active";
	      const starClassInactive = "rating__star fa fa-star";
	      const starsLength = stars.length;
	      let i;
	      stars.map((star) => {
	        star.onclick = () => {
	          i = stars.indexOf(star);

	          if (star.className === starClassInactive) {
	            for (i; i >= 0; --i) stars[i].className = starClassActive;
	          } else {
	            for (i; i < starsLength; ++i) stars[i].className = starClassInactive;
	          }
	        };
	      });
	    }
	    executeRating(ratingStars);
    </script>  
					<div class="bg-lightest-gray rounded-6 mt-3 d-flex flex-wrap p-4">
					
							
						<textarea class="form-control" name='comments' id='newComments' placeholder='후기를 작성해주세요.'></textarea>

						<div class="mt-auto ml-auto">
							<button  class="btn btn-primary px-5" id="valuationAddBtn">완료</button>
						</div>
					</div>
				</div>
					
					
					
					
					<!-- 후기 보기 -->
					<h2>후기</h2>
						<div class="comment-item">
							<div class="media">
								<div class="media-body">
									<div class="pt-1 pb-3">
										<!-- 후기 전체 -->
										
										<div class="Nutrition-list list-unstyled" id="valuation"></div>
									</div>
									
								</div>
								
							</div>
							<ul class='pagination'></ul>
							
						</div>
					</ul>
					
				</div> 
				
	
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<!-- 후기 수정 누렀을 때 
					 <div id='modDiv' style="display: none;">
		<div class='modal-title'></div>
		<div>
			<input type='text' id='comments'>
		</div>
		<div>
			<button type="button" id="valuationModBtn">Modify</button>
			<button type="button" id="valuationDelBtn">DELETE</button>
			<button type="button" id='closeBtn'>Close</button>
		</div>
	</div>
				
				<h2> 후 기 </h2>

	<div>
		<div>
			<input type='hidden' name='recipeno' id='recipeno'
				value='${RecipeRequest.recipeno}'>
			<input type='hidden' id='curRecipeno'>
			<input type='hidden' id='curMemberid'>
		</div>
		
		
		
		
		
		<div>
			memberid <input type='text' name='memberid' id='newMemberId'
				value='${RecipeRequest.memberid}'>
		</div>
		<div>
			Comments
			<textarea row='8' cols='50' type='text' name='comments'
				id='newComments'></textarea>
		</div>
		<button id="valuationAddBtn">완료</button>

	<ul id="valuation">
	</ul>

	<ul class='pagination'>
	</ul>



	 
	  <!--  
		<script id="template" type="text/x-handlebars-template">
		{{#each .}}
		<li class="replyLi" data-recipeno={{recipeno}}>
		<i class="fa fa-comments bg-blue"></i>
		 <div class="timeline-item" >
		  <span class="time">
		    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
		  </span>
		  <h3 class="timeline-header"><strong>{{bno}}</strong> -{{memberid}}</h3>
		  <div class="timeline-body">{{comments}} </div>
		    <div class="timeline-footer">
		     <a class="btn btn-primary btn-xs" 
			    data-toggle="modal" data-target="#modifyModal">수 정 하 기</a>
		    </div>
		  </div>			
		</li>
		{{/each}}
		</script>
	-->
	
	

	<script>
		/* var recipeno = 123239; */
		/* var recipeno = 55; */

		var recipeno = ${view.RECIPENO};
		//var bno = $(".modal-title").html(); 
		var bno = $("#curRecipeno").val();
		 getPageList(1); 
		function getAllList() {$.getJSON("/valuation/all/" + recipeno,
							function(data) {

								//console.log(data.length);

								var str = "";

								$(data).each(
												function() {
													//alert(this);
													//console.log(this);
													
													var ratingStr= "<div>";
													for(var i = 0; i < this.point; i++)	{
														ratingStr += "<i class='fa fa-star active'></i>";
													}
													for(var i = 0; i < 5 - this.point; i++)	{
														ratingStr += "<i class='fa fa-star'></i>";
													}
													ratingStr += "</div>";
													
													
													str += "<li data-memberid='"+this.memberid+"' data-bno='"+this.recipeno+"' class='valuationLi'>"
															+"<strong>"+ this.memberid+"</strong>"
															+ ratingStr
															+ this.comments+"<button>수정</button></li>";
												
												});

								$("#valuation").html(str);
							});
		}


		
		$("#valuationAddBtn").on("click", function() {

			alert("후기를 추가합니다.");
			var replyerObj = $("#newMemberId");
			var replytextObj = $("#newComments");
			var replyer = replyerObj.val();
			var replytext = replytextObj.val();
			var point = $("#rating").children(".active").length;
			//console.log(point)

			$.ajax({
				type : 'post',
				url : '/valuation',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					recipeno : recipeno,
					memberid : replyer,
					point: point,
					comments : replytext
				}),
				success : function(result) {

					if (result == 'SUCCESS') {
						//getPage("/valuation/" + recipeno + "/" + replyPage);
						alert("등록 되었습니다.");
						getAllList();

					}
				}
			});
			
			
		});

		$("#valuation").on("click", ".valuationLi button", function() {

			var valuation = $(this).parent();
			//레시피번호 bno
			var recipeno = valuation.attr("data-recipeno");
			var memberid = valuation.attr("data-memberid");
			//멤버id
			//var memberid = valuation.attr("data-memberid");
			var comments = valuation.text();
			$('#curMemberid').val(memberid);
			$('#curRecipeno').val(recipeno);

			$(".modal-title").html(bno);
			$("#curMemberid").val(memberid);
			$("#curRecipeno").val(bno);
			$("#comments").val(comments);
			$("#modDiv").show("slow");

		});

		$("#valuationDelBtn").on("click", function() {
			var valuation = $('#valuation').parent();
			var bno = $("#curRecipeno").val();
			var comments = $("#comments").val();
			//멤버id
			var memberid =$("#curMemberid").val();
			$.ajax({
				type : 'delete',
				url : '/valuation/delete?recipeno=' + bno + '&memberid=' + memberid,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("삭제 되었습니다.");
						$("#modDiv").hide("slow");
						getAllList();
					}
				}
			});
		});

		$("#closeBtn").on("click",function(){
			$("#modDiv").hide("slow");
		});
		
		
		$("#valuationModBtn").on("click", function() {
			
			var bno = $("#curRecipeno").val();
			//var bno = $(".modal-title").html();
			console.log(this);
			var comments = $("#comments").val();
			var memberid =$("#curMemberid").val();
			var point = $("#ratingOnModal").children(".active").length;
			console.log(point);

			$.ajax({
				type : 'put',
				url : '/valuation/' + recipeno + '/' + memberid,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				data : JSON.stringify({
					comments : comments,
					point: point
				}),
				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("수정 되었습니다.");
						$("#modDiv").hide("slow");
						getAllList();
						getPageList(valuationPage);
					}
				}
			});
			
		});

		function getPageList(page) {
			$.getJSON("/valuation/" + recipeno + "/" + page,
							function(data) {

								console.log(data.list.length);

								var str = "";

								$(data.list).each(
												function() {
													//alert(this);
													//console.log(this);
													
													var ratingStr= "<div>";
													for(var i = 0; i < this.point; i++)	{
														ratingStr += "<i class='fa fa-star active'></i>";
													}
													for(var i = 0; i < 5 - this.point; i++)	{
														ratingStr += "<i class='fa fa-star'></i>";
													}
													ratingStr += "</div>";
													
													
													
													
													str += "<li data-recipeno='" + this.recipeno + "' data-memberid='" + this.memberid + "' class='valuationLi'>" 
															 + "<strong>"+this.memberid + "</strong>"
															 + ratingStr
															+ this.comments 
															+ "<button id='valuationModBtn'>수정</button></li>";
												});

								$("#valuation").html(str);

								printPaging(data.pageMaker);

							});
			
			
		}

		function printPaging(pageMaker) {

			var str = "";

			if (pageMaker.prev) {
				str += "<li><a href='" + (pageMaker.startPage - 1)
						+ "'> << </a></li>";
			}

			for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
				var strClass = pageMaker.cri.page == i ? 'class=active' : '';
				str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
			}

			if (pageMaker.next) {
				str += "<li><a href='" + (pageMaker.endPage + 1)
						+ "'> >> </a></li>";
			}
			$('.pagination').html(str);
		}

		var valuationPage = 1;

		$(".pagination").on("click", "li a", function(event) {

			event.preventDefault();

			valuationPage = $(this).attr("href");

			getPageList(valuationPage);

		});
		
		$(".timeline").on("click", ".replyLi", function(event){
			var reply = $(this);
				$("#comments").val(reply.find('.timeline-body').text());
				$(".modal-title").html(reply.attr("data-bno"));	
		}); 
		
		/* 추가분 */
		
	 		Handlebars.registerHelper("prettifyDate", function(timeValue) {
				var dateObj = new Date(timeValue);
				var year = dateObj.getFullYear();
				var month = dateObj.getMonth() + 1;
				var date = dateObj.getDate();
				return year + "/" + month + "/" + date;
			}); 
			
			var printData = function(replyArr, target, templateObject) {

				var template = Handlebars.compile(templateObject.html());

				var html = template(replyArr);
				$(".valuationLi").remove();
				target.after(html);

			}
			

			var bno = ${view.RECIPENO};
			
			var replyPage = 1;

  			function getPage(pageInfo) {
			  //data = {"list":List<ValuationVO> , "pageMaker":} 
				
				$.getJSON(pageInfo, function(data) {
					printData(data.list, $("#repliesDiv"), $('#template'));
					printPaging(data.pageMaker, $(".pagination"));

					$("#modifyModal").modal('hide');

				});
			} 
	</script>

				
				
				
				
				
		
				


				
				
				

			
			<section class="tstbite-components my-4 my-md-5">
				<h5 class="py-3 mb-0">You might also like</h5>
				<div class="row">
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu126.jpg" class="w-100"
								alt="Menu">
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
								src="../resources/img/menu127.jpg" class="w-100"
								alt="Menu">
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
								src="../resources/img/menu124.jpg" class="w-100"
								alt="Menu">
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
								src="../resources/img/menu133.jpg" class="w-100"
								alt="Menu">
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
								src="../resources/img/menu139.jpg" class="w-100"
								alt="Menu">
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
								src="../resources/img/menu122.jpg" class="w-100"
								alt="Menu">
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
								src="../resources/img/menu138.jpg" class="w-100"
								alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">M&amp;M’s
									Chocolate Cake</a>
							</figcaption>
						</figure>
					</div>
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
							<a href="recipe-sidebar.html"
								class="tstbite-animation stretched-link rounded-6"> <img
								src="../resources/img/menu128.jpg" class="w-100"
								alt="Menu">
							</a>
							<figcaption class="mt-2">
								<a href="recipe-sidebar.html"
									class="text-black d-block mt-1 font-weight-semibold big">Almond
									Cinnamon Sponge Cake</a>
							</figcaption>
						</figure>
					</div>
				</div>
			</section>
		</div>

		<footer class="tstbite-footer pt-3 pt-md-5 mt-5 bg-lightest-gray">
			<div class="container">
				<div class="row pt-4 pb-0 pb-md-5">
					<div class="col-md-6">
						<div class="tastebite-footer-contnet pr-0 pr-lg-5 mr-0 mr-md-5">
							<a href="index.html"> <img
								src="../resources/img/brand4.svg" alt="Tastebite">
							</a>
							<p class="mt-3 text-gray-300 pr-0 pr-lg-5 mr-0 mr-lg-4">"On
								the other hand, we denounce with righteous indignation and
								dislike men who are so beguiled and demoralized by the charms of
								pleasure of the moment</p>
						</div>
					</div>
					<div class="col-md-2">
						<h6 class="caption font-weight-medium mb-2 inter-font">
							<span>Tastebite</span> <span
								class="d-inline-block d-md-none float-right"> <svg
									xmlns="http://www.w3.org/2000/svg" width="14" height="8"
									viewBox="0 0 9.333 5.333">
<path
										d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</span>
						</h6>
						<ul>
							<li><a
								href="recipe-full-width.html">About
									us</a></li>
							<li><a
								href="recipe-full-width.html">Careers</a></li>
							<li><a
								href="recipe-full-width.html">Contact
									us</a></li>
							<li><a
								href="recipe-full-width.html">Feedback</a></li>
						</ul>
					</div>
					<div class="col-md-2">
						<h6 class="caption font-weight-medium mb-2 inter-font">
							<span>Legal</span> <span
								class="d-inline-block d-md-none float-right"> <svg
									xmlns="http://www.w3.org/2000/svg" width="14" height="8"
									viewBox="0 0 9.333 5.333">
<path
										d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</span>
						</h6>
						<ul>
							<li><a
								href="recipe-full-width.html">Terms</a></li>
							<li><a
								href="recipe-full-width.html">Conditions</a></li>
							<li><a
								href="recipe-full-width.html">Cookies</a></li>
							<li><a
								href="recipe-full-width.html">Copyright</a></li>
						</ul>
					</div>
					<div class="col-md-2">
						<h6 class="caption font-weight-medium mb-2 inter-font">
							<span>Follow</span> <span
								class="d-inline-block d-md-none float-right"> <svg
									xmlns="http://www.w3.org/2000/svg" width="14" height="8"
									viewBox="0 0 9.333 5.333">
<path
										d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</span>
						</h6>
						<ul>
							<li><a
								href="recipe-full-width.html">Facebook</a></li>
							<li><a
								href="recipe-full-width.html">Twitter</a></li>
							<li><a
								href="recipe-full-width.html">Instagram</a></li>
							<li><a
								href="recipe-full-width.html">Youtube</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="container">
				<hr>
				<div class="row pb-4 pt-2 align-items-center">
					<div class="col-md-6 order-2 order-md-0">
						<p class="text-gray-300 small text-left mb-0">© 2020 Tastebite
							- All rights reserved</p>
					</div>
					<div class="col-md-6">
						<div class="tstbite-social text-left text-md-right my-4 my-md-0">
							<a
								href="recipe-full-width.html">
								<svg data-name="feather-icon/facebook"
									xmlns="http://www.w3.org/2000/svg" width="20" height="20"
									viewBox="0 0 20 20">
<rect data-name="Bounding Box" width="20" height="20"
										fill="rgba(255,255,255,0)"></rect>
<path
										d="M6.667,18.333H3.333A.834.834,0,0,1,2.5,17.5V11.667H.833A.835.835,0,0,1,0,10.833V7.5a.834.834,0,0,1,.833-.833H2.5V5a5.006,5.006,0,0,1,5-5H10a.834.834,0,0,1,.833.833V4.167A.834.834,0,0,1,10,5H7.5V6.667H10A.833.833,0,0,1,10.808,7.7l-.833,3.334a.831.831,0,0,1-.809.631H7.5V17.5A.834.834,0,0,1,6.667,18.333Zm-5-10V10H3.333a.835.835,0,0,1,.834.833v5.834H5.833V10.833A.834.834,0,0,1,6.667,10h1.85l.416-1.667H6.667A.834.834,0,0,1,5.833,7.5V5A1.669,1.669,0,0,1,7.5,3.333H9.166V1.666H7.5A3.337,3.337,0,0,0,4.167,5V7.5a.835.835,0,0,1-.834.833Z"
										transform="translate(5 0.833)" fill="#7f7f7f"></path>
</svg>
							</a> <a
								href="recipe-full-width.html">
								<svg data-name="feather-icon/instagram"
									xmlns="http://www.w3.org/2000/svg" width="20" height="20"
									viewBox="0 0 20 20">
<rect data-name="Bounding Box" width="20" height="20"
										fill="rgba(255,255,255,0)"></rect>
<path
										d="M5,18.333a5.005,5.005,0,0,1-5-5V5A5.006,5.006,0,0,1,5,0h8.333a5.005,5.005,0,0,1,5,5v8.333a5,5,0,0,1-5,5ZM1.667,5v8.333A3.337,3.337,0,0,0,5,16.667h8.333a3.337,3.337,0,0,0,3.333-3.333V5a3.337,3.337,0,0,0-3.333-3.334H5A3.338,3.338,0,0,0,1.667,5Zm4.59,7.076A4.164,4.164,0,1,1,9.2,13.3,4.161,4.161,0,0,1,6.256,12.076Zm.713-4.07a2.5,2.5,0,1,0,2.6-1.348A2.527,2.527,0,0,0,9.2,6.631,2.487,2.487,0,0,0,6.97,8.006Zm6.191-2.833a.833.833,0,1,1,.589.244A.834.834,0,0,1,13.161,5.173Z"
										transform="translate(0.833 0.833)" fill="#7f7f7f"></path>
</svg>
							</a> <a
								href="recipe-full-width.html">
								<svg xmlns="http://www.w3.org/2000/svg" width="20.004"
									height="20" viewBox="0 0 20.004 20">
<g data-name="feather-icon/twitter" transform="translate(0.002)">
<rect data-name="Bounding Box" width="20" height="20"
										fill="rgba(255,255,255,0)"></rect>
<path
										d="M6.894,16.644A13.387,13.387,0,0,1,.431,14.9a.834.834,0,0,1,.4-1.562H.869c.118,0,.237.007.354.007a8.925,8.925,0,0,0,3.708-.813,8.043,8.043,0,0,1-3.59-4.4A9.651,9.651,0,0,1,1.329,2.55a8.74,8.74,0,0,1,.412-1.214A.833.833,0,0,1,3.184,1.2,8.049,8.049,0,0,0,8.914,4.574l.255.023,0-.2A4.567,4.567,0,0,1,16.78,1.162a8.239,8.239,0,0,0,1.909-1,.827.827,0,0,1,.478-.155.852.852,0,0,1,.663.326.811.811,0,0,1,.149.707,7.28,7.28,0,0,1-1.662,3.145c.012.138.019.276.019.408a13.328,13.328,0,0,1-.922,4.987A11.157,11.157,0,0,1,6.894,16.644ZM2.839,3.378a7.847,7.847,0,0,0,.086,4.238,6.928,6.928,0,0,0,4.081,4.131.833.833,0,0,1,.13,1.451,10.505,10.505,0,0,1-3.025,1.414,10.962,10.962,0,0,0,2.786.367,9.566,9.566,0,0,0,6.869-2.807,10.5,10.5,0,0,0,2.9-7.576,2.817,2.817,0,0,0-.052-.538.834.834,0,0,1,.233-.75,5.6,5.6,0,0,0,.515-.583l-.285.1-.288.091a.831.831,0,0,1-.868-.25,2.9,2.9,0,0,0-5.088,1.953V5.45a.829.829,0,0,1-.812.833c-.084,0-.169,0-.253,0A9.659,9.659,0,0,1,6,5.525,9.669,9.669,0,0,1,2.839,3.378Z"
										transform="translate(-0.002 1.658)" fill="#7f7f7f"></path>
</g>
</svg>
							</a> <a
								href="recipe-full-width.html">
								<svg xmlns="http://www.w3.org/2000/svg" width="20.001"
									height="20" viewBox="0 0 20.001 20">
<g data-name="feather-icon/youtube" transform="translate(0)">
<rect data-name="Bounding Box" width="20" height="20"
										fill="rgba(255,255,255,0)"></rect>
<path
										d="M9.475,14.547,8.157,14.53c-.7-.013-1.348-.031-1.934-.053l-.592-.025a16.853,16.853,0,0,1-3.019-.316A3.189,3.189,0,0,1,.4,11.881,25.065,25.065,0,0,1,0,7.3,24.913,24.913,0,0,1,.408,2.681,3.168,3.168,0,0,1,2.618.411,17.815,17.815,0,0,1,5.8.089L6.887.049C7.536.029,8.205.016,8.876.008L9.8,0h.484L11.4.01c.584.007,1.173.02,1.748.036l.583.018a21.6,21.6,0,0,1,3.668.317A3.158,3.158,0,0,1,19.6,2.7,25.076,25.076,0,0,1,20,7.289a24.8,24.8,0,0,1-.408,4.58,3.164,3.164,0,0,1-2.209,2.269,16.78,16.78,0,0,1-3.014.315l-.592.025c-.586.023-1.237.041-1.934.053l-1.318.017ZM9.358,1.669c-.816.007-1.6.021-2.32.042l-1.109.04a18.192,18.192,0,0,0-2.868.266A1.468,1.468,0,0,0,2.037,3.031,23.455,23.455,0,0,0,1.667,7.3,23.669,23.669,0,0,0,2.018,11.5a1.488,1.488,0,0,0,1.031,1.024,18.758,18.758,0,0,0,2.977.273l.881.032c.374.011.793.022,1.282.031l1.3.017h1.026l1.3-.017c.488-.009.907-.019,1.282-.031l.881-.032.736-.035a14.14,14.14,0,0,0,2.228-.235,1.468,1.468,0,0,0,1.024-1.012,23.446,23.446,0,0,0,.37-4.232,23.255,23.255,0,0,0-.358-4.234,1.483,1.483,0,0,0-1.006-1.06,17.158,17.158,0,0,0-2.524-.232l-.776-.031c-.681-.023-1.453-.041-2.3-.053l-1.092-.009H9.8ZM7.545,10.616a.823.823,0,0,1-.254-.6V4.566a.835.835,0,0,1,.835-.834.822.822,0,0,1,.41.11l4.792,2.725a.833.833,0,0,1,0,1.449L8.537,10.74a.821.821,0,0,1-.411.111A.845.845,0,0,1,7.545,10.616ZM8.958,8.583l2.272-1.292L8.958,6Z"
										transform="translate(0 2.501)" fill="#7f7f7f"></path>
</g>
</svg>
							</a>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</section>

	<script src="../resources/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/html5.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/sticky.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/swiper-bundle.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/masonry.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/tastebite-scripts.js"
		type="text/javascript"></script>
	<script defer="" src="../resources/js/beacon.min.js"
		data-cf-beacon="{&quot;rayId&quot;:&quot;6a50cd88dd72f8d7&quot;,&quot;version&quot;:&quot;2021.10.0&quot;,&quot;r&quot;:1,&quot;token&quot;:&quot;9ae02b4a12234f118cf01e6f25c04e9d&quot;,&quot;si&quot;:100}"></script>

	



</body>
</html>