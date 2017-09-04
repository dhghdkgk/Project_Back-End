

<%@page import="model.outer.OuterDto"%>
<%@page import="model.outer.OuterDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	
	//한글처리]
	request.setCharacterEncoding("UTF-8");
	
	String no = request.getParameter("no");
	int nowPage = request.getParameter("nowPage") == null
			? 1
			: Integer.parseInt(request.getParameter("nowPage"));
	//전체 목록 가져오기]
	OuterDao dao = new OuterDao(application);
	List<OuterDto> records= dao.selectList();
	//자원반납
	dao.close();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>20/30 야외공연장 대관</title>


</head>
<script>
		function isDelete(no){								
			if(confirm("글을 삭제하시겠습니까?")){
				//삭제 처리]
				location.href="OutdoorstageapplicationDelete.jsp?no="+no+"&nowPage=<%=nowPage%>";
	
		}
	}
</script>

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
			<h1>야외공연장 대관</h1>
		</div>
		<div class="search">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select>
				<option value="이름">아이디</option>
				<option value="아이디">행사명</option>
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
							<th>행사명</th>
							<th>등록일</th>
						</tr>
					</thead>

					<tbody>
					<% if(records.isEmpty()){ %>
					<tr bgcolor="white" align="center">
                     <td colspan="5">등록된 글이 없어요</td>
                    </tr>
                    <% } else{
                    	int count = 0;
                    	for(OuterDto record:records){
                    %>
						<tr>
							<td><%=record.getOuter_no() %></td>
							<td><%=record.getMember_id() %></td>
							<td><a href="OutdoorstageapplicationOK.jsp?no=<%=record.getOuter_no() %>&nowPage=<%=nowPage%>"><%=record.getOuter_concertname() %></a></td>
							<td><%=record.getOuter_regidate() %></td>
							<td><a href="javascript:isDelete(<%=record.getOuter_no()%>)"><button type="button" class="btn btn-sm btn-info">삭제</button></a></td>
						</tr>
						<% 
						count++;
						}//for
                    	}//else%>
						
					</tbody>
				</table>
			</div>
		</div>


	</div>
	<!-- /내용끝 -->
</body>
</html>