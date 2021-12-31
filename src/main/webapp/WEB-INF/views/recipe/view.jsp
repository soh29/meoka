<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../include/header.jsp"%>

<!DOCTYPE html>
<!-- saved from url=(0057)recipe-full-width.html -->
<html dir="ltr" lang="en-US">
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Tastebite - Recipe</title>
	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	

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
								<li><small>수준</small> <span>${view.RANK} </span></li>
								<li><small>양</small> <span>${view.PORTION} </span></li>
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
							<c:if test="${login.memberId==view.MEMBERID}">
								<div class="container">
									<a href="/recipe/modify?RECIPENO=${view.RECIPENO}" class="btn btn-primary px-5">레시피 수정</a>
									<a href="/recipe/delete?RECIPENO=${view.RECIPENO}"class="btn btn-primary px-5">레시피 삭제</a>
								</div>
							</c:if>
				</section>
				
				
				
								<!-- 후기시작 -->
				
				
				<div class="my-5 pt-0 pt-md-3 container">

				
					<div class="border-bottom mb-4 pb-3">
						<h2 class="d-inline-block">후기</h2>
					</div>
					
				<!-- 후기 수정 누렀을 때 -->
<div id='modDiv' style="display: none;">
					 	<c:set var="Id" value="$(#curMemberid)" />
					 	<c:choose>
					 	<c:when test="${Id eq login.memberId}">
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
							</c:when>
							<c:when test="${Id ne login.memberId}">
								<p style="font-size:20px;color:red;">본인이 작성한글이 아닙니다.</p>
								<button type="button" id='closeBtn'>Close</button>
							</c:when>
							</c:choose>

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
						작성자: <input type='text' name='memberid' id='newMemberId' value='${login.memberId}'>

	

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

				
				
				
				
				
		
	<%@include file="../include/footer.jsp"%>
	



</body>
</html>