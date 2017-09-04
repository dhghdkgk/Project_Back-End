
<%@page import="model.qa.QaDTO"%>
<%@page import="model.qa.QaDAO"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>20/30 회원 관리 페이지</title>

<style>
search {
	padding-bottom: 9px;
	border-bottom: 1px solid #eee;
}
</style>
</head>
<%
String no = request.getParameter("no");
String nowPage = request.getParameter("nowPage");
//CRUD작업용 객체 생성]
QaDAO dao = new QaDAO(application);
//키값에 따른 레코드 하나 얻기]
QaDTO dto=dao.selectOne(no);
dao.close();
%>

<body role="document">
	<!-- 고정된 네비바 -->
	<jsp:include page="/admin/bootstrap/template/top.jsp"></jsp:include>
	<!-- 고정 네비바 끝 -->

	<div class="container theme-showcase" role="main">
<script>
	$(function(){

		$("a").click(function(){
			if(this.id == "list"){
				history.back();
			} else {
				$(this).parents("form").submit();
			}
		});
	});
</script>



		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1>묻고 답하기 답변</h1>

		</div>
		&nbsp; &nbsp; &nbsp;<strong>관리자 답변 </strong>
		<h3></h3>

		<div class="col-md-6">
			<form action="QuestionEditOk.jsp" method="post">
				<input type="hidden" name="no" value="<%=no%>"/> 
				<input type="hidden" name="nowPage" value="<%=nowPage%>" />
				<table class="table table-striped">
					<tr class="search" style="font-weight: normal;">
						<td style= "width: 20%;">제목</td>
						<td style="width: 50%;"><input type="text" name="title"
							value="<%=dto.getQa_title()%>" />
						<td>
						<td>전화번호</td>
						<td ><input type="text" name="tel"
							value="<%=dto.getQa_tel()%>" />
						<td>
					</tr>
					<tr class="search" style="font-weight: normal;">
						<td>담당부서</td>
						<td>
						<input type="text" name="dept"
							value="" />
						<td>
							<td>E-mail</td>
						<td ><input type="text" name="email"
							value="<%=dto.getQa_email()%>" />
						<td>
					</tr>


					<tr class="search" style="font-weight: normal;">
						<td>질문자 내용</td>
						<td><textarea rows="8" style="width: 98%" name="content"><%=dto.getQa_content().replace("\r\n", "<br/>") %></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							 
							 <a id="submit" class="btn btn-sm btn-primary">확인</a>
							 <a id="list" class="btn btn-sm btn-primary">뒤로</a>
							 
						</td>
					</tr>
				</table>
				<div style="text-align: center"></div>
			</form>
		</div>
	</div>


	<!-- /내용끝 -->
</body>

</html>