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
							${dto.review_review }
						</td>
					</tr>
					<tr>
						<th scope="row">서평자</th>
						<td>
							${dto.review_reviewer }
						</td>
						<th scope="row">발행사항</th>
						<td>
							${dto.book_pubmatter }
						</td>
					</tr>
				</table>
			</div>
			
			<table class="table table-striped">
				<tr>
					<td>청구기호: ${dto.book_mark }</td>
				</tr>
				<tr>
					<td>
						<div>서명: ${dto.book_name }</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>편·저자: ${dto.book_writer }</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>발행사항: ${dto.book_pubmatter }</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>PDF: ${dto.review_pdf }</div>
					</td>
				</tr>
				
				<tr>
					<td>
					목차
					${dto.list_content }
					</td>
				</tr>
				<tr>
					<td>
					서평
					${dto.review_review }
					</td>
				</tr>
				
				
				
				
			</table>
			
		<span style="text-align:right">
		<a href="<c:url value='/ReviewofnowweekEdit.do?no=${dto.review_no}'/>"><button type="button" class="btn btn-sm btn-info">수정</button></a>
		</span>
		<span style="text-align:right">
		<a href="<c:url value='/Reviewofnowweek.do'/>"><button type="button" class="btn btn-sm btn-info">목록</button></a>
		</span>

	</div>
	<!-- /내용끝 -->
</body>
</html>