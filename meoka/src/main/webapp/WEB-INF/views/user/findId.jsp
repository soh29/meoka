<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Find id</title>
<link href="/resources/css/swiper-bundle.min.css" rel="stylesheet"
	type="text/css" media="all">
<link href="/resources/css/tastebite-styles.css" rel="stylesheet"
	type="text/css" media="all">

<style>
body {
	margin: auto;
}
</style>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
</head>

<body>


	<h5
		class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">아이디 찾기</h5>
		
	<form method="post" action="find_id" name="findform">
	
		<div class="warp" style="width: 500px; margin: auto">
		
		<div class="name">
			<label for="name" style="width: 70px; margin: auto">이름</label> 
			<input type="text" class="name_input" style="margin-bottom:10px; width:400px"
				id="name" name="name" placeholder="이름을 입력하세요" />
		</div>

		<div class="name">
			<label for="email" style="width: 70px; margin: auto">이메일</label> 
			<input type="text" class="name_input" style="margin-bottom:10px; width:400px"
				id="toMail" name="email" placeholder="이메일주소를 입력하세요" />
		</div>
		
		<button type="submit" id="idChk" class="btn btn-secondary" onclick="fn_idChk()" value="N"
				style="border-color:#ff642b; background-color:#ff642b; width: 475px; float:none; margin:15px auto; color:#fff!important">아이디 찾기</button>
		</div>
		

		<!-- 이름과 이메일이 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				opener.document.findform.name.value = "";
				opener.document.findform.email.value = "";
			</script>
			<label style="width: 500px; margin: 10px auto; text-align:center">일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<!-- 이름과 비밀번호가 일치할 때 -->
		<c:if test="${check == 0 }">
		<div class="warp" style="width: 500px; margin: auto">
			<label style="width: 500px; margin: 10px auto; text-align:center">아이디는 ${id} 입니다.</label>
			<div>
				<a type="button" href="/" class="btn btn-secondary"
				style="border-color:#ff642b; background-color:#ff642b; width: 475px; float:none; margin:15px auto; color:#fff!important">확인</a>
			</div>
		</div>
		</c:if>

	</form>

</body>

<%@include file="../include/footer.jsp"%>

</html>