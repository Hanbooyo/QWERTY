<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="result" value="${param.result}"/>
<c:set var="idCheck" value="${param.idCheck}"/>
<c:set var="joinResult" value="${param.joinResult}"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>로그인/회원가입</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/login.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script>
	function fn_GoToCheck() {
		alert('아이디 중복확인이 필요합니다.');
	}
</script>
<c:choose>
	<c:when test="${result == 'loginFailed'}">
		<script>
			$(function () {
				alert('아이디나 비밀번호가 틀립니다. 다시 로그인 하세요!');
			});
		</script>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${idCheck == 'existence'}">
		<script>
			$(function () {
				alert('이미 존재하는 아이디 입니다. 다른 아이디로 다시 시도해 주세요');
				$(".checkbox").prop("checked", true);
			});
		</script>
	</c:when>
	<c:when test="${idCheck == 'possible'}">
		<script>
			$(function () {
				alert('사용 가능한 아이디 입니다.');
				$(".checkbox").prop("checked", true);
			});
		</script>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${joinResult == 'success'}">
		<script>
			$(function () {
				alert('회원가입이 완료되었습니다. 로그인 후 이용해 주세요.');
			});
		</script>
	</c:when>
	
</c:choose>
<meta charset="UTF-8">
</head>
<body>
	<!-- Page info section -->
	<section class="page-info-section set-bg" data-setbg="${contextPath}/resources/img/loginbg1.jpg">
		<div class="pi-content">
			<div class="container">
				<div class="row">
					<div class="col-xl-5 col-lg-6 text-white">
						<h2 style="color: #000; font-weight: bold;">로그인/회원가입</h2>
						<p style="color: #000; font-weight: bold; font-size: 23px;">어서
							회원이 되어서 함께 월드컵을 즐겨요!</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Page info section -->

	<div class="emtpyblock"></div>
	<!-- Page section -->

	<section class="page-section spad contact-page">
		<div class="container">
			<!--로그인/회원가입 부분 시작 -->
				<div class="section">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-12 text-center align-self-center py-5">
								<div class="section pb-5 pt-5 pt-sm-2 text-center">
									<h6 class="mb-0 pb-3" style="color: #fff; font-weight: bold;">로그인&nbsp;&nbsp;&nbsp;회원가입</h6>
									<input class="checkbox" type="checkbox" id="reg-log"
										name="reg-log" /> <label for="reg-log"></label>
									<div class="card-3d-wrap mx-auto">
										<div class="card-3d-wrapper">
											<div class="card-front">
												<div class="center-wrap">
													<div class="section text-center">
														<div>
															<br>
														</div>
														<h4 class="mb-4 pb-3"
															style="color: #fff; font-weight: bold;">로그인</h4>
														<form action="${contextPath}/member/login.do" method="post" name="frmLogin">
															<div class="form-group">
																<input type="text" name="id" class="form-style"
																	placeholder="ID" id="id" autocomplete="off" required="required"> 
																	<i class="input-icon uil uil-at"></i>
															</div>
															<div class="form-group mt-2">
																<input type="password" name="pwd" class="form-style"
																	placeholder="Password" id="pwd" autocomplete="off" required="required">
																<i class="input-icon uil uil-lock-alt"></i>
															</div>
															<input type="submit" class="btn mt-4" value="로그인">
														</form>
													</div>
												</div>
											</div>
											<div class="card-back">
												<div class="center-wrap">
													<div class="section text-center">
														<h4 class="mb-4 pb-3" style="color: #fff; font-weight: bold;">가입하기</h4>
														<c:choose>
															<c:when test="${idCheck == null || idCheck == 'existence'}">
																<form action="${contextPath}/member/idCheck.do" method="post">
																	<div class="form-group">
																		<input type="text" name="id" class="form-style" placeholder="ID" id="id" autocomplete="off" required="required"> 
																		<i class="input-icon uil uil-user"></i>
																		<button type="submit">중복확인</button>
																	</div>
																	<div class="form-group">
																		<input type="password" name="pwd" class="form-style" placeholder="Password" id="pwd" autocomplete="off">
																		<i class="input-icon uil uil-lock-alt"></i>
																	</div>
																	<div class="form-group">
																		<input type="text" name="name" class="form-style" placeholder="이름" id="name" autocomplete="off"> <i
																			class="input-icon uil uil-user"></i>
																	</div>
																	<div class="form-group">
																		<input type="tel" name="tel" class="form-style" placeholder="휴대폰 번호" id="tel" autocomplete="off">
																		<i class="input-icon uil uil-user"></i>
																	</div>
																	<div class="form-group mt-2">
																		<input type="text" name="email" class="form-style" placeholder="Email" id="email" autocomplete="off">
																		<i class="input-icon uil uil-at"></i>
																	</div>
																	<input type="button" class="btn mt-4" value="가입하기" onclick="fn_GoToCheck()"></a>
																</form>
															</c:when>
															<c:when test="${idCheck == 'possible'}">
																<form action="${contextPath}/member/addMember.do" method="post">
																	<div class="form-group">
																		<input type="text" name="id" class="form-style" placeholder="ID" id="id"  value="${param.possibleID}" autocomplete="off"> 
																		<i class="input-icon uil uil-user"></i>
																		<button type="submit" disabled>중복확인</button>
																	</div>
																	<div class="form-group">
																		<input type="password" name="pwd" class="form-style" placeholder="Password" id="pwd" autocomplete="off">
																		<i class="input-icon uil uil-lock-alt"></i>
																	</div>
																	<div class="form-group">
																		<input type="text" name="name" class="form-style" placeholder="이름" id="name" autocomplete="off"> <i
																			class="input-icon uil uil-user"></i>
																	</div>
																	<div class="form-group">
																		<input type="tel" name="tel" class="form-style" placeholder="휴대폰 번호('-'포함)" id="tel" autocomplete="off">
																		<i class="input-icon uil uil-user"></i>
																	</div>
																	<div class="form-group mt-2">
																		<input type="text" name="email" class="form-style" placeholder="Email" id="email" autocomplete="off">
																		<i class="input-icon uil uil-at"></i>
																	</div>
																	<input type="submit" class="btn mt-4" value="가입하기"></a>
																</form>
															</c:when>
														</c:choose>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			<!--로그인/회원가입 부분 종료 -->
			<!--제휴탭 부분 시작-->
			<div class="emtpyblock">
				<br>
			</div>
			<div class="row">
				<div class="col-lg-6 mb-5 mb-lg-3">
					<h4 class="comment-title">제휴하기</h4>
					<p>저희는 2022 카타르 월드컵 관련 페이지를 운영하면서 다양한 축구 굿즈도 판매중입니다. 또한 월드컵 관련
						광고 제휴도 가능하니 연락주시기 바랍니다!</p>
					<div class="row">
						<div class="col-md-9">
							<ul class="contact-info-list">
								<li><div class="cf-left">주소</div>
									<div class="cf-right">서울시 종로구 미려빌딩 6층</div></li>
								<li><div class="cf-left">연락처</div>
									<div class="cf-right">02-773-8782</div></li>
								<li><div class="cf-left">E-mail</div>
									<div class="cf-right">ezen@gmail.com</div></li>
							</ul>
						</div>
					</div>

					<div class="social-links">
						<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
							class="fa fa-twitter"></i></a> <a href="#"><i
							class="fa fa-google"></i></a> <a href="#"><i class="fa fa-letter"></i></a>
					</div>
				</div>

			</div>
		</div>
		</div>
		</div>
	</section>
	<!--제휴탭 부분 종료-->
	<!-- Page section end -->
</body>
</html>