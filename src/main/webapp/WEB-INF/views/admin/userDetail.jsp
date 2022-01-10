<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header_admin.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Find id</title>
<link href="/resources/css/swiper-bundle.min.css" rel="stylesheet"
	type="text/css" media="all">
<link href="/resources/css/tastebite-styles.css" rel="stylesheet"
	type="text/css" media="all">

<style>
body {
	margin: auto;
}
h5 { text-align: center; }
</style>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
</head>

<script>
function btn_click(str){
	if(str=="userUpdate"){
		alert("회원정보를 수정하시겠습니까?");
		frm1.action="/admin/userModify";
	} else{
		alert("해당회원을 탈퇴시키겠습니까?");
		frm1.action="/admin/userDelete";
	}
}
</script>

<body>

<div class="content-wrapper">
<section class="content-header">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header">
						<h5 class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">회원정보</h5>
					</div>
					<!-- /.box-header -->
					

					<form name="frm1" method="post">	
					<div class="warp" style="width: 700px; margin: auto">
					
						<div class="name">
           				<label for="name" style="width: 120px; margin: auto">이름</label>
                		<input type="text" class="name_input"
               			   style="margin-bottom: 10px; width: 400px" id="name"
              			   name="name" value="${user.name}"/>
        				</div>
        	
        				<div class="name">
           				<label for="memberId" style="width: 120px; margin: auto">아이디</label>
           				<input type="text" class="name_input"
              			   	   style="margin-bottom: 10px; width: 400px" id="memberId"
              			      name="memberId" value="${user.memberId}"/>       
        				</div>
        				
        				<div class="name">
           				<label for="email" style="width: 120px; margin: auto">이메일</label>
           				<input type="text" class="name_input"
              			   	   style="margin-bottom: 10px; width: 400px" id="email"
              			      name="email" value="${user.email}"/>
        				</div>
        				
        				<div class="name">
           				<label for="phoneNo" style="width: 120px; margin: auto">핸드폰번호</label>
           				<input type="text" class="name_input"
              			   	   style="margin-bottom: 10px; width: 400px" id="phoneNo"
              			      name="phoneNo" value="${user.phoneNo}"/>
        				</div>
        				
        				<div class="name">
           				<label for="memberType" style="width: 120px; margin: auto">사용자 유형</label>
           				<input type="text" class="name_input"
              			   	   style="margin-bottom: 10px; width: 400px" id="memberType"
              			      name="memberType" value="${user.memberType}"/>
        				</div>
        				
        				<div class="name">
           				<label for="rankNo" style="width: 120px; margin: auto">요리수준</label>
           				<input type="text" class="name_input"
              			   	   style="margin-bottom: 10px; width: 400px" id="rankNo"
              			      name="rankNo" value="${user.rankNo}"/>
        				</div>
        	      			
        			<!-- /.box-body -->     			

        	
        			<div class="blog-detail"><hr></div>
        	
        			<div class="box-footer">						
						<input type="submit" value="수정" onclick='btn_click("userUpdate");'>
						<input type="submit" value="탈퇴" onclick='btn_click("userDelete");'>
					</div>
					
					</div>
					
					</form>
					
					
        	
				</div>
				<!-- /.box -->
			</div>
			<!--/.col (left) -->
		</div>
		<!-- /.row -->
	</section>
</div>
</body>

<%@include file="../include/footer.jsp"%>

</html>