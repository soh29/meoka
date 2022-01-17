<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Join PAGE</title>
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
select {
  padding: 10px;
  padding-right: 30px;
  border: 1px solid gray;
  color: gray;
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
  background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E');
    background-repeat: no-repeat, repeat;
    background-position: right .7em top 50%, 0 0;
    background-size: .65em auto, 100%;
}
</style>

<script type="text/javascript">
   function fn_idChk() {
      $.ajax({
         url : "/user/idChk",
         type : "post",
         dataType : "json",
         data : {
            "memberId" : $("#memberId").val()
         },
         success : function(data) {
            if (data == 0) {
               $("#idChk").attr("value", "Y");
               alert("사용가능한 아이디입니다.");
            } else {
               alert("중복된 아이디입니다.");
            }
         }
      })
   }

   function fnSubmit() {
      if ($("#name").val() == null || $("#name").val() == "") {
         alert("이름을 입력해주세요.");
         $("#name").focus();
         return false;
      }
      if ($("#memberId").val() == null || $("memberId").val() == "") {
         alert("아이디를 입력해주세요.");
         $("#memberId").focus();
         return false;
      }
      if ($("#idChk").val() != 'Y') {
         alert("아이디 중복체크를 눌러주세요.");
         $("#idChk").focus();
         return false;
      }
      if ($("#password").val() == null || $("#password").val() == "") {
         alert("비밀번호를 입력해주세요.");
         $("#password").focus();
         return false;
      }
      if ($("#confirmPassword").val() == null
            || $("#confirmPassword").val() == "") {
         alert("비밀번호를 다시 입력해주세요.");
         $("#confirmPassword").focus();
         return false;
      }
      if ($("#password").val() != $("#confirmPassword").val()) {
         alert("비밀번호가 일치하지 않습니다.");
         $("#mconfirmPassword").focus();
         return false;
      }
      if ($("#email").val() == null || $("#email").val() == "") {
         alert("이메일을 입력해주세요.");
         $("#email").focus();
         return false;
      }
      if ($("#email").val() == null || $("#email2").val() == "") {
          alert("이메일 형식을 확인해주세요.");
          $("#email").focus();
          return false;
       }
      if ($("#phoneNo").val() == null || $("#phoneNo").val() == "") {
         alert("핸드폰번호를 입력해주세요.");
         $("#phoneNo").focus();
         return false;
      }
      if (confirm("회원가입하시겠습니까?")) {
         $("#createForm").submit();
         alret("회원가입에 성공하셨습니다.");
         self.location = "/";
         return false;
      }
   }
</script>



</head>

<div class="tstbite-components mb-5 pb-4">
   <h5
      class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">회원가입</h5>
   <form action="join" method="post" id="createForm">
      <div class="warp" style="width: 600px; margin: auto">

         <div class="name">
            <label for="name" style="width: 120px; margin: auto">이름</label> <input
               type="text" class="name_input"
               style="margin-bottom: 10px; width: 400px" id="name" name="name"
               placeholder="이름을 입력하세요" />
         </div>

         <div class="name">
            <label for="memberId" style="width: 120px; margin: auto">아이디</label>
            <input type="text" class="name_input"
               style="margin-bottom: 10px; width: 330px" id="memberId"
               name="memberId" placeholder="아이디를 입력하세요" />
            <button class="idChk" type="button" id="idChk" onclick="fn_idChk();"
               value="N" style="margin-left: -14px">중복확인</button>
         </div>

         <div class="name">
            <label for="password" style="width: 120px; margin: auto">비밀번호</label>
            <input type="password" class="name_input"
               style="margin-bottom: 10px; width: 400px" id="password"
               name="password" placeholder="비밀번호를 입력하세요" />
         </div>

         <div class="name">
            <label for="password" style="width: 120px; margin: auto">비밀번호
               확인</label> <input type="password" class="name_input"
               style="margin-bottom: 10px; width: 400px" id="confirmPassword"
               name="confirmPassword" placeholder="비밀번호를 다시 입력하세요" />
         </div>

         <div class="name">
            <label for="name" style="width: 120px; margin: auto">이메일</label> <input
               type="text" class="name_input"
               style="margin-bottom: 10px; width: 200px;" id="email" name="email"
               placeholder="이메일을 입력하세요" />@ <select name="email2"
               style="width: 180px; border-top-width: 2px; padding-top: 1px; padding-right: 2px;
                border-width: 1px; padding-left: 20px; padding-bottom: 1px; border-bottom-width: 1px; 
                margin-bottom: 10px; outline: 0px; border-radius: 2px;">
               <option hidden="" disabled="disabled" selected="selected" value="">
                  =선택하세요=</option>
               <option>naver.com</option>
               <option>daum.net</option>
               <option>gmail.com</option>
            </select>

         </div>

         <div class="name">
            <label for="memberId" style="width: 120px; margin: auto">핸드폰
               번호</label> <input type="text" class="name_input"
               style="margin-bottom: 10px; width: 400px" id="phoneNo"
               name="phoneNo" placeholder="핸드폰번호를 입력하세요" />
         </div>

         <button type="submit" id="idChk" class="btn btn-secondary"
            onclick="fnSubmit(); return false"
               style="border-color:#ff642b; background-color:#ff642b; width: 525px; float:none; margin:15px auto; color:#fff!important">회원가입</button>

      </div>

   </form>

</div>
</div>
</div>

<%@include file="../include/footer.jsp"%>

</html>