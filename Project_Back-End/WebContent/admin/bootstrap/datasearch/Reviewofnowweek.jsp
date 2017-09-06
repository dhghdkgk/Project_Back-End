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
			<h1>금주의 서평</h1>
		</div>
		<div class="search">
			<form action="/Reviewofnowweek.do" method="post">
				<input type="hidden" name="mode" value="search" />
				&nbsp; &nbsp; <span>주차별 보기</span>
				&nbsp;&nbsp;&nbsp;&nbsp;<select>
				<option value="전체">전체</option>
				<option value="8월 4째주">8월 4째주</option>
				<option value="8월 3째주">8월 3째주</option>
				<option value="8월 2째주">8월 2째주</option>
				<option value="8월 1째주">8월 1째주</option>
				<option value="7월 4째주">7월 4째주</option>
				<option value="7월 3째주">7월 3째주</option>
				<option value="7월 2째주">7월 2째주</option>
				<option value="7월 1째주">7월 1째주</option>
				<option value="6월 4째주">6월 4째주</option>
				<option value="6월 3째주">6월 3째주</option>
				<option value="6월 2째주">6월 2째주</option>
				<option value="6월 1째주">6월 1째주</option>
				<option value="5월 5째주">5월 5째주</option>
			</select> &nbsp;
			<button type="button" class="btn btn-sm btn-info">선택</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="text" size="15"/>
			<button type="button" class="btn btn-sm btn-info">검색</button>
			<button type="button" class="btn btn-sm btn-info">전체보기</button>
			</form>
		</div>
		<!-- 아래의 실제 내용 표시 -->
		<div>

			<div class="col-md-6">
				<table class="table table-striped">
					<thead>
						<tr>
							<th align="left">번 호</th>
							<th style="text-align:center">제목</th>
							<th>분야<th>
							<th>저자</th>
							<th>서평자</th>
							<th>소속</th>
							<th>발행일</th>
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
								<c:forEach var="item" items="${list}" varStatus="loop">
									<tr>
										<td>${totalRecordCount - (((nowPage  - 1) * pageSize ) + loop.index)}</td>
										<td>${item.review_no }</td>
										<td><a href="<c:url value='/ReviewofnowweekOk.do?no=${item.review_no }' />">${item.book_title }</a></td>
										<td>${item.book_type }</td>
										<td></td>
										<td>${item.book_writer }</td>
										<td>${item.review_reviewer }</td>
										<td>${item.book_pubplace}</td>
										<td>${item.book_pubdate }</td>
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