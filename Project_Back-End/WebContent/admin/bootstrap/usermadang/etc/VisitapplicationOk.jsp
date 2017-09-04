
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
                  <td class="end">갓5조</td>
              </tr>
              <tr>
                 <th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl">신청자명</span></th>
                  <td class="end">5조염</td>
              </tr>
              <tr>
                 <th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl">비밀번호</span></th>
                  <td class="end">1234</td>
              </tr>
              <tr>
                 <th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl">전화번호</span></th>
                  <td class="end">010-0000-0000</td>
                </tr>
                <tr>
                 <th scope="row"><span class="star">*</span><span class="txt dB lh30 alignLeft pL10 fl m_ml0">이메일</span></th>
                  <td class="end">
                     <div class="emailBoxWrap">
                         <span class="boxEmailStart">qmfwkaxn</span>
                          <span class="boxEmailMool">@</span>
                          <span class="boxEmailEndInput">naver.com</span>
<!--                           <span class="boxEmailEnd"> -->
<!--                              <select id="emailNm" name="emailNm" title="이메일 도메인"> -->
<!--                                 <option value="sel">이메일 선택</option> -->
<!--                                  <option value="">직접입력</option> -->
<!--                                  <option value="naver.com">naver.com</option> -->
<!--                                  <option value="hanmail.net">hanmail.net</option> -->
<!--                                  <option value="nate.com">nate.com</option> -->
<!--                                  <option value="gmail.com">gmail.com</option> -->
<!--                                  <option value="daum.net">daum.net</option> -->
<!--                                  <option value="hotmail.com">hotmail.com</option> -->
<!--                                  <option value="lycos.co.kr">lycos.co.kr</option> -->
<!--                                  <option value="korea.com">korea.com</option> -->
<!--                                  <option value="empal.com">empal.com</option> -->
<!--                                  <option value="dreamwiz.com">dreamwiz.com</option> -->
<!--                                  <option value="yahoo.com">yahoo.com</option> -->
<!--                                  <option value="ymail.com">ymail.com</option> -->
<!--                                  <option value="live.com">live.com</option> -->
<!--                                  <option value="aol.com">aol.com</option> -->
<!--                                  <option value="msn.com">msn.com</option> -->
<!--                                  <option value="me.com">me.com</option> -->
<!--                                  <option value="icloud.com">icloud.com</option> -->
<!--                                  <option value="rocketmail.com">rocketmail.com</option> -->
<!--                                  <option value="qq.com">qq.com</option> -->
<!--                                  <option value="link.com">link.com</option> -->
<!--                                </select> -->
<!--                          </span> -->
                       </div>                                                                            
                   </td>
               </tr>
              <tr>
                 <th scope="row"><span class="star">*</span><span class="txt dB alignLeft pL10 fl lh30">참관(견학)대상 구분</span></th>
                  <td class="end">
                     <div class="soloSelectBox">
                      		 도서관 관련직원
                        </div>
                 </td>
              </tr>
              <tr>
                 <th scope="row"><span class="star">*</span><span class="txt dB alignLeft pL10 fl lh30">참관(견학)인원</span></th>
                  <td class="end">5명</td>
            </tr>
              <tr>
                 <th scope="row"><span class="star">*</span><span class="txt dB alignLeft pL10 lh30 fl">성별인원</span></th>
                  <td class="end">
                    남성 2명 여성 3명
               </td>
              </tr>
              <tr>
                 <th scope="row"><span class="txt dB alignLeft pL30">참관(견학)일시</span></th>
                  <td class="end">
                    <span class="txt dB alignLeft pL10">
                    2017년 09월  08일  
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
                           공부하고자 참관합니다
                       </div>
                   </td>
               </tr>
            </table>
            <div align="right">
            <a href="<c:url value='VisitapplicationUpdate.jsp'/>" class="btn btn-sm btn-info">수정</a>
            <a href="<c:url value='Visitapplication.jsp'/>" class="btn btn-sm btn-info">목록</a>
             <button class="btn btn-sm btn-info">삭제</button>
            </div>
         </div><!-- tableBox e -->
      </form><!-- reqReservationVO e -->
   </div><!-- body e -->
</div><!-- contentBody e -->  
</div>
</div>



</body>
</html>