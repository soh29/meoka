<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>Home</title>
<link href="/resources/css/testbite-style.css" rel="stylesheet"
	type="text/css" media="all">

<style type="text/css">
.modal {
	display: none;
	background: rgba(0, 0, 0, 0);
	position: fixed;
	float: left;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

#replyCommentForm input {
	width: 20%;
	height: 100% display: inline-block;
	vertical-align: top;
	border: 1px solid black;
}

#replyCommentForm textarea {
	width: 50%;
	display: inline-block;
	vertical-align: top;
	border: 1px solid black;
}

#replyCommentForm button {
	display: inline-block;
	vertical-align: top;
}

body {
	margin: auto;
}

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
	position: fixed;
	max-width: 1200px;
	max-height: 800px;
	overflow: auto;
	float: left;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

.form-control-1 {
	background-color: #ffc1ab;
	border-style: solid;
	border-width: 2px 2px 2px 8px;
	padding: 12px;
	word-break: break-all;
	width: 70px;
}
</style>



</head>



<section class="tstbite-section p-0">
















	<!-- Main content -->

	<body>

		<div class='popup back' style="display: none;"></div>
		<div id="popup_front" class='popup front' style="display: none;">
			<img id="popup_img">
		</div>
		<h1
		style="font-size: 40px; font-weight: 600; margin-top: 5%; margin-bottom: 5%; text-align: center;">
		Q&A READPAGE</h1>

		<h6>제목</h6>
		<input class="form-control bg-lightest-gray" type="text"
			value="${boardVO.title}" readonly>
		<br>
		<h6>작성자</h6>
		<input class="form-control bg-lightest-gray" type="text"
			value="${boardVO.writer}" readonly>
		<br>
		<h6>내용</h6>
		<textarea class="form-control bg-lightest-gray" readonly
			style="height: 500px; resize: none;">${boardVO.content}</textarea>

		<button class="btn btn-primary" type="button"
			onclick="location.href='list'">글 목록</button>

		<c:if test="${not empty login }">

			<button class="btn btn-primary" type="button"
				onclick="location.href='modifyPage?bno=${boardVO.bno}'">글
				수정</button>
			<button class="btn btn-primary" type="button"
				onclick="location.href='deletePage?bno=${boardVO.bno}'">글
				삭제</button>
			<button class="btn btn-primary" type="button"
				onclick="location.href='replyPage?bno=${boardVO.bno}'">답글
				작성</button>

		</c:if>



		<ul class="mailbox-attachments clearfix uploadedList">
		</ul>




		<div class="row">
			<div class="col-md-12">


				<div class="box box-success">
					<div class="box-header">
						<h1
		style="font-size: 40px; font-weight: 600; margin-top: 5%; margin-bottom: 5%; text-align: center;">
		ADD NEW REPLY<br /></h1>
					</div>




					<c:if test="${not empty login}">
						<div class="box-body">
							<h6>Writer</h6>
							<input type="text" class="form-control" placeholder="USER ID"
								id="newCommentWriter" value="${login.memberId}" readonly><br />
							<h6> Comment Text</h6> <input
								class="form-control" type="text" placeholder="REPLY TEXT"
								id="newCommentText"><br />
						</div>

						<div class="box-footer">
							<button type="submit" class="btn btn-primary" id="contentAddBtn">ADD
								REPLY</button>
						</div>
					</c:if>

					<c:if test="${empty login}">
						<div class="box-body">
							<div>
								<a href="javascript:goLogin();">Login to leave comments</a>
							</div>
						</div>
					</c:if>
				</div>



				<!-- The time line -->
				<ul class="timeline" style="list-style-type: none;">
					<!-- timeline time label -->
					<li class="time-label border-bottom" id="commentsDiv">
						<h1
		style="font-size: 40px; font-weight: 600; margin-top: 5%; margin-bottom: 5%; text-align: center;">
		COMMENTS</h1> (<span class="bg-green">
							<small id='contentcntSmall'> ${boardVO.commentcnt}</small>
					</span>)
					</li>
				</ul>

				<div class='text-center'>
					<ul id="pagination" class="pagination pagination-sm no-margin ">

					</ul>
				</div>

			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->



		<!-- Modal -->
		<div id="modifyModal" class="modal modal-primary fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="display: none"></h4>
					</div>
					<div class="modal-body" data-cno>
						<p>
							<input type="text" id="content" class="form-control">
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" data-dismiss="modal"
							id="contentModBtn">Modify</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal"
							id="contentDelBtn">DELETE</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>


		<!-- jQuery 2.1.4 -->
		<!-- Bootstrap 3.3.2 JS -->
		<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
		<script src="/resources/bootstrap/js/bootstrap.min.js"
			type="text/javascript"></script>
		<script type="text/javascript" src="/resources/js/upload.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>



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

<li class="contentLi comment-item" data-cno={{cno}} data-bno={{bno}} data-groupno={{groupno}} data-grouporder={{grouporder}} data-depth={{depth}}
				style="margin-left:{{multiply40 depth}}px;">
									<div class=""><!--
										<a
											href="recipe-full-width.html#0"
											class="tstbite-avatar align-self-start mr-3"><img
											src="/resources/img/avatar5.png" alt="Avatar"></a>-->
										<div class="media-body">
											<div class="pt-1 pb-3">
												<h6 class="big inter-font font-weight-semibold">{{writer}}</h6>
												<div class="text-gray-300">{{prettifyDate regdate}}</div>
											</div>
											<p class="timeline-body">{{content}}</p>
											
							{{#eqWriter writer }}
                  <a class="btn btn-primary btn-xs" 
									data-toggle="modal" data-target="#modifyModal">Modify</a>
								{{/eqWriter}}
<c:if test="${not empty login}">
				<a class="btn btn-primary btn-xs replyComment">Reply Comment</a>
</c:if>
					
										</div>

									</div>

								</li>

        {{/each}}
</script>

		<script>
			Handlebars.registerHelper("eqWriter", function(writer, block) {
				var accum = '';
				if (writer == '${login.memberId}') {
					accum += block.fn();
				}
				return accum;
			});

			Handlebars.registerHelper("prettifyDate", function(timeValue) {

				var dateObj = new Date(timeValue);
				/*
				var year = dateObj.getFullYear();
				var month = dateObj.getMonth() + 1;
				var date = dateObj.getDate();
				return year + "/" + month + "/" + date;
				 */
				return dateObj.toISOString().slice(0, 19).replace(/-/g, "/")
						.replace("T", " ");
			});
			Handlebars.registerHelper('multiply40', function(num) {
				return num * 40;
			});

			var printData = function(contentArr, target, templateObject) {

				var template = Handlebars.compile(templateObject.html());

				var html = template(contentArr);
				$(".contentLi").remove();
				target.after(html);

			}

			var bno = ${boardVO.bno};

			var contentPage = 1;

			function getPage(pageInfo) {

				$
						.getJSON(
								pageInfo,
								function(data) {
									printData(data.list, $("#commentsDiv"),
											$('#template'));
									printPaging(data.pagingVO, $(".pagination"));
									//alert(data);
									$("#modifyModal").modal('hide');
									//$(".modal-backdrop").css('display', 'none');
									//$('body').removeClass('modal-open')
									//$(".modal-backdrop").remove();

									$("#contentcntSmall").html(
											data.pagingVO.total);

									$(".replyComment")
											.on(
													"click",
													function() {
														var li = $(this)
																.parent()
																.parent()
																.parent();
														var cno = li
																.attr("data-cno");
														var bno = li
																.attr("data-bno");
														var groupno = li
																.attr("data-groupno");
														var grouporder = li
																.attr("data-grouporder");
														var depth = li
																.attr("data-depth");
														//console.log(cno);
														//$(".popup").hide('slow');

														if ($("#replyCommentForm").length > 0)
															return;

														//create element (form)
														var newForm = $('<form></form>');
														//set attribute (form)
														newForm
																.attr("id",
																		"replyCommentForm");
														newForm
																.attr("name",
																		"replyCommentForm");
														newForm.attr("method",
																"post");
														newForm
																.attr("action",
																		"/comment/replyComment");
														//newForm.attr("target","_blank");
														// create element & set attribute (input)
														newForm
																.append($(
																		'<input class="form-control" id="replyCommentWriter">',
																		{
																			type : 'text',
																			name : 'writer'
																		}));
														newForm
																.append($(
																		'<textarea class="form-control" id="replyCommentContent">',
																		{
																			name : 'content'
																		}));
														newForm
																.append($(
																		'<button class="btn btn-primary" id="submitReplyComment">작성</button>',
																		{
																			type : 'button'
																		}));
														newForm
																.append($(
																		'<button class="btn btn-primary" id="cancelReplyComment">취소</button>',
																		{
																			type : 'button'
																		}));
														// append form (to body)
														li.append(newForm);
														$("#replyCommentWriter")
																.val(
																		'${login.memberId}');
														$("#cancelReplyComment")
																.on(
																		"click",
																		function(
																				e) {
																			e
																					.preventDefault();
																			$(
																					"#replyCommentForm")
																					.remove();
																		});
														$("#submitReplyComment")
																.on(
																		"click",
																		function(
																				e) {
																			e
																					.preventDefault();
																			var writerObj = $("#replyCommentWriter");
																			var contentObj = $("#replyCommentContent");
																			var writer = writerObj
																					.val();
																			var content = contentObj
																					.val();

																			$
																					.ajax({
																						type : 'post',
																						url : '/comment/replyComment',
																						headers : {
																							"Content-Type" : "application/json",
																							"X-HTTP-Method-Override" : "POST"
																						},
																						dataType : 'text',
																						data : JSON
																								.stringify({
																									cno : cno,
																									bno : bno,
																									groupno : groupno,
																									grouporder : grouporder,
																									depth : depth,
																									writer : writer,
																									content : content
																								}),
																						success : function(
																								result) {
																							console
																									.log("result: "
																											+ result);
																							if (result == 'SUCCESS') {
																								alert("등록 되었습니다.");
																								contentPage = 1;
																								getPage("/comment/"
																										+ bno
																										+ "/"
																										+ contentPage);
																								//writerObj.val("");
																								contentObj
																										.val("");
																							}
																						}
																					});
																		});
													});
								});

			}

			var printPaging = function(pagingVO, target) {

				contentPage = pagingVO.nowPage;

				var str = "";
				var prev = pagingVO.startPage != 1;
				var next = pagingVO.endPage * pagingVO.cntPerPage < pagingVO.total;
				if (prev) {
					str += "<li><a href='" + (pagingVO.startPage - 1)
							+ "'> << </a></li>";
				}

				for (var i = pagingVO.startPage, len = pagingVO.endPage; i <= len; i++) {
					var strClass = pagingVO.nowPage == i ? 'class=active' : '';
					str += "<li "+strClass+"><a href='"+i+"'>" + i
							+ "</a></li>";
				}

				if (next) {
					str += "<li><a href='" + (pagingVO.endPage + 1)
							+ "'> >> </a></li>";
				}

				target.html(str);
			};

			$("#commentsDiv").on("click", function() {

				if ($(".timeline li").size() > 1) {
					return;
				}
				getPage("/comment/" + bno + "/1");

			});

			$(".pagination").on("click", "li a", function(event) {

				event.preventDefault();

				contentPage = $(this).attr("href");

				getPage("/comment/" + bno + "/" + contentPage);

			});

			$("#contentAddBtn").on(
					"click",
					function() {

						var writerObj = $("#newCommentWriter");
						var contentObj = $("#newCommentText");
						var writer = writerObj.val();
						var content = contentObj.val();

						$.ajax({
							type : 'post',
							url : '/comment/',
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "POST"
							},
							dataType : 'text',
							data : JSON.stringify({
								bno : bno,
								writer : writer,
								content : content
							}),
							success : function(result) {
								//console.log("result: " + result);
								if (result == 'SUCCESS') {
									alert("등록 되었습니다.");
									contentPage = 1;
									getPage("/comment/lastPage/" + bno);
									//writerObj.val("");
									contentObj.val("");

									//scroll

									var lastComment = $(".timeline").children(
											".contentLi").last();

									$('html, body').animate({
										scrollTop : lastComment.position().top
									});

								}
							}
						});
					});

			$(".timeline").on("click", ".contentLi", function(event) {

				var content = $(this);
				var cno = content.attr("data-cno");

				$("#content").val(content.find('.timeline-body').text());
				$(".modal-title").html(cno);

			});

			$("#contentModBtn").on("click", function() {

				var cno = $(".modal-title").html();
				var content = $("#content").val();

				$.ajax({
					type : 'put',
					url : '/comment/' + cno,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"
					},
					data : JSON.stringify({
						content : content
					}),
					dataType : 'text',
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("수정 되었습니다.");
							getPage("/comment/" + bno + "/" + contentPage);
						}
					}
				});
			});

			$("#contentDelBtn").on("click", function() {

				var cno = $(".modal-title").html();
				var content = $("#content").val();

				$.ajax({
					type : 'delete',
					url : '/comment/' + cno,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType : 'text',
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("삭제 되었습니다.");
							getPage("/comment/" + bno + "/" + contentPage);
						}
					}
				});
			});
		</script>


		<script>
			$(document).ready(
					function() {
						var bno = ${boardVO.bno};

						getPage("/comment/lastPage/" + bno);

						var formObj = $("form[role='form']");

						//console.log(formObj);

						$("#modifyBtn").on("click", function() {
							formObj.attr("action", "/sboard/modifyPage");
							formObj.attr("method", "get");
							formObj.submit();
						});

						/* 	$("#removeBtn").on("click", function(){
						 formObj.attr("action", "/sboard/removePage");
						 formObj.submit();
						 }); */

						$("#removeBtn").on("click", function(event) {
							event.preventDefault();
							var contentCnt = $("#contentcntSmall").html();

							if (contentCnt > 0) {
								alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
								return;
							}

							var arr = [];
							$(".uploadedList li").each(function(index) {
								arr.push($(this).attr("data-src"));
							});

							if (arr.length > 0) {
								$.post("/upload/deleteAllFiles", {
									files : arr
								}, function() {

								});
							}

							formObj.attr("action", "/board/deletePage");
							formObj.submit();
						});

						$("#goListBtn ").on("click", function() {
							formObj.attr("method", "get");
							formObj.attr("action", "/sboard/list");
							formObj.submit();
						});

						var bno = ${boardVO.bno};
						var template = Handlebars.compile($("#templateAttach")
								.html());

						$.getJSON("/board/getAttach/" + bno, function(list) {
							$(list).each(function() {
								//alert(fileInfo);
								var fileInfo = getFileInfo(this);

								var html = template(fileInfo);

								$(".uploadedList").append(html);

							});
						});

						$(".uploadedList").on("click",
								".mailbox-attachment-info a", function(event) {

									var fileLink = $(this).attr("href");

									if (checkImageType(fileLink)) {

										event.preventDefault();

										var imgTag = $("#popup_img");
										imgTag.attr("src", fileLink);

										console.log(imgTag.attr("src"));

										$(".popup").show('slow');
										imgTag.addClass("show");
									}
								});

						$("#popup_img").on("click", function() {

							$(".popup").hide('slow');

						});

					});
		</script>



		<%@include file="../include/footer.jsp"%>
</section>




</body>
</html>
