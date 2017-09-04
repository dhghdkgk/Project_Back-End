<%@page import="model.notice.NoticeDao"%>
<%@page import="model.notice.NoticeDto"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- EditOk.jsp -->

<%
	//1]한글처리
	request.setCharacterEncoding("UTF-8");
	//2]파라미터 받기
	String no = request.getParameter("no");	
	String nowPage      = request.getParameter("nowPage");
	String title = request.getParameter("title");
	String dept_no = request.getParameter("dept_no");
	String file = request.getParameter("file");
	
	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	NoticeDto dto = new NoticeDto();
	dto.setNotice_no(Integer.parseInt(no));
	dto.setNotice_title(title);
	dto.setDept_no(Integer.parseInt(dept_no));
	dto.setNotice_file(file);
	
	//dto.setQa_dept(dept);
	//4]CRUD작업용 DAO계열 객체 생성s

	NoticeDao dao = new NoticeDao(application);
	 int affected = dao.update(dto);
	dao.close();
	if(affected == 1){
		request.setAttribute("nowPage",nowPage);
		request.setAttribute("SUC_FAIL", affected);
		request.setAttribute("WHERE","EDT");
	
		request.setAttribute("no",no);
		pageContext.getRequest().getRequestDispatcher("Notice_Message.jsp").forward(request, response);
	}
	else{ %>
	 <script>
			alert("수정 실패!!!");
			history.back();
		</script> 
	<% } %>