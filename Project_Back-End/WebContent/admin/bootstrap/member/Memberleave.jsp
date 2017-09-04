
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--  <%@ include file="/admin/bootstrap/Common/IsMember.jsp"%>  --%>
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
			<h1>회원관리</h1>
		</div>
		<div class="search">
			&nbsp; &nbsp; <span>회원검색</span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select>
				<option value="이름">이름</option>
				<option value="아이디">아이디</option>
			</select> &nbsp; <input type="text" size="55" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-sm btn-info">검색</button>
			<button type="button" class="btn btn-sm btn-info">전체보기</button>
		</div>
		<!-- 아래의 실제 내용 표시 -->
		<div>

			<div class="col-md-6">
				<table class="table table-striped">
					<thead>
						<tr>
							<th align="left">번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>비밀번호</th>
							<th>핸드폰</th>
							<th>작성일</th>
							<th>관리</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>1</td>
							<td>KIM</td>
							<td>김길동</td>
							<td>1234</td>
							<td>010-xxxx-xxxx</td>
							<td>2017-12-12</td>
							<td>탈퇴</td>

						</tr>
						<tr>
							<td>2</td>

							<td>KIM</td>
							<td>김길동</td>
							<td>1234</td>
							<td>010-xxxx-xxxx</td>
							<td>2017-12-12</td>
							<td>탈퇴</td>

						</tr>
						<tr>
							<td>3</td>

							<td>KIM</td>
							<td>김길동</td>
							<td>1234</td>
							<td>010-xxxx-xxxx</td>
							<td>2017-12-12</td>
							<td>탈퇴</td>

						</tr>
					</tbody>
				</table>
			</div>
		</div>


	</div>
	<!-- /내용끝 -->
</body>
</html>