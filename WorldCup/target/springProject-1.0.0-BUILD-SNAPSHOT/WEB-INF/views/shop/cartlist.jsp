<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/shop/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/shop/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/shop/css/magnific-popup.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/shop/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/shop/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/shop/css/style.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/board.css">
	<script>
		$(function() {
			let amout = $('#amount').val();
		});
	</script>
	<c:set var="totAmount" value="${amount}"/>
</head>
<body>
	<!-- Page info section -->
	<section class="page-info-section set-bg" data-setbg="${contextPath}/resources/img/commbg.jpg">
		<div class="pi-content">
			<div class="container">
				<div class="row">
					<div class="col-xl-5 col-lg-6 text-white">
						<h2 style="color: #fff; font-weight: bold;">장바구니</h2>
						<p style="color: #fff; font-weight: bold; font-size: 20px;"></p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Page info section -->

	
	<!-- Page section -->
	<section class="page-section recent-game-page">
		<section class="shop-cart">
			<div class="container">
				<h3 style="padding-bottom: 50px;">장바구니</h3>
				<div class="row">
					<div class="col-lg-12">
						<div class="shop__cart__table">
							<table>
								<thead>
									<tr>
										<th>상품 이미지</th>
										<th>상품명</th>
										<th>가격</th>
										<th>상품 옵션</th>
										<th>상품 수량</th>
										<th>총 가격</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${shopVOList == null}">
											<tr>
												<td colspan="5">장바구니에 담긴 상품이 없습니다</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="item" items="${shopVOList}" varStatus="status">	
													<tr> 
														<td class="cart__product__item">
															<img style="width: 90px; height: 90px;" src="${contextPath}/resources/img/items/${item.i_img}1.png" alt="">
														</td>
														<td>
															<div class="cart__product__item__title">
																<h6>${item.i_name}</h6>
															</div>
														</td>
														<td class="cart__price"><fmt:formatNumber value="${item.i_price}" pattern="###,###"></fmt:formatNumber>원</td>
														<c:choose>
															<c:when test="${item.i_option != 'default'}">
																<td class="cart__quantity">${item.i_option}</td>
															</c:when>
															<c:otherwise>
																<td class="cart__quantity">옵션없음</td>
															</c:otherwise>
														</c:choose>
														<td>${cartlist[status.index].c_count}</td>
														<td class="cart__total"><fmt:formatNumber value="${item.i_price * cartlist[status.index].c_count}" pattern="###,###"></fmt:formatNumber></td>
													</tr>
												</c:forEach>
											</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="cart__btn">
							
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="cart__btn update__btn">
							<a style="font-size: 30px;" href="${contextPath}/shop.do">계속 쇼핑하기</a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
					</div>
					<div class="col-lg-4 offset-lg-2">
						<div class="cart__total__procced">
							<ul>
								<li>+ ) 배송비<span>3,000원</span></li>
								
							</ul>
							<a href="${contextPath}/checkout.jsp" class="primary-btn">구매하기</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Shop Cart Section End -->
	
			</section>

	<!-- 푸터 부분 종료 -->
	<!--====== Javascripts & Jquery ======-->
	<script src="${contextPath}/resources/shop/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath}/resources/shop/js/jquery-ui.min.js"></script>
	<script src="${contextPath}/resources/shop/js/mixitup.min.js"></script>
	<script src="${contextPath}/resources/shop/js/jquery.countdown.min.js"></script>
	<script src="${contextPath}/resources/shop/js/jquery.slicknav.js"></script>
	<script src="${contextPath}/resources/shop/js/jquery.nicescroll.min.js"></script>
	<script src="${contextPath}/resources/shop/js/main.js"></script>
    </body>
</html>