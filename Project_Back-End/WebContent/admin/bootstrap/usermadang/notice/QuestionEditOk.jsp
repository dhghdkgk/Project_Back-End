

<%@page import="model.qa.QaDAO"%>
<%@page import="model.qa.QaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- EditOk.jsp -->

<%
	//1]한글처리
	request.setCharacterEncoding("UTF-8");
	//2]파라미터 받기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String no = request.getParameter("no");	
	String nowPage      = request.getParameter("nowPage");
	String dept = request.getParameter("dept");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");

	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	QaDTO dto = new QaDTO();
	dto.setQa_no(Integer.parseInt(no));	
	dto.setQa_title(title);
	dto.setQa_content(content);
	dto.setQa_tel(tel);
	dto.setQa_email(email);
	//dto.setQa_dept(dept);
	//4]CRUD작업용 DAO계열 객체 생성s

	QaDAO dao = new QaDAO(application);
	 int affected = dao.update(dto);
	dao.close();
	if(affected == 1){
		request.setAttribute("nowPage",nowPage);
		request.setAttribute("SUC_FAIL", affected);
		request.setAttribute("WHERE","EDT");
	
		request.setAttribute("no",no);
		pageContext.getRequest().getRequestDispatcher("Message.jsp").forward(request, response);
	}
	else{ %>
	 <script>
			alert("수정 실패!!!");
			history.back();
		</script> 
	<% } %>