<%@page import="model.otherbook.OtherBookDAO"%>
<%@page import="model.otherbook.OtherBookDTO"%>
<%@page import="java.sql.Date"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- EditOk.jsp -->

<%
	//1]한글처리
	request.setCharacterEncoding("UTF-8");
	//2]파라미터 받기
	String requester = request.getParameter("requester");
	String email = request.getParameter("email");
	String no = request.getParameter("no");	
	String nowPage      = request.getParameter("nowPage");
	String tel = request.getParameter("tel");
	String data = request.getParameter("data");
	String writer = request.getParameter("writer");
	String issue = request.getParameter("issue");
	String isbn = request.getParameter("isbn");
	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	OtherBookDTO dto = new OtherBookDTO();
	dto.setOther_requester(requester);
	dto.setOther_tel(tel);
	dto.setOther_email(email);
	dto.setOther_writer(writer);
	dto.setOther_issue(issue);
	dto.setBook_isbn(isbn);
	dto.setOther_no(Integer.parseInt(no));
	dto.setOther_data(data);
	

	OtherBookDAO dao = new OtherBookDAO(application);
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