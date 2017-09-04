
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
		/* function regist(){
			$("#frm").submit();
		} */
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
				<form id="frm" action="/ElectronicLib.do" method="post">
					<table class="table table-striped">
						<input type="hidden" name="mode" value="insert">
						<tr>
							<td style="width:20%">제목</td>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<td>저자</td>
							<td><input type="text" name="writer"></td>
						</tr>
						<tr>
							<td>형태사항</td>
							<td><input type="text" name="shape"></td>
						</tr>
						<tr>
							<td>책임표시사항</td>
							<td><input type="text" name="trans"></td>
						</tr>
						<tr>
							<td>ISBN</td>
							<td><input type="text" name="isbn"></td>
						</tr>
						<tr>
							<td>발행처</td>
							<td><input type="text" name="pubplace"></td>
						</tr>
						<tr>
							<td>발행일</td>
							<td><input type="text" name="pubdate"></td>
						</tr>
						<tr>
							<td>분류</td>
							<td>
								<select name="type">
									<option value="과학">과학</option>
									<option value="정치">정치</option>
									<option value="경제">경제</option>
									<option value="철학">철학</option>
									<option value="문학">문학</option>
									<option value="역사">역사</option>
									<option value="사회">사회</option>
									<option value="복지">복지</option>
									<option value="예술">예술</option>
									<option value="문화">문화</option>
									<option value="법학">법학</option>
									<option value="경영">경영</option>
									<option value="인문">인문</option>
									<option value="언론">언론</option>
									<option value="교육">교육</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>청구기호</td>
							<td><input type="text" name="mark"></td>
						</tr>
						<tr>
							<td>발행사항</td>
							<td><input type="text" name="pubmatter"></td>
						</tr>
						<tr>
							<td>초록</td>
							<td><input type="text" name="abstract"></td>
						</tr>
						<tr>
							<td>목차</td>
							<td><input type="text" name="book_list"></td>
						</tr>
						<tr>
							<td>서평</td>
							<td><textarea id="recommend" rows="" cols=""></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" class="" value="등록">
								<input type="reset" class="btn btn-sm btn-info" value="취소">
								<a class="btn btn-sm btn-info" href="javascript:list()">목록</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>


	</div>
	<!-- /내용끝 -->
</body>
</html>