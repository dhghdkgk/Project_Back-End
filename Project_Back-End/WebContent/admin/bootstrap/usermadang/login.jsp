<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
   
    <title>관리자 로그인 페이지</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- Custom styles for this template -->
    <link href="<c:url value='/admin/bootstrap/css/signin.css' />" rel="stylesheet">
   
  </head>

  <body>

    <div class="container">
 	
      <form class="form-signin" method="post" action="LoginProcess.jsp">
        <h2 class="form-signin-heading">관리자 로그인 </h2>
         <input type="text" name="user"  class="form-control" placeholder="아이디" value='<%=request.getParameter("user")==null ? "" :request.getParameter("user") %>'/>
		 <input type="password" name="pass"  class="form-control"placeholder="비밀번호" value='<%=request.getParameter("pass")==null ? "" :request.getParameter("pass") %>'/>
     	
     	
       <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 아이디 저장
          </label>
        </div>
         <button id="" class="btn btn-lg btn-primary btn-block" type="submit">로그인</button> 
       
      </form>

    </div> <!-- /container -->
  </body>
</html>
    