<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>2022 카타르 월드컵</title>
	<meta charset="UTF-8">
	<meta name="description" content="2022 worldcup page">
	<meta name="keywords" content="worldcup fifa">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 파비콘 -->
	<link href="${contextPath}/resources/img/favicon.ico" rel="shortcut icon" />
	<link href="${contextPath}/resources/css/paper-dashboard.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/mypage.css" rel="stylesheet" />
</head>
<body>
	<!-- 상단 이미지 영역 시작 -->
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
	<!-- 상단 이미지 영역 종료 -->

	<div class="emtpyblock"></div>

	<!-- 마이페이지 영역 시작 -->
	<section class="page-section spad contact-page">
	<div class="pi-content">
				<div class="wrapper">
					 <div class="container">
					<div class="main-panel">
						<nav class="navbar navbar-default">
							<div class="container-fluid">
								<div class="navbar-header">
									<a class="navbar-brand">내 정보</a>
								</div>
								<div class="collapse navbar-collapse">
								</div>
							</div>
						</nav>
							<div class="container-fluid">
								
									<div class="row">
										<div class="col-lg-4 col-md-5">
											<div class="card card-user">
												<div class="image">
													<img src="${contextPath}/resources/img/background.jpg" alt="..." />
												</div>
												<div class="content">
													<div class="author">
															<br><br><br><br>
														<h4 class="title">${member.id}님
														</h4>
													</div>
													<p class="description text-center">
														월드컵 페이지 회원 정보
													</p>
													<div class="text-center">
														<a  href="${contextPath}/member/removeMember.do?id=${member.id}">회원탈퇴</a>
													</div>
												</div>
												<hr>
												<div class="text-center">
													<div class="row">
													</div>
												</div>
											</div>
											
										</div>
										<div class="col-lg-7 col-md-7">
											<div class="card">
												<div class="header">
													<h4 class="title">내 정보 수정하기</h4>
												</div>
												<div class="content myInfo">
													<form action="${contextPath}/member/updateMember.do?id=${member.id}" method="post">
													
														<div class="row">
															<div class="col-md-3">
																<div class="form-group id">
																	<label>아이디</label>
																	<input type="text" class="form-control border-input"
																		 value="${member.id}" name="id" disabled>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-3">
																<div class="form-group pwd">
																	<label>비밀번호</label>
																	<input type="password" class="form-control border-input"
																		placeholder="비밀번호"  value="${member.pwd}" name="pwd">
																</div>
															</div>
														</div>
														
														<div class="row">
															<div class="col-md-3">
																<div class="form-group name">
																	<label>이름</label>
																	<input type="text" class="form-control border-input"
																		 value="${member.name}" name="name" >
																</div>
															</div>
														</div>
														
														<div class="row">
															<div class="col-md-3">
																<div class="form-group tel">
																	<label>휴대폰 번호</label>
																	<input type="tel" class="form-control border-input"
																		placeholder="휴대폰 번호"  value="${member.tel}" name="tel">
																</div>
															</div>
														</div>
														
														<div class="row">
															<div class="col-md-3">
																<div class="form-group email">
																	<label for="exampleInputEmail1">Email</label>
																	<input type="email" class="form-control border-input" value="${member.email}"
																			placeholder="Email" name="email" autocomplete="off">
																</div>
															</div>
														</div>
														
														<div class="text-center">
															<input type="submit" class="btn btn-info btn-fill btn-wd"
																value="수정하기"></button>
														</div>
														<div class="clearfix"></div>
													</form>
													
												</div>
											</div>
										</div>
									</div>
							</div>
					</div>
				</div>
		</section>
	<!--마이페이지 영역 종료-->
	<!--====== Javascripts & Jquery ======-->
	<script src="${contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/owl.carousel.min.js"></script>	
</body>
</body>
</html>