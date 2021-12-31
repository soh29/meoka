<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<!-- saved from url=(0047)profile.html -->
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>



<meta name="description" content="Tastebite">
<meta name="keywords" content="Tastebite">
<meta name="author" content="Tastebite">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Tastebite - Category</title>
<link
	href="/assets/images/favicon.ico"
	rel="shortcut icon" type="image/x-icon">

<link href="../resources/css/tastebite-styles.css" rel="stylesheet"
	type="text/css" media="all">

 <style>
.fileDrop {
  width: 160px;
  height: 120px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  overflow:hidden;
}
.fileDrop img {
	max-width: 100%;
 	height: auto;
  	
}
</style>	
	
</head>
<body>

<%@include file="../include/header.jsp"%>
		
		<!-- 여기까지 헤더부분. -->

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
						<a href="profile.html">
							<figure>
								<img src="../resources/img/menu111.png" class="rounded-circle"
									alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Cake</strong> <span class="tiny">Category</span>
							</div>
						</a>
					</div>
					<div class="tstbite-search-list">
						<a href="profile.html">
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
						<a href="profile.html">
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
						<a href="profile.html">
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
						<a href="profile.html">
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
						<a href="profile.html">
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
						<a href="profile.html"
							class="btn btn-sm btn-outline-dark px-4 py-2">See all 343
							results</a>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 헤더 옆 검색부분 -->

		<div class="container">
		<!--  콘텐츠 시작 -->
		<!-- 데이터 전송용 form 만들어줘야함!! -->
				
<form method="post">
	<div class="container">

			<section class="tstbite-components my-4 my-md-5">
				<div class="d-sm-flex">
					
					<div>
						<h5>FOOD</h5>
						<div class="col-lg-9 col-8 col-6">
						<h3><input type='text' class="py-2 py-md-3 mb-0" name="foodName" placeholder='FoodName'></h3> 
						</div>
					</div>
				</div>
				<div class="blog-detail">
					<div ><!-- class="row mt-0 mt-md-5" -->
						<div class="col-md-12">
						<h6>Type</h6>
							<ul class="list-unstyled component-list tstbite-svg">
									
											<select name="foodType">
											    <option value="한식">한식</option>
											    <option value="중식">중식</option>
											    <option value="일식">일식</option>
											    <option value="양식">양식</option>
											</select>
								<br/>
							</ul>
						</div>
					</div>
				</div>
				</section>
				<section class="tstbite-components my-4 my-md-5">
						<!-- 수정 필요. 밑에 form으로 -->
						<button id="submitButton" class="btn btn-lg btn-primary px-4 px-md-5 text-uppercase" type="submit"> 작성 </button>
				</section>
			</form>
		</div>
	
	</section>
	<%@include file="../include/footer.jsp"%>

	<script src="../resources/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/html5.min.js" type="text/javascript"></script>
	<script src="../resources/js/sticky.min.js" type="text/javascript"></script>
	<script src="../resources/js/swiper-bundle.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/masonry.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/tastebite-scripts.js"
		type="text/javascript"></script>
	<script defer="" src="../resources/js/beacon.min.js"
		data-cf-beacon="{&quot;rayId&quot;:&quot;6a50d6908fc02079&quot;,&quot;version&quot;:&quot;2021.10.0&quot;,&quot;r&quot;:1,&quot;token&quot;:&quot;9ae02b4a12234f118cf01e6f25c04e9d&quot;,&quot;si&quot;:100}"></script>


</body>
</html>