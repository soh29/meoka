<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0053)search-result.html -->
<html dir="ko" lang="UTF-8">
<head>
<link href="/resources/css/foodThemeList.css" rel="stylesheet"
   type="text/css" media="all">
<link href="/resources/css/recipeList.css" rel="stylesheet"
   type="text/css" media="all">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
body{
   font-family: 'Gowun Dodum', sans-serif;
}
.paging {
   text-align: center;
}

.paging a {
   display: inline-block;
   font-weight: bold;
   text-decoration: none;
   padding: 5px 8px;
   border: 1px solid #ccc;
   color: #f3f3f3;
   background-color: #ffc1ab;
   text-align: center;
}
/* 현재 페이징에 select 클래스를 적용한다*/
.paging a.select {
   color: #fff;
   background-color: #FFA7A7;
}
table {
border-width:2px;
}
</style>

<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<title>Tastebite - Search Result</title>

</head>
<body>

   <h1
      style="font-size: 40px; font-weight: 600; margin-top: 5%; margin-bottom: 5%; text-align: center;font-family: inter,sans-serif;"">
      THEME LIST</h1>

      
      <div class="container" style="text-align: center;">

            


      
   </div>
                <div class="search">
      <select name="searchType"style="border-radius:5px; border:1px solid gray;height:40px"; >
         <option value="n"
            <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
         <option value="t"
            <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>테마 이름</option>
         <option value="w"
            <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>테마 종류</option>
      </select> 

      <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" placeholder="Search" class="input-group search-box"/>

       <div class="button-8" id="searchBtn">
          <div class="eff-8"></div>
          <a href="#"> Search </a>
        </div>
        </div>
            <script>
         $(function() {
            $('#searchBtn').click(
                  function() {
                     self.location = "list"
                           + '${pageMaker.makeQuery(1)}'
                           + "&searchType="
                           + $("select option:selected").val()
                           + "&keyword="
                           + encodeURIComponent($('#keywordInput')
                                 .val());
                  });
         });
         
         
      </script>
             
             
             
             
             
             
            <div class="table-div">
            <table class="table table-bordered">
                  <tr>
                        <th>번호</th>
                        <th>이름</th>
                        <th>주제</th>
                        <th>삭제</th>
                  </tr>
         
            <c:forEach items="${list}" var="item">
                     <tr>
                        <td>${item.themeNo}</td>
                        <td>${item.themeName}</td>
                        <td>${item.themeType}</td>

                            <c:if test="${item.count == 0}">
                              <td>
                                 <a style="background-color: #FF642B;" href="/theme/delete?themeNo=${item.themeNo}"class="btn btn-primary px-5 btn-hover">테마 삭제</a>
                              </td>
                            </c:if>
                             <c:if test="${item.count != 0}">
                              <td>
                                 <a class="btn btn-primary px-5 btn-hover">삭제 불가</a>
                              </td>
                            </c:if>
                     </tr>
            </c:forEach>
            </table>
               
            </div>
               <div>
   </div>
      <div class="paging">
         <ul>
         <c:if test="${pageMaker.prev}">
            <a
               href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
         </c:if>

         <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
                     var="idx">
                     <a style="background-color:#ff642b; text-align: center;" href="list${pageMaker.makeSearch(idx)}">[${idx}]&nbsp;</a>
                  </c:forEach>

         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <a
               href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
         </c:if>
      </ul>
   </div>   
         



</body>

<%@include file="../include/footer.jsp"%>
</html>