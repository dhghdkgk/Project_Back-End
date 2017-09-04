
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="<c:url value='/admin/bootstrap/css/bootstrap.min.css' />">
<!-- Bootstrap theme -->
<link rel="stylesheet" href="<c:url value='/admin/bootstrap/css/bootstrap-theme.min.css' />">

<!-- Bootstrap core JavaScript
   ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
<script src="<c:url value='/admin/bootstrap/js/bootstrap.min.js'/>"></script>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">20/30 관리자</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="<c:url value='/'/>">홈</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">자료등록
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#"style="color:red; font-size: 15px; font-weight:bold">도서자료 등록</a></li>
						<li><a href="<c:url value='/admin/bootstrap/datasearch/ElectronicLib.jsp' />">도서자료 검색</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">회원관리
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/admin/bootstrap/member/Register.jsp' />">회원 등록</a></li>
						<li><a href="<c:url value='/admin/bootstrap/member/Memberleave.jsp' />">회원 검색</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">신착자료
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/admin/bootstrap/datasearch/Publishedbook.jsp' />">신착단행본 안내</a></li>
						<li><a href="<c:url value='/admin/bootstrap/datasearch/Newbookofnowweek.jsp' />">금주의 신간</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">책이야기
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/admin/bootstrap/datasearch/Reviewofnowweek.jsp' />">금주의 서평</a></li>
						<li><a href="<c:url value='/admin/bootstrap/datasearch/Recommandbook.jsp' />">오늘의 책</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">신청 및 예약
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/admin/bootstrap/usermadang/etc/Reservation.jsp' />">디지털정보센터 좌석예약</a></li>
						<li><a href="<c:url value='/admin/bootstrap/usermadang/etc/Applicationdata.jsp' />">야간이용 자료신청</a></li>
						<li><a href="<c:url value='/admin/bootstrap/usermadang/etc/Applicationbook.jsp' />">비치희망도서 신청</a></li>
						<li><a href="<c:url value='/admin/bootstrap/usermadang/etc/Newregister.jsp' />">메일링 서비스</a></li>
						<li><a href="<c:url value='/admin/bootstrap/usermadang/etc/Visitapplication.jsp' />">참관(견학) 및 연수</a></li>
						<li><a href="#" style="color:red; font-size: 15px; font-weight:bold">대여/반납</a></li>
						<li><a href="<c:url value='/admin/bootstrap/usermadang/etc/Outdoorstageapplication.jsp' />">야외공연장 대관</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">게시판
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/admin/bootstrap/usermadang/notice/Notice.jsp' />">공지사항</a></li>
						<li><a href="<c:url value='/admin/bootstrap/usermadang/notice/Q&A.jsp' />">자주하는 질문</a></li>
						<li><a href="<c:url value='/admin/bootstrap/usermadang/notice/Question.jsp' />">묻고 답하기</a></li>
						<li><a href="<c:url value='/admin/bootstrap/libintroduce/notice/Photodata.jsp' />">사이버 홍보실</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>