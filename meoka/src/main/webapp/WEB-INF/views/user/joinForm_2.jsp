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
				<input class="id_input" name="memberId" maxlength="20">
				<input type="button" value="중복확인">
			</div>
			<div class="id_wrap">
			<div class="pw_name">비밀번호</div>
			<div class="pw_input_box">
				<input type="password" class="form-control" name="password" maxlength="15">
			</div>
			<div class="id_wrap">
			<div class="pw_name">비밀번호 확인</div>
			<div class="id_input_box">
				<input class="id_input" name="confirmPassword" maxlength="15">
			</div>
			<div class="id_wrap">
			<div class="email_name">이메일</div>
			<div class="id_input_box">
				<input class="id_input" name="email" maxlength="30">@
				<select name="email_2">
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
				</select>
			</div>
			<div class="id_wrap">
			<div class="phone_number">전화번호</div>
			<div class="id_input_box">
				<input class="id_input" name="phoneNumber"/>
			</div>
			
			<input type="submit" value="가입"/> <input type="button" value="취소">
				
			
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