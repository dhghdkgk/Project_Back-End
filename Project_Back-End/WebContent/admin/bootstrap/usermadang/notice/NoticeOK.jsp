
<%@page import="model.notice.NoticeDto"%>
<%@page import="model.notice.NoticeDao"%>

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

	//1]파라미터(키값) 받기
	String no = request.getParameter("no");

	//현재 페이지번호 받기
	String nowPage = request.getParameter("nowPage");
	//2]CRUD작업용 BbsDAO생성
	NoticeDao dao = new NoticeDao(application);
	//조회수 업데이트
	//dao.updateVisitCount(no);
	//상세보기용 메소드 호출	
	NoticeDto dto = dao.selectOne(no);
	
	

	//3]자원반납
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


		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1>공지사항(상세보기)</h1>
		</div>
		
		<div class="col-md-6">
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
			                   <%=dto.getNotice_title() %>                                                                                                                     
			                    </div>
			                </td>
			            </tr>
			            <tr>
			                <th scope="row">등록부서</th>
			                <td>
			                    <div class="box01">
			                       <%=dto.getDept_name() %>                 
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
										<span class="txt"><a href=""><%=dto.getNotice_file() %></a></span>
									</div>
													
								</div>
			                </td>
			            </tr>
			        </table>
		</div>


		<span style="text-align:right">
		<a href="<c:url value='Notice.jsp'/>"><button type="button" class="btn btn-sm btn-info">목록</button></a>
		</span>
		<span style="text-align:right">
		<a href="NoticeEdit.jsp?no=<%=dto.getNotice_no()%>&nowPage=<%=nowPage%>"><button type="button" class="btn btn-sm btn-info">수정</button></a>
		</span>
		

	</div>
	<!-- /내용끝 -->
</body>
</html>