<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${not empty login}">
		<script>
			alert('${login.memberId}님, 환영합니다.');
			self.location = "/";
		</script>
	</c:if>

	<c:if test="${empty login}">
		<script>
			alert('아이디와 비밀번호를 확인해주세요.');
			self.location = "/";
		</script>
	</c:if>

	<script type="text/javascript">
		self.location = "/home-v3";
	</script>

</body>
</html>

