
<%@page import="model.qa.QaDAO"%>
<%@page import="java.util.HashMap"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Delete.jsp -->
<%
	//1]파라미터 받기	
	String no      = request.getParameter("no");
	int nowPage      =Integer.parseInt(request.getParameter("nowPage"));	
	//2]CRUD작업용 DAO계열 객체 생성
	QaDAO dao = new QaDAO(application);
	int affected = dao.delete(no);	
	
	int totalCount=dao.getTotalRecordCount(new HashMap());
	int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	int totalPage=(int)Math.ceil((double)totalCount/pageSize);
	
	if(nowPage > totalPage){
		nowPage = totalPage;
	}
	dao.close();
	if(affected == 1){
		request.setAttribute("SUC_FAIL", affected);
		request.setAttribute("nowPage", nowPage);
		pageContext.getRequest().getRequestDispatcher("Message.jsp").forward(request, response);
		
	}
	else{%>
		 <script>
			alert("삭제 실패!!!");
			history.back();
		</script> 
	<%}%>