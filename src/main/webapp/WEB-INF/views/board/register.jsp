<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../include/header.jsp"%>


<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<title>Home</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<link href="/resources/css/testbite-style.css" rel="stylesheet"
	type="text/css" media="all">


<style>
body{
	font-family: 'Gowun Dodum', sans-serif;
}
h6{
	font-family: 'Gowun Dodum', sans-serif;
}
body {
	margin: auto;
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

	


		





<h1
		style="font-size: 40px; font-weight: 600; margin-top: 5%; margin-bottom: 5%; text-align: center;">
		Q&A REGISTER</h1>



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







</body>
</html>
