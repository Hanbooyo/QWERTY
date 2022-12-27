<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>제품 상세 페이지</title>
<!-- Stylesheets -->
   <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/font-awesome.min.css"/>
   <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css"/>
   <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/animate.css"/>
   <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/elegant-icons.css" type="text/css">
   <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/jquery-ui.min.css" type="text/css">
   <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/magnific-popup.css" type="text/css">
   <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slicknav.min.css" type="text/css">
   <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/styleshop.css" type="text/css">
   <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/board.css">
   
</head>
<body>
	<!-- 상단 이미지 영역 시작 -->
	<section class="page-info-section set-bg" data-setbg="${contextPath}/resources/img/group3.jpg">
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

	<!--상품상세페이지 시작-->
	<section class="page-section recent-game-page">
        <section class="product-details">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="product__details__pic">
                            <div class="product__details__pic__left product__thumb nice-scroll">
                                <c:forEach begin="1" end="7" var="i">
	                                <a class="pt active" href="#product-${i}">
	                                   <img src="${contextPath}/resources/img/items/${itemDetail[0].i_num}_i${i}.png" alt="">
	                            	</a>                                    
                                </c:forEach>
                            </div>
                            <div class="product__details__slider__content">
                                <div class="product__details__pic__slider owl-carousel">
                                    <c:forEach begin="1" end="4" var="i">
                                    	<img data-hash="product-${i}" name="i_img" class="product__big__img" src="${contextPath}/resources/img/items/${itemDetail[0].i_num}_i${i}.png" alt="">                                        
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                    	<form name="frmOC" >
	                        <div class="product__details__text">
	                        	<div class="product__details__price">
		                            <strong>${itemDetail[0].i_name}</strong>
		                            <input type="hidden" value="${itemDetail[0].i_name}" name="i_name">                      	
	                        	</div>
	                            <div class="product__details__price">
	                                <strong><fmt:formatNumber value="${itemDetail[0].i_price}" pattern="###,###"></fmt:formatNumber>원</strong>
	                            </div>
	                            <c:choose>
	                                <c:when test="${itemDetail.size()>1}">
		                                <dl class="option">
		                                    <dt>옵션</dt>
		                                    <dd>
		                                        <div class="input-row">
		                                            <div class="input-group">
		                                                <select name="optionList" id="optionList">
					                                        <option disabled>옵션 선택</option>
					                                        <c:forEach var="option" begin="1" items="${itemDetail}">
					                                            <option value="${option.i_option}">${option.i_option}</option>
					                                        </c:forEach>
		                                                </select>
		                                            </div>
		                                        </div>
		                                    </dd>
		                                </dl>
	                                </c:when>
	                                <c:otherwise>
	                                	<input name="optionList" value="${itemDetail[0].i_option}" type="hidden">
	                                </c:otherwise>
	                            </c:choose>
	                            <div class="product__details__widget"></div>
	                            <div class="product__details__button">
	                                <div class="quantity">
	                                    <span>개수:</span>
	                                    <div class="pro-qty">
	                                        <input type="text" value="1" name="amount" id="amount">
	                                    </div>
	                                </div>
	                                <c:choose>
	                                	<c:when test="${isLogOn == true && member != null}">
			                                <input class="cart-btn" type="button" value="장바구니" onclick="fn_cart(frmOC);"/>
			                                <input class="cart-btn" type="button" value="구매하기" onclick="fn_order(frmOC);"/>
	                                	</c:when>
	                                	<c:otherwise>
	                                		<a class="cart-btn" href="javascript:fn_goCart('${isLogOn}','${contextPath}/shop.do','${contextPath}/member/loginForm.do')">장바구니</a>
	                                		<a class="cart-btn" href="javascript:fn_goOrder('${isLogOn}','${contextPath}/shop.do','${contextPath}/member/loginForm.do')">구매하기</a>
	                                	</c:otherwise>
	                                </c:choose>
	                            </div>
	                        </div>
	                	</form>
                    </div>
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">제품상세정보</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">문의하기</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">문의게시판</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <!-- 제품 상세 정보 이미지 -->
                                    <div style="text-align: center;">
                                        <img src="${contextPath}/resources/img/items/${itemDetail[0].i_content}.png">
                                    </div>
                                </div>

                                <div class="tab-pane" id="tabs-2" role="tabpanel">

                                    <!--폼 유지 부분 시작-->
                                    <div class="container">
                                        <div class="section">
                                            <div class="container">
                                                <div class="row justify-content-center">

                                                </div>
                                            </div>
                                        </div>
                                        <!--폼 유지 부분 종료-->
                                        <div class="col-lg-12">
                                            <div class="contact-form-warp">
                                                <h4 class="comment-title">상품 문의</h4>
                                                <c:choose>
                                                	<c:when test="${isLogOn == true && member != null}">
		                                                <form name="articleForm" action="${contextPath}/qBoard/addArticle.do?i_name=${itemDetail[0].i_name}" 
		                                                method="post" class="comment-form" enctype="multipart/form-data">
		                                                    <div class="row">
		                                                        <div class="col-md-3">
		                                                            <input type="text" placeholder="상품명" autocomplete="off" disabled>
		                                                        </div>
		                                                        <div class="col-md-9">
		                                                            <input type="text" value="${itemDetail[0].i_name}" disabled>
		                                                        </div>
		                                                        <div class="col-md-3">
		                                                            <input type="text" placeholder="이미지파일 첨부" autocomplete="off" disabled>
		                                                        </div>
		                                                         <div class="col-md-9">
		                                                            <input type="file" name="q_img">
		                                                        </div>
		                                                        <div class="col-lg-12">
		                                                            <input type="text" placeholder="제목" name="q_title" autocomplete="off">
		                                                            <textarea placeholder="내용" name="q_content"></textarea>
		                                                            <input type="submit" class="site-btn" style="font-weight: bold;" value="문의하기">
		                                                        </div>
		                                                    </div>
		                                                </form>
                                                	</c:when>
                                                	<c:otherwise>
                                                		<form name="articleForm" class="comment-form" enctype="multipart/form-data">
		                                                    <div class="row">
		                                                        <div class="col-md-3">
		                                                            <input type="text" placeholder="상품명" name="id" autocomplete="off" disabled>
		                                                        </div>
		                                                        <div class="col-md-9">
		                                                            <input type="text" name="i_name" value="${itemDetail[0].i_name}" disabled>
		                                                        </div>
		                                                        <div class="col-md-3">
		                                                            <input type="text" placeholder="이미지파일 첨부" autocomplete="off" disabled>
		                                                        </div>
		                                                         <div class="col-md-9">
		                                                            <input type="file" name="q_img" disabled>
		                                                        </div>
		                                                        <div class="col-lg-12">
		                                                            <input type="text" placeholder="제목" name="q_title" autocomplete="off" disabled>
		                                                            <textarea style="font-size: 2em;" placeholder="로그인 후 이용 가능합니다." name="q_content" disabled></textarea>
		                                                        </div>
	                                                        </div>
	                                                	</form>
                                                	</c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-3" role="tabpanel">
                                    <!-- 게시판 페이지 시작 -->
                                    <section class="notice">
                                        <div class="page-title">
                                            <div class="container">
                                                <h3>문의게시판</h3>
                                            </div>
                                        </div>

                                        <!-- 게시판 리스트 영역 시작 -->
                                        <div id="board-list">
                                            <div class="container">
                                                <table class="board-table" align="center" border="1" width="100%">
                                                    <thead class="shop-board-table-thead">
                                                        <tr>
                                                            <th class="th-num">글번호</th>
                                                            <th class="th-title">제목</th>
                                                            <th class="th-name">작성자</th>
                                                            <th class="th-date">작성일</th>
                                                        </tr>
                                                    </thead>
                                                    <c:choose>
                                                        <c:when test="${empty q_articleList}">
                                                            <tr>
                                                                <td align="center" colspan="4">등록된 글이 없습니다.</td>
                                                            </tr>
                                                        </c:when>
                                                        <c:when test="${!empty q_articleList}">
                                                            <c:forEach var="article" items="${q_articleList}"
                                                                varStatus="articleNum">
                                                                <tr>
                                                                    <td width="5%" align="center">${articleNum.count}
                                                                    </td>
                                                                    <td width="50%" align="left">
                                                                        <span style="padding-left:15px"></span>
                                                                        <c:choose>
                                                                            <c:when test="${article.level > 1}">
                                                                                <c:forEach begin="1"
                                                                                    end="${article.level}" step="1">
                                                                                    <span
                                                                                        style="padding-left:15px"></span>
                                                                                </c:forEach>
                                                                                [답변]<a
                                                                                    href="${contextPath}/qBoard/viewArticle.do?q_ano=${article.q_ano}">${article.q_title}</a>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <a
                                                                                    href="${contextPath}/qBoard/viewArticle.do?q_ano=${article.q_ano}">${article.q_title}</a>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td width="10%" align="center">${article.id}</td>
                                                                    <td width="10%" align="center">
                                                                        <fmt:formatDate value="${article.q_date}" />
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:when>
                                                    </c:choose>
                                                </table>
                                                <br>
                                                <div align="center">
                                                    <c:if test="${totArticles != null}">
                                                        <c:choose>
                                                            <c:when test="${totArticles >100}">
                                                                <c:forEach var="page" begin="1" end="10" step="1">
                                                                    <c:if test="${section > 1 && page==1}">
                                                                        <a href="${contextPath}/qBoard/listArticles.do?section=${section-1}&pageNum=${(section-1)*10+1}"> prev </a>
                                                                    </c:if>
                                                                    <a href="${contextPath}/qBoard/listArticles.do?section=${section}&pageNum=${page}">${(section-1)*10+page}</a>
                                                                    <c:if test="${page==10}">
                                                                        <a href="${contextPath}/qBoard/listArticles.do?section=${section+1}&pageNum=${section*10+1}"> next </a>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:when test="${totArticles == 100}">
                                                                <c:forEach var="page" begin="1" end="10" step="1">
                                                                    <a href="#">${page}</a>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:when test="${totArticles <100}">
                                                                <c:forEach var="page" begin="1"
                                                                    end="${totArticles/10+1}" step="1">
                                                                    <c:choose>
                                                                        <c:when test="${page==pageNum}">
                                                                            <a class="sel_page"
                                                                                href="${contextPath}/qBoard/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <a class="noSel_page"
                                                                                href="${contextPath}/qBoard/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                        </c:choose>
                                                    </c:if>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 게시판 리스트 영역 종료 -->
                                    </section>
                                    <!-- 게시판 페이지 종료 -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
		<!-- 상품 상세 페이료-->
	<!--====== Javascripts & Jquery ======-->
   <script src="${contextPath}/resources/js/jquery-3.2.1.min.js"></script>
   <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
   <script src="${contextPath}/resources/js/owl.carousel.min.js"></script>
   <script src="${contextPath}/resources/js/main.js"></script>
   <script src="${contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
   <script src="${contextPath}/resources/js/jquery-ui.min.js"></script>
   <script src="${contextPath}/resources/js/mixitup.min.js"></script>
   <script src="${contextPath}/resources/js/jquery.countdown.min.js"></script>
   <script src="${contextPath}/resources/js/jquery.slicknav.js"></script>
   <script src="${contextPath}/resources/js/jquery.nicescroll.min.js"></script>
   <script src="${contextPath}/resources/js/shopmain.js"></script>
<script>
		function fn_order(obj) {
				obj.action = "${contextPath}/order.do";
				obj.submit();
		}
		function fn_cart(obj) {
			obj.action = "${contextPath}/cart.do";
			obj.submit();
		}
		function fn_goCart(isLogOn, shop, loginForm) {
			if(isLogOn != '' && isLogOn != 'false') {
				location.href = shop;
			}else {
				alert('로그인 후 장바구니가 가능합니다.');
				location.href = loginForm + "?action=/shop.do";
			}
		}
		function fn_goOrder(isLogOn, shop, loginForm) {
			if(isLogOn != '' && isLogOn != 'false') {
				location.href = shop;
			}else {
				alert('로그인 후 구매하기가 가능합니다.');
				location.href = loginForm + "?action=/shop.do";
			}
		}
</script>
</body>
</html>