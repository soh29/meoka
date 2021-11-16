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
</style>
</head>

   <script type="text/javascript">
      $(document).ready(function(){
         // 취소
         $(".cancel").on("click", function(){
            
            location.href = "/";
                      
         })
      
         $("#submit").on("click", function(){
            if($("#password").val()==""){
               alert("비밀번호를 입력해주세요.");
               $("#password").focus();
               return false;
            }

         });
         
            
         
      })
   </script>
   
   <body>
   <div class="tstbite-components mb-5 pb-4">
   <h5
      class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">회원정보수정</h5>
      <section id="container">
         <form action="/user/modifyComplete" method="post">
             
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
            <label for="password" style="width: 120px; margin: auto">새 비밀번호
               </label> <input type="password" class="name_input"
               style="margin-bottom: 10px; width: 400px" id="password"
               name="password" />
        	</div>
        	
        	<div class="name">
            <label for="passwordCheck" style="width: 120px; margin: auto">새 비밀번호
               </label> <input type="password" class="name_input"
               style="margin-bottom: 10px; width: 400px" id="passwordCheck"
               name="passwordCheck" />
        	</div>
        	
        	<div class="name">
            <label for="email" style="width: 120px; margin: auto">이메일
               </label> <input type="text" class="name_input"
               style="margin-bottom: 10px; width: 400px" id="email"
               name="email" value="${login.email}"/>
        	</div>
        	
        	<div class="name">
            <label for="phoneNo" style="width: 120px; margin: auto">핸드폰번호
               </label> <input type="text" class="name_input"
               style="margin-bottom: 10px; width: 400px" id="phoneNo"
               name="phoneNo" value="${login.email}"/>
        	</div>
        	
        	<div class="name">
            <label for="memberType" style="width: 120px; margin: auto">타입
               </label> <input type="text" class="name_input"
               style="margin-bottom: 10px; width: 400px" id="memberType"
               name="memberType" value="${login.memberType}"/>
        	</div>
        	
        	<div class="name">
            <label for="rankNo" style="width: 120px; margin: auto">수준
               </label> <input type="text" class="name_input"
               style="margin-bottom: 10px; width: 400px" id="rankNo"
               name="rankNo" value="${login.rankNo}"/>
        	</div>
             
            <button type="submit" id="submit" class="btn btn-secondary"
            style="border-color:#ff642b; background-color:#ff642b; width: 525px; float:none; margin:15px auto; color:#fff!important">회원정보수정</button>
            
         </form>
      </section>
      
   </body>

<%@include file="../include/footer.jsp"%>

</html>
 