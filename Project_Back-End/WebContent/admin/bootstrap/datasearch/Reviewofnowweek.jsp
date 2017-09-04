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
						<tr>
							<td>1</td>
							<td><a href="<c:url value='ReviewofnowweekOk.jsp'/>">원하는 곳에서 일하고 살아갈 자유, 디지털 노마드</a></td>
							<td>사회</td>
							<td></td>
							<td>도유진</td>
							<td>김태현</td>
							<td>서울대학교 법학전문대학원</td>
							<td>2017-12-12</td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="<c:url value='ReviewofnowweekOk.jsp'/>">원하는 곳에서 일하고 살아갈 자유, 디지털 노마드</a></td>
							<td>사회</td>
							<td></td>
							<td>도유진</td>
							<td>김태현</td>
							<td>서울대학교 법학전문대학원</td>
							<td>2017-12-12</td>

						</tr>
						<tr>
							<td>3</td>
							<td><a href="<c:url value='ReviewofnowweekOk.jsp'/>">원하는 곳에서 일하고 살아갈 자유, 디지털 노마드</a></td>
							<td>사회</td>
							<td></td>
							<td>도유진</td>
							<td>김태현</td>
							<td>서울대학교 법학전문대학원</td>
							<td>2017-12-12</td>

						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		


	</div>
	<!-- /내용끝 -->
</body>
</html>