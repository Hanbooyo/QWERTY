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
<html lang="ko">

<head>
	<title>2022 카타르 월드컵</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/shop-payment.css" />
</head>

<body>
	<!-- 상단 영역 시작 -->
	<section class="page-info-section set-bg" data-setbg="${contextPath}/resources/img/group3.jpg">
		<div class="pi-content">
			<div class="container">
				<div class="row">
					<div class="col-xl-5 col-lg-6 text-white">
						<h2 style="color: #fff; font-weight: bold;">주문/결제</h2>
						<p style="color: #fff; font-weight: bold; font-size: 20px;"></p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 상단 영역 종료 -->

	<div><br><br></div>
	
	<!-- 결제 페이지 시작 -->
	<section class="page-section recent-game-page">
		<div id="container">
			<div class="payWrap">
				<div class="payHeader">
					<h3 class="title">주문/결제</h3>
					<div><br></div>
					<div class="nav">
						<ul>
							<li><span class="num on">1</span>주문/결제</li>
							<li class="last"><span class="num">2</span>주문완료</li>
						</ul>
					</div>
				</div>
				<div class="payCont cf">
				<form name="pay" id="pay">
					<div class="payMethod">
								<div class="tblCartWrap">
									<h4 class="sTitle">주문하시는 상품</h4>
									<table class="tblCart" summary="상품명,기간,제공서비스,결제금액 항목으로 구성된 표입니다.">
										<caption>주문하실 상품 내역</caption>
										<colgroup>
											<col width="21%">
											<col width="16%">
											<col width="*">
											<col width="21%">
										</colgroup>
										<thead>
											<tr>
												<th scope="col" style="text-align: center;">상품명</th>
												<th scope="col" style="text-align: center;">개수</th>
												<th scope="col" style="text-align: center;">상품옵션</th>
												<th scope="col" style="text-align: center;">결제금액</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>${itemInfo.i_name}</td>
												<td>${amount}</td>
												<td>${itemInfo.i_option}</td>
												<td class="price"><strong><fmt:formatNumber value="${itemInfo.i_price*amount}" pattern="###,###"></fmt:formatNumber></strong>원</td>
												
											</tr>
										</tbody>
									</table>
								</div>
						
						<div class="tblCartWrap">
							<h4 class="sTitle">주문 정보 입력</h4>
							<table class="tblCart" summary="주문 정보를 입력하는 표입니다.">
								<tr>
									<th scope="col" style="text-align: center;">수령인 이름</th>
									<td><input type="text" name="o_name" required></td>
								</tr>
								<tr>
									<th scope="col" style="text-align: center;">수령인 연락처</th>
									<td><input type="text" name="o_tel" placeholder="(-)를 반드시 포함 해주세요" required></td>
								</tr>
								<tr>
									<th scope="col" style="text-align: center;">수령인 이메일</th>
									<td><input type="text" name="o_email" required></td>
								</tr>
								<tr>
									<th scope="col" style="text-align: center;">배송요청사항</th>
									<td><input type="text" name="o_require"></td>
								</tr>
								<tr>
									<th scope="col" style="text-align: center;">수령인 주소</th>
									<td>
										<input type="text" id="sample6_postcode" placeholder="우편번호" name="postAdd">
										<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" id="sample6_address" placeholder="주소" name="address"><br>
										<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddress">
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="payInfo">
						<div class="inner">
							<h4 class="sTitle">결제정보</h4>
							<div class="optWrap">
								<div class="optCont">
									<div class="totalPrice">
										<span class="tit">총 상품금액</span>
										
										<span class="con"><strong class="colorBlue"><fmt:formatNumber value="${itemInfo.i_price*amount}" pattern="###,###"></fmt:formatNumber></strong>원</span>
									</div>
									<div class="disList">
										<dl>
											<dt>배송비</dt>
											<dd>3,000원</dd>
										</dl>
								</div>
								<div class="optBottom">
									<div class="totalPayPrice">
										<span class="tit">최종 결제금액</span>
										<span class="con"><strong><fmt:formatNumber value="${(itemInfo.i_price*amount)+3000}" pattern="###,###"></fmt:formatNumber></strong>원</span>
									</div>
									<p class="desc">물품 재고에 따라 배송기간이 다를 수 있습니다.</p>
								</div>
							</div>
							<div class="agreeCont v01" data-agree="1">
								<input type="checkbox" style="margin-left: 15px;">
								<label>상품 결제 내용을 확인했습니다.</label>
							</div>
							
							<div class="btnPay">
								<a href="javascript:fn_pay('${(itemInfo.i_price*amount)+3000}','${itemInfo.i_name}', pay, '${i_num}', ${amount})">결제하기</a>
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
		</section>
		<!-- 결제 페이지 종료 -->

</body>

		<!--====== Javascripts & Jquery ======-->
		<script src="${contextPath}/resources/js/jquery-3.2.1.min.js"></script>
		<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
		<script src="${contextPath}/resources/js/owl.carousel.min.js"></script>
		<script src="${contextPath}/resources/js/main.js"></script>
		<script src="${contextPath}/resources/js/shop-payment.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="${contextPath}/resources/js/post.js"></script>
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		<script>
			
			
			const IMP = window.IMP; // 생략 가능
			IMP.init("imp71421876"); // Example: imp00000000
			
			function fn_pay(totamount, i_name, obj, i_num, o_count) {
				IMP.request_pay({
					pg : "html5_inicis",
					pay_method : "card",
					merchant_uid : "ORD20180131-0000011", //주문번호
					name : i_name,
					amount : totamount, // 숫자타입
				}, function(rsp) {
					console.log(rsp);
					if (rsp.success) {
						alert("결제성공");
						obj.action="${contextPath}/pay.do?i_name=" + i_name + "&i_num=" + i_num + "&o_count=" + o_count;
						obj.submit();
					} else {
						alert("결제실패");
					}
					alert(msg);
				});
			}
			function fn_paydd() {
				IMP.request_pay({
					pg : "html5_inicis",
					pay_method : "card",
					merchant_uid : "ORD20180131-0000011", //주문번호
					name : "노르웨이 회전 의자",
					amount : 100, // 숫자타입
					buyer_email : "gildong@gmail.com",
					buyer_name : "홍길동",
					buyer_tel : "010-4242-4242",
					buyer_addr : "서울특별시 강남구 신사동",
					buyer_postcode : "01181"
				}, function(rsp) {
					console.log(rsp);
					if (rsp.success) {
						alert("결제성공");
						locatioin.href=''
					} else {
						alert("결제실패");
					}
					alert(msg);
				});
			}

			//취소하기 버튼
			function cancle() {
				window.history.forward();
			}
		</script>
		
</html>
