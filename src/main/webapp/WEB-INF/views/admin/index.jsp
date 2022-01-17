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
<link href="/resources/css/testbite-style.css" rel="stylesheet"
   type="text/css" media="all">

<style>
body {
   margin: auto;
}
h5 { text-align: left; }
</style>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
</head>

<body>


   <h5
      class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">관리자 페이지</h5>
      
      
      <div class="warp" style="width: 1000px; margin: auto">       
      <section class="tstbite-components my-4 my-md-5">
      
      
      
      <!-- <a href="/user/logout" class="btn btn-primary">로그아웃</a>-->
      

      <!-- <a href="/admin/getUserList" method="get">회원정보 수정</a> -->
      
      <c:if test="${login.memberId == 'meoka'}">
      <div class="row">   
            
                <!-- box1 -->                           
                  <div class="col-md-4" style="border:3px solid black; border-radius:10px; margin:5px; height: 250px; width:240px;">                     
                     <figcaption class="mt-2" style="margin-bottom:10px; padding-top: 50px; text-align:center">
                        <div class="w-100 float-left">
                           <div class="float-left">
                              <div class="fabrx-ratings has-rating rating">
                                 <input type="radio" id="radio1" name="rate1" value="1"
                                    checked="checked">
                              </div>
                           </div>
                        </div>
                        <img id="Icon" src="../resources/img/member2.png" width="64" height="64" viewBox="0 0 64 64" style="margin-top:2px;">
                        <p text-align="center" class="f-size-20 text-black d-block mt-1 font-weight-semibold"><a href="/admin/getUserList" font-size="21px;"> 회원 관리 </a></p>
                     </figcaption>
                    
                  </figure>
                  </div>

                  <!-- box2 -->
                    <div class="col-md-4" style="border:3px solid black; border-radius:10px; margin:5px; height: 250px; width:240px;">                     
                     <figcaption class="mt-2" style="margin-bottom:10px; padding-top: 60px; text-align:center">
                        <div class="w-100 float-left">
                           <div class="float-left">
                              <div class="fabrx-ratings has-rating rating">
                                 <input type="radio" id="radio1" name="rate1" value="1"
                                    checked="checked">
                              </div>
                           </div>
                        </div>
                        <img id="Icon" src="../resources/img/post.png" width="48" height="48" viewBox="0 0 64 64" style="margin-top:3px; margin-bottom:5px;">
                        <p text-align="center" class="f-size-20 text-black d-block mt-1 font-weight-semibold"><a href="/admin/getRecipeList" font-size="20px;"> 레시피목록 관리 </a></p>
                     </figcaption>
                     </figure>
                  </div>
                  
                  <!-- box3 -->
                  <div class="col-md-4" style="border:3px solid black; border-radius:10px; margin:5px; height: 250px; width:240px;" >
                  <figcaption class="mt-2" style="margin-bottom:10px; padding-top: 20px; text-align:center">
                           <div class="w-100 float-left" style="padding-top:5px">
                              <div class="float-left">
                                 <div class="fabrx-ratings has-rating rating">
                                 <input type="radio" id="radio1" name="rate1" value="1"
                                    checked="checked">
                              </div>
                           </div>
                           <img id="Icon" src="../resources/img/comment.png" width="48" height="48" viewBox="0 0 64 64" style="margin-top:40px; margin-bottom:5px;">
                           <p text-align="center" class="f-size-20 text-black d-block mt-1 font-weight-semibold" style="margin-bottom:30px"><a href="/admin/getValuationList" font-size="20px;"> 댓글 관리 </a></p>
                       </figcaption>
                     </figure>
                  </div>
                  
                  <!-- box4 -->
                    <div class="col-md-4" style="border:3px solid black; border-radius:10px; margin:5px; height: 250px; width:240px;" >
                  <figcaption class="mt-2" style="margin-bottom:10px; padding-top: 20px; text-align:center">
                           <div class="w-100 float-left" style="padding-top:5px">
                              <div class="float-left">
                                 <div class="fabrx-ratings has-rating rating">
                                 <input type="radio" id="radio1" name="rate1" value="1"
                                    checked="checked">
                              </div>
                           </div>
                           <img id="Icon" src="../resources/img/q&a.png" width="48" height="48" viewBox="0 0 64 64" style="margin-top:42px; margin-bottom:5px;">
                           <p text-align="center" class="f-size-20 text-black d-block mt-1 font-weight-semibold" style="margin-bottom:30px"><a href="/board/list" font-size="20px;"> Q&A 관리 </a></p>
                       </figcaption>
                     </figure>
                  </div>
                  
               </div>
            </section>

            <!-- lab end -->
			</div>
			</c:if>
			<c:if test="${empty login || login.memberId != 'meoka'}">
         		<p class="f-size-24 font-weight-regular" style="text-align:center">
         		관리자 페이지에 접속하려면 로그인하세요.</p>
      		</c:if>
			
      		
      


</body>

<%@include file="../include/footer.jsp"%>

</html>