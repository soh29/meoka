<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0053)search-result.html -->
<html dir="ko" lang="UTF-8">
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/css/recipeList.css" rel="stylesheet"
	type="text/css" media="all">

	<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body{
	font-family: 'Gowun Dodum', sans-serif;
}
.paging {
	text-align: center;
}

.paging a {
	display: inline-block;
	font-weight: bold;
	text-decoration: none;
	padding: 5px 8px;
	border: 1px solid #ccc;
	color: #f3f3f3;
	background-color: #ffc1ab;
}
/* 현재 페이징에 select 클래스를 적용한다*/
.paging a.select {
	color: #fff;
	background-color: #FFA7A7;
}
.fa-star.active {
  cursor: pointer;
  color: #dabd18b2;
  background-color : #FFF;
}
</style>
</head>
<body>



		
		<div class="container">

			<section class="tstbite-components my-4 my-md-5">
				<h1
		style="font-size: 40px; font-weight: 600; margin-top: 5%; margin-bottom: 5%; text-align: center; font-family: inter,sans-serif;"">
		FOODTHEME LIST</h1>
				
				 <!-- 검색기능 -->
	<div class="search">
	   <select name="themeType" id="themeTypeSelect" style="height:40px; text-align-last: center; text-align: center; -ms-text-align-last: center; -moz-text-align-last: center;">
        <c:forEach items="${themeTypes}" var="item">
			<option value="${item}"${item == themeVO.themeType ? " selected":"" }>${item}</option>
		</c:forEach>
       </select> 

		<select name="themeNo" id="themeSelect"
			style="height:40px; text-align-last: center; text-align: center; -ms-text-align-last: center; -moz-text-align-last: center;">
		</select>
		
		 <div class="button-8" id="searchBtn">
		    <div class="eff-8"></div>
		    <a href="#"> Search </a>
		  </div>

	</div>
				 
				 
				 
				 
				 
				 
				<div class="row">
				<c:forEach items="${list}" var="list">
					<div class="col-lg-3 col-md-4 col-6">
						<figure class="my-3 my-md-4 tstbite-card">
						 <a href="/recipe/view?RECIPENO=${list.RECIPENO}"
								class="tstbite-animation stretched-link rounded-6">
								<img src="${list.PHOTO}" class="w-100" alt="Menu" style="width:280px!important;height:300px!important">
							</a>
							<figcaption class="mt-2">
								<a href="/recipe/view?RECIPENO=${list.RECIPENO}"><strong>${list.RECIPENAME}</strong></a><br><small>${list.MEMBERID}</small>
								<small>
								<c:forEach var="i" begin="1" end="${list.point}">
									<i class='fa fa-star active'></i>
								</c:forEach>
								<c:forEach var="i" begin="${list.point+1}" end="5">
									<i class='fa fa-star'></i>
								</c:forEach>
								</small>
							</figcaption>
						</figure>
					</div>
				</c:forEach>
				
					
				</div>
				
				
				
				
				

			</section>
		</div>
		<script>
			$(function() {
				$('#searchBtn').click(
						function() {
							
							self.location = "listByTheme"
									+ "?themeNo="
									+ $("#themeSelect").val()
									+ "&themeType="
									+ $("#themeTypeSelect option:selected").text()
									+ "&themeName="
									+ $("#themeSelect option:selected").text();
						});
			});
			
			
			
			
			
			
			
			function updateThemeSelect(themeType){
				$.ajax({
					url: "themes",
					data: { themeType: themeType },
					method: "GET",
					dataType: "json"
				})
				.done(function(json) {
					$("#themeSelect option").remove();
					const currentThemeNo = ${themeVO.themeNo};
					for(let i = 0; i < json.length; i++)	{
						string1 = "<option value='" + json[i].themeNo + "'"
						if(json[i].themeNo === currentThemeNo)
							string1 += " selected"
						string2 = ">" + json[i].themeName + "</option>";
						$("#themeSelect").append(string1 + string2);
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
		
<%@include file="../include/footer.jsp"%>
	
</body>
</html>