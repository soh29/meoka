
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<!-- saved from url=(0044)blog.html -->
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="description" content="Tastebite">
<meta name="keywords" content="Tastebite">
<meta name="author" content="Tastebite">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Tastebite - Blog</title>
<link href="assets/images/favicon.ico" rel="shortcut icon"
	type="image/x-icon">

    
<link href="../resources/css/tastebite-styles.css" rel="stylesheet"
	type="text/css" media="all">
	
	
	
	
</head>
<body>

	<section class="tstbite-section p-0">
		<div class="container">

			<header class="tstbite-header bg-white">
				<nav class="navbar navbar-expand-lg has-header-inner px-0">
					<a class="navbar-brand" href="index.html"> <img
						src="../resources/img/brand4.svg" style="max-width: 161px"
						alt="Tastebite">
					</a>
					<div
						class="tstbite-header-links d-flex align-items-center ml-auto order-0 order-lg-2">
						<a href="javascript:void(0);" class="search-link"> <svg
								xmlns="http://www.w3.org/2000/svg" width="26.667"
								height="26.667" viewBox="0 0 26.667 26.667">
<path
									d="M24.39,26.276l-4.9-4.9a12.012,12.012,0,1,1,1.885-1.885l4.9,4.9a1.334,1.334,0,0,1-1.886,1.886ZM2.666,12a9.329,9.329,0,0,0,15.827,6.7,1.338,1.338,0,0,1,.206-.206A9.332,9.332,0,1,0,2.666,12Z"></path>
</svg>
						</a> <a href="blog.html" class="ml-4 ml-md-4 mr-2 mr-md-0 circle"><img
							src="../resources/img/avatar1.png" alt="Avatar"></a>
					</div>
					<button class="navbar-toggler pr-0 ml-2 ml-md-3" type="button"
						data-toggle="collapse" data-target="#menu-4"
						aria-controls="menu-4" aria-expanded="false"
						aria-label="Toggle navigation">
						<svg data-name="Icon/Hamburger" xmlns="http://www.w3.org/2000/svg"
							width="24" height="24" viewBox="0 0 24 24">
<path data-name="Icon Color"
								d="M1.033,14a1.2,1.2,0,0,1-.409-.069.947.947,0,0,1-.337-.207,1.2,1.2,0,0,1-.216-.333,1.046,1.046,0,0,1-.072-.4A1.072,1.072,0,0,1,.072,12.6a.892.892,0,0,1,.216-.321.947.947,0,0,1,.337-.207A1.2,1.2,0,0,1,1.033,12H22.967a1.206,1.206,0,0,1,.409.069.935.935,0,0,1,.336.207.9.9,0,0,1,.217.321,1.072,1.072,0,0,1,.072.391,1.046,1.046,0,0,1-.072.4,1.206,1.206,0,0,1-.217.333.935.935,0,0,1-.336.207,1.206,1.206,0,0,1-.409.069Zm0-6a1.2,1.2,0,0,1-.409-.069.934.934,0,0,1-.337-.207,1.189,1.189,0,0,1-.216-.333A1.046,1.046,0,0,1,0,6.989,1.068,1.068,0,0,1,.072,6.6a.9.9,0,0,1,.216-.322.947.947,0,0,1,.337-.207A1.2,1.2,0,0,1,1.033,6H22.967a1.206,1.206,0,0,1,.409.068.935.935,0,0,1,.336.207.9.9,0,0,1,.217.322A1.068,1.068,0,0,1,24,6.989a1.046,1.046,0,0,1-.072.4,1.193,1.193,0,0,1-.217.333.923.923,0,0,1-.336.207A1.206,1.206,0,0,1,22.967,8Zm0-6a1.2,1.2,0,0,1-.409-.068.947.947,0,0,1-.337-.207,1.193,1.193,0,0,1-.216-.334A1.039,1.039,0,0,1,0,.988,1.068,1.068,0,0,1,.072.6.892.892,0,0,1,.288.276.934.934,0,0,1,.625.069,1.2,1.2,0,0,1,1.033,0H22.967a1.206,1.206,0,0,1,.409.069.923.923,0,0,1,.336.207A.9.9,0,0,1,23.928.6,1.068,1.068,0,0,1,24,.988a1.039,1.039,0,0,1-.072.4,1.2,1.2,0,0,1-.217.334.935.935,0,0,1-.336.207A1.206,1.206,0,0,1,22.967,2Z"
								transform="translate(0 5)" fill="#000"></path>
</svg>
					</button>
					<div class="collapse navbar-collapse" id="menu-4">
						<ul class="navbar-nav m-auto pt-3 pt-lg-0">
							<li class="nav-item dropdown"><a class="nav-link"
								href="blog.html" role="button" id="HomePage"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <span>Home Page</span> <svg
										xmlns="http://www.w3.org/2000/svg" width="9.333"
										height="5.333" viewBox="0 0 9.333 5.333">
<path
											d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</a>
								<div class="dropdown-menu" aria-labelledby="HomePage">
									<a class="dropdown-item" href="index.html">Home V1</a> <a
										class="dropdown-item" href="home-v2.html">Home V2</a> <a
										class="dropdown-item" href="home-v3.html">Home V3</a>
								</div></li>
							<li class="nav-item dropdown"><a class="nav-link"
								href="blog.html" role="button" id="RecipePage"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <span>Recipe Page</span> <svg
										xmlns="http://www.w3.org/2000/svg" width="9.333"
										height="5.333" viewBox="0 0 9.333 5.333">
<path
											d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</a>
								<div class="dropdown-menu" aria-labelledby="RecipePage">
									<a class="dropdown-item" href="recipe-full-width.html">Full
										Width</a> <a class="dropdown-item" href="recipe-sidebar.html">Sidebar</a>
								</div></li>
							<li class="nav-item dropdown"><a class="nav-link"
								href="blog.html" role="button" id="Pages" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <span>Pages</span>
									<svg xmlns="http://www.w3.org/2000/svg" width="9.333"
										height="5.333" viewBox="0 0 9.333 5.333">
<path
											d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</a>
								<div class="dropdown-menu" aria-labelledby="Pages">
									<a class="dropdown-item" href="category.html">Category</a> <a
										class="dropdown-item" href="archive.html">Archive</a> <a
										class="dropdown-item" href="favorites.html">Favorites</a> <a
										class="dropdown-item" href="profile.html">Profile</a> <a
										class="dropdown-item" href="about.html">About</a> <a
										class="dropdown-item" href="blog.html">Blog Page</a> <a
										class="dropdown-item" href="search-result.html">Search
										Results</a>
								</div></li>
							<li class="nav-item"><a class="nav-link"
								href="elements.html">Elements</a></li>
							<li class="nav-item"><a class="nav-link"
								href="https://fabrx.co/tastebite-food-recipes-website-template/"
								target="_blank">Buy</a></li>
						</ul>
					</div>
				</nav>
			</header>
		</div>

		<div class="tstbite-search">
			<div class="container">
				<div class="input-group search-box">
					<input type="text" name="Search" placeholder="Search"
						class="form-control" id="Search">
					<button type="button">
						<img src="../resources/img/close.svg" alt="img">
					</button>
				</div>
				<div class="search-results" id="SearchList">
					<div class="tstbite-search-list">
						<a href="blog.html">
							<figure>
								<img src="../resources/img/menu111.png" class="rounded-circle"
									alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Cake</strong> <span class="tiny">Category</span>
							</div>
						</a>
					</div>
					<div class="tstbite-search-list">
						<a href="blog.html">
							<figure>
								<img src="../resources/img/menu112.jpg" class="rounded-2"
									alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Black Forest Birthday Cake</strong>
							</div>
						</a>
					</div>
					<div class="tstbite-search-list">
						<a href="blog.html">
							<figure>
								<img src="../resources/img/menu113.jpg" class="rounded-2"
									alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Double Thick Layered Sponge Cake</strong>
							</div>
						</a>
					</div>
					<div class="tstbite-search-list">
						<a href="blog.html">
							<figure>
								<img src="../resources/img/menu114.jpg" class="rounded-2"
									alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Cranberry Macaroon Ice cream Cake</strong>
							</div>
						</a>
					</div>
					<div class="tstbite-search-list">
						<a href="blog.html">
							<figure>
								<img src="../resources/img/menu115.jpg" class="rounded-2"
									alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Almond Cinnamon Sponge Cake</strong>
							</div>
						</a>
					</div>
					<div class="tstbite-search-list">
						<a href="blog.html">
							<figure>
								<img src="../resources/img/menu116.jpg" class="rounded-2"
									alt="Menu">
							</figure>
							<div class="tstbite-search-name">
								<strong class="small">Four Mini Birthday Cupcakes</strong>
							</div>
						</a>
					</div>
					<div class="text-center py-4">
						<a href="blog.html" class="btn btn-sm btn-outline-dark px-4 py-2">See
							all 343 results</a>
					</div>
				</div>
			</div>
		</div>
		<div class="container">

			<section class="tstbite-components my-4 my-md-5">

				<!-- 게시판 -->
				<section class="content">



					<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
					<script
						src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
					<script type="text/javascript" src="/resources/js/upload.js"></script>

					<!-- Main content -->
					<style type="text/css">
.popup {
	position: absolute;
}

.back {
	background-color: gray;
	opacity: 0.5;
	width: 100%;
	height: 300%;
	overflow: hidden;
	z-index: 1101;
}

.front {
	z-index: 1110;
	opacity: 1;
	boarder: 1px;
	margin: auto;
}

.show {
	position: relative;
	max-width: 1200px;
	max-height: 800px;
	overflow: auto;
}
</style>

					<div class='popup back' style="display: none;"></div>
					<div id="popup_front" class='popup front' style="display: none;">
						<img id="popup_img">
					</div>

					<section class="content">
						<div class="row">
							<!-- left column -->
							<div class="col-md-12">
								<!-- general form elements -->
								<div class="box box-primary">
									<div class="box-header">
										<h3 class="box-title">READ BOARD</h3>
									</div>
									<!-- /.box-header -->

									<form role="form" action="modifyPage" method="post">

										<input type='hidden' name='bno' value="${QAVO.bno}"> <input
											type='hidden' name='page' value="${cri.page}"> <input
											type='hidden' name='perPageNum' value="${cri.perPageNum}">
										<input type='hidden' name='searchType'
											value="${cri.searchType}"> <input type='hidden'
											name='keyword' value="${cri.keyword}">

									</form>

									<div class="box-body">
										<div class="form-group">
											<label for="exampleInputEmail1">Title</label> <input
												type="text" name='title' class="form-control"
												value="${QAVO.title}" readonly="readonly">
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1">Content</label>
											<textarea class="form-control" name="content" rows="3"
												readonly="readonly">${QAVO.content}</textarea>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Writer</label> <input
												type="text" name="writer" class="form-control"
												value="${QAVO.memberid}" readonly="readonly">
										</div>
									</div>
									<!-- /.box-body -->

									<div class="box-footer">

										<div>
											<hr>
										</div>

										<ul class="mailbox-attachments clearfix uploadedList">
										</ul>
										<c:if test="${login.uid == QAVO.memberid}">
											<button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
											<button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
										</c:if>
										<button type="submit" class="btn btn-primary" id="goListBtn">GO
											LIST</button>
									</div>

								</div>
								<!-- /.box -->
							</div>
							<!--/.col (left) -->

						</div>
						<!-- /.row -->



						<div class="row">
							<div class="col-md-12">


								<div class="box box-success">
									<div class="box-header">
										<h3 class="box-title">Write a comment</h3>
									</div>
									
									<c:if test="${empty login}">
										<div class="write-comment">
											<div class="d-sm-flex align-items-center flex-wrap">
	
												<p class="mb-0 ml-auto">
													<a href="blog.html" class="text-primary">Login</a> to post a
													comment
												</p>
											</div>
										</div>
									</c:if>							
									
									<c:if test="${not empty login}">			
										<div class="write-comment"><input
													class="form-control" type="text" placeholder="USER ID"
													id="newReplyWriter" value="${login.uid }"
													readonly="readonly">
											<form class="bg-lightest-gray rounded-6 mt-3 d-flex flex-wrap p-4">
												
												<textarea class="form-control" placeholder="Comment text" id="newReplyText"></textarea>
												<div class="mt-auto ml-auto">
													<button id="replyAddBtn" type="button" class="btn btn-primary px-5">Post
														comment</button>
												</div>
											</form>
										</div>
									</c:if>

								</div>

							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->





					</section>
					<!-- /.content -->






<!-- Modal -->
			<div id="modifyModal" class="modal modal-primary fade"
							role="dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title"></h4>
									</div>
									<div class="modal-body" data-rno>
										<p>
											<input type="text" id="replytext" class="form-control">
										</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
										<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>	
						
						
						
						
						
						
					<div class="my-5 pt-3">

						
				
						
						
						
						
						
						
						
						<ul id="timeline" class="timeline tstbite-comments list-unstyled mb-0">
							<li id="repliesDiv">
								<div class="border-bottom mb-4 pb-3">
									<h2 class="d-inline-block">Comments</h2>
									<span class="f-size-24">(<span id='replycntSmall' class="f-size-15">${QAVO.replycnt}</span>)</span>
								</div>
							</li>
							

						</ul>
						<a href="blog.html"
							class="btn btn-outline-dark btn-block py-1 py-md-3">Load 25
							more comments</a>

						
					</div>



								<div class='text-center'>
									<ul id="pagination" class="pagination pagination-sm no-margin ">

									</ul>
								</div>
						
					<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>                
</script>



					<script id="template" type="text/x-handlebars-template">
				{{#each .}}


							<li class="comment-item">
								<div class="media">
									<a href="blog.html"
										class="tstbite-avatar align-self-start mr-3"><img
										src="../resources/img/avatar7.png" alt="Avatar"></a>
									<div class="media-body">
										<div class="timeline-header pt-1 pb-3">
											<h6 class="big inter-font font-weight-semibold">{{memberid}}</h6>
											<div class="text-gray-300">{{prettifyDate regdate}}</div>
										</div>
										<p class="timeline-body">{{replytext}}</p>

								{{#eqMemberid memberid }}
                  <a class="btn btn-primary btn-xs" 
									data-toggle="modal" data-target="#modifyModal">Modify</a>
								{{/eqMemberid}}

									</div>
								</div>
							</li>







        {{/each}}
</script>

					<script>
						Handlebars.registerHelper("eqMemberid", function(
								memberid, block) {
							var accum = '';
							if (memberid == '${login.uid}') {
								accum += block.fn();
							}
							return accum;
						});

						Handlebars.registerHelper("prettifyDate", function(
								timeValue) {
							var dateObj = new Date(timeValue);
							var year = dateObj.getFullYear();
							var month = dateObj.getMonth() + 1;
							var date = dateObj.getDate();
							return year + "/" + month + "/" + date;
						});

						var printData = function(replyArr, target,
								templateObject) {

							var template = Handlebars.compile(templateObject
									.html());

							var html = template(replyArr);
							$(".replyLi").remove();
							target.after(html);

						}

						var bno = ${QAVO.bno};

						var replyPage = 1;

						function getPage(pageInfo) {

							$
									.getJSON(
											pageInfo,
											function(data) {
												printData(data.list,
														$("#repliesDiv"),
														$('#template'));
												printPaging(data.pageMaker,
														$(".pagination"));

												$("#modifyModal").modal('hide');
												$("#replycntSmall")
														.html(data.pageMaker.totalCount);

											});
						}

						var printPaging = function(pageMaker, target) {

							var str = "";

							if (pageMaker.prev) {
								str += "<li><a href='"
										+ (pageMaker.startPage - 1)
										+ "'> << </a></li>";
							}

							for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
								var strClass = pageMaker.cri.page == i ? 'class=active'
										: '';
								str += "<li "+strClass+"><a href='"+i+"'>" + i
										+ "</a></li>";
							}

							if (pageMaker.next) {
								str += "<li><a href='"
										+ (pageMaker.endPage + 1)
										+ "'> >> </a></li>";
							}

							target.html(str);
						};

						$("#repliesDiv").on("click", function() {
							//console.log($('#timeline'));
							if ($("#timeline li").size() > 1) {
								return;
							}
							getPage("/replies/" + bno + "/1");

						});

						$(".pagination").on("click", "li a", function(event) {

							event.preventDefault();

							replyPage = $(this).attr("href");

							getPage("/replies/" + bno + "/" + replyPage);

						});

						$("#replyAddBtn")
								.on(
										"click",
										function() {
											//alert();
											var memberidObj = $("#newReplyWriter");
											var replytextObj = $("#newReplyText");
											var memberid = memberidObj.val();
											var replytext = replytextObj.val();

											$
													.ajax({
														type : 'post',
														url : '/replies/',
														headers : {
															"Content-Type" : "application/json",
															"X-HTTP-Method-Override" : "POST"
														},
														dataType : 'text',
														data : JSON
																.stringify({
																	bno : bno,
																	memberid : memberid,
																	replytext : replytext
																}),
														success : function(
																result) {
															console
																	.log("result: "
																			+ result);
															if (result == 'SUCCESS') {
																alert("등록 되었습니다.");
																replyPage = 1;
																getPage("/replies/"
																		+ bno
																		+ "/"
																		+ replyPage);
																memberidObj
																		.val(memberid);
																replytextObj
																		.val("");
															}
														}
													});
										});

						$(".timeline")
								.on(
										"click",
										".replyLi",
										function(event) {

											var reply = $(this);

											$("#replytext")
													.val(
															reply
																	.find(
																			'.timeline-body')
																	.text());
											$(".modal-title").html(
													reply.attr("data-rno"));

										});

						$("#replyModBtn")
								.on(
										"click",
										function() {
											//alert();
											var rno = $(".modal-title").html();
											var replytext = $("#replytext")
													.val();

											$
													.ajax({
														type : 'put',
														url : '/replies/' + rno,
														headers : {
															"Content-Type" : "application/json",
															"X-HTTP-Method-Override" : "PUT"
														},
														data : JSON
																.stringify({
																	replytext : replytext
																}),
														dataType : 'text',
														success : function(
																result) {
															console
																	.log("result: "
																			+ result);
															if (result == 'SUCCESS') {
																alert("수정 되었습니다.");
																getPage("/replies/"
																		+ bno
																		+ "/"
																		+ replyPage);
															}
														}
													});
										});

						$("#replyDelBtn")
								.on(
										"click",
										function() {

											var rno = $(".modal-title").html();
											var replytext = $("#replytext")
													.val();

											$
													.ajax({
														type : 'delete',
														url : '/replies/' + rno,
														headers : {
															"Content-Type" : "application/json",
															"X-HTTP-Method-Override" : "DELETE"
														},
														dataType : 'text',
														success : function(
																result) {
															console
																	.log("result: "
																			+ result);
															if (result == 'SUCCESS') {
																alert("삭제 되었습니다.");
																getPage("/replies/"
																		+ bno
																		+ "/"
																		+ replyPage);
															}
														}
													});
										});
					</script>


					<script>
						$(document)
								.ready(
										function() {

											var formObj = $("form[role='form']");

											console.log(formObj);

											$("#modifyBtn").on(
													"click",
													function() {
														//alert();
														formObj.attr("action",
																"modifyPage");
														formObj.attr("method",
																"get");
														formObj.submit();
													});

											/* 	$("#removeBtn").on("click", function(){
											 formObj.attr("action", "/sboard/removePage");
											 formObj.submit();
											 }); */

											$("#removeBtn")
													.on(
															"click",
															function() {

																var replyCnt = $("#replycntSmall").html();

																if (replyCnt > 0) {
																	alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
																	return;
																}

																var arr = [];
																$(
																		".uploadedList li")
																		.each(
																				function(
																						index) {
																					arr
																							.push($(
																									this)
																									.attr(
																											"data-src"));
																				});

																if (arr.length > 0) {
																	$
																			.post(
																					"/deleteAllFiles",
																					{
																						files : arr
																					},
																					function() {

																					});
																}

																formObj
																		.attr(
																				"action",
																				"removePage");
																formObj
																		.submit();
															});

											$("#goListBtn ").on(
													"click",
													function() {
														formObj.attr("method",
																"get");
														formObj.attr("action",
																"list");
														formObj.submit();
													});

											var bno = ${QAVO.bno};
											var template = Handlebars
													.compile($(
															"#templateAttach")
															.html());

											$
													.getJSON(
															"getAttach/" + bno,
															function(list) {
																$(list)
																		.each(
																				function() {

																					var fileInfo = getFileInfo(this);

																					var html = template(fileInfo);

																					$(
																							".uploadedList")
																							.append(
																									html);

																				});
															});

											$(".uploadedList")
													.on(
															"click",
															".mailbox-attachment-info a",
															function(event) {

																var fileLink = $(
																		this)
																		.attr(
																				"href");

																if (checkImageType(fileLink)) {

																	event
																			.preventDefault();

																	var imgTag = $("#popup_img");
																	imgTag
																			.attr(
																					"src",
																					fileLink);

																	console
																			.log(imgTag
																					.attr("src"));

																	$(".popup")
																			.show(
																					'slow');
																	imgTag
																			.addClass("show");
																}
															});

											$("#popup_img").on(
													"click",
													function() {

														$(".popup")
																.hide('slow');

													});

										});
					</script>






				</section>

				<section class="tstbite-components my-4 my-md-5">
					<h5 class="py-3 mb-0">FAQ</h5>

				</section>
		</div>

		<footer class="tstbite-footer pt-3 pt-md-5 mt-5 bg-lightest-gray">
			<div class="container">
				<div class="row pt-4 pb-0 pb-md-5">
					<div class="col-md-6">
						<div class="tastebite-footer-contnet pr-0 pr-lg-5 mr-0 mr-md-5">
							<a href="index.html"> <img src="../resources/img/brand4.svg"
								alt="Tastebite">
							</a>
							<p class="mt-3 text-gray-300 pr-0 pr-lg-5 mr-0 mr-lg-4">"On
								the other hand, we denounce with righteous indignation and
								dislike men who are so beguiled and demoralized by the charms of
								pleasure of the moment</p>
						</div>
					</div>
					<div class="col-md-2">
						<h6 class="caption font-weight-medium mb-2 inter-font">
							<span>Tastebite</span> <span
								class="d-inline-block d-md-none float-right"> <svg
									xmlns="http://www.w3.org/2000/svg" width="14" height="8"
									viewBox="0 0 9.333 5.333">
<path
										d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</span>
						</h6>
						<ul>
							<li><a href="blog.html">About us</a></li>
							<li><a href="blog.html">Careers</a></li>
							<li><a href="blog.html">Contact us</a></li>
							<li><a href="blog.html">Feedback</a></li>
						</ul>
					</div>
					<div class="col-md-2">
						<h6 class="caption font-weight-medium mb-2 inter-font">
							<span>Legal</span> <span
								class="d-inline-block d-md-none float-right"> <svg
									xmlns="http://www.w3.org/2000/svg" width="14" height="8"
									viewBox="0 0 9.333 5.333">
<path
										d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</span>
						</h6>
						<ul>
							<li><a href="blog.html">Terms</a></li>
							<li><a href="blog.html">Conditions</a></li>
							<li><a href="blog.html">Cookies</a></li>
							<li><a href="blog.html">Copyright</a></li>
						</ul>
					</div>
					<div class="col-md-2">
						<h6 class="caption font-weight-medium mb-2 inter-font">
							<span>Follow</span> <span
								class="d-inline-block d-md-none float-right"> <svg
									xmlns="http://www.w3.org/2000/svg" width="14" height="8"
									viewBox="0 0 9.333 5.333">
<path
										d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</span>
						</h6>
						<ul>
							<li><a href="blog.html">Facebook</a></li>
							<li><a href="blog.html">Twitter</a></li>
							<li><a href="blog.html">Instagram</a></li>
							<li><a href="blog.html">Youtube</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="container">
				<hr>
				<div class="row pb-4 pt-2 align-items-center">
					<div class="col-md-6 order-2 order-md-0">
						<p class="text-gray-300 small text-left mb-0">© 2020 Tastebite
							- All rights reserved</p>
					</div>
					<div class="col-md-6">
						<div class="tstbite-social text-left text-md-right my-4 my-md-0">
							<a href="blog.html"> <svg data-name="feather-icon/facebook"
									xmlns="http://www.w3.org/2000/svg" width="20" height="20"
									viewBox="0 0 20 20">
<rect data-name="Bounding Box" width="20" height="20"
										fill="rgba(255,255,255,0)"></rect>
<path
										d="M6.667,18.333H3.333A.834.834,0,0,1,2.5,17.5V11.667H.833A.835.835,0,0,1,0,10.833V7.5a.834.834,0,0,1,.833-.833H2.5V5a5.006,5.006,0,0,1,5-5H10a.834.834,0,0,1,.833.833V4.167A.834.834,0,0,1,10,5H7.5V6.667H10A.833.833,0,0,1,10.808,7.7l-.833,3.334a.831.831,0,0,1-.809.631H7.5V17.5A.834.834,0,0,1,6.667,18.333Zm-5-10V10H3.333a.835.835,0,0,1,.834.833v5.834H5.833V10.833A.834.834,0,0,1,6.667,10h1.85l.416-1.667H6.667A.834.834,0,0,1,5.833,7.5V5A1.669,1.669,0,0,1,7.5,3.333H9.166V1.666H7.5A3.337,3.337,0,0,0,4.167,5V7.5a.835.835,0,0,1-.834.833Z"
										transform="translate(5 0.833)" fill="#7f7f7f"></path>
</svg>
							</a> <a href="blog.html"> <svg data-name="feather-icon/instagram"
									xmlns="http://www.w3.org/2000/svg" width="20" height="20"
									viewBox="0 0 20 20">
<rect data-name="Bounding Box" width="20" height="20"
										fill="rgba(255,255,255,0)"></rect>
<path
										d="M5,18.333a5.005,5.005,0,0,1-5-5V5A5.006,5.006,0,0,1,5,0h8.333a5.005,5.005,0,0,1,5,5v8.333a5,5,0,0,1-5,5ZM1.667,5v8.333A3.337,3.337,0,0,0,5,16.667h8.333a3.337,3.337,0,0,0,3.333-3.333V5a3.337,3.337,0,0,0-3.333-3.334H5A3.338,3.338,0,0,0,1.667,5Zm4.59,7.076A4.164,4.164,0,1,1,9.2,13.3,4.161,4.161,0,0,1,6.256,12.076Zm.713-4.07a2.5,2.5,0,1,0,2.6-1.348A2.527,2.527,0,0,0,9.2,6.631,2.487,2.487,0,0,0,6.97,8.006Zm6.191-2.833a.833.833,0,1,1,.589.244A.834.834,0,0,1,13.161,5.173Z"
										transform="translate(0.833 0.833)" fill="#7f7f7f"></path>
</svg>
							</a> <a href="blog.html"> <svg xmlns="http://www.w3.org/2000/svg"
									width="20.004" height="20" viewBox="0 0 20.004 20">
<g data-name="feather-icon/twitter" transform="translate(0.002)">
<rect data-name="Bounding Box" width="20" height="20"
										fill="rgba(255,255,255,0)"></rect>
<path
										d="M6.894,16.644A13.387,13.387,0,0,1,.431,14.9a.834.834,0,0,1,.4-1.562H.869c.118,0,.237.007.354.007a8.925,8.925,0,0,0,3.708-.813,8.043,8.043,0,0,1-3.59-4.4A9.651,9.651,0,0,1,1.329,2.55a8.74,8.74,0,0,1,.412-1.214A.833.833,0,0,1,3.184,1.2,8.049,8.049,0,0,0,8.914,4.574l.255.023,0-.2A4.567,4.567,0,0,1,16.78,1.162a8.239,8.239,0,0,0,1.909-1,.827.827,0,0,1,.478-.155.852.852,0,0,1,.663.326.811.811,0,0,1,.149.707,7.28,7.28,0,0,1-1.662,3.145c.012.138.019.276.019.408a13.328,13.328,0,0,1-.922,4.987A11.157,11.157,0,0,1,6.894,16.644ZM2.839,3.378a7.847,7.847,0,0,0,.086,4.238,6.928,6.928,0,0,0,4.081,4.131.833.833,0,0,1,.13,1.451,10.505,10.505,0,0,1-3.025,1.414,10.962,10.962,0,0,0,2.786.367,9.566,9.566,0,0,0,6.869-2.807,10.5,10.5,0,0,0,2.9-7.576,2.817,2.817,0,0,0-.052-.538.834.834,0,0,1,.233-.75,5.6,5.6,0,0,0,.515-.583l-.285.1-.288.091a.831.831,0,0,1-.868-.25,2.9,2.9,0,0,0-5.088,1.953V5.45a.829.829,0,0,1-.812.833c-.084,0-.169,0-.253,0A9.659,9.659,0,0,1,6,5.525,9.669,9.669,0,0,1,2.839,3.378Z"
										transform="translate(-0.002 1.658)" fill="#7f7f7f"></path>
</g>
</svg>
							</a> <a href="blog.html"> <svg xmlns="http://www.w3.org/2000/svg"
									width="20.001" height="20" viewBox="0 0 20.001 20">
<g data-name="feather-icon/youtube" transform="translate(0)">
<rect data-name="Bounding Box" width="20" height="20"
										fill="rgba(255,255,255,0)"></rect>
<path
										d="M9.475,14.547,8.157,14.53c-.7-.013-1.348-.031-1.934-.053l-.592-.025a16.853,16.853,0,0,1-3.019-.316A3.189,3.189,0,0,1,.4,11.881,25.065,25.065,0,0,1,0,7.3,24.913,24.913,0,0,1,.408,2.681,3.168,3.168,0,0,1,2.618.411,17.815,17.815,0,0,1,5.8.089L6.887.049C7.536.029,8.205.016,8.876.008L9.8,0h.484L11.4.01c.584.007,1.173.02,1.748.036l.583.018a21.6,21.6,0,0,1,3.668.317A3.158,3.158,0,0,1,19.6,2.7,25.076,25.076,0,0,1,20,7.289a24.8,24.8,0,0,1-.408,4.58,3.164,3.164,0,0,1-2.209,2.269,16.78,16.78,0,0,1-3.014.315l-.592.025c-.586.023-1.237.041-1.934.053l-1.318.017ZM9.358,1.669c-.816.007-1.6.021-2.32.042l-1.109.04a18.192,18.192,0,0,0-2.868.266A1.468,1.468,0,0,0,2.037,3.031,23.455,23.455,0,0,0,1.667,7.3,23.669,23.669,0,0,0,2.018,11.5a1.488,1.488,0,0,0,1.031,1.024,18.758,18.758,0,0,0,2.977.273l.881.032c.374.011.793.022,1.282.031l1.3.017h1.026l1.3-.017c.488-.009.907-.019,1.282-.031l.881-.032.736-.035a14.14,14.14,0,0,0,2.228-.235,1.468,1.468,0,0,0,1.024-1.012,23.446,23.446,0,0,0,.37-4.232,23.255,23.255,0,0,0-.358-4.234,1.483,1.483,0,0,0-1.006-1.06,17.158,17.158,0,0,0-2.524-.232l-.776-.031c-.681-.023-1.453-.041-2.3-.053l-1.092-.009H9.8ZM7.545,10.616a.823.823,0,0,1-.254-.6V4.566a.835.835,0,0,1,.835-.834.822.822,0,0,1,.41.11l4.792,2.725a.833.833,0,0,1,0,1.449L8.537,10.74a.821.821,0,0,1-.411.111A.845.845,0,0,1,7.545,10.616ZM8.958,8.583l2.272-1.292L8.958,6Z"
										transform="translate(0 2.501)" fill="#7f7f7f"></path>
</g>
</svg>
							</a>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</section>

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
		data-cf-beacon="{&quot;rayId&quot;:&quot;6a50cae36ead0af4&quot;,&quot;version&quot;:&quot;2021.10.0&quot;,&quot;r&quot;:1,&quot;token&quot;:&quot;9ae02b4a12234f118cf01e6f25c04e9d&quot;,&quot;si&quot;:100}"></script>

</body>
</html>