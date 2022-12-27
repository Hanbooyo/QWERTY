<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>2022 카타르 월드컵</title>
<meta charset="UTF-8">
</head>
<body>


	<!-- 헤더 영역 시작 -->
		<div class="container">
			<!-- 로고 -->
			<a class="site-logo" href="${contextPath}/main.do">
				<img src="${contextPath}/resources/img/logo2.jpg" class="headlogo" alt="">
			</a>
			<div class="user-panel">
			<c:choose>
					<c:when test="${isLogOn == true && member != null}">
						<p style="color:#fff;">${member.id}님</p>
						<a href="${contextPath}/member/mypage.do" style="cursor: pointer;">마이페이지　　/　　</a>
						<a href="${contextPath}/member/logout.do" style="cursor: pointer;">로그아웃</a>
					</c:when>
					<c:otherwise>
						<a href="${contextPath}/member/loginForm.do" style="cursor: pointer;">로그인　　/　　</a><a href="${contextPath}/member/loginForm.do" style="cursor: pointer;">회원가입</a>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- responsive -->
			<div class="nav-switch">
				<i class="fa fa-bars"></i>
			</div>
			<!-- site menu -->
			<nav class="main-menu">
				<ul>
					<li><a href="${contextPath}/main.do">홈</a></li>
					<li><a href="${contextPath}/match/matchSchedule.do">경기</a></li>
					<li><a href="${contextPath}/video.do">영상</a></li>
					<li><a href="${contextPath}/fBoard/listArticles.do">커뮤니티</a></li>
					<li><a href="${contextPath}/shop.do">쇼핑</a></li>
				</ul>
			</nav>
		</div>
	<!-- 헤더 영역 종료 -->
	
	
</body>
</html>