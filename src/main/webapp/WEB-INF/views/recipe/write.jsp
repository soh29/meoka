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

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<style>
body{
	font-family: 'Gowun Dodum', sans-serif;
}
.fileDrop {
	width: 160px;
	height: 120px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	overflow: hidden;
}

.fileDrop img {
	image-rendering: auto; 
}
</style>

</head>


<body>

	

		<!-- 여기까지 헤더부분. -->

		

	
		<!--  콘텐츠 시작 -->
		<div class="container">
			<!-- 데이터 전송용 form 만들어줘야함!! -->
<h1
		style="font-size: 40px; font-weight: 600; margin-top: 5%; margin-bottom: 5%; text-align: center; font-family: inter,sans-serif;"">
		RECIPE REGISTER</h1>
			<form method="post">
				<div class="contents">

					<section class="tstbite-components my-4 my-md-5">
						<div class="title">
					
							<div>
								<div class="write1">
									<label>제목</label>
									<input type='text'  name="RECIPENAME"placeholder='제목' class="writeInput">
								</div>
							</div>
						</div>
						<div class="d-flex flex-wrap">
							<div class="write1">
								<!--<img src="../resources/img/avatar11.png"
							class="rounded-circle" alt="Avatar">-->
								<label>작성자</label> <input type="text"  class="writeInput"name="MEMBERID"
									value="${login.memberId }" readonly /><br />
							</div>
							<div class="my-2 mr-4">
								<small>${view.REGDATE}</small>
							</div>
							<div class="write1">음식 선택: <span> <input
								id="foodName" type='text' 
								name="foodName" placeholder='음식 이름' readonly style="text-align-last: center; text-align: center; -ms-text-align-last: center; -moz-text-align-last: center;"> 
							<input
								id="foodNo" type='hidden' 
							name="foodNo">
							<button type="button" id="foodSelect"
								class="btn btn-lg btn-primary" style="width:100px; height:28px; padding:0px; font-size:1rem;">음식 선택
							</button></span>
							</div>
						</div>
						<div class="blog-detail">
							<div class="bg-lightest-gray bg-custom">
								<!-- class="row mt-0 mt-md-5" -->
								<div class="col-md-12">
									<label style="padding-left:40px;padding-top:20px; width:120px;">요리정보</label>
									<ul class="list-unstyled component-list tstbite-svg">
										<li id="marginLi"><small>조리시간</small><span><input type="text"
												name="COOKINGTIME" /></span><br /></li>
										<li><small>수준</small> <span> <select name="RANKNO">
													<option value="1">초급</option>
													<option value="2">중급</option>
													<option value="3">고급</option>
											</select> <br />
										</span></li>
										<li><small>양</small> <span><input type="text"
												name="PORTION" /><br /> </span></li>
									</ul>
								</div>
							</div>

						</div>
						<div class="row mt-4 g-0 spanDiv">
							<div class="col-lg-8">
								<div class="rounded-12 bg-lightest-gray p-4">
									<span>도 구</span>
									<div id="newUtensilId"></div>
									<div id="dynamicCheck">
										<input type="button" value="도구 추가"
											onclick="createNewUtensil();" />
									</div>
									<span id="marginSpan">재 료</span>
									<div id="newIngredientId"></div>
									<div id="dynamicCheck">
										<input type="button" value="재료 추가"
											onclick="createNewIngredient();" />
									</div>

								</div>
							</div>
						</div>
				</div>
				<div class="col-md-8 spanDiv">
					<div class=" rounded-12 bg-lightest-gray p-4">
						<span>조리 방법</span>
						<div id="recipedetailview">
							<!-- 레시피 디테일 text 작성기능 -->
							<div id="dynamicCheck">
								<input type="button" value="방법 추가"
									onclick="createNewElement();" />
							</div>
							
							<div id="newElementId"></div>


						</div>
					</div>
				</div>
		</div>
		
		<section class="tstbite-components my-4 my-md-5">
			<div class="align-items-center pt-0 pt-md-5 button">
				<div class="col-lg-3 col-4 textCenter">
					<!-- 수정 필요. 밑에 form으로 -->
					<button id="submitButton"
						class="btn btn-lg btn-primary px-4 px-md-5 text-uppercase"
						type="submit">작성</button>
				</div>
			</div>

		</section>
		</form>
		
	</section>

	


	<!-- 파일 업로드 기능 -->

	<script id="template" type="text/x-handlebars-template">
 <li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn">x</a>
  </div>
   </li>                
</script>





	<script>
		var template = Handlebars.compile($("#template").html());
	</script>

	<!-- 세부내용 인풋박스 추가기능 -->
	<script>
		function createNewElement() {
			// First create a DIV element.
			var txtNewInputBox = document.createElement('div');

			// Then add the content (a new input box) of the element.

			txtNewInputBox.innerHTML = "<div class='form-group'>"
					+"<span>내용</span></br>"
					+ "<textarea name='RECIPEDETAIL'></textarea>"
					+ "<input type='hidden' name ='PHOTO'>"
					+ "<br><input type='button' class='removeDetail' value='삭제'>"
					+ "<br>"
					+ "<label for='exampleInputEmail1'>File DROP Here</label>"
					+ "<div class='fileDrop'></div>"
					+ "</div>"
					+ "<div class='mailbox-attachments clearfix uploadedList'></div>"

			// Finally put it where it is supposed to appear.
			document.getElementById("newElementId").appendChild(txtNewInputBox);

			//추가해보는거
			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();

			});

			$(".fileDrop")
					.on(
							"drop",
							function(event) {

								event.preventDefault();

								var files = event.originalEvent.dataTransfer.files;

								var file = files[0];

								var formData = new FormData();

								formData.append("file", file);

								var $this = $(this);
								$
										.ajax({
											url : '/upload/uploadAjax',
											data : formData,
											dataType : 'text',
											processData : false,
											contentType : false,
											type : 'POST',
											success : function(data) {

												var fileInfo = getFileInfo(data);
												console.log(fileInfo);

												var html = template(fileInfo);
												//console.log(html);
												//console.log(fileInfo.imgsrc);
												//console.log($($this).parent());

												//$(".uploadedList").append(html);
												$(
														$($this)
																.parent()
																.children(
																		"div[class='fileDrop']"))
														.html(
																'<img src="' + fileInfo.getLink + '" height="120px" width="160px">'
																		+ '<button style="position: absolute;float:right;" class="delBtn ">사진삭제</button>');
												//style="position: absolute;bottom: 0;float:right;"
												$(
														$($this)
																.parent()
																.children(
																		"input[type='hidden']"))
														.attr("value",
																fileInfo.getLink);
												$(".delBtn").on(
														"click",
														function() {
															$(this).parent()
																	.children()
																	.remove();

														});
											}
										});

								//consol.log($(this).children(":first").attr("name", "recipeDetail[" + index + "].RECIPEDETAIL" ));
								//consol.log($(this).children(":eq(1)").attr("name", "recipeDetail[" + index + "].PHOTO" ));
							});

			$(".uploadedList").on(
					"click",
					"delbtn",
					function(event) {

						var that = $(this);

						$.ajax({
							url : "/upload/deleteFile",
							type : "post",
							data : {
								fileName : $(this).attr("href")
							},
							dataType : "text",
							success : function(result) {
								if (result == 'deleted') {
									$(
											$(that).parent().children(
													"div[class='fileDrop']"))
											.remove();
									//that.parent("div").parent().remove();
								}
							}
						});
					});
			$(".removeDetail").on("click", function(event) {
				event.preventDefault();
				$(this).parent().parent().remove();
			});

		}
	</script>


	<!-- 도구 스크립트  -->

	<script>
		function createNewUtensil() {
			// First create a DIV element.
			var NewInputBox = document.createElement('div');

			// Then add the content (a new input box) of the element.
			NewInputBox.innerHTML = " <span>요리도구</span> <input type='text' name='utensilName'><input type='button' class='deleteBtn1' value='삭제'onclick='remove(this)'>";

			// Finally put it where it is supposed to appear.
			document.getElementById("newUtensilId").appendChild(NewInputBox);
		}
		function remove(createNewUtensil) {
			document.getElementById("newUtensilId").removeChild(
					createNewUtensil.parentNode);
		}
	</script>
	<!-- 도구 끝 -->

	<!-- 재료 시작-->
	<script>
		function createNewIngredient() {
			var NewInputBox = document.createElement('div');

			NewInputBox.innerHTML = " <span>재료이름</span> <input type='text' name='ingredientName'></br> <span>양</span> <input type='text' name='amount'><br/> <span>필수여부</span>"
					+ "<select name='required'>"
					+ "<option value='Y'>필수</option>"
					+ "<option value='N'>대체가능</option>"
					+ "</select>"
					+ "<br><input type='button' class='deleteBtn' value='삭제'onclick='removeIngredient(this)'>";

			document.getElementById("newIngredientId").appendChild(NewInputBox);
		}

		function removeIngredient(createNewIngredient) {
			document.getElementById("newIngredientId").removeChild(
					createNewIngredient.parentNode);
		}
	</script>




	<script>
	<!--작성 눌렀을때 인덱스 -->
		$("#submitButton").on(
				"click",
				function(event) {
					event.preventDefault();
					//alert();

					if ($("#newElementId").children().length == 0) {
						alert("세부 조리방법을 추가하세요");
						return;
					}
					if ($("#newUtensilId").children().length == 0) {
						alert("도구를 추가하세요");
						return;
					}
					if ($("#newIngredientId").children().length == 0) {
						alert("재료를 추가하세요");
						return;
					}
					$("#newElementId").children("div").each(
							function(index, item) {
								$(item).children(":eq(0)").children(
										"textarea[name='RECIPEDETAIL']").attr(
										"name",
										"recipeDetail[" + index
												+ "].RECIPEDETAIL");

								$(item).children(":eq(0)").children(
										"input[name='PHOTO']").attr("name",
										"recipeDetail[" + index + "].PHOTO")
							});

					/* 
					$('#newElementId').children(":eq(0)").children().each(function(index, item)	{
						
					      $($($(this)).parent().children("input[type='text']")).attr("name", "recipeDetail[" + index + "].RECIPEDETAIL");
					     $($($(this)).parent().children("input[type='hidden']")).attr("name", "recipeDetail[" + index + "].PHOTO");
						
						$(this).children().children(":eq(0)").attr("name", "recipeDetail[" + index + "].RECIPEDETAIL" );
						$(this).children().children(":eq(1)").attr("name", "recipeDetail[" + index + "].PHOTO" );
						
					}) */
					$('#newUtensilId').children().each(
							function(index, item) {
								$(this).children("input[name='utensilName']").attr("name",
										"utensil[" + index + "].utensilName");
							})
					$('#newIngredientId').children().each(
							function(index, item) {

								$(this)
										.children(
												"input[name='ingredientName']")
										.attr(
												"name",
												"ingredient[" + index
														+ "].ingredientName");
								$(this).children("input[name='amount']").attr(
										"name",
										"ingredient[" + index + "].amount");
								$(this).children("select[name='required']")
										.attr(
												"name",
												"ingredient[" + index
														+ "].required");
							})

					$("form").submit();
				});
	</script>
	 <script>
		window.onload = function() {
			var divs = document.querySelectorAll('.form-group > div');
			for (var i = 0; i < divs.length; ++i) {
				var div = divs[i];
				var divAspect = div.offsetHeight / div.offsetWidth;
				div.style.overflow = 'hidden';

				var img = div.querySelector('img');
				var imgAspect = img.height / img.width;

				if (imgAspect <= divAspect) {
					// 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
					var imgWidthActual = div.offsetHeight / imgAspect;
					var imgWidthToBe = div.offsetHeight / divAspect;
					var marginLeft = -Math
							.round((imgWidthActual - imgWidthToBe) / 2)
					img.style.cssText = 'width: auto; height: 100%; margin-left: '
							+ marginLeft + 'px;'
				} else {
					// 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
					img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
				}
			}

		};
	</script>


	<script>										
		$("#foodSelect").on("click", function()	{
			const width = 360;
			const height = 360;
			var left = (screen.width/2)-(width/2);
			var top = (screen.height/2)-(height/2);
			
			var myWindow = window.open("../foodTheme/foodList", "foodSelect", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, copyhistory=no, width='+width+', height='+height+', top='+top+', left='+left);
			//$(myWindow.document)
		})	
	</script>

	<script>
	$("#submitButton").on("click", function(event){
		event.preventDefault();
		//alert();
		
		if($("#foodNo").val().length == 0 ) {
			alert("음식을 지정하세요");
			return;
		}
		
		const foodNo = $("#foodNo").val();

	});
</script>


<%@include file="../include/footer.jsp"%>

</body>
</html>