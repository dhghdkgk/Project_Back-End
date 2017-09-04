

<%@page import="model.otherbook.OtherBookDTO"%>
<%@page import="model.otherbook.OtherBookDAO"%>
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
OtherBookDAO dao = new OtherBookDAO(application);
//키값에 따른 레코드 하나 얻기]
OtherBookDTO dto=dao.selectOne(no);
dao.close();
%>

<body role="document">
	<!-- 고정된 네비바 -->
	<jsp:include page="/admin/bootstrap/template/top.jsp"></jsp:include>
	<!-- 고정 네비바 끝 -->
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
	<div class="container theme-showcase" role="main">




		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1>묻고 답하기 답변</h1>

		</div>
		&nbsp; &nbsp; &nbsp;<strong>관리자 답변 </strong>
		<h3></h3>
			<form action="ApplicationbookEditOk.jsp" method="post">
		<div class="col-md-6">
				<input type="hidden" name="no" value="<%=no%>" /> <input
					type="hidden" name="nowPage" value="<%=nowPage%>" />
				<table class="table table-striped">
					<tr>
						<th><span>신청일자</span></th>
						<td><%=dto.getOther_regidate() %></td>

						<th><span>신청자</span></th>
						<td><input type="text" name="requester"
							value="<%=dto.getOther_requester() %>" /></td>
					</tr>

					<tr>
						<th><span>이메일</span></th>
						<td><input type="text" name="email"
							value="<%=dto.getOther_email() %>" /></td>



						<th><span>연락처</span></th>
						<td><input type="text" name="tel"
							value="<%=dto.getOther_tel() %>" /></td>

					</tr>

				</table>
		</div>
		&nbsp;&nbsp;&nbsp;<strong>신청 자료 </strong>
		<div>

			<div class="col-md-6">
				<table class="table table-striped">
					<tr>
						<th><span>자료구분 </span></th>
						<td>
							<input type="text" name="data" value="<%=dto.getOther_data() %>" />
						</td>
					
					</tr>

					
					<tr>
						<th class="border_left"><span class="check" title="자료명"><label
								for="title">자료명</label></span></th>
						<td colspan="3" class="border_right"><input type="text"
							name="title" id="title" style="width: 93%;" maxlength="500"
							value="<%=dto.getOther_title() %>" /></td>
					</tr>

					<tr>
						<th class="border_left"><span class="check" title="저자"><label
								for="author">저자</label></span></th>
						<td><input type="text" name="writer" id="author"
							style="width: 95%;" maxlength="100"
							value="<%=dto.getOther_writer() %>" onfocus="inValue(this.id)" />
						</td>
						<th class="no_round"><span class="check" title="가격"><label
								for="amt">가격</label></span></th>

						<td class="border_right"><input type="text" name="amt"
							id="amt" style="width: 53%; text-align: right;" maxlength="10"
							value="<%=dto.getOther_price() %>" /> <label for="currencyDivCode" class="lab1">화폐단위</label>
							<select name="currencyDivCode" id="currencyDivCode"
							style="width: 150px">
							
						</select></td>
					</tr>
					

					<tr>
						<th class="border_left"><span class="check" title="발행처"><label
								for="publisher">발행처</label></span></th>
						<td><input type="text" name="issue" id="publisher"
							style="width: 95%;" maxlength="100"
							value="<%=dto.getOther_issue() %>" onfocus="inValue(this.id)" />
						</td>
						<th class="no_round"><span title="발행년"><label
								for="publisherYear">발행년</label></span></th>
						<td class="border_right"><input type="text"
							name="publisherYear" id="publisherYear" style="width: 95%;"
							maxlength="4" value="<%=dto.getOther_year() %>" /></td>
					</tr>

					<tr>
						<th class="border_left"><span title="ISBN"><label
								for="isbn">ISBN</label></span></th>
						<td><input type="text" name="isbn" id="isbn"
							style="width: 95%;" maxlength="50"
							value="<%=dto.getBook_isbn() %>" /></td>
						
					</tr>


			<tr>
				<td colspan="2">
					<a id="submit" class="btn btn-sm btn-primary">확인</a>
					<a id="list" class="btn btn-sm btn-primary">뒤로</a>
					</td>
				</tr>	
				</table>

			</div>

		</div>

		</form>
	</div>


	<!-- /내용끝 -->
</body>

</html>