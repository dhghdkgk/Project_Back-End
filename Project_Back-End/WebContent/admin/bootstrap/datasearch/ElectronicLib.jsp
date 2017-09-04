
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

	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<!--  <div class="jumbotron">
        <h1>회원 관리 페이지</h1>
        
      </div> -->


		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1>도서 관리</h1>
		</div>
		<div class="search">
			<form action="/ElectronicLib.do" method="post">
				<input type="hidden" name="mode" value="search" />
				<span>도서 검색</span>
				<select style="margin-left:15px">
					<option value="이름">전체</option>
					<option value="아이디">자료명</option>
					<option value="아이디">저자</option>
					<option value="아이디">청구기호</option>
				</select>
				<input type="text" size="55" />
				<button class="btn btn-sm btn-info">검색</button>
				<button class="btn btn-sm btn-info">전체보기</button>
			</form>
		</div>
		<!-- 아래의 실제 내용 표시 -->
		<div>
			<div class="col-md-6">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>표지</th>
							<th>제목</th>
							<th>저자</th>
							<th>옮긴이</th>
							<th>자료실</th>
							<th>청구번호</th>
							<th>등록일</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td><img src="" alt="해리포터와 마법사의 돌"></td>
							<td><a href="ElectronicLib.do?no=1&nowpage=1">해리포터와 마법사의 돌</a></td>
							<td>케이트 글래스먼 외 15인</td>
							<td>옮긴이</td>
							<td>823.009 -16-1 </td>
							<td>인문자연과학자료실(314호)</td>
							<td>2017-08-28</td>
						</tr>
						<tr>
							<td><img src="" alt="해리포터와 마법사의 돌"></td>
							<td>해리포터와 마법사의 돌</td>
							<td>케이트 글래스먼 외 15인</td>
							<td>옮긴이</td>
							<td>823.009 -16-1 </td>
							<td>인문자연과학자료실(314호)</td>
							<td>2017-08-28</td>
						</tr>
						<tr>
							<td><img src="" alt="해리포터와 마법사의 돌"></td>
							<td>해리포터와 마법사의 돌</td>
							<td>케이트 글래스먼 외 15인</td>
							<td>옮긴이</td>
							<td>823.009 -16-1 </td>
							<td>인문자연과학자료실(314호)</td>
							<td>2017-08-28</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


	</div>
	<!-- /내용끝 -->
</body>
</html>