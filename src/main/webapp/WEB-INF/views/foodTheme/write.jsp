<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0047)profile.html -->
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>




<link
	href="/assets/images/favicon.ico"
	rel="shortcut icon" type="image/x-icon">

<link href="../resources/css/tastebite-styles.css" rel="stylesheet"
	type="text/css" media="all">

 <style>

 {
	font-family: Arial, Helvetica, sans-serif;

}

li > small {
font-family: Arial, Helvetica, sans-serif;
font-size: 10px;
}


</style>	
	
</head>
<body>

	
		
		<!-- 여기까지 헤더부분. -->

		
		
		<!-- 헤더 옆 검색부분 -->
		
		<!--  콘텐츠 시작 -->
		<div class="container">			
				<!-- 데이터 전송용 form 만들어줘야함!! -->
				
<form method="post">
	<div class="container">

			<section class="tstbite-components my-4 my-md-5">
				<div class="d-sm-flex">
					
					<div>
							<h4>음식-테마 등록</h4>
							<input id="foodName" type='text' class="py-2 py-md-3 mb-0" name="foodName" placeholder='음식 이름' readonly>
							<input id="foodNo" type='hidden' class="py-2 py-md-3 mb-0" name="foodNo">
							
							<button type="button" id="foodSelect" class="btn btn-lg btn-primary px-4 px-md-5 text-uppercase" >음식 선택</button>
							
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

					</div>
				</div>
				<div class="d-flex flex-wrap">
					<div class="my-2 mr-4">
						<!--<img src="../resources/img/avatar11.png"
							class="rounded-circle" alt="Avatar">--> 
							<label>테마 카테고리</label>
							
							<select name="themeType" id="themeTypeSelect">
							<c:forEach items="${themeTypes}" var="item">
								  <option value="${item}">${item}</option>
							</c:forEach>
							</select>
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
							 
							
							
							<label>상세 테마 선택</label>
							<select name="themeNo" id="themeSelect">

							</select>

					</div>
				
				</div>
				
				<section class="tstbite-components my-4 my-md-5">
				<div class="row align-items-center pt-0 pt-md-5">
					<div class="col-lg-3 col-4 text-right">
						<!-- 수정 필요. 밑에 form으로 -->
						<button id="submitButton" class="btn btn-lg btn-primary px-4 px-md-5 text-uppercase" type="submit"> 작성 </button>
					</div>
				</div>
				
				</section>
			</form>
			
			
		
	</section>

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