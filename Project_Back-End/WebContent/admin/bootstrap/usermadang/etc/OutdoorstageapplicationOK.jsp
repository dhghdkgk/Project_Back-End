

<%@page import="model.outer.OuterDto"%>
<%@page import="model.outer.OuterDao"%>
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
<title>20/30 야외공연장 대관(상세보기)</title>


</head>
<%
	//1]파라미터(키값) 받기
	String no = request.getParameter("no");
	String nowPage = request.getParameter("nowPage");
	//2]CRUD작업용 BbsDAO생성
	OuterDao dao = new OuterDao(application);
	//상세보기용 메소드 호출	
	OuterDto dto = dao.selectOne(no);
	
	//3]자원반납
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
			<h1>야외공연장 대관(상세보기)</h1>
		</div>
		
		<div class="col-md-6">
			<table class="table table-striped" summary="행사명, 신청자(단체)명, 공연자 수, 전화번호, 이메일, 행사내용, 공연자 프로필 및 활동약력, 요청사항, 공연일자, 신청일자로 구성">
			  	<tr>
			    	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl wA">행사명</span></th>
			    	<td>
			    	<%=dto.getOuter_concertname() %>
					</td>
			  	</tr>
			  	<tr>
			    	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl wA m_floatNone">신청자(단체)명</span></th>
			    	<td>
			    	<%=dto.getOuter_name() %>
					</td>
			    	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl wA m_floatNone">공연자 수</span></th>
			    	<td class="end">
			    		<%=dto.getOuter_number() %>
			    		<span class="box30 fl m5">명</span>
			    	</td>
			  	</tr>
			  	<tr>
			    	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl wA m_floatNone">전화번호</span></th>
			    	<td class="end" colspan="3">
						<%=dto.getOuter_tel() %>
					</td>
			  	</tr>
			  	<tr>
			    	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl wA m_floatNone">이메일</span></th>
			    	<td class="end" colspan="3">
						<%=dto.getOuter_email() %>    
					</td>
			  	</tr>
			  	<tr>
			    	<th rowspan="3" scope="row"><span class="star">*</span><span class="txt dB alignLeft pL10 fl lh30 wA m_floatNone">행사내용</span></th>
			    	<td class="end" colspan="3">
						<div class="overflowH">
							<div class="txtareaBox">
								<span class="star lh17">*</span>
								<span class="txt dB alignLeft pL10 mt0">행사 주요내용</span>
							</div>
							<%=dto.getOuter_content() %>
						</div>
					</td>
			  	</tr>
			  	<tr>
				    <td class="end" colspan="3">
						<div class="overflowH">
							<div class="txtareaBox">
								<span class="star lh17">*</span>
								<span class="txt dB alignLeft pL10 mt0">행사 진행일정</span>
							</div>
							<%=dto.getOuter_progress() %>
						</div>
					</td>
			  	</tr>
			  	<tr>
				    <td class="end" colspan="3">
						<div class="overflowH">
							<div class="txtareaBox">
								<span class="star lh17">*</span>
								<span class="txt dB alignLeft pL10 mt0 lh15 wA m_floatNone">
									추가장비 반입 및 설비 설치 계획(장비규모운반계획,행사 준비및 설치시간등)
								</span>
							</div>
							<%=dto.getOuter_equipment() %>
						</div>      
				    </td>
				  </tr>
			  	<tr>
			    	<th scope="row"><span class="txt dB alignLeft pL30 wA">공연자 프로필<br/>및 활동약력</span></th>
				    <td class="end" colspan="3">
						<%=dto.getOuter_profile() %>
					</td>
				</tr>
			  	<tr>
			    	<th scope="row"><span class="txt dB alignLeft pL30 wA">요청사항</span></th>
			    	<td class="end" colspan="3">
						<%=dto.getOuter_request() %>
					</td>
			  	</tr>
			  	<tr>
			    	<th scope="row">
			    		<span class="txt dB alignLeft pL30 wA">
			    			<label for="kongyenday">공연일자</label>
			    		</span>
			    	</th>
			    	<td>
			    		<%=dto.getOuter_date() %>
			   		</td>
				    <th>
				    	<span class="txt dB alignLeft pL30 wA">신청일자</span>
				    </th>
				    <td class="end">
				    	<%=dto.getOuter_regidate() %>
				    </td>
			  	</tr>
			</table>
		</div>
		
		<span style="text-align:right">
		<a href="OutdoorstageapplicationEdit.jsp?no=<%=dto.getOuter_no()%>&nowPage=<%=nowPage%>"><button type="button" class="btn btn-sm btn-info">수정</button></a>
		</span>
		<span style="text-align:right">
		<a href="<c:url value='Outdoorstageapplication.jsp'/>"><button type="button" class="btn btn-sm btn-info">목록</button></a>
		</span>


	</div>
	<!-- /내용끝 -->
</body>
</html>