<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<title>Home</title>
<style type="text/css">
.modal {
display:none;
  background: gray;
  position: fixed;
  float: left;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
</style>


</head>

<!-- Main content -->
    <style type="text/css">
    .popup {position: absolute;}
    .back { background-color: gray; opacity:0.5; width: 100%; height: 300%; overflow:hidden;  z-index:1101;}
    .front { 
       z-index:1110; opacity:1; boarder:1px; margin: auto; 
      }
     .show{
       position:relative;
       max-width: 1200px; 
       max-height: 800px; 
       overflow: auto;       
     } 
  	
    </style>

    <div class='popup back' style="display:none;"></div>
    <div id="popup_front" class='popup front' style="display:none;">
     <img id="popup_img">
    </div>
    
    
    
    
    
<body>
	제목<input type="text" value="${boardVO.title}"><br>
	작성자<input type="text" value="${boardVO.writer}"><br>
	내용<textarea>${boardVO.content}</textarea>

<button type="button" onclick="location.href='list'">글 목록</button>
<button type="button" onclick="location.href='modifyPage?bno=${boardVO.bno}'">글 수정</button>
<button type="button" onclick="location.href='deletePage?bno=${boardVO.bno}'" id="removeBtn">글 삭제</button>
<button type="button" onclick="location.href='replyPage?bno=${boardVO.bno}'">답글 작성</button>







    <ul class="mailbox-attachments clearfix uploadedList">
    </ul>






	<div class="row">
		<div class="col-md-12">


			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>




				<c:if test="${not empty login}">
					<div class="box-body">
						<label for="exampleInputEmail1">Writer</label> <input
							class="form-control" type="text" placeholder="USER ID"
							id="newCommentWriter" value="${login.uid }" readonly="readonly">
						<label for="exampleInputEmail1">Comment Text</label> <input
							class="form-control" type="text" placeholder="REPLY TEXT"
							id="newCommentText">
					</div>

					<div class="box-footer">
						<button type="submit" class="btn btn-primary" id="contentAddBtn">ADD
							REPLY</button>
					</div>
				</c:if>

				<c:if test="${empty login}">
					<div class="box-body">
						<div>
							<a href="javascript:goLogin();">Login Please</a>
						</div>
					</div>
				</c:if>
			</div>



			<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="commentsDiv"><span class="bg-green">
						Replies List <small id='contentcntSmall'> [
							${boardVO.commentcnt} ] </small>
				</span></li>
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
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-cno>
					<p>
						<input type="text" id="content" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="contentModBtn">Modify</button>
					<button type="button" class="btn btn-danger" id="contentDelBtn">DELETE</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


<!-- jQuery 2.1.4 --><!-- Bootstrap 3.3.2 JS -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>                
</script>

<script>
Handlebars.registerHelper('multiply30', function(num) {
	return num * 30;
});
</script>

<script id="template" type="text/x-handlebars-template">
				{{#each .}}
	         <li class="contentLi" data-cno={{cno}} data-bno={{bno}} data-groupno={{groupno}} data-grouporder={{grouporder}} data-depth={{depth}}
				style="margin-left:{{multiply30 depth}}px;">
             <i class="fa fa-comments bg-blue"></i>
             <div class="timeline-item" >
                <span class="time">
                  <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
                </span>
                <h3 class="timeline-header"><strong>{{cno}}</strong> -{{writer}}</h3>
                <div class="timeline-body">{{content}} </div>
								<div class="timeline-footer">
								{{#eqWriter writer }}
                  <a class="btn btn-primary btn-xs" 
									data-toggle="modal" data-target="#modifyModal">Modify</a>
								{{/eqWriter}}

				<a class="btn btn-primary btn-xs replyComment">Reply Comment</a>
							  </div>
	            </div>			
           </li>
        {{/each}}
</script>

<script>
	Handlebars.registerHelper("eqWriter", function(writer, block) {
		var accum = '';
		if (writer == '${login.uid}') {
			accum += block.fn();
		}
		return accum;
	});

	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
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

		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#commentsDiv"), $('#template'));
			printPaging(data.pagingVO, $(".pagination"));
			//alert(data);
			$("#modifyModal").modal('hide');
			$("#contentcntSmall").html("[ " + data.pagingVO.total + " ]");
			
			
			$(".replyComment").on("click", function() {
				var li = $(this).parent().parent().parent();
				var cno = li.attr("data-cno");
				var bno = li.attr("data-bno");
				var groupno = li.attr("data-groupno");
				var grouporder = li.attr("data-grouporder");
				var depth = li.attr("data-depth");
				console.log(cno);
				//$(".popup").hide('slow');
				
				if($("#replyCommentForm").length > 0)
						return;
				
				//create element (form)
				var newForm = $('<form></form>');
				//set attribute (form)
				newForm.attr("id","replyCommentForm");
				newForm.attr("name","replyCommentForm");
				newForm.attr("method","post");
				newForm.attr("action","/comment/replyComment");
				//newForm.attr("target","_blank");
				// create element & set attribute (input)
				newForm.append($('<input id="replyCommentWriter">', {type: 'text', name: 'writer'}));
				newForm.append($('<textarea id="replyCommentContent">', {name: 'content'}));
				newForm.append($('<button id="submitReplyComment">작성</button>', {type: 'button'}));
				newForm.append($('<button id="cancelReplyComment">취소</button>', {type: 'button'}));
				// append form (to body)
				li.append(newForm);
				$("#replyCommentWriter").val('${login.uid}');
				$("#cancelReplyComment").on("click", function(e) {
					e.preventDefault();
					$("#replyCommentForm").remove();
				});
				$("#submitReplyComment").on("click", function(e) {
					e.preventDefault();
					var writerObj = $("#replyCommentWriter");
					var contentObj = $("#replyCommentContent");
					var writer = writerObj.val();
					var content = contentObj.val();

					$.ajax({
						type : 'post',
						url : '/comment/replyComment',
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						data : JSON.stringify({
							cno : cno,
							bno : bno,
							groupno: groupno,
							grouporder: grouporder,
							depth: depth,
							writer : writer,
							content : content
						}),
						success : function(result) {
							console.log("result: " + result);
							if (result == 'SUCCESS') {
								alert("등록 되었습니다.");
								contentPage = 1;
								getPage("/comment/lastPage/" + bno);
								//writerObj.val("");
								contentObj.val("");
							}
						}
					});
				});
			});
		});
		
	}

	var printPaging = function(pagingVO, target) {

		var str = "";
		var prev = pagingVO.startPage != 1;
		var next = pagingVO.endPage * pagingVO.cntPerPage < pagingVO.total;
		if (prev) {
			str += "<li><a href='" + (pagingVO.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pagingVO.startPage, len = pagingVO.endPage; i <= len; i++) {
			var strClass = pagingVO.nowPage == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
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

	$("#contentAddBtn").on("click", function() {

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
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("등록 되었습니다.");
					contentPage = 1;
					getPage("/comment/lastPage/" + bno);
					//writerObj.val("");
					contentObj.val("");
				}
			}
		});
	});

	$(".timeline").on("click", ".contentLi", function(event) {

		var content = $(this);

		$("#content").val(content.find('.timeline-body').text());
		$(".modal-title").html(content.attr("data-cno"));

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

				console.log(formObj);

				$("#modifyBtn").on("click", function() {
					formObj.attr("action", "/sboard/modifyPage");
					formObj.attr("method", "get");
					formObj.submit();
				});

				/* 	$("#removeBtn").on("click", function(){
				 formObj.attr("action", "/sboard/removePage");
				 formObj.submit();
				 }); */

				$("#removeBtn").on("click", function() {

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
						$.post("/deleteAllFiles", {
							files : arr
						}, function() {

						});
					}

					formObj.attr("action", "/sboard/removePage");
					formObj.submit();
				});

				$("#goListBtn ").on("click", function() {
					formObj.attr("method", "get");
					formObj.attr("action", "/sboard/list");
					formObj.submit();
				});

				var bno = ${boardVO.bno};
				var template = Handlebars.compile($("#templateAttach").html());

				$.getJSON("/board/getAttach/" + bno, function(list) {
					$(list).each(function() {
						//alert(fileInfo);
						var fileInfo = getFileInfo(this);

						var html = template(fileInfo);

						$(".uploadedList").append(html);

					});
				});

				$(".uploadedList").on("click", ".mailbox-attachment-info a",
						function(event) {

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



</body>
</html>
