
<%@page import="model.qa.QaDTO"%>
<%@page import="model.qa.QaDAO"%>
<%@page import="java.util.Map"%>

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

<style>
search {
	padding-bottom: 9px;
	border-bottom: 1px solid #eee;
}
</style>
</head>
<%
String no = request.getParameter("no");

//CRUD작업용 객체 생성]
QaDAO dao = new QaDAO(application);
//키값에 따른 레코드 하나 얻기]
QaDTO dto=dao.selectOne(no);
dao.close();
%>

<body role="document">
	<!-- 고정된 네비바 -->
	<jsp:include page="/admin/bootstrap/template/top.jsp"></jsp:include>
	<!-- 고정 네비바 끝 -->

	<div class="container theme-showcase" role="main">
<script>
	 $(function(){

		$("a").click(function(){
			if(this.id == "list"){
				history.back();
			} else {
				location.href ="QuestionOk.jsp?no=<%=no%>";
			}
		});
	}); 
	function selChange(val){
	       if(val=="sel"){
	            $(".boxEmailEndInput > input").val("");
	          }else{
	            $(".boxEmailEndInput > input").val(val); 
	          }
	   }
</script>



		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1>묻고 답하기 답변</h1>

		</div>
		&nbsp; &nbsp; &nbsp;<strong>관리자 답변 </strong>
		<h3></h3>

		<div class="col-md-6">		
				<input type="hidden" name="no" value="<%=no%>"/> 			
				<table class="table table-striped">
					<tr class="search" style="font-weight: normal;">
						<td>담당부서</td>
						<td>
						<span class="boxEmailEndInput"><input  type="text" title="이메일 도메인 입력란"  value="" /></span>
                          <span class="boxEmailEnd">
                             <select id="anwser" name="anwser" title="담당부서" onchange="javascript:selChange(this.value);">
                                 <option value="sel">담당부서 선택</option>
                                 <option value="">직접입력</option>
                                 <option value="기획담당관실">기획담당관실</option>
                                 <option value="총무담당관실">총무담당관실</option>
                                 <option value="겅치행정정보과">겅치행정정보과</option>
                                 <option value="경제사회정보과">경제사회정보과</option>
                                 <option value="국외정보과">국외정보과</option>
                                 <option value="공공정책정보과">공공정책정보과</option>
                              </select>
                     </span>
						<td>
					</tr>


					<tr class="search" style="font-weight: normal;">
						<td>답변내용</td>
						<td><textarea rows="8" style="width: 98%" name="content"></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							 
							 <a id="OK" class="btn btn-sm btn-primary">확인</a>
							 <a id="list" class="btn btn-sm btn-primary">뒤로</a>
							 
						</td>
					</tr>
				</table>
				<div style="text-align: center"></div>
			</form>
		</div>
	</div>


	<!-- /내용끝 -->
</body>

</html>