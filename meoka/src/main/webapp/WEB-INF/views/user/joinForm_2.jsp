<%@ page contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/user/join.css">
<script
	src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256=WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVu="
	crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<form action="join" method="post">
	<div class="warp">
		<div class="subject">
			<span>회원가입</span>
			
		</div>
		<div class="id_wrap">
			<div class="id_name">아이디</div>
			<div class="id_input_box">
				<input class="id_input" name="memberId">
			</div>
			<div class="id_wrap">
			<div class="pw_name">비밀번호</div>
			<div class="id_input_box">
				<input class="id_input" name="password">
			</div>
			<div class="id_wrap">
			<div class="pw_name">비밀번호 확인</div>
			<div class="id_input_box">
				<input class="id_input" name="password">
			</div>
			
		</div>	
		 </div>
	 <button type="submit">등록</button>
  </form>
</div>				
			
<script>

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		$("#join_form").attr("action","/member/join");
		$("#join_form").submit();
	
	});
});	
	

</script>			

</body>
</html>