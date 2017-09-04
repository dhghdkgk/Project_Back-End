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
			<h1>참관(견학) 및 연수</h1>
		</div>
		<form action="VisitapplicationRegisterOk.jsp" method="post">
			<input id="userSeq" name="userSeq" type="hidden" value="5393315"/>
		 	<div class="tableBox" id="inForm" style="display: block">
				<table class="table table-striped">
		        <caption>참관(견학)신청 작성</caption>
		        <colgroup>
		        	<col style="width:25%;" />
		            <col style="width:75%;" />
		        </colgroup>
		        <tr>
		        	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl">단체명</span></th>
		            <td class="end"><div class="box30 box31 box700"><input id="visit_name" name="organNm" title="단체명 입력란" type="text" value=""/></div></td>
		        </tr>
		        <tr>
		        	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl">신청자명</span></th>
		            <td class="end"><div class="box30 box31 box700"><input id="visit_register" name="visitReqNm" title="신청자명 입력란" type="text" value=""/></div></td>
		        </tr>
		        <tr>
		        	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl">전화번호</span></th>
		           	<td>
		           	<input type="text" id=visit_tel/>
		           	-
		           	<input type="text" id=visit_tel1/>
		           	-
		           	<input type="text" id=visit_tel2/>
		           	</td>
		       	</tr>
		       	<tr>
		        	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl m_ml0">이메일</span></th>
		            <td class="end">
		            	  <input type="text" id=visit_email/> @ <input type="text" id=visit_email2/>                                                     
			       	</td>
			   	</tr>
		        <tr>
		        	<th scope="row"><span class="star">*</span><span class="txt dB alignLeft pL10 fl lh30">참관(견학)대상 구분</span></th>
		            <td><input type="text" id=visit_division/></td>
		        </tr>
		        <tr>
		        	<th scope="row"><span class="star">*</span><span class="txt dB alignLeft pL10 fl lh30">참관(견학)인원</span></th>
		            <td class="end">
		            	<input type="text" id="visit_number"/>명
		            </td>
				</tr>
		        <tr>
		        	<th scope="row"><span class="txt dB alignLeft pL30">참관(견학)일시</span></th>
		            <td class="end">
			        <input type="text" id="visit_date"/>
		            </td>
		        </tr>

		        <tr>
		       		<th scope="row"><span class="txt dB alignLeft pL30">참관(견학)내용</span></th>
		       		<td class="end">
		           		<div class="fl w97p pt7 ml10 m_w100p w100 mb10">
		               		<pre><textarea id="visit_content" name="etcContent" title="참관(견학) 내용 입력란" class="m_w95 w97p h50"></textarea></pre>
		           		</div>
		       		</td>
		   		</tr>
		   		 <tr>
		        	<th scope="row"><span class="txt dB alignLeft pL30">신청 날짜</span></th>
		            <td class="end">
			        <input type="text" id="visit_regidate"/>
		            </td>
		        </tr>
				</table>
				<div align="right">
				</div>
			</div><!-- tableBox e -->
		</form><!-- reqReservationVO e -->
		<div align="right">
		<a href="<c:url value='VisitapplicationRegisterOk.jsp'/>" class="btn btn-sm btn-info">등록</a>
		</div>
	</div><!-- body e -->
</div><!-- contentBody e -->  
</div>
</div>



</body>
</html>