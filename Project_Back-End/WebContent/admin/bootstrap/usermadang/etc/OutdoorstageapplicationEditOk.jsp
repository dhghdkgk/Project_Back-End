
<%@page import="model.outer.OuterDao"%>
<%@page import="model.outer.OuterDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//1]한글처리
	request.setCharacterEncoding("UTF-8");
	//2]파라미터 받기
	String no = request.getParameter("no");	
	String nowPage = request.getParameter("nowPage");
	String concertname = request.getParameter("concertname");
	String name = request.getParameter("name");
	String number = request.getParameter("number");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String tel = tel1 + "-"+tel2+"-"+tel3;
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1 + "@" + email2;
	String content = request.getParameter("content");
	String progress = request.getParameter("progress");
	String equipment = request.getParameter("equipment");
	String profile = request.getParameter("profile");
	String outer_request = request.getParameter("outer_request");
	String date = request.getParameter("date");

	
	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	OuterDto dto = new OuterDto();
	dto.setOuter_no(Integer.parseInt(no));
	dto.setOuter_concertname(concertname);
	dto.setOuter_name(name);
	dto.setOuter_number(Integer.parseInt(number));
	dto.setOuter_tel(tel);
	dto.setOuter_email(email);
	dto.setOuter_content(content);
	dto.setOuter_progress(progress);
	dto.setOuter_equipment(equipment);
	dto.setOuter_profile(profile);
	dto.setOuter_request(outer_request);
	dto.setOuter_date(date);

	OuterDao dao = new OuterDao(application);
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

