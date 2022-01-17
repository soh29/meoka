<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta http-equiv="Content-Type" charset=UTF-8" />
<title>회원탈퇴</title>
<link href="/resources/css/swiper-bundle.min.css" rel="stylesheet"
   type="text/css" media="all">
<link href="/resources/css/swiper-bundle.min.css" rel="stylesheet"
   type="text/css" media="all">
   
<style>
body {
	margin: auto;
	
</style>   

</head>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/";
			
		})

		$("#submit").on("click", function() {
			if ($("#password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
		});

	})	
</script>

<body>

<h5
class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">회원탈퇴</h5>
	<section id="container">
		<form action="/user/deleteComplete" method="post">
		<div class="warp" style="width: 500px; margin: auto">
		
		
			  <div class="name">
            <label class="control-label" for="name" style="width: 80px; margin:auto">이름
               </label> <input type="text" class="name_input"
               style="margin-bottom: 10px; width: 400px; background-color: #D8D8D8; border-width:1px; border-radius:2px;" id="name"
               name="name" value="${login.name}" readonly="readonly"/>
        	</div>
			
			
			
			<div class="name">
				<label class="control-label" for="memberId" style="width: 80px; margin: auto">아이디</label>
				<input class="name_input" type="text" style="margin-bottom: 10px;width: 400px;background-color: #D8D8D8; border-width:1px; border-radius:2px;" 
				id="memberId" name="memberId" value="${login.memberId}" readonly="readonly">
			</div>
			<div class="name">
				<label class="control-label" for="password" style="width: 80px; margin: auto">비밀번호</label> <input
					class="name_input" type="password" style="margin-bottom: 10px; width: 400px; border-width:1px; border-radius:2px;" id="password" name="password" />
			</div>
			<div class="form-group has-feedback" style="margin: 15px; text-align:right; ">
				<button class="btn btn-success" type="submit" id="submit" style="background-color:#ff642b;">회원탈퇴</button>
				<a href="/user/info" class="btn btn-primary">취소</a>
			</div>
		  </form>
		<div>
			<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
		</div>
	</section>


</body>

<%@include file="../include/footer.jsp"%>

</html>