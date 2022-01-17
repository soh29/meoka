<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@include file="../include/header.jsp"%>

<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Q&A PAGE</title>
<link href="/resources/css/swiper-bundle.min.css" rel="stylesheet"
	type="text/css" media="all">
<link href="/resources/css/tastebite-styles.css" rel="stylesheet"
	type="text/css" media="all">

<style>
body {
	margin: auto;
	font-family: 'Gowun Dodum', sans-serif;
}
</style>	

</head>
<body>

            <h5 class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">${login.name}</h5>

            <!-- lab begin -->
            <div class="warp" style="width: 1000px; margin: auto">
            <section class="tstbite-components my-4 my-md-5">

            <div class="row" style="margin-left:120px;">  

               <!-- box1 -->                           
                  <div class="col-md-4" style="border:3px solid black; border-radius:10px; margin:5px; height: 250px; width:240px;">                     
                     <figcaption class="mt-2" style="margin-bottom:10px; padding-top: 10px; text-align:center">
                        <div class="w-100 float-left">
                           <div class="float-left">
                              <div class="fabrx-ratings has-rating rating">
                                 <input type="radio" id="radio1" name="rate1" value="1"
                                    checked="checked">
                              </div>
                           </div>
                        </div>
                        <img id="Icon" src="../resources/img/member.png" width="64" height="64" viewBox="0 0 64 64">
                        <p text-align="center" class="f-size-20 text-black d-block mt-1 font-weight-semibold"> 정보관리 </p>
                     </figcaption>
                      <style>
                     ul.checkmark {
  						list-style: none;
					}
                     ul.checkmark  li:before {
  						content: '✓';
  						margin-right:10px;
					}
					</style>
	                  <ul class="checkmark" style="padding-left:40px; margin-top:28px">
                        <li><a href="/user/modify" method="get">회원정보 수정</a></li>
                        <li><a href="/user/delete" method="get">회원탈퇴</a></li>
                        <li><a href="/user/logout" method="get">로그아웃</a></li>
					</ul>
                  </figure>
                  </div>

                    <!-- box2 -->
                    <div class="col-md-4" style="border:3px solid black; border-radius:10px; margin:5px; height: 250px; width:240px;">                     
                     <figcaption class="mt-2" style="margin-bottom:10px; padding-top: 20px; text-align:center">
                        <div class="w-100 float-left">
                           <div class="float-left">
                              <div class="fabrx-ratings has-rating rating">
                                 <input type="radio" id="radio1" name="rate1" value="1"
                                    checked="checked">
                              </div>
                           </div>
                        </div>
                        <img id="Icon" src="../resources/img/star.png" width="48" height="48" viewBox="0 0 64 64">
                        <p text-align="center" class="f-size-20 text-black d-block mt-1 font-weight-semibold"> 즐겨찾기 </p>
                     </figcaption>
                     <ul class="checkmark" style="padding-left:28px; margin-top:33px">
                        <li><a href="#" method="get">즐겨찾는 레시피</a></li>
                        <li><a href="#" method="get">즐겨찾는 작성자</a></li>
                        </ul>
                     </figure>
                  </div>
                  
                    <!-- box3 -->
                  <div class="col-md-4" style="border:3px solid black; border-radius:10px; margin:5px; height: 250px; width:240px;" >
                  <figcaption class="mt-2" style="margin-bottom:10px; padding-top: 15px; text-align:center">
                           <div class="w-100 float-left" style="padding-top:5px">
                              <div class="float-left">
                                 <div class="fabrx-ratings has-rating rating">
                                 <input type="radio" id="radio1" name="rate1" value="1"
                                    checked="checked">
                              </div>
                           </div>
                           <img id="Icon" src="../resources/img/todo.png" width="48" height="48" viewBox="0 0 64 64">
                           <p text-align="center" class="f-size-20 text-black d-block mt-1 font-weight-semibold" style="margin-bottom:30px"> 나의활동 </p>
                       </figcaption>
                       <ul class="checkmark" style="padding-left:28px">
                        <li><a href="/user/myValuationList" method="get">작성한 후기</a></li>
                        <li><a href="/user/myRecipeList" method="get">작성한 레시피</a></li>
                        </ul>
                     </figure>
                  </div>
                  
                  
                  
               </div>
            </section>

            <!-- lab end -->

<%@include file="../include/footer.jsp"%>

</html>