<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../include/header.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<title>Home</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">




<style>
body{
	font-family: 'Gowun Dodum', sans-serif;
}
h6{
	font-family: 'Gowun Dodum', sans-serif;
}
.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
  
}
</style>


</head>
<body>



	<section class="tstbite-section p-0" style="margin-top:5%;">

	


			<div class="tstbite-search">
				<div class="container">
					<div class="input-group search-box">
						<input type="text" name="Search" placeholder="Search"
							class="form-control" id="Search">
						<button type="button">
							<img src="/resources/img/close.svg" alt="img">
						</button>
					</div>
					<div class="search-results" id="SearchList">
						<div class="tstbite-search-list">
							<a href="#0">
								<figure>
									<img src="/resources/img/menu111.png" class="rounded-circle"
										alt="Menu">
								</figure>
								<div class="tstbite-search-name">
									<strong class="small">Cake</strong> <span class="tiny">Category</span>
								</div>
							</a>
						</div>
						<div class="tstbite-search-list">
							<a href="#0">
								<figure>
									<img src="/resources/img/menu112.jpg" class="rounded-2"
										alt="Menu">
								</figure>
								<div class="tstbite-search-name">
									<strong class="small">Black Forest Birthday Cake</strong>
								</div>
							</a>
						</div>
						<div class="tstbite-search-list">
							<a href="#0">
								<figure>
									<img src="/resources/img/menu113.jpg" class="rounded-2"
										alt="Menu">
								</figure>
								<div class="tstbite-search-name">
									<strong class="small">Double Thick Layered Sponge Cake</strong>
								</div>
							</a>
						</div>
						<div class="tstbite-search-list">
							<a href="#0">
								<figure>
									<img src="/resources/img/menu114.jpg" class="rounded-2"
										alt="Menu">
								</figure>
								<div class="tstbite-search-name">
									<strong class="small">Cranberry Macaroon Ice cream
										Cake</strong>
								</div>
							</a>
						</div>
						<div class="tstbite-search-list">
							<a href="#0">
								<figure>
									<img src="/resources/img/menu115.jpg" class="rounded-2"
										alt="Menu">
								</figure>
								<div class="tstbite-search-name">
									<strong class="small">Almond Cinnamon Sponge Cake</strong>
								</div>
							</a>
						</div>
						<div class="tstbite-search-list">
							<a href="#0">
								<figure>
									<img src="/resources/img/menu116.jpg" class="rounded-2"
										alt="Menu">
								</figure>
								<div class="tstbite-search-name">
									<strong class="small">Four Mini Birthday Cupcakes</strong>
								</div>
							</a>
						</div>
						<div class="text-center py-4">
							<a href="#0" class="btn btn-sm btn-outline-dark px-4 py-2">See
								all 343 results</a>
						</div>
					</div>
				</div>
			</div>









<form id="registerForm" role="form" method="post">
	<h6>제목</h6>
	<input class="form-control bg-lightest-gray" type="text" name="title"><br>
	<h6>작성자</h6>
	<input class="form-control bg-lightest-gray"  type="text" name="writer" readonly value="${login.memberId }"><br>
	<h6>내용</h6>
	<textarea class="form-control bg-lightest-gray"  name="content" style="height:500px; resize: none;"></textarea>
	<div class="form-group" style="margin-top:2%;">
		<label for="fileDrop">File DROP Here</label>
		<div class="fileDrop"></div>
	</div>


	<!-- /.box-body -->

	<div class="box-footer" style="margin-top:5%; text-align: center;">
		<div>
			<hr>
		</div>

		<ul class="mailbox-attachments clearfix uploadedList">
		</ul>

		<button type="submit" class="btn btn-primary" style="width: 100px;">작성</button>&nbsp;&nbsp;
		<button class="btn btn-primary" type="button"  style="width: 100px;"onclick="location.href='list'">글 목록</button>

	</div>
</form>






<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>




<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn">X</a>
	</span>
  </div>
</li>                
</script>    

<script>

var template = Handlebars.compile($("#template").html());

$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});


$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];

	var formData = new FormData();
	
	formData.append("file", file);	
	
	
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
			  
			  $(".uploadedList").append(html);
		  }
		});	
});


$("#registerForm").submit(function(event){
	event.preventDefault();
	
	var that = $(this);
	
	var str ="";
	$(".uploadedList .delbtn").each(function(index){
		 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
	});
	
	that.append(str);

	that.get(0).submit();
});

$(".uploadedList").on("click", ".delbtn", function(event){
	
	event.preventDefault();
	
	var that = $(this);
	 
	$.ajax({
	   url:"/upload/deleteFile",
	   type:"post",
	   data: {fileName:$(this).attr("href")},
	   dataType:"text",
	   success:function(result){
		   if(result == 'deleted'){
			   that.closest("li").remove();
		   }
	   }
   });
});

$("button[type='submit']").on("click", function(event) {
	event.preventDefault();
	//alert();
	var form = $("form[role='form']");
	if(form.children("input[name='title']").val()==="")	{
		alert("제목을 입력하세요.");
		return;
	}
	if(form.children("textarea[name='content']").val()==="")	{
		alert("내용을 입력하세요.");
		return;
	}
	form.submit();
});
</script>








		<%@include file="../include/footer.jsp"%>
	</section>

	<script src="/resources/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
	<script src="/resources/js/html5.min.js" type="text/javascript"></script>
	<script src="/resources/js/sticky.min.js" type="text/javascript"></script>
	<script src="/resources/js/swiper-bundle.min.js"
		type="text/javascript"></script>
	<script src="/resources/js/masonry.min.js" type="text/javascript"></script>
	<script src="/resources/js/tastebite-scripts.js"
		type="text/javascript"></script>
	<script defer="" src="/resources/js/beacon.min.js"
		data-cf-beacon="{&quot;rayId&quot;:&quot;6a50d4b4c883204a&quot;,&quot;version&quot;:&quot;2021.10.0&quot;,&quot;r&quot;:1,&quot;token&quot;:&quot;9ae02b4a12234f118cf01e6f25c04e9d&quot;,&quot;si&quot;:100}"></script>

	<!-- lab begin -->
	<c:if test="${not empty login}">
		<div class="modal fade" id="moaModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Information</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
					</div>
					<div class="modal-body">
						<input class="form-control" type="text" id="memberId"
							name="memberId" value="${login.memberId}" readonly="readonly" />
					</div>
					<form action=/user/modify method="get">
						<div class="modal-footer">
							<button class="btn btn-primary" type="submit">회원정보수정</button>
							<!-- lab end -->



								<a href="/user/logout" class="btn btn-primary">로그아웃</a>



						</div>
					</form>
				</div>
			</div>
		</div>
	</c:if>

	<c:if test="${empty login}">
		<!-- lab begin -->
		<div class="modal fade" id="moaModal" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content rounded-4 shadow-17 mb-4 mb-md-5">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"> <svg id="feather-icon_search"
								data-name="feather-icon/search"
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24">
<rect id="Bounding_Box" data-name="Bounding Box" width="24" height="24"
									fill="#d8d8d8" opacity="0"></rect>
<path id="Shape"
									d="M14.435,15.849,8.071,9.485,1.707,15.849A1,1,0,0,1,.293,14.435L6.657,8.071.293,1.707A1,1,0,0,1,1.707.293L8.071,6.657,14.435.293a1,1,0,0,1,1.414,1.415L9.485,8.071l6.364,6.364a1,1,0,1,1-1.414,1.414Z"
									transform="translate(3.929 3.929)"></path>
</svg>
						</span>
					</button>
					<div class="modal-body">
						<h6 class="text-uppercase mb-4 pb-2">Login</h6>
						<form action="/user/loginPost" method="post">
							<div class="form-group mt-md-3 pb-md-3">
								<div class="form-control-box">
									<input type="text" class="form-control" placeholder="Email"
										name="memberId"> <span class="form-icon"> <svg
											id="Icon" xmlns="http://www.w3.org/2000/svg" width="24"
											height="24" viewBox="0 0 24 24">
<rect data-name="Bounding Box" width="24" height="24"
												fill="rgba(255,255,255,0)"></rect>
<path
												d="M3,18a3,3,0,0,1-3-3V3.01C0,3,0,2.99,0,2.98A3,3,0,0,1,3,0H19a3,3,0,0,1,3,2.968c0,.018,0,.036,0,.054V15a3,3,0,0,1-3,3ZM2,15a1,1,0,0,0,1,1H19a1,1,0,0,0,1-1V4.921l-8.427,5.9a1,1,0,0,1-1.147,0L2,4.921ZM11,8.78l8.895-6.226A1,1,0,0,0,19,2H3a1,1,0,0,0-.895.553Z"
												transform="translate(1 3)" fill="#7f7f7f"></path>
</svg>
									</span>
								</div>
							</div>

							<div class="form-group mt-md-3 pb-md-3">
								<div class="form-control-box">
									<input type="password" class="form-control"
										placeholder="Password" name="password"> <span
										class="form-icon"> <svg
											xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24">
<rect data-name="Bounding Box" width="24" height="24"
												fill="rgba(255,255,255,0)"></rect>
<path
												d="M3,22a3,3,0,0,1-3-3V12A3,3,0,0,1,3,9H4V6A6,6,0,0,1,16,6V9h1a3,3,0,0,1,3,3v7a3,3,0,0,1-3,3ZM2,12v7a1,1,0,0,0,1,1H17a1,1,0,0,0,1-1V12a1,1,0,0,0-1-1H3A1,1,0,0,0,2,12ZM14,9V6A4,4,0,1,0,6,6V9Z"
												transform="translate(2 1)" fill="#7f7f7f"></path>
</svg>
									</span>
									<div class="text-right">
										<a href="home-v3.html#0"
											class="text-orange small font-weight-medium">Forgot
											Password?</a>
									</div>
								</div>
							</div>
							<button type="submit" class="btn btn-lg btn-block btn-primary">Login</button>
						</form>


						<p class="text-center font-weight-light mt-4 pt-2">Or login
							with</p>
						<ul class="login-social list-unstyled">
							<li><a href="javascript:void(0);" class="facebook"> <img
									src="/resources/img/facebook2.svg" alt="Icon"> <span>Facebook</span>
							</a></li>
							<li><a href="javascript:void(0);" class="google"> <img
									src="/resources/img/google2.svg" alt="Icon"> <span>Google</span>
							</a></li>
						</ul>
						<div class="text-center login-footer">
							<p>
								Don’t have an account? <a href="user/join">Sign up</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- lab end -->


		<!--  
		<div class="modal fade" id="moaModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">로그인하세요.</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
					</div>
				</div>
			</div>
		</div>
		-->

	</c:if>

	<!-- lab end -->





</body>
</html>
