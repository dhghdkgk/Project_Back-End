<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 여부 판단]
	if(session.getAttribute("USER_ID")==null &&session.getAttribute("USER_ID1")==null &&session.getAttribute("USER_ID2")==null ){
		out.println("<script>");
		out.println("<script>");
		out.println("location.replace('"+request.getContextPath()+"/admin/bootstrap/usermadang/login.jsp');");
		out.println("</script>");	
		
	}
%>