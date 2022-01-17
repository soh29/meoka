<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<title>Home</title>
<%@include file="../include/header.jsp"%>
<link href="/resources/css/testbite-style.css" rel="stylesheet"
	type="text/css" media="all">

<style>
.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
  
}

body{
  margin: auto;
}
</style>

</head>
<body>

<h1
		style="font-size: 40px; font-weight: 600; margin-top: 5%; margin-bottom: 5%; text-align: center;">
		Q&A MODIFIY</h1>




<form role="form" method="post">
	<input name="bno" type="hidden" value="${boardVO.bno }">

	<h6>제목</h6>
	<input class="form-control bg-lightest-gray" name="title" type="text" value="${boardVO.title}"><br>
	<h6>작성자</h6>
	<input class="form-control bg-lightest-gray" name="writer" type="text" value="${boardVO.writer}" readonly><br>
	<h6>내용</h6>
	<textarea class="form-control bg-lightest-gray" name="content" style="height:500px; resize: none;">${boardVO.content}</textarea>

	<div class="form-group">
		<label for="fileDrop">File DROP Here</label>
		<div class="fileDrop"></div>
	</div>	

	<ul class="mailbox-attachments clearfix uploadedList">
	</ul>
		
		
	<button class="btn btn-primary" type="submit">수정하기</button>
	<button class="btn btn-primary" type="button" onclick="location.href='list'">글 목록</button>
</form>




<!-- jQuery 2.1.4 --><!-- Bootstrap 3.3.2 JS -->
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
$(document).ready(function(){
		
	var formObj = $("form[role='form']");
	
	formObj.submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
		});
		
		that.append(str);

		console.log(str);
		
		that.get(0).submit();
	});
	
	
	$(".btn-warning").on("click", function(){
	  self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"+
			  "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
	
});




var template = Handlebars.compile($("#template").html());


$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});


$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];

	//console.log(file);
	
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


var bno = ${boardVO.bno};
var template = Handlebars.compile($("#template").html());

$.getJSON("/board/getAttach/"+bno,function(list){
	$(list).each(function(){
		
		var fileInfo = getFileInfo(this);
		
		var html = template(fileInfo);
		
		 $(".uploadedList").append(html);
		
	});
});

$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
	
	var fileLink = $(this).attr("href");
	
	if(checkImageType(fileLink)){
		
		event.preventDefault();
				
		var imgTag = $("#popup_img");
		imgTag.attr("src", fileLink);
		
		console.log(imgTag.attr("src"));
				
		$(".popup").show('slow');
		imgTag.addClass("show");		
	}	
});

$("#popup_img").on("click", function(){
	
	$(".popup").hide('slow');
	
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






</body>
</html>
