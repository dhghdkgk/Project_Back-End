
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


</head>


<body role="document">
	<!-- 고정된 네비바 -->
	<jsp:include page="/admin/bootstrap/template/top.jsp"></jsp:include>
	<!-- 고정 네비바 끝 -->

	<script>
		function edit(no){
			location.href = "<c:url value='/ElectronicLib/Edit.do?no="+no+"' />";
		}
		function list(){
			history.back();
		}
		
	</script>

	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<!--  <div class="jumbotron">
        <h1>회원 관리 페이지</h1>
        
      </div> -->


		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1>도서등록</h1>
		</div>
		<!-- 아래의 실제 내용 표시 -->
		<div>
			<div class="col-md-6">
				<table class="table table-striped">
					<tr>
						<td>표지</td>
						<td><img src="<c:url value='/Upload/Book/${dto.book_img }' />" style="width:60px; height:80px;"></td>
					</tr>
					<tr>
						<td style="width: 20%">제목</td>
						<td>${dto.book_title }</td>
					</tr>
					<tr>
						<td>저자</td>
						<td>${dto.book_writer }</td>
					</tr>
					<tr>
						<td>형태사항</td>
						<td>${dto.book_shape }</td>
					</tr>
					<tr>
						<td>책임표시사항</td>
						<td>${dto.book_trans }</td>
					</tr>
					<tr>
						<td>ISBN</td>
						<td>${dto.book_isbn }</td>
					</tr>
					<tr>
						<td>발행처</td>
						<td>${dto.book_pubplace }</td>
					</tr>
					<tr>
						<td>발행일</td>
						<td>${dto.book_pubdate }</td>
					</tr>
					<tr>
						<td>분류</td>
						<td>${dto.book_type }</td>
					</tr>
					<tr>
						<td>청구기호</td>
						<td>${dto.book_mark }</td>
					</tr>
					<tr>
						<td>발행사항</td>
						<td>${dto.book_pubmatter }</td>
					</tr>
					<tr>
						<td>초록</td>
						<td>${dto.book_abstract }</td>
					</tr>
					<tr>
						<td>목차</td>
						<td></td>
					</tr>
					<tr>
						<td>서평</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2">
							<a class="btn btn-sm btn-info" href="javascript:edit(${dto.book_no })">수정</a>
							<a class="btn btn-sm btn-info" href="javascript:list()">목록</a>
						</td>
					</tr>
				</table>
			</div>
		</div>


	</div>
	<!-- /내용끝 -->
</body>
</html>