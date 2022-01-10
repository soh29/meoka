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
	if(str=="valuationRestrict"){
		alert("해당 댓글을 규제하시겠습니까?");
		frm3.action="/admin/valuationRestrict";
	} else{
		frm3.action="/admin/valuationDelete";
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
						<h5 class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">댓글정보</h5>
					</div>
					<!-- /.box-header -->
					

					<form name="frm3" method="post">	
					<div class="warp" style="width: 700px; margin: auto">
					
						<div class="name">
           				<label for="recipeno" style="width: 120px; margin: auto">레시피번호</label>
                		<input type="text" class="name_input"
               			   style="margin-bottom: 10px; width: 400px" id="recipeno"
              			   name="recipeno" value="${valuation.recipeno}"/>
        				</div>
        				
        				<div class="name">
           				<label for="point" style="width: 120px; margin: auto">평점</label>
           				<input type="text" class="name_input"
              			   	   style="margin-bottom: 10px; width: 400px" id="point"
              			      name="point" value="${valuation.point}"/>
        				</div>
        	
        				<div class="name">
           				<label for="comments" style="width: 120px; margin: auto">내용</label>
           				<input type="text" class="name_input"
              			   	   style="margin-bottom: 10px; width: 400px" id="comments"
              			      name="comments" value="${valuation.comments}"/>
        				</div>
        				
        				<div class="name">
           				<label for="memberid" style="width: 120px; margin: auto">작성자</label>
           				<input type="text" class="name_input"
              			   	   style="margin-bottom: 10px; width: 400px" id="memberid"
              			      name="memberid" value="${valuation.memberid}"/>
        				</div>
        				
        				<div class="name">
           				<label for="regDate" style="width: 120px; margin: auto">작성날짜</label>
           				<input type="text" class="name_input"
              			   	   style="margin-bottom: 10px; width: 400px" id="regDate"
              			      name="regDate" value="${valuation.regDate}"/>
        				</div>
        				
        	      			
        			<!-- /.box-body -->   
        			
        			<div class="box-footer">						
						<input type="submit" value="규제" onclick='btn_click("valuationRestrict");'>
						<input type="submit" value="삭제" onclick='btn_click("valuationDelete");'>
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