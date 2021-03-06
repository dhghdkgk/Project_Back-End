
<%@page import="model.PagingUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.notice.NoticeDto"%>
<%@page import="model.notice.NoticeDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" cont9gent="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>20/30 공지사항</title>


</head>
<%
	request.setCharacterEncoding("UTF-8");
	//검색과 관련된 파라미터 받기]
	String searchColumn = request.getParameter("searchColumn");
	String searchWord = request.getParameter("searchWord");
	String no = request.getParameter("no");
	
	//검색후 페이징과 관련된 파라미터를 전달할 값을 저장할 변수]
	String addQuery = "";
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	if (searchWord != null) {
		addQuery += "searchColumn=" + searchColumn + "&searchWord=" + searchWord + "&";
	
		map.put("searchColumn", searchColumn);
		map.put("searchWord", searchWord);
	}
	
	//전체 목록 가져오기]
	NoticeDao dao = new NoticeDao(application);
	//페이징을 위한 로직 시작]
	//전체 레코드 수
	int totalRecordCount = dao.getTotalRecordCount(map);
	//페이지 사이즈
	int pageSize = Integer.valueOf(application.getInitParameter("PAGE_SIZE"));
	//블락페이지
	int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));
	//전체 페이지수]
	int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
	//현재 페이지를 파라미터로 받기]
	int nowPage = request.getParameter("nowPage") == null
			? 1
			: Integer.parseInt(request.getParameter("nowPage"));
	//시작 및 끝 ROWNUM구하기]
	int start = (nowPage - 1) * pageSize + 1;
	int end = nowPage * pageSize;
	map.put("start", start);
	map.put("end", end);
	//페이징을 위한 로직 끝]	
	List<NoticeDto> records = dao.selectList(map);
	
	//자원반납
	dao.close();
%>

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
			<h1>공지사항</h1>
		</div>
		<div class="search">
			&nbsp; &nbsp; <span>회원검색</span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select>
				<option value="제목">제목</option>
				<option value="내용">내용</option>
				<option value="제목+내용">제목+내용</option>
				<option value="부서명">부서명</option>
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
							<th>구분</th>
							<th>제목</th>
							<th>첨부파일</th>
							<th>등록일</th>
							<th>등록부서</th>
							<th>조회</th>
						</tr>
					</thead>

					<tbody>
					<%
						if (records.isEmpty()) {
					%>
					<tr bgcolor="white" align="center">
						<td colspan="10">등록된 글이 없어요</td>
					</tr>
					<%
						} else {
							int count = 0;
							for (NoticeDto record : records) {
					%>
					<!-- 아래 반복 -->
						<tr>
							<td><%=totalRecordCount - (((nowPage - 1) * pageSize) + count)%></td>
							<td><%=record.getNotice_no() %></td>
							<td><%=record.getNotice_divide() %></td>
							<td><a href="NoticeOK.jsp?no=<%=record.getNotice_no() %>&nowPage=<%=nowPage%>"><%=record.getNotice_title() %></a></td>
							<td><%=record.getNotice_file() %></td>
							<td><%=record.getNotice_regidate() %></td>
							<td><%=record.getDept_name() %></td>
							<td><%=record.getNotice_count() %></td>
						</tr>
						<%
						count++;
							} //for 
						} //else
					%>
					</tbody>
				</table>
				<table width="100%">
					<tr align="center">
						<td style="font-size: 1.2em;"><%=PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, "Notice.jsp?" + addQuery)%></td>
					</tr>
				</table>
			</div>
		</div>


	</div>
	<!-- /내용끝 -->
</body>
</html>