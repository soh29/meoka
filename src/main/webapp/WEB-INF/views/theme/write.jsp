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
<link href="/resources/css/recipeWrite.css" rel="stylesheet"
	type="text/css" media="all">
<link href="/resources/css/foodRegister.css" rel="stylesheet"
	type="text/css" media="all">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">

<style>
body {
	font-family: 'Gowun Dodum', sans-serif;
}
</style>

<title>Tastebite - Category</title>



</head>
<body>





	<!-- 헤더 옆 검색부분 -->

	<!--  콘텐츠 시작 -->
	<div class="container">
		<!-- 데이터 전송용 form 만들어줘야함!! -->
		<h1
			style="font-size: 40px; font-weight: 600; margin-top: 5%; margin-bottom: 5%; text-align: center;font-family: inter,sans-serif;">
			THEME REGISTER</h1>
		<form method="post">
			<div class="container">



				<div class="bg-lightest-gray bg-custom">
					<!-- class="row mt-0 mt-md-5" -->
					<div class="col-md-12">
						<ul class="list-unstyled component-list tstbite-svg">
							<li><label class="centerLabel">요리정보</label></li>
							<li><strong>테마종류:</strong> <span><input type="text"
									name="themeType" placeholder="기념일"
									/ style="text-align-last: center; text-align: center; -ms-text-align-last: center; -moz-text-align-last: center;"><br />
							</span></li>
							<li><strong>테마이름:</strong> <span><input type="text"
									name="themeName" placeholder="크리스마스"
									/ style="text-align-last: center; text-align: center; -ms-text-align-last: center; -moz-text-align-last: center;"><br /></span></li>




						</ul>

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
					type="submit" style="margin: -385px; margin-top:-500px;">작성</button>
			</div>
		</div>

	</section>

	</form>
	<%@include file="../include/footer.jsp"%>










</body>
</html>