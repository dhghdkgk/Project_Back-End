
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
String no = request.getParameter("no");
String nowPage = request.getParameter("nowPage");
//CRUD작업용 객체 생성]
OuterDao dao = new OuterDao(application);
//키값에 따른 레코드 하나 얻기]
OuterDto dto=dao.selectOne(no);
dao.close();
%>

<body role="document">
	<!-- 고정된 네비바 -->
	<jsp:include page="/admin/bootstrap/template/top.jsp"></jsp:include>
	<!-- 고정 네비바 끝 -->
<script>
	$(function(){

		$("a").click(function(){
			if(this.id == "list"){
				history.back();
			} else {
				$(this).parents("form").submit();
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
	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<!--  <div class="jumbotron">
        <h1>회원 관리 페이지</h1>
        
      </div> -->


		<!-- 실제 내용의 제목 표시 -->
		<div class="page-header">
			<h1>야외공연장 대관(상세보기)</h1>
		</div>
		<form action="OutdoorstageapplicationEditOk.jsp" method="post">
		<div class="col-md-6">
			<input type="hidden" name="no" value="<%=no %>" /> <input
				   type="hidden" name="nowPage" value="<%=nowPage%>" />
			<table class="table table-striped" summary="행사명, 신청자(단체)명, 공연자 수, 전화번호, 이메일, 행사내용, 공연자 프로필 및 활동약력, 요청사항, 공연일자, 신청일자로 구성">
			  	<tr>
			    	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl wA">행사명</span></th>
			    	<td class="end" colspan="3">
						<div class="box701 width95p"><input id="eventnm" name="concertname" title="행사명 입력란" type="text" value="<%=dto.getOuter_concertname() %>" size="50"/></div>
					</td>
			  	</tr>
			  	<tr>
			    	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl wA m_floatNone">신청자(단체)명</span></th>
			    	<td>
						<div class="box701"><input id="team" name="name" title="신청자(단체)명 입력란" type="text" value="<%=dto.getOuter_name() %>"/></div>
					</td>
			    	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl wA m_floatNone">공연자 수</span></th>
			    	<td class="end">
			    		<span class="box30 box31 box36 fl width76p m_width45">
			    			<input title="공연자 수 입력란" type="number" name="number" id="peopleNo" class="width95p" value="<%=dto.getOuter_number() %>" style="text-align:right;"/>
			    		</span>
			    		<span class="box30 fl m5">명</span>
			    	</td>
			  	</tr>
			  	<tr>
			    	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl wA m_floatNone">전화번호</span></th>
			    	<td class="end" colspan="3">
						<div class="phoneBoxWrap">
		                	<span class="boxPhoneStart">
		                    	<select id="phoneNum1" name="tel1" title="지역번호 또는 무선사업자번호 선택">
									<option><%=dto.getOuter_tel().split("-")[0] %></option>
									<option value="02">02</option>
									<option value="031">031</option>
									<option value="032">032</option>
									<option value="033">033</option>
									<option value="041">041</option>
									<option value="042">042</option>
									<option value="043">043</option>
									<option value="051">051</option>
									<option value="052">052</option>
									<option value="053">053</option>
									<option value="054">054</option>
									<option value="055">055</option>
									<option value="061">061</option>
									<option value="062">062</option>
									<option value="063">063</option>
									<option value="064">064</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</span>
		                    <span class="phoneMool">-</span>
		                    <span class="boxPhoneCenter"><input id="phoneNum2" name="tel2" title="전화번호 중간자리" type="text" value="<%=dto.getOuter_tel().split("-")[1] %>"/></span>
		        	        <span class="phoneMool">-</span>
		            	    <span class="boxPhoneEnd"><input id="phoneNum3" name="tel3" title="전화번호 끝자리" type="text" value="<%=dto.getOuter_tel().split("-")[2] %>"/></span>
						</div>
					</td>
			  	</tr>
			  	<tr>
			    	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl wA m_floatNone">이메일</span></th>
			    	<td class="end" colspan="3">
						<div class="emailBoxWrap">
		                	<span class="boxEmailStart">
		                    	<input id="email" name="email1" title="이메일 앞자리" type="text" value="<%=dto.getOuter_email().split("@")[0] %>"/>
		                    </span>
		                    <span class="boxEmailMool">@</span>
		                    <span class="boxEmailEndInput"><input id="domain" type="text" title="이메일 도메인 입력란" name="email2" value="<%=dto.getOuter_email().split("@")[1] %>" /></span>
		                    <span class="boxEmailEnd">
		                    	<select id="emailNm" name="email" title="이메일 도메인" onchange="javascript:selChange(this.value);">
			                        <option value="sel">이메일 선택</option>
			                        <option value="">직접입력</option>
			                        <option value="naver.com">naver.com</option>
			                        <option value="hanmail.net">hanmail.net</option>
			                        <option value="nate.com">nate.com</option>
			                        <option value="gmail.com">gmail.com</option>
			                        <option value="daum.net">daum.net</option>
			                        <option value="hotmail.com">hotmail.com</option>
			                        <option value="lycos.co.kr">lycos.co.kr</option>
			                        <option value="korea.com">korea.com</option>
			                        <option value="empal.com">empal.com</option>
			                        <option value="dreamwiz.com">dreamwiz.com</option>
			                        <option value="yahoo.com">yahoo.com</option>
			                        <option value="ymail.com">ymail.com</option>
			                        <option value="live.com">live.com</option>
			                        <option value="aol.com">aol.com</option>
			                        <option value="msn.com">msn.com</option>
			                        <option value="me.com">me.com</option>
			                        <option value="icloud.com">icloud.com</option>
			                        <option value="rocketmail.com">rocketmail.com</option>
			                        <option value="qq.com">qq.com</option>
			                        <option value="link.com">link.com</option>
		                        </select>
							</span>
						</div>            
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
							<div class="txtareaBox2">
								<div class="all100 borderL01 mr10 pL10">
									<textarea rows="" cols="" class="h50" name="content" id="contents" title="행사 주요내용 내용입력란"><%=dto.getOuter_content() %></textarea>
									<span class="dB lh22 wA">남은 글자 수 : (1000/1000)이내</span>
								</div>
							</div>
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
							<div class="txtareaBox2">
								<div class="all100 borderL01 mr10 pL10">
									<textarea rows="" cols="" class="h50" name="progress" id="eventsch"  title="행사 진행일정 내용입력란"><%=dto.getOuter_progress() %></textarea>
									<span class="dB lh22 wA">남은 글자 수 : (1000/1000)이내</span>
								</div>
							</div>
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
							<div class="txtareaBox2">
								<div class="all100 borderL01 mr10 pL10">
									<textarea rows="" cols="" class="h50" name = "equipment" id="addequ" title="추가장비 반입및 설비 설치계획(장비규모운반계획,행사준비및 설치시간등) 내용입력란"><%=dto.getOuter_equipment() %></textarea>
									<span class="dB lh22">남은 글자 수 : (1000/1000)이내</span>
								</div>
							</div>
						</div>      
				    </td>
				  </tr>
			  	<tr>
			    	<th scope="row"><span class="txt dB alignLeft pL30 wA">공연자 프로필<br/>및 활동약력</span></th>
				    <td class="end" colspan="3">
						<div class="fl pt7 ml10 m_width100 w100">
							<div class="fl m_width100 pt7 m_w100p box5054 w100">
								<textarea rows="" cols="" class="h50" name="profile" id="profile"  title="공연자 프로필 및 활동약력 입력란"><%=dto.getOuter_profile() %></textarea>
							</div>
				
							<div class="mtM20">남은 글자 수 : (1000/1000)이내</div>
						</div>
					</td>
				</tr>
			  	<tr>
			    	<th scope="row"><span class="txt dB alignLeft pL30 wA">요청사항</span></th>
			    	<td class="end" colspan="3">
						<div class="fl m_width100 pt7 ml10 w100">
							<div class="fl m_width100 pt7 m_w100p box5054 w100">
								<textarea rows="" cols="" class="w97p h50" name="outer_request" id="etcreq" title="요청사항 입력란"><%=dto.getOuter_request() %></textarea>
							</div>
							<div class="mtM20">남은 글자 수 : (1000/1000)이내</div>
						</div>
					</td>
			  	</tr>
			  	<tr>
			    	<th scope="row">
			    		<span class="txt dB alignLeft pL30 wA">
			    			<label for="kongyenday">공연일자</label>
			    		</span>
			    	</th>
			    	<td>
			    		<div class="box30 lh22" id="evDate">
			    			<input type ="hidden" readonly="readonly" title="공연일자" id="kongyenday" style="border:0" value="" />
			    		</div>
			    		<input id="usedate" name="date" value="<%=dto.getOuter_date() %>"/>
			   		</td>
				    <th>
				    	<span class="txt dB alignLeft pL30 wA">신청일자</span>
				    </th>
				    <td class="end">
				    	<div class="box30 lh22">
				    		<%=dto.getOuter_regidate() %>
				    	</div>
				    </td>
			  	</tr>
			  	<tr>
				<td colspan="2">
					<a id="submit" class="btn btn-sm btn-primary">확인</a>
					<a id="list" class="btn btn-sm btn-primary">뒤로</a>
					</td>
				</tr>
			</table>
		</div>
		<%-- <span style="text-align:right">
		<a href="OutdoorstageapplicationEditOk.jsp?no=<%=dto.getOuter_no() %>"><button type="button" class="btn btn-sm btn-info">수정</button></a>
		</span>
		<span style="text-align:right">
		<a href="<c:url value='Outdoorstageapplication.jsp'/>"><button type="button" class="btn btn-sm btn-info">목록</button></a>
		</span> --%>

		</form>

	</div>
	<!-- /내용끝 -->
</body>
</html>