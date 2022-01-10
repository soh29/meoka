<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Modify PAGE</title>
<link href="/resources/css/swiper-bundle.min.css" rel="stylesheet"
   type="text/css" media="all">
<link href="/resources/css/tastebite-styles.css" rel="stylesheet"
   type="text/css" media="all">

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
body {
   margin: auto;
}
h5 {text-align:center;}
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
   <div class="warp" style="width: 600px; margin: auto">
   <h5
      class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">회원탈퇴</h5>
      <section id="container">
         <form action="/user/deleteComplete" method="post">
             
            <div class="name">
            <label for="name" style="width: 120px; margin: auto">이름
               </label> <input type="text" class="name_input"
               style="margin-bottom: 10px; width: 400px" id="name"
               name="name" value="${login.name}" readonly="readonly"/>
        	</div>
        	
        	<div class="name">
            <label for="memberId" style="width: 120px; margin: auto">아이디
               </label> <input type="text" class="name_input"
               style="margin-bottom: 10px; width: 400px" id="memberId"
               name="memberId" value="${login.memberId}" readonly="readonly"/>
        	</div>
        	
        	<div class="name">
            <label for="password" style="width: 120px; margin: auto">비밀번호
               </label> <input type="password" class="name_input"
               style="margin-bottom: 10px; width: 400px" id="password"
               name="password" />
                            
            <div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
				<a href="/user/info" class="btn btn-primary">취소</a>
			</div>
			
			<c:if test="${msg == false}">
					<script type="text/javascript">
						alert('비밀번호가 맞지 않습니다.');
					</script>
			</c:if>
			</div>
			
         </form>
      </section>
      
   </body>



</html>