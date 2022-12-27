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
</head>
<body>
	<!-- 푸터 영역 상단 부분 시작 -->
	<section class="footer-top-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="footer-logo text-white">
						<img src="${contextPath}/resources/img/footerlogo4.png" class="footlogo"
							alt="">
						<p>Qatar Worldcup Easy Resoponse To You</p>
					</div>
				</div>

				<div class="col-lg-4 col-md-6">
					<div class="footer-widget mb-5 mb-md-0">
						<h4 class="fw-title">주요 기술 스택</h4>
						<div class="footer_flex">
							<div><img class="flex_logo" src="${contextPath}/resources/img/flogo1.png" alt="logo"></div>
							<div><img class="flex_logo" src="${contextPath}/resources/img/flogo2.png" alt="logo"></div>
							<div><img class="flex_logo" src="${contextPath}/resources/img/flogo3.png" alt="logo"></div>
							<div><img class="flex_logo" src="${contextPath}/resources/img/flogo4.png" alt="logo"></div>
							<div><img class="flex_logo" src="${contextPath}/resources/img/flogo5.png" alt="logo"></div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="footer-widget">
						<h4 class="fw-title">웹페이지 제작</h4>
						<div class="top-comment">
							<div class="tc-item">
								<div class="tc-thumb set-bg" data-setbg="${contextPath}/resources/img/member/han.png"></div>
								<div class="tc-content">
									<p class="footer_repair"><a href="https://github.com/Hanbooyo"
											target="_blank">한부영</a>&nbsp;&nbsp;<br> 풀스택(프론트엔드, 백엔드)</p>
									<div class="tc-date"></div>
								</div>
							</div>
							<div class="tc-item">
								<div class="tc-thumb set-bg" data-setbg="${contextPath}/resources/img/member/kimsun.jpg"></div>
								<div class="tc-content">
									<p class="footer_repair"><a href="https://github.com/sunkang-kim"
											target="_blank">김선강</a>&nbsp;&nbsp;<br> 풀스택(프론트엔드, 백엔드)</p>
									<div class="tc-date"></div>
								</div>
							</div>
							<div class="tc-item">
								<div class="tc-thumb set-bg" data-setbg="${contextPath}/resources/img/member/park.jpg"></div>
								<div class="tc-content">
									<p class="footer_repair"><a href="https://github.com/shpark010"
											target="_blank">박성환</a>&nbsp;&nbsp;<br> 풀스택(프론트엔드, 백엔드)</p>
									<div class="tc-date"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 푸터 상단 부분 종료 -->


	<!-- 푸터 영역 하단 부분 시작 -->
	<footer class="footer-section">
		<div class="container">
			<ul class="footer-menu">
				<li><a href="${contextPath}/main.do">홈</a></li>
				<li><a href="${contextPath}/match/schedule.do">경기</a></li>
				<li><a href="${contextPath}/video.do">영상</a></li>
				<li><a href="${contextPath}/fBoard/FarticleList.do">커뮤니티</a></li>
				<li><a href="${contextPath}/shop.do">쇼핑</a></li>
			</ul>
			<p class="copyright">
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				Copyright &copy;
				<script>
					document.write(new Date().getFullYear());
				</script>
				All rights reserved <i class="fa fa-heart-o" aria-hidden="true"></i>
				by <a href="https://colorlib.com" target="_blank">QWERTY</a>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			</p>
		</div>
	</footer>
	<!-- 푸터 부분 종료 -->
</body>
</html>