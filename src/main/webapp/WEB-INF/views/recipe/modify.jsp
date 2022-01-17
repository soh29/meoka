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
<link href="/resources/css/testbite-style.css" rel="stylesheet"
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

	
			<section>
	
		
		<!--  콘텐츠 시작 -->
		<div class="container">			
				<!-- 데이터 전송용 form 만들어줘야함!! -->
				<h1
		style="font-size: 40px; font-weight: 600; margin-top: 5%; margin-bottom: 5%; text-align: center;">
		RECIPE MODIFY</h1>
<form method="post">
	<div class="container">

			<section class="tstbite-components my-4 my-md-5">
				<div class="d-sm-flex">
					
					<div>
						<div class="col-lg-9 col-8 col-6">
						<h3><input type='text' class="py-2 py-md-3 mb-0" name="RECIPENAME" value="${view.RECIPENAME}"></h3> 
						</div>
					</div>
				</div>
				<div class="d-flex flex-wrap">
					<div class="my-2 mr-4">
						<!--<img src="../resources/img/avatar11.png"
							class="rounded-circle" alt="Avatar">--> 
							<label>작성자</label> <input type="text" name="MEMBERID" value="${login.memberId }" readonly /><br />
					</div>
					<div class="my-2 mr-4">
						<small>${view.REGDATE}</small>
					</div>
				</div>
					<div class="write1">음식 선택: <span> 
						<input id="foodName" type='text' value="${view.foodName}"
							name="foodName" placeholder='음식 이름' readonly style="text-align-last: center; text-align: center; -ms-text-align-last: center; -moz-text-align-last: center;"> 
						<input id="foodNo" value="${view.foodNo}" type='hidden' name="foodNo">
						<button type="button" id="foodSelect"
								class="btn btn-lg btn-primary" style="width:100px; height:28px; padding:0px; font-size:1rem;">음식 선택
						</button></span>
					</div>
				<div class="blog-detail">
					<div ><!-- class="row mt-0 mt-md-5" -->
						<div class="col-md-12">
						<h6>요리정보</h6>
							<ul class="list-unstyled component-list tstbite-svg">
								<li><small>조리시간</small><span><input type="text" name="COOKINGTIME" value="${view.COOKINGTIME}" /></span><br /></li>
								<li><small>수준</small>
									<span>
											<select name="RANKNO" value = "${view.RANKNO}">
											    <option value="1">초급</option>
											    <option value="2">중급</option>
											    <option value="3">고급</option>
											</select>
										<br />
									</span>
								</li>
								<li><small>양</small> <span><input type="text" name="PORTION" value="${view.PORTION}" /><br />  </span></li>
							</ul>
						</div>
								</div>
							
							</div>
							<div class="row mt-4 g-0">
								<div class="col-lg-8">
									<div class="rounded-12 bg-lightest-gray p-4">
										<h6> 도 구 </h6>
										<div id="newUtensilId">
											<c:forEach items="${viewUtensil}" var="UtensilVO">
												<div>
												 요리도구 <input type='text' name='utensilName' value='${UtensilVO.utensilName}'>
												<input id="removeUtensilForm" type='button' value='삭제'onclick='remove(this)'>							
												</div>
											</c:forEach>
										
										</div>
										<div id="dynamicCheck">
										   <input type="button" value="도구 추가" onclick="createNewUtensil();"/>
										</div>
										<h6> 재 료 </h6>
										<div id="newIngredientId">
										
										<c:forEach items="${viewIngredient}" var="IngredientVO">
										
										<div>
										 재료이름 <input type='text' name='ingredientName' value='${IngredientVO.ingredientName}'></br>
										  양 <input type='text' name='amount' value='${IngredientVO.amount}'><br/>
										   필수여부<select name='required'>
											<option value='Y' <c:out value="${IngredientVO.required == 'Y' ? 'selected' : ''}"/>>
											필수</option>
											<option value='N' <c:out value="${IngredientVO.required == 'N' ? 'selected' : ''}"/>>대체가능</option>
											</select>
											<input id="removeIngredientForm" type='button' value='삭제'onclick='removeIngredient(this)'>
										
										</div>
										</c:forEach>
										
										
										
										</div>
										<div id="dynamicCheck">
										   <input type="button" value="재료 추가" onclick="createNewIngredient();"/>
										</div>
											
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="mt-5">
								<h6>조리 방법</h6>
										<!-- 레시피 디테일 text 작성기능 -->
										<div id="dynamicCheck">
										   <input type="button" value="조리 방법 추가" onclick="createNewElement();"/>
										</div>
										</br>
										<strong> 내 용 </strong>
										
										<div id="newElementId">
											<c:forEach items="${list}" var="RecipeDetailVO">
												<div>
													<div class='form-group'>
														
																<textarea name='RECIPEDETAIL'>${RecipeDetailVO.RECIPEDETAIL}</textarea>
																<input type='hidden' name ='PHOTO' value='${RecipeDetailVO.PHOTO}'>
																<input type='button' class='removeDetailForm' value='삭제'>
																<br>
																
														<label for='exampleInputEmail1'>File DROP Here</label>
															<div class='fileDrop'>
															<img src="${RecipeDetailVO.PHOTO}"/>
															</div>
													</div>
												</div>	
											</c:forEach>
										</div>
								</div>
						</div>
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
    						
	txtNewInputBox.innerHTML =  "<div class='form-group'>"
									+ "<textarea name='RECIPEDETAIL'></textarea>"
									+ "<input type='hidden' name ='PHOTO'>"
									+ "<input type='button' class='removeDetail' value='삭제'>"
									+ "<br>"
									+ "<label for='exampleInputEmail1'>File DROP Here</label>"
									+ "<div class='fileDrop'></div>"
								+"</div>"
								+"<div class='mailbox-attachments clearfix uploadedList'></div>"



 // Finally put it where it is supposed to appear.
	document.getElementById("newElementId").appendChild(txtNewInputBox);
    
    //추가해보는거
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();

	});


	
	 $(".fileDrop").on("drop", function(event){
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];

		var formData = new FormData();
		
		formData.append("file", file);	
		
		var $this = $(this);
		$.ajax({
			  url: '/upload/uploadAjax',
			  data: formData,
			  dataType:'text',
			  processData: false,
			  contentType: false,
			  type: 'POST',
			  success: function(data){
				
				  var fileInfo = getFileInfo(data);
	
				  var html = template(fileInfo);

				 /* $($($this).parent().children("div[class='fileDrop']"))
				  	.html('<img src="' + fileInfo.imgsrc + '" height="120px" width="160px">');
				  */
				  $($($this).parent().children("div[class='fileDrop']"))
				  	.html('<img src="' + fileInfo.getLink + '" height="120px" width="160px">'
				  	+ '<button style="position: absolute;bottom: -50;float:right;" class="delBtn ">사진삭제</button>'				
				  	);
				  
				  $($($this).parent().children("input[type='hidden']")).attr("value", fileInfo.getLink);
				  $(".delBtn").on("click", function() {
						$(this).parent().children().remove();
						
						});
			  }
			});	 
	});
	 
	 
	 
	 $(".uploadedList").on("click", "delbtn", function(event){
			
		 var that = $(this);
	
	   $.ajax({
		   url:"/deleteFile",
		   type:"post",
		   data: {fileName:$(this).attr("href")},
		   dataType:"text",
		   success:function(result){
			   if(result == 'deleted'){
				   that.parent("div").parent().remove();
			   }
		   }
	   });
});
	 $(".removeDetail").on("click", function(event){
		    event.preventDefault();
		    $(this).parent().parent().remove();
		});	 

}
$(".removeDetailForm").on("click", function(event){
    event.preventDefault();
    $(this).parent().parent().remove();
});




</script>


<!-- 도구 스크립트  -->

<script>
function createNewUtensil() {
    // First create a DIV element.
	var NewInputBox = document.createElement('div');

    // Then add the content (a new input box) of the element.
	NewInputBox.innerHTML = " 요리도구 <input type='text' name='utensilName'><input type='button' value='삭제'onclick='remove(this)'>";

    // Finally put it where it is supposed to appear.
	document.getElementById("newUtensilId").appendChild(NewInputBox);
}
function remove(createNewUtensil){
	document.getElementById("newUtensilId").removeChild(createNewUtensil.parentNode);
}
</script>		
<!-- 도구 끝 -->

<!-- 재료 시작-->
<script>
function createNewIngredient() {
	var NewInputBox = document.createElement('div');

	NewInputBox.innerHTML = " 재료이름 <input type='text' name='ingredientName'></br> 양 <input type='text' name='amount'><br/> 필수여부" 
		+"<select name='required'>"
  		 + "<option value='Y'>필수</option>"
 		 + "<option value='N'>대체가능</option>"
		+"</select>"
+	"<input type='button' value='삭제'onclick='removeIngredient(this)'>";
	
	document.getElementById("newIngredientId").appendChild(NewInputBox);
}

function removeIngredient(createNewIngredient){
	document.getElementById("newIngredientId").removeChild(createNewIngredient.parentNode);
}

</script>


	

<script>
	<!--작성 눌렀을때 인덱스 -->

	$("#submitButton").on("click", function(event){
		event.preventDefault();
		//alert();
		
		if($("#newElementId").children().length == 0 ) {
			alert("세부 조리방법을 추가하세요");
			return;
		}
		if($("#newUtensilId").children().length == 0 ) {
			alert("도구를 추가하세요");
			return;
		}
		if($("#newIngredientId").children().length == 0 ) {
			alert("재료를 추가하세요");
			return;
		}
		$("#newElementId").children("div").each(function(index, item) {
			$(item).children(":eq(0)").children("textarea[name='RECIPEDETAIL']").attr("name", "recipeDetail[" + index + "].RECIPEDETAIL");

			$(item).children(":eq(0)").children("input[name='PHOTO']").attr("name", "recipeDetail[" + index + "].PHOTO")
		});
		
		/* 
		$('#newElementId').children(":eq(0)").children().each(function(index, item)	{
			
	          $($($(this)).parent().children("input[type='text']")).attr("name", "recipeDetail[" + index + "].RECIPEDETAIL");
	         $($($(this)).parent().children("input[type='hidden']")).attr("name", "recipeDetail[" + index + "].PHOTO");
			
			$(this).children().children(":eq(0)").attr("name", "recipeDetail[" + index + "].RECIPEDETAIL" );
			$(this).children().children(":eq(1)").attr("name", "recipeDetail[" + index + "].PHOTO" );
			
		}) */
		$('#newUtensilId').children().each(function(index, item)	{
			$(this).children(":first").attr("name", "utensil[" + index + "].utensilName" );
			})
		$('#newIngredientId').children().each(function(index, item)	{
			
			$(this).children("input[name='ingredientName']").attr("name", "ingredient[" + index + "].ingredientName" );
			$(this).children("input[name='amount']").attr("name", "ingredient[" + index + "].amount" );
			$(this).children("select[name='required']").attr("name", "ingredient[" + index + "].required" );
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
      var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2)
      img.style.cssText = 'width: auto; height: 100%; margin-left: '
                      + marginLeft + 'px;'
    } else {
      // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
      img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
    }
  }
  
  
  
  
  
  
  
  
  
  
  $(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();

	});


	
	 $(".fileDrop").on("drop", function(event){
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];

		var formData = new FormData();
		
		formData.append("file", file);	
		
		var $this = $(this);
		$.ajax({
			  url: '/upload/uploadAjax',
			  data: formData,
			  dataType:'text',
			  processData: false,
			  contentType: false,
			  type: 'POST',
			  success: function(data){
				
				  var fileInfo = getFileInfo(data);
	
				  var html = template(fileInfo);

				 /* $($($this).parent().children("div[class='fileDrop']"))
				  	.html('<img src="' + fileInfo.imgsrc + '" height="120px" width="160px">');
				  */
				  $($($this).parent().children("div[class='fileDrop']"))
				  	.html('<img src="' + fileInfo.imgsrc + '" height="120px" width="160px">'
				  	+ '<button style="position: absolute;bottom: -50;float:right;" class="delBtn ">사진삭제</button>'				
				  	);
				  
				  $($($this).parent().children("input[type='hidden']")).attr("value", fileInfo.imgsrc);
				  $(".delBtn").on("click", function() {
						$(this).parent().children().remove();
						
						});
			  }
			});	 
	});
  
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

<%@include file="../include/footer.jsp"%>

</body>
</html>