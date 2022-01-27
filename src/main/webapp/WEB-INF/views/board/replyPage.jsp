<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<title>Home</title>
<link href="/resources/css/testbite-style.css" rel="stylesheet"
	type="text/css" media="all">
<style>
body{
	font-family: 'Gowun Dodum', sans-serif;
}
body {
	margin: auto;
}
</style>
</head>
<body>


					


<h1
		style="font-size: 40px; font-weight: 600; margin-top: 5%; margin-bottom: 5%; text-align: center;">
		Q&A REPLYPAGE</h1>








<form role="form" method="post">
	<input name="bno" type="hidden" value="${boardVO.bno }">
	<input name="groupno" type="hidden" value="${boardVO.groupno }">
	<input name="grouporder" type="hidden" value="${boardVO.grouporder }">
	<input name="depth" type="hidden" value="${boardVO.depth }">
	
	<h6>제목</h6>
	<input class="form-control bg-lightest-gray"  type="text" name="title"><br>
	<h6>작성자</h6>
	<input class="form-control bg-lightest-gray"  type="text" name="writer" value="${login.memberId }"><br>
	<h6>내용</h6>
	<textarea class="form-control bg-lightest-gray"  name="content" style="height:500px; resize: none;"></textarea>
	
	<button class="btn btn-primary" type="submit">작성</button>
	<button class="btn btn-primary" type="button" onclick="location.href='list'">글 목록</button>
</form>






<!-- jQuery 2.1.4 --><!-- Bootstrap 3.3.2 JS -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script>

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
