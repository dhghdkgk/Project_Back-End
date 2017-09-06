  


<%@page import="model.PagingUtil"%>
<%@page import="model.otherbook.OtherBookDTO"%>
<%@page import="model.otherbook.OtherBookDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/Styles/jquery-ui.min.css'/>"/>
<!-- jQuery사용을 위한 라이브러리 임베딩 -->
<!-- jQuery Core -->
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- jQuery UI -->
<script src="<c:url value='/JS/jquery-ui.min.js'/>" type="text/javascript"></script>
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
	OtherBookDAO dao = new OtherBookDAO(application);
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
	List<OtherBookDTO> records = dao.selectList(map);

	//자원반납
	dao.close();
%>
<script>
		function isDelete(no){								
			if(confirm("글을 삭제하시겠습니까?")){
				//삭제 처리]
				location.href="ApplicationbookDelete.jsp?no="+no+"&nowPage=<%=nowPage%>";
	
		}
	}
</script>





<title>20/30 회원 관리 페이지</title>


</head>

  
<body >

<%-- <jsp:include page="/admin/bootstrap/template/top.jsp"></jsp:include> --%>

<div class="container theme-showcase" role="main">
	<jsp:include page="/admin/bootstrap/template/top.jsp"></jsp:include>
	

<div class="page-header">
			<h1>비치희망도서신청내역</h1>
		</div>
		<div class="search">
			 <strong>신청도서검색</strong>
			 </div>
			 <label style="color: gray;">※상세보기를 원하시면 저자클릭</label>
			&nbsp;				
<div>					
 	<form method="post">
				<span style="font-weight: bold;">검색 항목</span>&nbsp;&nbsp;
				<select name="searchColumn">
				<option value="">검색</option>		
				<option value="other_writer">저자</option>
				<option value="other_issue">발행처</option>
				
				</select>&nbsp;&nbsp;&nbsp;
				 <input type="text" size="54" name="searchWord" /><input
					type="submit" value="검색" />
						</form>
			<div class="col-md-6">
				<table class="table table-striped">
					<thead>
						<tr>
							<th align="left">번호</th>
							<th>신청일</th>
							<th>자료구분</th>						
							<th>저자명</th>
							<th>발행처</th>
							<th>처리상태</th>
							<th>처리일</th>
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
							for (OtherBookDTO record : records) {
					%>
					<!-- 아래 반복 -->

					<tr>
						<td><%=totalRecordCount - (((nowPage - 1) * pageSize) + count)%></td>
						<td><%=record.getOther_regidate()%></td>
						<td><%=record.getOther_data() %></td>						
						<td><a href="ApplicationbookOk.jsp?no=<%=record.getOther_no() %>&nowPage=<%=nowPage%>"><%=record.getOther_writer()%></a></td>
						<td><%=record.getOther_issue()%></td>
						<td><%=record.getOther_status() %></td>
						<td><%=record.getOther_year() %></td>
						<td><a href='javascript:isDelete(<%=record.getOther_no()%>)'><button
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
						<td style="font-size: 1.2em;"><%=PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, "Applicationbook.jsp?" + addQuery)%></td>
					</tr>
				</table>
					

				

					</div>
				
				 
		
	


	</div>
	 
	</div>
		


	
	<!-- /내용끝 -->
</body>
</html>