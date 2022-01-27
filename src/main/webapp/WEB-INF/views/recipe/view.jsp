<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../include/header.jsp"%>

<!DOCTYPE html>
<!-- saved from url=(0057)recipe-full-width.html -->
<html dir="ltr" lang="en-US">
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<link href="/resources/css/recipeView.css" rel="stylesheet"
	type="text/css" media="all">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">




	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	

    <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
<style>

	
.fa.active {
	color: orange;
}
.fa {
	color: black;
}

body{
	font-family: 'Gowun Dodum', sans-serif;
}
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

						
			<section>
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
					<img src="${show}" class="main-Img"/>
					<div ><!-- class="row mt-0 mt-md-5" -->
						<div class="col-md-12" id="first-div">
						<span>${view.RECIPENAME}</span><br>
						
						
						
					

					
						
						
						
						
						<span>요리정보</span><br>
							<ul class="list-unstyled component-list tstbite-svg">
							<li><small>종류</small>  <span>${view.foodName}</span></li>
								<li><small>조리시간</small>  <span>${view.COOKINGTIME}</span></li>
								<li><small>수준</small> <span>${view.RANK} </span></li>
								<li><small>양</small> <span>${view.PORTION} </span></li>
								<li>
								
								<div class="fabrx-ratings has-rating rating" style="font-size: 1rem;text-align:left;">
													<!-- 별점 평균 -->
													
													<script>
													var avg= ${avg};
													var ratingStr= "<div>";
													for(var i = 0; i < avg; i++)	{
														ratingStr += "<i class='fa fa-star fa-sm active'></i>";
													}
													for(var i = 0; i < 5 - avg; i++)	{
														ratingStr += "<i class='fa fa-star fa-sm'></i>";
													}
													ratingStr += "</div>";
													
													
													$("div.fabrx-ratings").append($(ratingStr));
													</script>
												</div>								
								
								
								</li>
							</ul>
						</div>
								</div>
							
							</div>
							<div class="row mt-4 g-0">
								<div class="col-lg-8">
									<div class="rounded-12 bg-lightest-gray p-4">
										<span> 도 구 </span>
										<div id="view">
												<ul class="Nutrition-list list-unstyled">
											<c:forEach items="${getUtensilList}" var="UtensilVO">
												<li><input type="checkbox" id="dropsblue" name="dropsblue"
											class="form-check-input">${UtensilVO.utensilName }</li>
											</c:forEach>
												</ul>
										</div>
										<span> 재 료 </span>
										<div id="view">
											<c:forEach items="${getIngredientList}" var="IngredientVO">
												<ul class="Nutrition-list list-unstyled">
												<li>
												<strong><input type="checkbox" id="dropsblue" name="dropsblue"class="form-check-input"> 
												이름 </strong>: ${IngredientVO.ingredientName}
												</li>
												<li><strong>&nbsp;&nbsp;&nbsp; 양 </strong>: ${IngredientVO.amount}</li>
												<li><strong>&nbsp;&nbsp;&nbsp; 필수여부 </strong>: ${IngredientVO.required}</li>
												<li><span class="serv-span"> 종류 : ${IngredientVO.ingredientType}</span></li>
												<li><span class="serv-span"> 유통기한 : ${IngredientVO.bestBefore}</span> </li>
												<li><span class="serv-span"> 효능 : ${IngredientVO.efficacy}</span></li>
												<li><span class="serv-span"> 가격 : ${IngredientVO.price}</span></li>
												
												</ul>
												<br>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="container">
							<div class="mt-6">
								<span>조리 방법</span>
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
						<h6>Comment</h6>
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
									<button type="button" id="valuationModBtn">수정</button>
									<button type="button" id="valuationDelBtn">삭제</button>
									<button type="button" id='closeBtn'>닫기</button>
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
						
						<!-- 나중에 로그인한 아이디로 바꾸기 -->
								 <br>
						<div class="nameInput">
							작성자: <input type='text' name='memberid' id='newMemberId' value='${login.memberId}'>
						</div>
					</div>

	

       <div id="rating" class="rating">  
        <i class = "rating__star fa fa-star active" aria-hidden = "true" id = "st1"></i>  
       <i class = "rating__star fa fa-star active" aria-hidden = "true" id = "st2"></i>  
       <i class = "rating__star fa fa-star active" aria-hidden = "true" id = "st3"></i>  
       <i class = "rating__star fa fa-star active" aria-hidden = "true" id = "st4"></i>  
       <i class = "rating__star fa fa-star" aria-hidden = "true" id = "st5"></i>  
       </div>  

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
								var IdLoggedIn = '${login.memberId}';
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
															+ ratingStr + "<span>"+this.comments+"</span>";
													if(this.memberid == IdLoggedIn)
														str += "<button>수정</button></li>";
													else
														str += "</li>";
												
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
			console.log(point)

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
			var comments = valuation.children("span").text();
			//alert(comments)
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
													
													
													var IdLoggedIn = "${login.memberId}";
													
													
													str += "<li data-recipeno='" + this.recipeno + "' data-memberid='" + this.memberid + "' class='valuationLi'>" 
															 + "<strong>"+this.memberid + "</strong>"
															 + ratingStr
															+ "<span>"+this.comments 
															+ "</span>";
															
													if(this.memberid == IdLoggedIn)
														str += "<button id='valuationModBtn'>수정</button></li>";
													else
														str += "</li>";
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