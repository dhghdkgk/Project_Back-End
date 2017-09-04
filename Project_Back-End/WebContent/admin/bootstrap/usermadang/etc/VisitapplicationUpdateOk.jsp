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
		<form>
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
		            <td class="end"><div class="box30 box31 box700"><input id="organNm" name="organNm" title="단체명 입력란" type="text" value=""/></div></td>
		        </tr>
		        <tr>
		        	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl">신청자명</span></th>
		            <td class="end"><div class="box30 box31 box700"><input id="visitReqNm" name="visitReqNm" title="신청자명 입력란" type="text" value=""/></div></td>
		        </tr>
		        <tr>
		        	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl">비밀번호</span></th>
		            <td class="end"><div class="box30 box31 box700"><input id="password" name="password" title="비밀번호 입력란" type="text" value=""/></div></td>
		        </tr>
		        <tr>
		        	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl">전화번호</span></th>
		            <td class="end">
		            	<div class="phoneBoxWrap">
		                	<div class="boxPhoneStart">
		                    	<select id="phoneNum1" name="phoneNum1" title="지역번호 또는 무선사업자번호 선택">
									<option >선택</option>
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
		                    </div>
		                	<div class="phoneMool">-</div>
		                    	<div class="boxPhoneCenter"><input id="phoneNum2" name="phoneNum2" title="전화번호 중간자리" type="text" value="" maxlength="4"/></div>
		                        <div class="phoneMool">-</div>
		                        <div class="boxPhoneEnd"><input id="phoneNum3" name="phoneNum3" title="전화번호 끝자리" type="text" value="" maxlength="4"/></div>
		                </div>
		           	</td>
		       	</tr>
		       	<tr>
		        	<th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl m_ml0">이메일</span></th>
		            <td class="end">
		            	<div class="emailBoxWrap">
		                	<span class="boxEmailStart"><input id="email" name="email" title="이메일 앞자리" type="text" value=""/></span>
		                    <span class="boxEmailMool">@</span>
		                    <span class="boxEmailEndInput"><input id="emailNm" name="emailNm" title="이메일 도메인 입력란" type="text" value=""/></span>
<!-- 		                    <span class="boxEmailEnd"> -->
<!-- 		                    	<select id="emailNm" name="emailNm" title="이메일 도메인"> -->
<!-- 			                    	<option value="sel">이메일 선택</option> -->
<!-- 			                        <option value="">직접입력</option> -->
<!-- 			                        <option value="naver.com">naver.com</option> -->
<!-- 			                        <option value="hanmail.net">hanmail.net</option> -->
<!-- 			                        <option value="nate.com">nate.com</option> -->
<!-- 			                        <option value="gmail.com">gmail.com</option> -->
<!-- 			                        <option value="daum.net">daum.net</option> -->
<!-- 			                        <option value="hotmail.com">hotmail.com</option> -->
<!-- 			                        <option value="lycos.co.kr">lycos.co.kr</option> -->
<!-- 			                        <option value="korea.com">korea.com</option> -->
<!-- 			                        <option value="empal.com">empal.com</option> -->
<!-- 			                        <option value="dreamwiz.com">dreamwiz.com</option> -->
<!-- 			                        <option value="yahoo.com">yahoo.com</option> -->
<!-- 			                        <option value="ymail.com">ymail.com</option> -->
<!-- 			                        <option value="live.com">live.com</option> -->
<!-- 			                        <option value="aol.com">aol.com</option> -->
<!-- 			                        <option value="msn.com">msn.com</option> -->
<!-- 			                        <option value="me.com">me.com</option> -->
<!-- 			                        <option value="icloud.com">icloud.com</option> -->
<!-- 			                        <option value="rocketmail.com">rocketmail.com</option> -->
<!-- 			                        <option value="qq.com">qq.com</option> -->
<!-- 			                        <option value="link.com">link.com</option> -->
<!-- 			                   	</select> -->
<!-- 			                </span> -->
			           	</div>                                                                            
			       	</td>
			   	</tr>
		        <tr>
		        	<th scope="row"><span class="star">*</span><span class="txt dB alignLeft pL10 fl lh30">참관(견학)대상 구분</span></th>
		            <td class="end">
		            	<div class="soloSelectBox">
							
								<select id="Select1" name="obj" title="참관(견학)대상 구분">
									<option value="1">도서관관련직원</option>
									<option value="2">문헌정보학과생</option>
									<option value="3">중고등학교 도서반</option>
									<option value="4">초/중/고교생</option>
									<option value="5">일반인</option>
									<option value="6">기타</option>
								</select>
		               	</div>
		        	</td>
		        </tr>
		        <tr>
		        	<th scope="row"><span class="star">*</span><span class="txt dB alignLeft pL10 fl lh30">참관(견학)인원</span></th>
		            <td class="end">
		            	<div class="soloSelectBox1">
		                	<select name="visitCnt" id="visitCnt" title="참관(견학)인원 선택">                 
		                    	<option value="">선택</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>

								</select>
		                </div>
		                <div class="soloSelectBox2">명</div>
		                <div class="soloSelectBox3"> (* 참관(견학)인원은 5명 이상, 30명 이하로 신청 가능)</div>
		            </td>
				</tr>
		        <tr>
		        	<th scope="row"><span class="star">*</span><span class="txt dB alignLeft pL10 lh30 fl">성별인원</span></th>
		            <td class="end">
		            	<div class="m_width2240">
		                	<div class="fl">
		                    	<div class="divDefine fl lh28">남성</div>
		                        <div class="divDefine fl ml0">
		                        	<input id="maleCnt" name="maleCnt" title="남성인원수 입력란" style="text-align: right; " type="text" value=""/>
		                        </div>
		                        <div class="fl ml0 divDefine lh28 m_mr0">명</div>
		                    </div>
		                    <div class="fl m_clear">
		                    	<div class="divDefine fl lh28">여성</div>
		                        <div class="divDefine fl m_ml0">
		                        	<input id="fmaleCnt" name="fmaleCnt" title="여성인원수 입력란" style="text-align: right;" type="text" value=""/>
		                         </div>
		                         <div class="fl lh33 divDefine ml0 lh28 m_mr0">명</div>
		                    </div>
						</div>
					</td>
		        </tr>
		        <tr>
		        	<th scope="row"><span class="txt dB alignLeft pL30">참관(견학)일시</span></th>
		            <td class="end">
			        	<span class="txt dB alignLeft pL10">
				        년 월  일  
						<input id="year" name="year" type="hidden" value=""/>
						<input id="month" name="month" type="hidden" value=""/>
						<input id="day" name="day" type="hidden" value=""/>
						<input id="timeGbn" name="timeGbn" title="참관(견학)일시 입력란" type="hidden" value=""/>
			            </span>
		            </td>
		        </tr>

		        <tr>
		       		<th scope="row"><span class="txt dB alignLeft pL30">참관(견학)내용</span></th>
		       		<td class="end">
			        	<div class="subBoxTxt mb0">
		    	        	<ul class="ml10 mt10 mbM10">
		        	        	<li>열람실 참관(견학)</li>
		            	       	<li>기타요구사항</li>
		               		</ul>
		           		</div>
		           		<div class="fl w97p pt7 ml10 m_w100p w100 mb10">
		               		<pre><textarea id="etcContent" name="etcContent" title="참관(견학) 내용 입력란" class="m_w95 w97p h50"></textarea></pre>
		           		</div>
		       		</td>
		   		</tr>
				</table>
				<div align="right">
				</div>
			</div><!-- tableBox e -->
		</form><!-- reqReservationVO e -->
	</div><!-- body e -->
</div><!-- contentBody e -->  
</div>
</div>



</body>
</html>