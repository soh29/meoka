<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header_admin.jsp"%>

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
h5 { text-align: center; }
p { text-align: center; }
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
		class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">관리자 페이지</h5>
		
		
		
		<div class="warp" style="width: 1000px; margin: auto">
		
		
		<section class="tstbite-components my-4 my-md-5">
		<!-- <a href="/user/logout" class="btn btn-primary">로그아웃</a>-->
		

		<a href="/admin/getUserList" method="get">회원 전체목록</a><br>
		<a href="/admin/getRecipeList" method="get">레시피 전체목록</a><br>
		<a href="/admin/getValuationList" method="get">댓글 전체목록</a><br>
		<a href="/" method="get">Q&A 전체목록</a><br>
		</section>
		</div>
		
		
		
		


</body>

<%@include file="../include/footer.jsp"%>

</html>