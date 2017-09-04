
<%@page import="model.otherbook.OtherBookDTO"%>
<%@page import="model.otherbook.OtherBookDAO"%>
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
<%

	//1]파라미터(키값) 받기
	String no = request.getParameter("no");

	//현재 페이지번호 받기
	String nowPage = request.getParameter("nowPage");
	//2]CRUD작업용 BbsDAO생성
	OtherBookDAO dao = new OtherBookDAO(application);
	//상세보기용 메소드 호출	
	OtherBookDTO dto = dao.selectOne(no);
	
	//이전글/다음글 조회
	Map<String,OtherBookDTO> map = dao.prevNnext(no);

	

	//3]자원반납
	dao.close();
%>


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
			<h1>비치희망도서</h1>
		</div>
		 &nbsp; &nbsp; &nbsp;<strong>이용자 정보 </strong>
		 <h3></h3>
		 
		<div class="col-md-6">
		<table class="table table-striped">      	       	
        	<tr>
            	<th ><span>신청일자</span></th>
            	<td >
	            	
						<%=dto.getOther_regidate() %>			            	
            	</td>

                <th ><span>신청자</span></th>
                <td >
					
						<%=dto.getOther_requester()%>		
					
													                 	
                </td>   
            </tr>
            
            <tr>
            	<th ><span>이메일</span></th>
                <td >
	            	
						<%=dto.getOther_email() %>
					
					
                </td>
   
			
			
				<th ><span>연락처</span></th>
                <td >
                	
						<%=dto.getOther_tel() %>
					
						
				</td>
				
            </tr>

        </table>              
		</div>
 &nbsp;&nbsp;&nbsp;<strong>신청 자료 <strong>
 		<div>

			<div class="col-md-6">
				<table class="table table-striped">
			<tr>
				<th ><span >자료구분 </span></th>
				<td >
                	<select  style="width:150px" >
						<option value="" selected><%=dto.getOther_data() %></option>	
					</select>
                </td>
	
            </tr>

			 
				 <tr>
            	<th class="border_left"><span class="check" title="자료명"><label for="title">자료명</label></span></th>
                <td colspan="3" class="border_right">
                	<input type="text" name="title" id="title" style="width:93%;" maxlength="500" value="<%=dto.getOther_title() %>" />
                </td>
            </tr>
						
						  <tr>
				<th class="border_left"><span class="check" title="저자"><label for="author">저자</label></span></th>
				<td>
					<input type="text" name="author" id="author" style="width:95%;" maxlength="100" value="<%=dto.getOther_writer() %>" onfocus="inValue(this.id)" />
				</td>                  
            	<th class="no_round"><span class="check" title="가격"><label for="amt">가격</label></span></th>
						
				<td class="border_right">
                	<input type="text" name="amt" id="amt" style="width:53%; text-align:right;" maxlength="10" value="<%=dto.getOther_price() %>" />
                	<label for="currencyDivCode" class="lab1">화폐단위</label>
					<select name="currencyDivCode" id="currencyDivCode" style="width:150px">
						<option value="" selected>-- 화폐단위선택 --</option>
					</select>
                </td>           
            </tr>
				 
            
            <tr>
            	<th class="border_left"><span class="check" title="발행처"><label for="publisher">발행처</label></span></th>
                <td>
                	<input type="text" name="publisher" id="publisher" style="width:95%;" maxlength="100" value="<%=dto.getOther_issue() %>" onfocus="inValue(this.id)" />
                </td>
                <th class="no_round"><span title="발행년"><label for="publisherYear">발행년</label></span></th>
                <td class="border_right">
                	<input type="text" name="publisherYear" id="publisherYear" style="width:95%;" maxlength="4" value="<%=dto.getOther_year() %>" />
                </td>
            </tr>
            
            <tr>
            	<th class="border_left"><span title="ISBN"><label for="isbn">ISBN</label></span></th>
                <td>
                	<input type="text" name="isbn" id="isbn" style="width:95%;" maxlength="50" size="35" value="<%=dto.getBook_isbn() %>" />
                </td>
                
            </tr>
			

					
				</table>
			<button id="edit" class="btn btn-sm btn-primary">수정</button>
			<button id="list" class="btn btn-sm btn-primary">목록</button>
			<hr/>
				
			</div>
			 <table width="35%" >
	                          <tr>
	                           <td width="15%">이전글:</td>
	                           <td><%=map.get("PREV") ==null?"이전글이 없습니다": String.format("<a href='ApplicationbookOk.jsp?no=%d'>%s</a>",map.get("PREV").getOther_no(),map.get("PREV").getOther_title()) %></td>
	                          </tr>
	                          <tr>
	                           <td width="15%">다음글:</td>
	                           <td><%=map.get("NEXT") ==null?"다음글이 없습니다": String.format("<a href='ApplicationbookOk.jsp?no=%d'>%s</a>",map.get("NEXT").getOther_no(),map.get("NEXT").getOther_title()) %></td>
	                          </tr>
	                         </table>
		</div>
					
<script>
	$(function(){
		$(":button").click(function(){
			if(this.id == "list"){
				location.href = "Applicationbook.jsp?nowPage=<%=nowPage%>";
			}else if (this.id == "edit"){
				location.href = "ApplicationbookEdit.jsp?no=<%=no%>&nowPage=<%=nowPage%>";
			}
			
		});
	});
				</script>
	</div>
	<!-- /내용끝 -->
</body>
</html>