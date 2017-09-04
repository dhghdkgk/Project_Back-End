
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="/admin/bootstrap/Common/IsMember.jsp"%> --%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>

    
    </script>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>국회도서관</title>
    


  </head>

  <body role="document">

    
    <!-- 고정된 네비바 -->
    <jsp:include page="/admin/bootstrap/template/top.jsp"></jsp:include>
    <!-- 고정 네비바 끝 -->


    <div class="container theme-showcase" role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
     <!--  <div class="jumbotron">
        <h1>메인 페이지</h1>
        
      </div> -->
      
      
     <!-- 실제 내용의 제목 표시 -->
      <div class="page-header">
        <h1>최신 등록된 글 5개 목록</h1>
      </div>
      <div style="width:100px;height:130px; border:2px black solid; background-color:#E6F0F0; 
		 text-align: center;
		 	border-radius:20px 20px 20px 20px;" >
			<span style="font-weight: bold;">관리자</span>
	<!--   <hr style="color:red;background-color:black;height:2px" width="80px"; align="center"  />		 
	 	 -->
		 
        
	</div>

<a href="<c:url value='/admin/bootstrap/usermadang/Logout.jsp'/>">로그아웃</a>
      <!-- 아래의 실제 내용 표시 -->
      <div>
         <h3>실제 내용입니다</h3>
         <h3>실제 내용입니다</h3>				
         <h3>실제 내용입니다</h3>
         <h3>실제 내용입니다</h3>
         <h3>실제 내용입니다</h3>
         <h3>실제 내용입니다</h3>
         <h3>실제 내용입니다</h3>
         <h3>실제 내용입니다</h3>
         <h3>실제 내용입니다</h3>
         <h3>실제 내용입니다</h3>
         <h3>실제 내용입니다</h3>
         <h3>실제 내용입니다</h3>
         <h3>실제 내용입니다</h3>
         <h3>실제 내용입니다</h3>
         <h3>실제 내용입니다</h3>
         <h3>실제 내용입니다</h3>
      </div>


    </div> <!-- /내용끝 -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" ></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script> 
  </body>
</html>