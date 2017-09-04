


<%@page import="model.qa.QaDAO"%>
<%@page import="model.qa.QaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1]한글처리
	request.setCharacterEncoding("UTF-8");
	//2]파라미터 받기
	String division =request.getParameter("division");


	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String tel = tel1 + "-"+tel2+"-"+tel3;
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1 + "@" + email2;
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String file = request.getParameter("file");
 	String name = request.getParameter("name");

	String id      = session.getAttribute("USER_ID").toString();	
	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	QaDTO dto = new QaDTO();
	dto.setQa_division(division);
	dto.setQa_email(email);
	dto.setQa_tel(tel);
	
	dto.setQa_title(title);
	dto.setQa_content(content);
	dto.setQa_file(file);
	dto.setMember_id(id);
	dto.setQa_name(name);

	//4]CRUD작업용 DAO계열 객체 생성
	QaDAO dao = new QaDAO(application);
	int affected = dao.insert(dto);
	dao.close();
	if(affected == 1){
		response.sendRedirect("Question.jsp");
	}
	else{%>
		<script>
			alert("입력 실패!!!");
			history.back();
		</script>
	<%}%>