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
<title>20/30 금주의 서평</title>


</head>
<%-- <%

	//1]파라미터(키값) 받기
	String no = request.getParameter("no");

	//현재 페이지번호 받기
	String nowPage = request.getParameter("nowPage");
	//2]CRUD작업용 BbsDAO생성
	ReCommendDAO dao = new ReCommendDAO(application);
	//조회수 업데이트


	//상세보기용 메소드 호출	
	//BookDTO dto = dao.selectOne(no);
	
	//이전글/다음글 조회
	//Map<String,BookDTO> map = dao.prevNnext(no);
	
	

	//3]자원반납
	dao.close();
%> --%>

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
			<h1>금주의 서평(상세보기)</h1>
		</div>

		<div class="body">
			<!-- 여기서부터 콘텐츠 s -->
			<div class="bodyBox001">
				<table class="table table-striped">
					<colgroup>
						<col style="width: 15%;" />
						<col style="width: 35%;" />
						<col style="width: 16%;" />
						<col style="width: 34%;" />
					</colgroup>
					<tr>
						<th scope="row">서평</th>
						<td colspan="3">
							<div class="box01">인간을 위한 노동자, 디지털 노마드</div>
						</td>
					</tr>
					<tr>
						<th scope="row">서평자</th>
						<td>
							<div class="box01">김태현</div>
						</td>
						<th scope="row">서펑 게재일</th>
						<td>
							<div class="box01"></div>
						</td>
					</tr>
				</table>
			</div>
			
			<table class="table table-striped">
				<tr>
					<td>청구기호: 기호입니다</td>
				</tr>
				<tr>
					<td>
						<div>서명: 이름</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>편·저자: 저자</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>발행사항: 발행사항</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>PDF: aa</div>
					</td>
				</tr>
				
				<tr>
					<td>
					목차
					목차입니다<br/>
					목차입니다<br/>
					목차입니다<br/>
					목차입니다<br/>
					목차입니다<br/>
					목차입니다<br/>
					목차입니다<br/>
					목차입니다<br/>
					목차입니다
					</td>
				</tr>
				<tr>
					<td>
					서평
					서평입니다<br/>
					서평입니다<br/>
					서평입니다<br/>
					서평입니다<br/>
					서평입니다<br/>
					서평입니다<br/>
					서평입니다<br/>
					서평입니다<br/>
					서평입니다<br/>
					서평입니다<br/>
					</td>
				</tr>
				
				
				
				
			</table>
			
		<div align="right">
			<a href="<c:url value='Reviewofnowweek.jsp'/>"><button
					type="button" class="btn btn-sm btn-info">목록</button></a>
		</div>

	</div>
	<!-- /내용끝 -->
</body>
</html>