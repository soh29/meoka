<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../include/header.jsp"%>

<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Q&A PAGE</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
   rel="stylesheet">


   

<style>
body {
   font-family: 'Gowun Dodum', sans-serif;
}
table {
   width:100%;
   table-layout:fixed;
}
th:first-child, th:last-child {
   width:24%;
}

th {
   background-color: #ff80c0
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
</style>

</head>
<body>

<h5
      class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">Q&A PAGE </h5>



<form>
		<div class="input-group custom-input-group pl-0 pl-lg-5"
         style="padding-left: 0px;">


      



         <select class="form-control border"
            style="height: 50px; width: 100px;" name="searchOption">
            <option value="title"
               <c:out value="${map.searchOption == 'title'?'selected':'' }"/>>Title</option>
            <option value="writer"
               <c:out value="${map.searchOption == 'writer'?'selected':'' }"/>>Writer</option>
            <option value="content"
               <c:out value="${map.searchOption == 'content'?'selected':'' }"/>>Content</option>
            <option value="all"
               <c:out value="${map.searchOption == 'all'?'selected':'' }"/>>All</option>
         </select> <input name="keyword" class="form-control border"
            style="height: 50px; width: 400px; margin-left: 2%;"
            placeholder="입력하세요" value="${map.keyword }">
         <button class="btn btn-primary" type="submit"
            style="margin-left: 1%; margin-right: 2%; width: 90px;">검색</button>
         <br/ >
      </div>



   </form>
   <br />
   <br />



   <table class="table table-bordered"   border="1">
      <thead>
         <br />
         <br />
         <tr>
            <th style="background-color: #ffc1ab">번호</th>
            <th style="background-color: #ffc1ab">이름</th>
            <th style="width: 300px; background-color: #ffc1ab">제목</th>
            <th style="background-color: #ffc1ab">조회</th>
            <th style="width: 150px; background-color: #ffc1ab">작성일</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach var="item" items="${map.list}">
            <tr>
               <td>${item.bno}</td>
               <td>${item.writer}</td>
               <td style=><c:if test="${item.depth > 0}">
                     <span style="padding-left:${item.depth * 15}px">┖</span>
                  </c:if> <a href="/board/readPage?bno=${item.bno}"
                  style="text-decoration: none; color: black;"> ${item.title}
                     [${item.commentcnt }]</a></td>
               <td>${item.viewcnt}</td>
               <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                     value="${item.regdate}" /></td>
            </tr>
         </c:forEach>
      </tbody>
   </table>

   <br>

   <form>
   




      <!-- lab begin -->
      <c:if test="${not empty login}">
         <button class="btn btn-primary" type="button"
            style="width: 90px; border-radius: 0; float: right;"
            onclick="location.href='/board/register'">글작성</button>
      </c:if>

      <c:if test="${empty login}">
         <button class="btn btn-primary" type="button"
            style="width: 90px; border-radius: 0; float: right;"
            onclick="location.href='/board/list'">글작성</button>

      </c:if>
      <!-- lab end -->
      <div style="width: 12px; margin: auto; display: block; 
   
   
   color: #f3f3f3;
   background-color: #ffc1ab">
         <c:if test="${paging.startPage != 1 }">
            <a
               href="/board/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">&lt;</a>
         </c:if>
         <c:forEach begin="${paging.startPage }" end="${paging.endPage }"
            var="p">
            <c:choose>
               <c:when test="${p == paging.nowPage}">
               <a style="background-color:#ff642b; font-weight:bold;">[${p}]&nbsp;</a>
               </c:when>
               <c:when test="${p != paging.nowPage}">
                  <a
                     href="/board/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${p }</a>
               </c:when>
            </c:choose>
         </c:forEach>
         <c:if test="${paging.endPage != paging.lastPage}">
            <a
               href="/board/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">&gt;</a>
         </c:if>
      </div>

      <div></div>
   </form>

   <button class="accordion">자주 묻는 질문1</button>
   <div class="panel">
      <p>재료가 상했는지 확인 부탁드립니다</p>
   </div>

   <button class="accordion">자주 묻는 질문2</button>
   <div class="panel">
      <p>어떤 조리기구가 더 나을까요</p>
   </div>

   <button class="accordion">자주 묻는 질문3</button>
   <div class="panel">
      <p>알레르기 유발 재료를 알려주세요</p>


   </div>
   <br>
</body>

<%@include file="../include/footer.jsp"%>
</html>