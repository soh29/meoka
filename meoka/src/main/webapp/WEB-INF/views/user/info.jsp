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
}
</style>	

</head>
<body>

            <a href="/user/logout" class="btn btn-primary">로그아웃</a>

            <!-- lab begin -->
            <section class="tstbite-components my-4 my-md-5">

               <!-- box1 -->
               <div class="row">
                  <div class="col-md-4" style="border:2px solid green; border-radius:10px; margin:5px; height: 160px; width:200px; padding-left:30px">
                     <a href="#0" class="tstbite-animation rounded-6"></a>
                     <figcaption class="mt-2" style="margin-bottom:10px; padding-top: 10px;">
                        <div class="w-100 float-left">
                           <div class="float-left">
                              <div class="fabrx-ratings has-rating rating">
                                 <input type="radio" id="radio1" name="rate1" value="1"
                                    checked="checked">
                              </div>
                           </div>
                        </div>
                        <a href="#0"
                           class="f-size-20 text-black d-block mt-1 font-weight-semibold">[정보관리]</a>
                     </figcaption>
                        <li><a href="/user/modify" method="get">회원정보 수정</a></li>
                        <li><a href="/user/delete" method="get">회원탈퇴</a></li>

                  </figure>
                  </div>

                  <!-- box2 -->
                    <div class="col-md-4" style="border:2px solid green; border-radius:10px; margin:5px; height: 160px; width:200px; padding-left:30px">
                     <figure class="my-3 tstbite-card">
                        <figcaption class="mt-2" style="margin-bottom:10px; padding-top: 3px;">
                           <div class="w-100 float-left">
                              <div class="float-left"></div>
                           </div>
                           <a href="#0"
                              class="f-size-20 text-black d-block mt-1 font-weight-semibold">[즐겨찾기]</a>
                        </figcaption>
                        <li><a href="/user/modify" method="get">즐겨찾는 레시피</a></li>
                        <li><a href="#" method="get">즐겨찾는 작성자</a></li>
                     </figure>
                  </div>
                  
                  <!-- box3 -->
                  <div class="col-md-4" style="border:2px solid green; border-radius:10px; margin:5px; height: 160px; width:200px; padding-left:30px" >
                     <figure class="my-3 tstbite-card">
                        <figcaption class="mt-2" style="margin-bottom:10px; padding-top: 3px;">
                           <div class="w-100 float-left">
                              <div class="float-left">
                                 <div class="fabrx-ratings has-rating rating"></div>
                              </div>
                           </div>
                           <a href="#0"
                              class="f-size-20 text-black d-block mt-1 font-weight-semibold">[나의 활동]</a>
                        </figcaption>
                        <li><a href="/user/modify" method="get">작성한 후기</a></li>
                        <li><a href="#" method="get">최근 본 레시피</a></li>
                     </figure>
                  </div>
                  
                  <!-- box4 -->
                    <div class="col-md-4" style="border:2px solid green; border-radius:10px; margin:5px; height: 160px; width:200px; padding-left:30px">
                     <figure class="my-3 tstbite-card" >
                        <figcaption class="mt-2" style="margin-bottom:10px; padding-top: 3px;">
                           <div class="w-100 float-left">
                              <div class="float-left"></div>
                           </div>
                           <a href="#0"
                              class="f-size-20 text-black d-block mt-1 font-weight-semibold">[]</a>
                        </figcaption>
                        <li><a href="/user/modify" method="get"></a></li>
                        <li><a href="#" method="get"></a></li>
                     </figure>
                  </div>
                  
               </div>
            </section>

            <!-- lab end -->

<%@include file="../include/footer.jsp"%>

</html>