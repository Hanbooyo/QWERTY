<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>2022 카타르 월드컵</title>
	<link href="${contextPath}/resources/img/favicon.ico" rel="shortcut icon"/>

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/owl.carousel.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/animate.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/elegant-icons.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/jquery-ui.min.css"/>
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/media.css"/>
	<script src="${contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script src="${contextPath}/resources/js/youtube.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${contextPath}/resources/js/jquery-ui.min.js"></script>
	<meta charset="UTF-8">
</head>
<body>
	<!-- Page info section -->
	<section class="page-info-section set-bg" data-setbg="${contextPath}/resources/img/commbg.jpg">
		<div class="pi-content">
			<div class="container">
				<div class="row">
					<div class="col-xl-5 col-lg-6 text-white">

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Page info section -->


	<!-- Page section -->
	<section class="page-section review-page spad">
		<!--all video start-->
		<div class="selectV container" >
			<form name="form1" method="post" onsubmit="return false;">
				<button class="btn_v" id="all" onclick="find('카타르 월드컵 경기');">전체</button>
				<button class="btn_v" id="goal" onclick="find('카타르 월드컵 경기 골영상');">골영상</button>
				<button class="btn_v" id="highlight" onclick="find('카타르 월드컵 경기 주요장면');">하이라이트</button>
			</form>
		</div>
		<div class="container" id="all">
			<div class="row player" id="get_view">
				<!-- <div class="review-item">
					<div class="review-title">

					</div>
					<div class="review-cover set-bg"> -->
						<!--영상 들어갈 곳-->
					<!-- </div>
					<div class="review-text"> -->
						<!--설명 들어갈 곳-->
					<!-- </div>
				</div> -->
			</div>
			<div class="text-center pt-4" id="btn_page">
			</div>
		</div>
		<!-- all video end -->
	</section>
	<!-- Page section end -->
    </body>
</html>