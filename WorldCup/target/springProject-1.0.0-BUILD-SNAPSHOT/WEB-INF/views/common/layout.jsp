<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>2022 카타르 월드컵</title>
	<meta charset="UTF-8">
	<meta name="description" content="Game Warrior Template">
	<meta name="keywords" content="warrior, game, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->   
	<link href="${contextPath}/resources/img/favicon.ico" rel="shortcut icon"/>

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/owl.carousel.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/animate.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/login.css" />
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/schedule.css" />


	<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>
	<header class="header-section">
		<tiles:insertAttribute name="header" />
	</header>
	<!-- 경기일정 시작 -->
	<div class="latest-news-section">
		<div class="ln-title">오늘의 경기 일정</div>
		<div class="news-ticker">
			<div class="news-ticker-contant">
				<div class="nt-item"><span class="new">16강</span>대한민국(Republic of Korea) vs 브라질(Brazil)</div>
				<div class="nt-item"><span class="strategy">16강</span>일본(Japan) vs 크로아티아(Croatia)</div>
				<div class="nt-item"><span class="racing">16강</span>스페인(Spain) vs 모로코(Moroco)</div>
			</div>
		</div>
	</div>
	<!-- 경기일정 종료 -->
	<div id="content">
		<tiles:insertAttribute name="body" />
	</div>
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>

	<!--====== Javascripts & Jquery ======-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.marquee.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/schedule.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>