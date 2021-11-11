<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
   <head>
      <!-- 합쳐지고 최소화된 최신 CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <title>회원가입</title>
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
            // if($("#memberId").val()==""){
               // alert("성명을 입력해주세요.");
               // $("#memberId").focus();
               // return false;
            // }
         });
         
            
         
      })
   </script>
   <body>
      <section id="container">
         <form action="/user/modifyComplete" method="post">
            <div class="form-group has-feedback">
               <label class="control-label" for="name">이름</label>
               <input class="form-control" type="text" id="name" name="name" value="${login.name}" readonly="readonly"/>
            </div>
         
            <div class="form-group has-feedback">
               <label class="control-label" for="memberId">아이디</label>
               <input class="form-control" type="text" id="memberId" name="memberId" value="${login.memberId}" readonly="readonly"/>
            </div>
            
            <!-- <div class="form-group has-feedback">
               <label class="control-label" for="password">기존 비밀번호</label>
               <input class="form-control" type="password" id="password" name="password" />
            </div> -->
            
            <div class="form-group has-feedback">
               <label class="control-label" for="password">새 비밀번호</label>
               <input class="form-control" type="password" id="password" name="password" />
            </div>
            
            <div class="form-group has-feedback">
               <label class="control-label" for="password">새 비밀번호 확인</label>
               <input class="form-control" type="password" id="passwordCheck" name="passwordCheck" />
            </div>
            
            <div class="form-group has-feedback">
               <label class="control-label" for="rankNo">이메일</label>
               <input class="form-control" type="text" id="email" name="email" value="${login.email}"/>
            </div>
            
            <div class="form-group has-feedback">
               <label class="control-label" for="rankNo">번호</label>
               <input class="form-control" type="text" id="phoneNo" name="phoneNo" value="${login.phoneNo}"/>
            </div>
            
            <div class="form-group has-feedback">
               <label class="control-label" for="memberType">타입</label>
               <input class="form-control" type="text" id="memberType" name="memberType" value="${login.memberType}"/>
            </div>
            
            <div class="form-group has-feedback">
               <label class="control-label" for="memberType">수준</label>
               <input class="form-control" type="text" id="rankNo" name="rankNo" value="${login.rankNo}"/>
            </div>
            
            <div class="form-group has-feedback">
               <button class="btn btn-success" type="submit" id="submit">회원정보수정</button>

               <a href="/user/info" class="btn btn-primary">취소</a>
            </div>
         </form>
      </section>
      
   </body>
   
</html>
 