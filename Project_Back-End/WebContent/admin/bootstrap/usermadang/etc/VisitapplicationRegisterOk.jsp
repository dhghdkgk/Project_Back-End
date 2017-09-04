<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.VisitDao"%>
<%@page import="model.VisitDto"%>
<%@page import="model.OuterDto"%>
<%@page import="model.OuterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	//1]한글처리
	request.setCharacterEncoding("UTF-8");
	//2]파라미터 받기
	String visit_name = request.getParameter("visit_name");	
	String visit_register = request.getParameter("visit_register");
	String visit_tel = request.getParameter("visit_tel");
	String visit_tel1 = request.getParameter("visit_tel1");
	String visit_tel2 = request.getParameter("visit_tel2");
	String tel = visit_tel+"-"+visit_tel1+"-"+visit_tel2;
	String visit_email = request.getParameter("visit_email");
	String visit_email1 = request.getParameter("visit_email1");
	String email = visit_email+"@"+visit_email1;
	String visit_division = request.getParameter("visit_division");
	String visit_number = request.getParameter("visit_number");
	String visit_date = request.getParameter("visit_date");
	String visit_content = request.getParameter("visit_content");
	String visit_regidate = request.getParameter("visit_regidate");
	
																
	
	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	VisitDto dto = new VisitDto();
	dto.setVisit_name(visit_name);
	dto.setVisit_register(visit_register);
	dto.setVisit_tel(tel);
	dto.setVisit_email(email);
	dto.setVisit_division(visit_division);
	dto.setVisit_number(Integer.parseInt(visit_number));
	dto.setVisit_date(visit_date);
	dto.setVisit_content(visit_content);
	dto.setVisit_regidate(visit_regidate);
											
	
	VisitDao dao = new VisitDao(application);
	int affected = dao.update(dto);
	dao.close();
	if(affected == 1){
		request.setAttribute("nowPage",nowPage);
		request.setAttribute("SUC_FAIL", affected);
		request.setAttribute("WHERE","EDT");
		request.setAttribute("no",no);
		pageContext.getRequest().getRequestDispatcher("Outer_Message.jsp").forward(request, response);
	}
	else{ %>
	 <script>
			alert("수정 실패!!!");
			history.back();
		</script> 
	<% } %>
	
	
	
	
	

