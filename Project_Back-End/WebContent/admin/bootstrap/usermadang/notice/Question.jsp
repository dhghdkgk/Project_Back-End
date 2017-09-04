

<%@page import="model.pagingutil.PagingUtil"%>
<%@page import="model.qa.QaDTO"%>
<%@page import="model.qa.QaDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%@page import="java.util.List"%>

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
	QaDAO dao = new QaDAO(application);
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
	List<QaDTO> records = dao.selectList(map);

	//자원반납
	dao.close();
%>
<script>
	function iswrite() {
		
		location.href="QuestionWrite.jsp";
	}
		function isDelete(no){								
			if(confirm("글을 삭제하시겠습니까?")){
				//삭제 처리]
				location.href="QuestionDelete.jsp?no="+no+"&nowPage=<%=nowPage%>";
	
		}
	}
</script>

<body role="document">
	<!-- 고정된 네비바 -->
	<jsp:include page="/admin/bootstrap/template/top.jsp"></jsp:include>
	<!-- 고정 네비바 끝 -->

	<div class="container theme-showcase" role="main">




		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1>묻고 답하기</h1>
		</div>
		<div class="search">
			&nbsp; &nbsp; <strong>검색구분</strong> &nbsp;&nbsp;&nbsp;<select>
				<option value="">전체</option>
				<option value="일반">일반</option>
				<option value="민원">민원</option>


			</select> &nbsp;&nbsp;&nbsp; <strong>공개여부</strong> &nbsp;&nbsp;&nbsp;<select>
				<option value="">공개</option>
				<option value="비공개">비공개</option>
			</select>
						

			&nbsp;&nbsp;&nbsp; <strong>처리상태</strong> &nbsp;&nbsp;&nbsp;
			<select name="">
				<option value="">전체</option>			
				<option value="처리중">처리중</option>
				<option value="답변중">답변완료</option>		
			</select>

		</div>
		<form method="post">
			<div class="search">

				&nbsp; &nbsp; <span>검색 항목</span> &nbsp;&nbsp;&nbsp; 
				<select name="searchColumn">
					<option value="qa_title">제목</option>
					<option value="qa_content">내용</option>					
					<option value="qa_name">작성자</option>
				</select> &nbsp; <input type="text" size="54" name="searchWord" /> <input
					type="submit" value="검색" />
				<!-- <button type="button" class="btn btn-sm btn-info">검색</button> -->
			</div>
		</form>

		<!-- 아래의 실제 내용 표시 -->
		<div>

			<div class="col-md-6">
				<table class="table table-striped">
					<thead>
						<tr>
							<th align="left">번호</th>
							<th>아이디</th>
							<th>구분</th>
							<th>공개여부</th>
							<th>제목</th>
							<th>질문자</th>
							<th>등록일</th>
							<th>처리상태</th>
							<th>관리</th>
						</tr>
					</thead>
					<%
						if (records.isEmpty()) {
					%>
					<tr bgcolor="white" align="center">
						<td colspan="10">등록된 글이 없어요</td>
					</tr>
					<%
						} else {
							int count = 0;
							for (QaDTO record : records) {
					%>
					<!-- 아래 반복 -->

					<tr>
						<td><%=totalRecordCount - (((nowPage - 1) * pageSize) + count)%></td>
						<td><%=record.getMember_id()%></td>
						<td><%=record.getQa_division() %></td>
						<td><%=record.getQa_open()%></td>
						<td><a href="QuestionOk.jsp?no=<%=record.getQa_no() %>&nowPage=<%=nowPage%>"><%=record.getQa_title()%></a></td>
						<td><%=record.getQa_name()%></td>
						<td><%=record.getQa_regidate()%></td>
						<td><%=record.getQa_process()%></td>
						<td><a href='javascript:isDelete(<%=record.getQa_no()%>)'><button
									type="button" class="btn btn-xs btn-primary">삭제</button></a></td>
					</tr>

					<%
						count++;
							} //for 
						} //else
					%>
				</table>
				<table width="100%">
					<tr align="center">
						<td style="font-size: 1.2em;"><%=PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, "Question.jsp?" + addQuery)%></td>
					</tr>
				</table>
				<a class="btn btn-sm btn-primary" href="javascript:iswrite()">글쓰기</a>
			</div>
		</div>


	</div>
	<!-- /내용끝 -->
</body>
</html>