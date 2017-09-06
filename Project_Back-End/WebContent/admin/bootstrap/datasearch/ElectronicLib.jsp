
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
							<th>번호</th>
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
						<c:choose>
							<c:when test="${empty list }">
								<tr bgcolor="white" align="center">
									<td colspan="7">등록된 자료가 없어요</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${list }" varStatus="loop">
									<tr bgcolor="white" align="center">
										<td style="vertical-align: middle;">${totalRecordCount - (((nowPage  - 1) * pageSize ) + loop.index)}</td>
										<td><img src="<c:url value='/Upload/Book/${item.book_img }' />" style="width: 30px; height: 50px;"></td>
										<td align="left">
											<a href="<c:url value='/ElectronicLib/View.do?no=${item.book_no }' />">${item.book_title }</a>
										</td>
										<td>${item.book_writer }</td>
										<td>${item.book_trans }</td>
										<td>자료실</td>
										<td>${item.book_mark }</td>
										<td>${item.book_regidate }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>

					</tbody>
				</table>
		                      <table width="100%">
		                        <tr align="center">
		                          <td>${pagingString }</td>
		                        </tr>
		                      </table>
			</div>
		</div>


	</div>
	<!-- /내용끝 -->
</body>
</html>