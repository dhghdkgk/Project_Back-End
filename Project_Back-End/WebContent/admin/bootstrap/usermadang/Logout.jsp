<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Logout.jsp -->
<%
	//로그아웃 처리-]-세션영역에 저장된 속성 삭제
	//방법1]
 	if(session.getAttribute("USER_ID")!= null){
		session.removeAttribute("USER_ID");
		session.removeAttribute("USER_PWD");
	} 	
 		
 	else if(session.getAttribute("USER_ID1")!= null){
		session.removeAttribute("USER_ID1");
		session.removeAttribute("USER_PWD1");
	}
	

 	else if(session.getAttribute("USER_ID2")!= null){
		session.removeAttribute("USER_ID2");
		session.removeAttribute("USER_PWD2");
	} 	
	
 	
		request.getRequestDispatcher("login.jsp").forward(request,response);
 
	//방법2]
	//session.invalidate();
	//로그아웃 처리후 로그인 페이지로 이동]
	
%>