<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<%@include file="../include/header.jsp"%>

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
</head>
<body>

	<!--  콘텐츠 시작 -->
	<div class="container">
		<!-- 데이터 전송용 form 만들어줘야함!! -->

		<form method="post">




			<h1
				style="font-size: 40px; font-weight: 600; margin-top: 5%; margin-bottom: 5%; text-align: center; font-family: inter,sans-serif;">
				FOOD-THEME REGISTER</h1>

			<div class="bg-lightest-gray">

				<div class="col-md-12">
					<ul class="list-unstyled component-list tstbite-svg">
						<li><label class="centerLabel">테마 지정</label></li>
						<li><strong>음식 선택:</strong> <span> <input
								id="foodName" type='text' 
								name="foodName" placeholder='음식 이름' readonly style="text-align-last: center; text-align: center; -ms-text-align-last: center; -moz-text-align-last: center;"> <input
								id="foodNo" type='hidden' 
								name="foodNo">
								<button type="button" id="foodSelect"
									class="btn btn-lg btn-primary px-4 px-md-5 text-uppercase">음식
									선택</button></span></li>

						<li><strong>테마 카테고리: </strong><span><select
								name="themeType" id="themeTypeSelect"
								style="text-align-last: center; text-align: center; -ms-text-align-last: center; -moz-text-align-last: center;">
									<c:forEach items="${themeTypes}" var="item">
										<option value="${item}">${item}</option>
									</c:forEach>
							</select></span></li>
						<li><strong>상세 테마 선택:</strong><span> <select
								name="themeNo" id="themeSelect"
								style="text-align-last: center; text-align: center; -ms-text-align-last: center; -moz-text-align-last: center;">

							</select>
						</span></li>
					</ul>


					<br />
				</div>
			</div>







			<section class="tstbite-components my-4 my-md-5">
				<div class="row align-items-center pt-0 pt-md-5">
					<div class="col-lg-3 col-4 text-right">
						<!-- 수정 필요. 밑에 form으로 -->
						<button id="submitButton"
							class="btn btn-lg btn-primary px-4 px-md-5 text-uppercase"
							type="submit" style="margin: -385px;">작성</button>
					</div>
				</div>

			</section>
		</form>
	</div>
	<script>
								function updateThemeSelect(themeType){
									$.ajax({
										url: "themes",
										data: { themeType: themeType },
										method: "GET",
										dataType: "json"
									})
									.done(function(json) {
										$("#themeSelect option").remove();
										for(let i = 0; i < json.length; i++)	{
											//alert(json[i].themeName);
											$("#themeSelect").append("<option value='" + json[i].themeNo + "'>" + json[i].themeName + "</option>");
										}
										
									})
								}
								//console.log($("#themeTypeSelect option:selected").val())
								$("#themeTypeSelect").on("change", function(){
									//alert(this.value);
									updateThemeSelect(this.value);
								})
								let themeType = $("#themeTypeSelect option:selected").val();
								updateThemeSelect(themeType);
								
							</script>
	<script>
							
							
							$("#foodSelect").on("click", function()	{
								const width = 360;
								const height = 360;
								var left = (screen.width/2)-(width/2);
								var top = (screen.height/2)-(height/2);
								
								var myWindow = window.open("foodList", "foodSelect", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, copyhistory=no, width='+width+', height='+height+', top='+top+', left='+left);
								//$(myWindow.document)
								
			
							})
							
							</script>

	<script>
	<!--작성 눌렀을때 인덱스 -->

	$("#submitButton").on("click", function(event){
		event.preventDefault();
		//alert();
		
		if($("#foodNo").val().length == 0 ) {
			alert("음식을 지정하세요");
			return;
		}
		
		const foodNo = $("#foodNo").val();
		const themeNo = $("#themeSelect option:selected").val();
		console.log(foodNo, themeNo)
		$.ajax({
			url: "foodThemeExists",
			data: {
				themeNo: themeNo,
				foodNo: foodNo
			},
			method: "GET",
			dataType: "json"
		})
		.done(function(data) {
			if(data == 0)
				$("form").submit();
			else
				alert("이미 존재하는 음식테마입니다.");
		})
		//
	});
</script>
</body>


<%@include file="../include/footer.jsp"%>
</html>