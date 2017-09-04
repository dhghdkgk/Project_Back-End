

<%@page import="model.outer.OuterDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//1]파라미터 받기	
	String no      = request.getParameter("no");
	int nowPage      =Integer.parseInt(request.getParameter("nowPage"));	
	
	//2]CRUD작업용 DAO계열 객체 생성
	OuterDao dao = new OuterDao(application);
	int affected = dao.delete(no);	
	
	dao.close();
	if(affected == 1){
		request.setAttribute("SUC_FAIL", affected);
		request.setAttribute("nowPage", nowPage);
		pageContext.getRequest().getRequestDispatcher("Outer_Message.jsp").forward(request, response);
		
	}
	else{%>
		 <script>
			alert("삭제 실패!!!");
			history.back();
		</script> 
	<%}%>