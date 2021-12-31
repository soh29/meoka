<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<!DOCTYPE html>
<!-- saved from url=(0047)profile.html -->
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>



<title>Tastebite - Category</title>
<link href="/assets/images/favicon.ico" rel="shortcut icon"
	type="image/x-icon">

<link href="../resources/css/tastebite-styles.css" rel="stylesheet"
	type="text/css" media="all">

<style>
.fileDrop {
	width: 160px;
	height: 120px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	overflow: hidden;
}

.fileDrop img {
	max-width: 100%;
	height: auto;
}
</style>

</head>
<body>

]

		<!-- 여기까지 헤더부분. -->

		

		<!-- 헤더 옆 검색부분 -->

		<!--  콘텐츠 시작 -->
		<div class="container">
			<!-- 데이터 전송용 form 만들어줘야함!! -->

			<form method="post">
				<div class="container">

					<section class="tstbite-components my-4 my-md-5">


						<div class="blog-detail">
							<div>
								<!-- class="row mt-0 mt-md-5" -->
								<div class="col-md-12">
									<h6>자신이 원하는 테마를 입력해주세요.</h6>
									<ul class="">
										<li><strong>테마종류:</strong> <span><input
												type="text" name="themeType" placeholder="기념일" /><br /> </span></li>
										<br>
										<li><strong>테마이름:</strong> <span><input
												type="text" name="themeName" placeholder="크리스마스" /><br /></span></li>
									</ul>
								</div>
							</div>

						</div>
				</div>
		</div>
		</div>
		<section class="tstbite-components my-4 my-md-5">
			<div class="row align-items-center pt-0 pt-md-5">
				<div class="col-lg-3 col-4 text-right">
					<!-- 수정 필요. 밑에 form으로 -->
					<button id="submitButton"
						class="btn btn-lg btn-primary px-4 px-md-5 text-uppercase"
						type="submit">작성</button>
				</div>
			</div>

		</section>
		</form>
		
<%@include file="../include/footer.jsp"%>

	<script src="../resources/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/html5.min.js" type="text/javascript"></script>
	<script src="../resources/js/sticky.min.js" type="text/javascript"></script>
	<script src="../resources/js/swiper-bundle.min.js"
		type="text/javascript"></script>
	<script src="../resources/js/masonry.min.js" type="text/javascript"></script>
	<script src="../resources/js/tastebite-scripts.js"
		type="text/javascript"></script>
	<script defer="" src="../resources/js/beacon.min.js"
		data-cf-beacon="{&quot;rayId&quot;:&quot;6a50d6908fc02079&quot;,&quot;version&quot;:&quot;2021.10.0&quot;,&quot;r&quot;:1,&quot;token&quot;:&quot;9ae02b4a12234f118cf01e6f25c04e9d&quot;,&quot;si&quot;:100}"></script>





















</body>
</html>