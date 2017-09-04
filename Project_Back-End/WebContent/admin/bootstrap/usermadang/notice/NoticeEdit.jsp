
<%@page import="model.notice.NoticeDto"%>
<%@page import="model.notice.NoticeDao"%>
<%@page import="java.util.List"%>

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
<title>20/30 공지사항(상세보기)</title>


</head>
<%
String no = request.getParameter("no");
String nowPage = request.getParameter("nowPage");
//CRUD작업용 객체 생성]
NoticeDao dao = new NoticeDao(application);
//키값에 따른 레코드 하나 얻기]
NoticeDto dto=dao.selectOne(no);
List<NoticeDto> records = dao.selectname();
dao.close();
%>


<body role="document">
	<!-- 고정된 네비바 -->
	<jsp:include page="/admin/bootstrap/template/top.jsp"></jsp:include>
	<!-- 고정 네비바 끝 -->

	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<!--  <div class="jumbotron">
        <h1>회원 관리 페이지</h1>
        
      </div> -->

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
			<h1>공지사항(상세보기)</h1>
		</div>
		
		<div class="col-md-6">
		<form action="NoticeEditOk.jsp" method="post">
				<input type="hidden" name="no" value="<%=no%>"/> 
				<input type="hidden" name="nowPage" value="<%=nowPage%>" />
		<table class="table table-striped" summary="공지사항 상세화면으로 제목, 등록부서, 등록일, 첨부파일로 구성">
		            <colgroup>
						<col style="width:16%;" />
						<col style="width:48%;" />
						<col style="width:16%;" />
						<col style="width:20%;" />
		            </colgroup>
			            <tr>
			                <th scope="row">제목</th>
			                <td colspan="3">
			                    <div class="box01">   
			                    <input type="text" name="title"
								value="<%=dto.getNotice_title()%>" />                                                                                                     
			                    </div>
			                </td>
			            </tr>
			            <tr>
			                <th scope="row">등록부서</th>
			                
			            
			                <td>
			                    <div class="box01">
			                    	<select name="dept_no">
			                    		<%
			                    			int count = 1; 
											for (NoticeDto record : records) {
										%>
		                    				<option value="<%=count %>">
			                    			<%=record.getDept_name() %>
			                    			</option>
		                    			<%
		                    					count++;
		                    				} 
		                    			%>
			                    	</select>
			                    <%-- <input type="text" name="dept_no"value="<%=dto.getDept_name()%>" /> --%>               
			                    </div>
			                </td>
			                <th scope="row">등록일</th>
			                <td>
			                    <div class="box01">
			                    <%=dto.getNotice_regidate() %>   
			                    </div>
			                </td>

			            </tr>
			            <tr>
			            
			                <th scope="row"><span class="txt">첨부파일</span></th>
			                <td colspan="3">
			                    <div class="box00">	
											
									<div class="pdf">
										<span class="pdfImg"><img src="<c:url value='/Images/icon_pdf.png'/>" alt="pdf" /></span>
										<span class="txt">
										<input type="text" name="file"
										value="<%=dto.getNotice_file()%>" />
										</span>
									</div>
													
								</div>
			                </td>
			            </tr>
			            <tr>
						<td colspan="2">
						<a id="submit" class="btn btn-sm btn-primary">확인</a>
						<a id="list" class="btn btn-sm btn-primary">뒤로</a>
						</td>
				</tr>
			        </table>
			        </form>
		</div>

		<%-- <div align="right">
		<a href="<c:url value='Notice.jsp'/>"><button type="button" class="btn btn-sm btn-info">확인</button></a>
		</div> --%>


	</div>
	<!-- /내용끝 -->
</body>
</html>