



<%@page import="model.qa.QaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!-- LoginProcess.jsp -->
<%

	//사용자 입력값 받기]
	String user = request.getParameter("user").trim();
	String pass = request.getParameter("pass").trim();
	
	QaDAO dao = new QaDAO(application);
	
	boolean flag = dao.isMember(user, pass);
	dao.close();
	if(flag){	
		//1.로그인 처리]-세션영역에 속성 저장
		session.setAttribute("USER_ID",user);
		session.setAttribute("USER_PWD",pass);
		//2.로그인 처리후 마이 페이지로 이동]
		
		 response.sendRedirect(request.getContextPath()+"/index.jsp"); 
	}
		
	else{//비회원-다시 로그인 페이지로 포워드
	
		out.println("<script>");
		out.println("alert('아뒤와 비번 불일치');");
		out.println("history.back();");
		out.println("</script>");
	
	
	}
		
				
	
	
%>