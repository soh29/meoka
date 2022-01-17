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

<div class="box box-primary">
   <div class="box-header">
      <h5 class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">레시피 정보</h5>
   </div>
   
   <form name="frm2" method="post">   
   <div class="warp" style="width: 700px; margin: auto">
   
   <c:if test="${not empty show}">
   <p style="text-align: center;">
      <img src="${show}" class="w-100" style="width:320px!important"/>
   </p>
   </c:if>
   
   <div class="name">
    <label for="RECIPENO" style="width: 120px; margin: auto">레시피 번호</label>
    <input type="text" class="name_input"
           style="margin-bottom: 10px; width: 400px" id="RECIPENO"
           name="RECIPENO" value="${recipe.RECIPENO}" readonly/>
    </div>
    
    <div class="name">
    <label for="RECIPENAME" style="width: 120px; margin: auto">레시피 이름</label>
    <input type="text" class="name_input"
           style="margin-bottom: 10px; width: 400px" id="RECIPENAME"
           name="RECIPENAME" value="${recipe.RECIPENAME}"/>
    </div>
    
    <div class="name">
    <label for="INFO" style="width: 120px; margin: auto">요리정보</label>
    <label for="COOKINGTIME" style="width: 70px; margin: auto">조리시간</label>    
    <input type="text" class="name_input"
           style="margin-bottom: 10px; width: 325px" id="COOKINGTIME"
           name="COOKINGTIME" value="${recipe.COOKINGTIME}"/>
    </div>
    
    <div class="name">
    <label for="INFO" style="width: 120px; margin: auto"></label>
    <label for="RANK" style="width: 70px; margin: auto">수준</label>    
    <input type="text" class="name_input"
           style="margin-bottom: 10px; width: 325px" id="RANK"
           name="RANK" value="${recipe.RANK}"/>
    </div>
    
    <div class="name">
    <label for="INFO" style="width: 120px; margin: auto"></label>
    <label for="PORTION" style="width: 70px; margin: auto">양</label>    
    <input type="text" class="name_input"
           style="margin-bottom: 10px; width: 325px" id="PORTION"
           name="PORTION" value="${recipe.PORTION}"/>
    </div>
    
    <c:forEach items="${getUtensilList}" begin="0" end="0" var="UtensilVO">
    <div class="name">    
    <label for="INFO" style="width: 120px; margin: auto"></label>
    <label for="utensilName" style="width: 70px; margin: auto">도구</label>    
    <input type="text" class="name_input"
           style="margin-bottom: 10px; width: 325px" id="utensilName"
           name="utensilName" value="${UtensilVO.utensilName}"/>
    </div>
    </c:forEach>
    
    <c:forEach items="${getUtensilList}" begin="1" var="UtensilVO">
    <div class="name">    
    <label for="INFO" style="width: 120px; margin: auto"></label>
    <label for="utensilName2" style="width: 70px; margin: auto"></label>    
    <input type="text" class="name_input"
           style="margin-bottom: 10px; width: 325px" id="utensilName2"
           name="utensilName2" value="${UtensilVO.utensilName}"/>
    </div>
    </c:forEach>
    
    <c:forEach items="${getIngredientList}" begin="0" end="0" var="IngredientVO">
    <div class="name">    
    <label for="INFO" style="width: 120px; margin: auto"></label>
    <label for="ingredientName" style="width: 70px; margin: auto">재료</label>    
    <input type="text" class="name_input"
           style="margin-bottom: 10px; width: 325px" id="ingredientName"
           name="ingredientName" value="${IngredientVO.ingredientName}"/>
    </div>
    </c:forEach>
    
    <c:forEach items="${getIngredientList}" begin="1" var="IngredientVO">
    <div class="name">    
    <label for="INFO" style="width: 120px; margin: auto"></label>
    <label for="ingredientName" style="width: 70px; margin: auto"></label>    
    <input type="text" class="name_input"
           style="margin-bottom: 10px; width: 325px" id="ingredientName"
           name="ingredientName" value="${IngredientVO.ingredientName}"/>
    </div>
    </c:forEach>    
    
    <c:forEach items="${list}" begin="0" end="0" var="RecipeDetailVO">
    <div class="name">    
    <label for="INFO" style="width: 120px; margin: auto"></label>
    <label for="ingredientName" style="width: 70px; margin: auto">조리방법</label>    
    <input type="text" class="name_input"
           style="margin-bottom: 10px; width: 325px" id="ingredientName"
           name="ingredientName" value="${RecipeDetailVO.RECIPEDETAIL}"/>
    </div>
    </c:forEach>
    
    <c:forEach items="${list}" begin="1" var="RecipeDetailVO">
    <div class="name">    
    <label for="INFO" style="width: 120px; margin: auto"></label>
    <label for="ingredientName" style="width: 70px; margin: auto"></label>    
    <input type="text" class="name_input"
           style="margin-bottom: 10px; width: 325px" id="ingredientName"
           name="ingredientName" value="${RecipeDetailVO.RECIPEDETAIL}"/>
    </div>
    </c:forEach>   
       
    <div class="name">
    <label for="MEMBERID" style="width: 120px; margin: auto">작성자</label>
    <input type="text" class="name_input"
           style="margin-bottom: 10px; width: 400px" id="MEMBERID"
           name="MEMBERID" value="${recipe.MEMBERID}"/>
    </div>
    
    <div class="name">
    <label for="REGDATE" style="width: 120px; margin: auto">작성 날짜</label>
    <input type="text" class="name_input"
           style="margin-bottom: 10px; width: 400px" id="REGDATE"
           name="REGDATE" value="${recipe.REGDATE}"/>
    </div>
               
   <div class="warp" style="padding-left:400px; text-align:left; margin:15px;">
      <a href="/admin/delete?RECIPENO=${recipe.RECIPENO}"class="btn btn-primary">레시피 삭제</a>
   </div>         
                        
                        
            
               
                     
                        
            </section>
</body>

<%@include file="../include/footer.jsp"%>

</html>