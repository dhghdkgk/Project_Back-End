
<%@page import="model.qa.QaDTO"%>
<%@page import="model.qa.QaDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.DeptDTO"%>


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
.a{
	
}
</style>
</head>

<%

	//1]파라미터(키값) 받기
	String no = request.getParameter("no");

	//현재 페이지번호 받기
	String nowPage = request.getParameter("nowPage");
	//2]CRUD작업용 BbsDAO생성
	QaDAO dao = new QaDAO(application);
	//조회수 업데이트
	dao.updateVisitCount(no);
	//상세보기용 메소드 호출	
	QaDTO dto = dao.selectOne(no);
	
	//이전글/다음글 조회
	Map<String,QaDTO> map = dao.prevNnext(no);
	
	

	//3]자원반납
	dao.close();
%>
	
<body role="document">
	<!-- 고정된 네비바 -->
	<jsp:include page="/admin/bootstrap/template/top.jsp"></jsp:include>
	<!-- 고정 네비바 끝 -->
	<script>
	function fncna(obj) {
		if(obj.value != ""){
			if($("lable").html() == "처리상태"){
				$("lable").html("처리중").css("color","#008080");
			}
			}
			else{
				if($("lable").html() == "처리중"){
					$("lable").html("처리상태").css("color","black")
			}
			
		}
	}
	
	$(function () {
		if($(".b").html() == ""){
		$(".a").hide();
		
		}
		
	});
	</script>
	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<!--  <div class="jumbotron">
        <h1>회원 관리 페이지</h1>
        
      </div> -->


		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1>묻고 답하기 답변</h1>

		</div>
		&nbsp; &nbsp; &nbsp;<strong>관리자 답변 </strong>
		<h3></h3>

		<div class="col-md-6">
			<table class="table table-striped">
			<tr class="search" style="font-weight: normal;">		
					<td style="width:20%;">질문자</td>
					<td style="width:50%;"><%=dto.getQa_name() %></td>
					
					<td style="width:20%;">전화번호</td>
					<td><%= dto.getQa_tel() %></td>
					
					
					</tr>
					<tr class="search" style="font-weight: normal;">		
					<td style="width:20%;">이메일</td>
					<td style="width:50%;"><%=dto.getQa_email()%></td>
					</tr>
				<tr class="search" style="font-weight: normal;">		
					<td style="width:20%;">제목</td>
					<td style="width:50%;"><%=dto.getQa_title()%></td>



					<td style="width:20%;">등록일</td>
					<td><%= dto.getQa_regidate() %></td>
						



				</tr>
				<tr class="search" style="font-weight: normal;">
					<td>담당부서</td>
					<td><!-- <select onchange="fncna(this);">
				<option value=""></option>		
				<option value="1">기획담당관실</option>			
				<option value="2">총무담당관실</option>
				<option value="3">정치행정정보과</option>		
				<option value="4">경제사회정보과</option>
				<option value="5">국외정보과</option>
				<option value="6">공공정책정보과</option>
				
			</select> --></td>

					<td class="search">조회수</td>
					<td class="search" style="font-weight: normal;"><%=dto.getQa_count() %></td>
				</tr>
			
				<tr class="search" style="font-weight: normal;">
					<td class="search">질문자 내용</td>	
					<td></td>
					
				<td style="width:20%;" >처리상태</td>
					<td><!-- <select name="">
				<option value="">처리상태</option>		
				<option value="처리중">처리중</option>			
				<option value="답변중">답변중</option>
				<option value="답변완료">답변완료</option></select> -->
				<lable>처리상태</lable></td>
				
				</tr>
				<tr>
				<td><%=dto.getQa_content().replace("\r\n", "<br/>") %></td>	
				</tr>
				<tr class="search">
					<td colspan="4">답변내용
					</td>
					<tr>
					<td class="a" ></td>
					
				</tr>
				
			</table>
			
			<div style="text-align:right">
			
				
				<button id="ed" style="margin-left: 400px;" class="btn btn-sm btn-primary">질문답변</button>
		
		
			
	
				<button id="edit" class="btn btn-sm btn-primary">수정</button>
				<button id="list" class="btn btn-sm btn-primary">목록</button>
			</div>
			  <table width="75%" >
	                          <tr>
	                           <td width="15%">이전글:</td>
	                           <td><%=map.get("PREV") ==null?"이전글이 없습니다": String.format("<a href='QuestionOk.jsp?no=%d'>%s</a>",map.get("PREV").getQa_no(),map.get("PREV").getQa_title()) %></td>
	                          </tr>
	                          <tr>
	                           <td>다음글:</td>
	                           <td><%=map.get("NEXT") ==null?"다음글이 없습니다": String.format("<a href='QuestionOk.jsp?no=%d'>%s</a>",map.get("NEXT").getQa_no(),map.get("NEXT").getQa_title()) %></td>
	                          </tr>
	                         </table>  
		</div>
		</form>
	</div>


	<!-- /내용끝 -->
</body>
<script>
	$(function(){
		$(":button").click(function(){
				
			if(this.id == "ed"){
				
				<%-- $(".a").toggle(function(){					 
					if($(".b").html() == ""){
					 if( $("#ed").html() == '질문답변' ) {
					      $("#ed").html('확인');
					 }
					else if($("#ed").html() == '확인'){					
							
					    	  //얼러트로 뿌려주기
					    	  alert("답변 성공");
					   	location.href = "Question.jsp?nowPage=<%=nowPage%>";
					}
					      
					    }
					    else {
					      $("#ed").html('질문답변');
					    }
				
				});//toggle --%>
				location.href = "QuestionAnswer.jsp?no=<%=no%>";
				
			}
			
			
			
			if(this.id == "list"){
				location.href = "Question.jsp?nowPage=<%=nowPage%>";
			} else if (this.id == "edit"){
				location.href = "QuestionEdit.jsp?no=<%=no%>&nowPage=<%=nowPage%>";
			}
		});
	});
</script>
</html>