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
<link href="/resources/css/testbite-style.css" rel="stylesheet"
   type="text/css" media="all">
<link href="/resources/css/foodThemeList.css" rel="stylesheet"
   type="text/css" media="all">

<style>
body {
   font-family: 'Gowun Dodum', sans-serif;
   margin: auto;   
 
}

table {
	width:100%;
	table-layout:fixed;
}
th:first-child, th:last-child {
	width:16%;
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
      class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">댓글 목록</h5>


<table class="table table-bordered">
   <tbody>
   
   <tr>
      <th>레시피 번호</th>
      <th>내용</th>
      <th>평점</th>
   </tr>
  
   <c:forEach items="${valuationList}" var="valuation">         
      <tr>
         <td>${valuation.recipeno}</td>
         <td>${valuation.comments}</td>
         <td>${valuation.point}</td>      
      </tr>
      
   </c:forEach>
   </tbody>
</table>

</body>

<%@include file="../include/footer.jsp"%>

</html>