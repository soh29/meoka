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
		class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">댓글목록</h5>
		
<table class="table table-bordered"">
	<thead>
	<tr>
		<th>내용</th>
		<th>평점</th>
		<th>작성자</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${valuationList}" var="valuation">			
		<tr>
			<td><a href="${path}/admin/getValuationDetail?comments=${valuation.comments}">${valuation.comments}&nbsp;</a></td>
			<td>${valuation.point}</td>	
			<td>${valuation.memberid}</td>		
		</tr>
		
	</c:forEach>
	</tbody>
</table>
<input type="button" value="메인으로" class="btn" onclick="location.href='/'">

</body>

<%@include file="../include/footer.jsp"%>

</html>