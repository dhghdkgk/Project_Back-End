
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
<script>
$(function(){

	$("a").click(function(){
		if(this.id == "list"){	
			location.href ="Question.jsp";
		} else {
			$(this).parents("form").submit();
		}
	});
});
	
	
</script>
<script>
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
			<h1>회원관리</h1>
				
				
		</div>
		
		<!-- 아래의 실제 내용 표시 -->
		<div>
			<form action="QuestionWriteOk.jsp" method="post">
			
			<div class="col-md-6">
		
			<table class="normalTable table">
				<caption>묻고 답하기</caption>
				<colgroup>
					<col style="width:20%;" />
					<col style="width:80%;" />
				</colgroup>
				<tr>
				<th>질문자</th>
				<td><input type="text" name="name"/></td>
				</tr>
			  <tr>
			    <th scope="row">구분</th>
			    <td class="end">
					
					<input type="radio"  name="division" checked="checked" value="일반"/>
							<label>일반</label>
					<input type="radio" name="division"  value="민원"/>
						<label>민원</label>
				</td>
			  </tr>
			  <tr>
			    <th scope="row">*<span>이메일</span></th>
			    <td class="end">
					<div class="emailBoxWrap">
	                    <span class="boxEmailStart">
	                        <input id="email" name="email1" title="이메일 앞자리" type="text" value=""/>
	                    </span>
	                    <span class="boxEmailMool">@</span>	                   
	                   <span class="boxEmailEndInput"><input type="text" title="이메일 도메인 입력란" name="email2"  value="" /></span>
                          <span class="boxEmailEnd">
                             <select id="anwser" name="email" title="이메일" onchange="javascript:selChange(this.value);">
                                 <option value="">이메일 선택</option>
			                   <option value="sel">직접입력</option>
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
			    <th scope="row"><span class="star01 pL10 m_pL0 fl m_pR0">*</span><span class="fl lh22">전화번호</span></th>
			    <td class="end">
					<div class="phoneBoxWrap">
					  <span class="boxPhoneStart">
						   <select id="tel1" name="tel1" title="지역번호 또는 무선사업자번호 선택">
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
					  </span>
					  <span class="phoneMool">-</span>
					  <span class="boxPhoneCenter">
						<input  name="tel2" title="핸드폰 중간자리" type="text" value=""/>
					  </span>
					  <span class="phoneMool">-</span>
					  <span class="boxPhoneEnd">
						  <input  name="tel3" title="핸드폰 끝자리" type="text" value=""/>
					  </span>
					</div>
						</td>
					  </tr>
					  <tr>
					    <th scope="row"><span class="pL25 dB lh22 m_pL0">문의 공개여부</span></th>
					    <td>
					
							<input type="radio" name="open" value="공개"checked="checked"/>
								<label>공개</label>
					
							
								<input type="radio" name="open" value="비공개"/>
								<label>비공개</label>
					
						</td>
					  </tr>
					  <tr>
					    <th scope="row"><span class="pL25 dB lh22 m_pL0">메일 수신여부</span></th>
					    <td class="end">
							
								<span><input type="radio"value="Y" name="emailing"checked="checked"/></span>
								<label>수신</label>
						
							
								<input type="radio"name="emailing" value="N"/>
								<label>수신하지 않음</label>
							
						</td>
					  </tr>
					  <tr>
					    <th scope="row"><span class="pL25 dB lh22 m_pL0">SMS 수신여부</span></th>
					    <td class="end">
							
								<span><input type="radio"value="Y" name="sms" checked="checked"/></span>
								<label>수신</label>
							
						
							<input type="radio" name="sms" value="N"/>
								<label>수신하지 않음</label>
						
						</td>
					  </tr>
					  <tr>
					    <th scope="row"><span>*</span>제목</th>
					    <td class="end">
						
								<input type="text" name="title" title="제목 입력란" />
						</td>
					  </tr>
					  <tr>
					    <th scope="row"><span>*</span>내용</th>
					    <td class="end">
							
					<textarea  title="내용입력란" name="content"></textarea>
						
						</td>
					  </tr>
					  <!--    -->
					  <tr>
					    <th scope="row"><span class="pL25 m_pL0">첨부파일</span></th>
					    <td class="end">
							<div class="pL10 mt10">
					            <input  type="file" name="file" title="첨부파일 선택" />
							</div>
							<p >* 보안을 위해 업로드 하는 파일은 zip 압축파일로 제한이 됩니다.</p> 
							<p >* 파일첨부가 필요한 경우 zip 파일로 압축하여 업로드 하시기 바랍니다.</p> 
						</td>
					  </tr>
							<tr>
						<td colspan="2">
							 
							<a id="submit" class="btn btn-sm btn-primary" >등록</a>
							<a id="list" class="btn btn-sm btn-primary" >목록</a>
							
						</td>
					</tr>
					</table>
	
			</div>
			</form>	
		</div>



	</div>
	<!-- /내용끝 -->
</body>
</html>