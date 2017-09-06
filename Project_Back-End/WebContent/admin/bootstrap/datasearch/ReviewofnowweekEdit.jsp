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
		<form action="${pageContext.request.contextPath}/ReviewofnowweekEdit.do" method="post" enctype="multipart/form-data">
		<div class="body">
			<!-- 여기서부터 콘텐츠 s -->
			<input type="hidden" name="no" value="${dto.review_no }" />
			<input type="hidden" name="book_no" value="${dto.book_no }" />
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
							<input name="review_review" value="${dto.review_review }" />
						</td>
					</tr>
					<tr>
						<th scope="row">서평자</th>
						<td>
							<input name="review_reviewer" value="${dto.review_reviewer }" />
						</td>
						<th scope="row">발행사항</th>
						<td>
							<input name="book_pubmatter" value="${dto.book_pubmatter }" />
						</td>
					</tr>
				</table>
			</div>
			
			<table class="table table-striped">
				<tr>
					<td>청구기호: <input name="book_mark" value="${dto.book_mark }" /></td>
				</tr>
				<tr>
					<td>
						<div>서명: <input name="book_name" value="${dto.book_name }" /></div>
					</td>
				</tr>
				<tr>
					<td>
						<div>편·저자: <input name="book_writer" value="${dto.book_writer }" /></div>
					</td>
				</tr>
				<tr>
					<td>
						<div>발행사항: <input name="book_pubmatter" value="${dto.book_pubmatter }" /></div>
					</td>
				</tr>
				<tr>
					<td>
						<div>PDF: <input name="review_pdf" value="${dto.review_pdf }" /></div>
					</td>
				</tr>
				
				<tr>
					<td>
					목차
					<input name="list_content" value="${dto.list_content }" />
					</td>
					
				</tr>
				<tr>
					<td>
					서평
					<input name="review_review" value="${dto.review_review }" />
					</td>
				</tr>
				<tr>
				<tr bgcolor="white" align="left">
          			<td colspan="2">
          			<input type="submit" value="등록"/>
          			</td>
          		</tr>
				
				
				
			</table>
			
		<%-- <span style="text-align:right">
		<a href="OutdoorstageapplicationEdit.jsp"><button type="button" class="btn btn-sm btn-info">확인</button></a>
		</span>
		<span style="text-align:right">
		<a href="<c:url value='/ReviewofnowweekOk.do?no=${dto.review_no}'/>"><button type="button" class="btn btn-sm btn-info">뒤로</button></a>
		</span> --%>

	</div>
	</form>
	<!-- /내용끝 -->
</body>
</html>