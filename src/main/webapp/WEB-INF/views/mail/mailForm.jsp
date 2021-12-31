<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<title>mailForm.jsp</title>
</head>

<script type="text/javascript">
function fn_idChk(){
	$.ajax({
		url : "/user/idChk",
		type : "post",
		dataType : "json",
		data : {"memberId" : $("#memberId").val()},
		success : function(data){
			if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("아이디가 존재하지 않습니다.");
				document.location.href="";
			}else{
				alert("임시 비밀번호가 발송되었습니다.");
				document.location.href="/";
			}
		}
	})
}
</script>

<body>

	<h5
      class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">비밀번호 찾기</h5>
      
   <form role="form" method="post" class="was-validated">
   
      <div class="warp" style="width: 500px; margin: auto">
      
      <div class="name">
         <label for="memberId" style="width: 70px; margin: auto">아이디</label> 
         <input type="text" class="name_input" style="margin-bottom:10px; width:400px"
            id="memberId" name="memberId" placeholder="아이디를 입력하세요" />
      </div>
      
      <div class="name">
         <label for="email" style="width: 70px; margin: auto">이메일</label> 
         <input type="text" class="name_input" style="margin-bottom:10px; width:400px"
            id="toMail" name="email" placeholder="이메일주소를 입력하세요" />
      </div>
      
      <button type="submit" id="idChk" class="btn btn-secondary;" onclick="fn_idChk()" value="N"
            style="border-color:#ff642b; background-color:#ff642b; width: 475px; float:none; margin:15px auto; color:#fff!important">비밀번호 찾기</button>

   </div>
   </form>

</body>

<%@include file="../include/footer.jsp"%>

</html>