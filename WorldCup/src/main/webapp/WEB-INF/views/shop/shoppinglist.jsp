<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<head>
	<title>2022 카타르 월드컵</title>
	<meta charset="UTF-8">
</head>

<body>



	<!-- 상단 이미지 영역 시작 -->
	<section class="page-info-section set-bg" style="height:250px;" data-setbg="${contextPath}/resources/img/group3.jpg">
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

	
	<!-- 쇼핑 영역 시작 -->
	<section class="page-section recent-game-page spad">
		<section class="shop spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-3">
						<div class="shop__sidebar">
							<div class="sidebar__categories">
								<div class="section-title side1">
									<h4>Categories</h4>
								</div>
								<div class="categories__accordion">
									<div class="accordion" id="accordionExample">
										<div class="card">
											<div class="card-heading active">
												<a href="${contextPath}/shop.do" data-toggle="collapse" data-target="#collapseOne">상품보기</a>
											</div>
											<div id="collapseOne" class="collapse show" data-parent="#accordionExample">
												<div class="card-body">
													<ul>
														<li><a href="${contextPath}/shop.do?category=1">유니폼</a></li>
														<li><a href="${contextPath}/shop.do?category=2">축구화</a></li>
														<li><a href="${contextPath}/shop.do?category=3">패션잡화</a></li>
														<li><a href="${contextPath}/shop.do?category=4">악세사리</a></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="card">
											<div class="card-heading active">
												<a data-toggle="collapse" data-target="#collapseOne">구매관련</a>
											</div>
										<div id="collapseOne" class="collapse" data-parent="#accordionExample">
											<div class="card-body">
												<ul>
													<li><a href="#">장바구니</a></li>
													<li><a href="#">구매페이지</a></li>
													<li><a href="${contextPath}/qBoard/listArticles.do">문의하기</a></li>
												</ul>
											</div>
										</div>
										</div>
									</div>
								</div>
							</div>                      
						</div>
					</div>
					<div class="col-lg-9 col-md-9">
							<div class="row">
								<c:forEach var="listItems" items="${articleList}">
									<div class="col-lg-4 col-md-6">
										<a href="${contextPath}/shopdetail.do?i_name=${listItems.i_name}">
											<div class="product__item">
												<div class="product__item__pic set-bg" name="i_img" data-setbg="${contextPath}/resources/img/items/${listItems.i_img}1.png">	 
												</div>
												<div class="product__item__text">
													<h6>${listItems.i_name}</h6>
													<div class="product__price"><fmt:formatNumber value="${listItems.i_price}" pattern="###,###"></fmt:formatNumber>원</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
								
								<c:choose>
									<c:when test="${category == null}">
										<div class="col-lg-12 text-center">
											<div class="pagination__option">
												<c:if test="${totArticles != null }">
									   					<c:forEach var="page" begin="1" end="${totArticles/9 +1}" step="1">
									   						<c:if test="${section > 1 && page == 1}">
									   							<a href="${contextPath}/shop.do?section=${section-1}&pageNum=${(section-1)*9+1}"> <i class="fa fa-angle-left"></i> </a>
									   						</c:if>
									   							<a href="${contextPath}/shop.do?section=${section}&pageNum=${page}">${(section-1)*9+page}</a>
									   						<c:if test="${page == 9}">
									   							<a href="${contextPath}/shop.do?section=${section+1}&pageNum=${section*9+1}"> <i class="fa fa-angle-right"></i> </a>
									   						</c:if>
									   					</c:forEach>
										   		</c:if>
											</div>
										</div>
									</c:when>
									<c:when test="${category != null}">
										<div class="col-lg-12 text-center">
											<div class="pagination__option">
												<c:if test="${totArticles != null }">
									   					<c:forEach var="page" begin="1" end="${totArticles/9 +1}" step="1">
									   						<c:if test="${section > 1 && page == 1}">
									   							<a href="${contextPath}/shop.do?category=${category}&section=${section-1}&pageNum=${(section-1)*9+1}"> <i class="fa fa-angle-left"></i> </a>
									   						</c:if>
									   							<a href="${contextPath}/shop.do?category=${category}&section=${section}&pageNum=${page}">${(section-1)*9+page}</a>
									   						<c:if test="${page == 9}">
									   							<a href="${contextPath}/shop.do?category=${category}&section=${section+1}&pageNum=${section*9+1}"> <i class="fa fa-angle-right"></i> </a>
									   						</c:if>
									   					</c:forEach>
										   		</c:if>
											</div>
										</div>
									</c:when>
								</c:choose>
								
							</div>
						</div>
					</div>
				</div>
		</section>
	</section>
	<!-- 쇼핑 영역 종료 -->

	<link rel="stylesheet" href="${contextPath}/resources/css/styleshop.css">

    </body>
</html>