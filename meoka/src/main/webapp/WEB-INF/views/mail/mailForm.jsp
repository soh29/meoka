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

	<div class="container">
		<h2 style="font-family:inter,sans-serif!important; width:500px; font-size:36px; font-weight:600px;" class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">비밀번호 찾기</h2>
		<form role="form" method="post" class="was-validated">
			<div class="form-group">
				<label for="email">메일</label> <input type="text"
					class="form-control" id="toMail" name="email"
					placeholder="메일주소를 입력하세요" required />
			</div>

			<div class="form-group">
				<label for="memberId">아이디</label> <input type="text"
					class="form-control" id="memberId" name="memberId"
					placeholder="아이디를 입력하세요" required />
			</div>						

			<button type="submit" id="idChk" style="border-color:#e4f1ff; background-color:#e4f1ff;" class="btn btn-secondary" "onclick="fn_idChk()" value="N">메일보내기</button>
			<button type="reset" class="btn btn-secondary">다시쓰기</button>
			<button type="button" class="btn btn-secondary"
				onclick="location.href='${contextPath}/'">돌아가기</button>
		</form>
	</div>

</body>

<%@include file="../include/footer.jsp"%>

</html>