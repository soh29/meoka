<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Join PAGE</title>
<link href="/resources/css/swiper-bundle.min.css" rel="stylesheet"
	type="text/css" media="all">
<link href="/resources/css/tastebite-styles.css" rel="stylesheet"
	type="text/css" media="all">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script type="text/javascript">
function fn_idChk(){
   $.ajax({
      url : "/user/idChk",
      type : "post",
      dataType : "json",
      data : {"memberId" : $("#memberId").val()},
      success : function(data){
         if(data == 0){
            $("#idChk").attr("value", "Y");
            alert("사용가능한 아이디입니다.");
         }else{
            alert("중복된 아이디입니다.");
         }
      }
   })
}
</script>
</head>

         <div class="tstbite-components mb-5 pb-4">
            <h5
               class="border-bottom pt-md-5 pb-4 mb-5 font-weight-semibold inter-font">회원가입</h5>
            <form action="join" method="post">
               <div class="warp" style="width: 500px; margin: auto">
                  <div class="subject"></div>
                  <div class="id_wrap">
                     <div class="name">이름</div>
                     <div class="name_input_box">
                        <input class="name_input" name="name" maxlength="20">
					 </div>
                        
                           <div class="id_name">아이디</div>
                           <div class="id_input_box">
                              <input class="id_input" id="memberId" name="memberId" maxlength="20">
                              <button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
                           </div>
                         

                           
                              <div class="pw_name">비밀번호</div>
                              <div class="id_input_box">
                                 <input type="password" class="id_input" name="password"
                                    maxlength="15">
                              </div>

                              
                                 <div class="pw_name">비밀번호 확인</div>
                                 <div class="id_input_box">
                                    <input type="password" class="id_input"
                                       name="confirmPassword" maxlength="15">
                                 </div>

                                 
                                    <div class="email_name">이메일</div>
                                    <div class="id_input_box">
                                       <input class="id_input" name="email" maxlength="30">@
                                       <select name="email2">
                                          <option>naver.com</option>
                                          <option>daum.net</option>
                                          <option>gmail.com</option>
                                       </select>
                                    </div>

                                    
                                       <div class="phoneNo">핸드폰번호</div>
                                       <div class="id_input_box">
                                          <input type="text" class="id_input" name="phoneNo" />
                                       </div>

                                    </div>
                                    
                                    <button type="submit" class="btn btn-primary"
                                       style="margin: 20px 0px 20px 20px; float: right">등록</button>
            </form>

         </div>
      </div>
      </div>
      
<%@include file="../include/footer.jsp"%>

</html>