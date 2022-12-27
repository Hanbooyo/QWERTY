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
	<!-- 상단 백그라운드 영역 시작 -->
	<section class="hero-section">
		<div class="hero-slider owl-carousel">
			<div class="hs-item set-bg" data-setbg="${contextPath}/resources/img/mascot2.jpg">
				<div class="hs-text">
					<div class="container">
						<h2 style="color: #000; font-weight: bold;text-shadow: 1px 1px #fffefe;">2022 카타르 월드컵</h2>
						<p style="color: #000; font-weight: bold; font-size: 23px;text-shadow: 1px 1px #fffefe;">2022 카타르 월드컵 경기일정을 제공받고 승부예측을 해보세요!</p>
						<a href="${contextPath}/match/matchSchedule.do" class="site-btn" style="font-weight: bold;">일정/승부예측</a>
					</div>
				</div>
			</div>
			<div class="hs-item set-bg" data-setbg="${contextPath}/resources/img/group2.jpg">
				<div class="hs-text">
					<div class="container">
						<h2 style="color: #333; font-weight: bold;text-shadow: 1px 1px #fffefe;">2022 카타르 월드컵</h2>
						<p style="color: #333; font-weight: bold; font-size: 23px;">하이라이트 영상과 뉴스 그리고 월드컵 관련 굿즈를 판매중입니다!</p>
						<a href="${contextPath}/video.do" class="site-btn" style="font-weight: bold;">영상 보기</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 상단 백그라운드 영역 종료 -->


	
	<div><br></div>
	<!-- 뉴스 영역 시작 -->
	<section class="feature-section spad">
		<div class="container">
			<h2 style="text-align: center;">2022 월드컵 관련 뉴스</h2><br>
			<div class="row">
				<div class="col-lg-3 col-md-6 p-0">
					<div class="feature-item set-bg" data-setbg="${contextPath}/resources/img/news/news1.jpg">
						<span class="cata new">new</span>
						<div class="fi-content text-white">
							<h5><a href="https://newsis.com/view/?id=NISX20221101_0002068662&cID=10523&pID=10500" target="_blank">우크라, 러시아 FIFA 퇴출·이란 월드컵 출전금지 요구</a></h5>
							<p>이란내 반정부 시위 탄압 이유 "월드컵 출전 금지시켜야"<br>
								우크라이나 점령지 클럽 통합하려는 러시아도 퇴출 요구</p>
							<a href="#" class="fi-comment">3 Comments</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 p-0">
					<div class="feature-item set-bg" data-setbg="${contextPath}/resources/img/news/news2.jpg">
						<span class="cata strategy">new</span>
						<div class="fi-content text-white">
							<h5><a href="https://www.xportsnews.com/article/1649104" target="_blank">구보·도안·도미야스…일본 월드컵대표팀, 젊은 피 대거 합류[오피셜]</a></h5>
							<p>	JFA(일본축구협회)는 1일 홈페이지를 통해 2022 카타르 월드컵 최종 명단 26인을 발표했다.</p>
							<a href="#" class="fi-comment">3 Comments</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 p-0">
					<div class="feature-item set-bg" data-setbg="${contextPath}/resources/img/news/news3.jpg">
						<span class="cata new">new</span>
						<div class="fi-content text-white">
							<h5><a href="https://www.xportsnews.com/article/1648998" target="_blank">'월드컵 위너' 포그바, 끝내 카타르 行 불발...무릎 부상 재발</a></h5>
							<p>프랑스 축구대표팀 미드필더 폴 포그바가 부상에 발목이 잡히면서 월드컵 출전이 끝내 좌절됐다.</p>
							<a href="#" class="fi-comment">3 Comments</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 p-0">
					<div class="feature-item set-bg" data-setbg="${contextPath}/resources/img/news/news4.jpg">
						<span class="cata racing">new</span>
						<div class="fi-content text-white">
							<h5><a href="https://news.kbs.co.kr/news/view.do?ncd=5589828&ref=A" target="_blank">월드컵 앞둔 카타르서 외국인 노동자 수천명 ‘강제 퇴거’ 논란</a></h5>
							<p>외국인 노동자 거주하던 아파트 10여동 강제로 비우고 폐쇄<br>
								대부분 아시아·아프리카 출신…일부 노동자, 주변도로서 노숙</p>
							<a href="#" class="fi-comment">3 Comments</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 p-0">
					<div class="feature-item set-bg" data-setbg="${contextPath}/resources/img/news/news5.jpg">
						<span class="cata new">new</span>
						<div class="fi-content text-white">
							<h5><a href="https://search.naver.com/search.naver?sm=tab_hty.top&where=news&query=%EC%9B%94%EB%93%9C%EC%BB%B5+%EB%89%B4%EC%8A%A4&oquery=%EC%9B%94%EB%93%9C%EC%BB%B5+%EA%B4%80%EB%A0%A8+%EB%89%B4%EC%8A%A4&tqi=h2v9plprvhGssDFNcadssssstfh-108670" target="_blank">[2022 카타르 월드컵] FIFA 랭킹 1~5위 국가별 주요 선수들</a></h5>
							<p>얼마 남지 않은 2022 카타르 월드컵을 더 재미있게 보기 위해 1시드에 배정된 랭킹 상위권 국가들의 주요 선수들을 알아본다.</p>
							<a href="#" class="fi-comment">3 Comments</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 p-0">
					<div class="feature-item set-bg" data-setbg="${contextPath}/resources/img/news/news6.jpg">
						<span class="cata new">new</span>
						<div class="fi-content text-white">
							<h5><a href="http://www.sportsseoul.com/news/read/1172914?ref=naver" target="_blank">월드컵 3주 남았는데 '안 터지네'…손흥민 이례적 'EPL 선발=무득점 장기화'</a></h5>
							<p>카타르 월드컵을 3주 남겨두고 좀처럼 터지지 않고 있다. ‘한국산 월드스타’ 손흥민(30·토트넘)이 마주한 상황이다.</p>
							<a href="#" class="fi-comment">3 Comments</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 p-0">
					<div class="feature-item set-bg" data-setbg="${contextPath}/resources/img/news/news7.jpg">
						<span class="cata new">new</span>
						<div class="fi-content text-white">
							<h5><a href="http://www.kidshankook.kr/news/articleView.html?idxno=5066" target="_blank">월드컵 개최지 카타르 ‘예술의 거리’로</a></h5>
							<p>전 세계 손님 위한 ‘공공예술’프로젝트··· 연말까지 거장들의 설치 작품 100여 점 선보여</p>
							<a href="#" class="fi-comment">3 Comments</a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 p-0">
					<div class="feature-item set-bg" data-setbg="${contextPath}/resources/img/news/news8.jpg">
						<span class="cata new">new</span>
						<div class="fi-content text-white">
							<h5><a href="https://www.xportsnews.com/article/1648680" target="_blank">
								'전경기 출전' 아스널 사카, 발목 부상으로 '절뚝'→월드컵 어쩌나</a></h5>
							<p>이번 시즌 아스널에서 모든 경기에 출전했던 부카요 사카가 발목 부상으로 쓰러졌다.</p>
							<a href="#" class="fi-comment">3 Comments</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 뉴스 영역 종료 -->


	<!-- 하이라이트 영역 시작  -->
	<section class="recent-game-section spad set-bg" data-setbg="${contextPath}/resources/img/group3.jpg"><br>
		<div class="container">
			<div class="section-title">
				<div class="cata new"><a href="${contextPath}/video.do">더보기</a></div>
				<h2 class="videohead">하이라이트</h2>
			</div>
			<div class="row">
					<div class="recent-game-item">
						<div class="video1">
						<iframe width="560" height="315" src="https://www.youtube.com/embed/lj0CKFwO1mE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>
				</div>
				
				<div class="col-lg-4 col-md-6">
					<div class="recent-game-item">
						<iframe  class="video2" width="560" height="315" src="https://www.youtube.com/embed/TWJXDSBWcek" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>	
					</div>
				</div>
			</div>
	</section>
	<!-- 하이라이트 영역 종료 -->


	<!-- 커뮤니티 영역 시작 -->
	<section class="tournaments-section spad">
		<br><br>
		<div class="container" >
			<div class="tournament-title"></div>
			<div class="row">
				<div class="col-mine">
					<div class="tournament-item mb-4 mb-lg-0">
						<a href="${contextPath}/fBoard/listArticles.do">
							<div class="ti-notic">더보기</div>
							<div class="ti-content">
								<div class="ti-text">
									<h4>자유게시판</h4>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-mine">
					<a href="${contextPath}/qBoard/listArticles.do">
						<div class="tournament-item">
							<div class="ti-notic">더보기</div>
							<div class="ti-content">
								<div class="ti-text">
									<h4>문의게시판</h4>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>
	<!-- 커뮤니티 영역 종료 -->


	<!-- 쇼핑 영역 시작 -->
	<section class="review-section spad set-bg" style="background-color:#f6f6f6;">
		<div class="container" ><br><br>
			<div class="section-title">
				<h2>쇼핑</h2>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="review-item">
						<div name="i_img" class="review-cover set-bg" data-setbg="${contextPath}/resources/img/items/10100.png"></div>
						</div>
						<div class="review-text">
							<a href="${contextPath}/shopdetail.do?i_name=AS%20%EC%BD%94%EB%A6%AC%EC%95%84%202022%20%EB%82%98%EC%9D%B4%ED%82%A4%20%EB%93%9C%EB%9D%BC%EC%9D%B4%20%EC%8A%A4%ED%83%80%EB%94%94%EC%9B%80%20%ED%99%88%20%EC%A0%80%EC%A7%80%20L/S">
								<h5>AS 코리아 2022 나이키 드라이 스타디움 홈 저지 L/S</h5>
								<p>145,000 원</p>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
					<div class="review-item">
						<div name="i_img" class="review-cover set-bg" data-setbg="${contextPath}/resources/img/items/20300.png"></div>
						</div>
						<a href="${contextPath}/shopdetail.do?i_name=나이키%20머큐리얼%20슈퍼플라이%208%20엘리트%20FG">
						<div class="review-text">
							<h5>나이키 머큐리얼 슈퍼플라이 8 엘리트 FG</h5>
							<p>319,000 원</p>
						</div>
						</a>
					</div>
					<div class="col-lg-3 col-md-6">
					<div class="review-item">
						<div name="i_img" class="review-cover set-bg" data-setbg="${contextPath}/resources/img/items/32100.png">
						</div>
						<div class="review-text">
							<a href="${contextPath}/shopdetail.do?i_name=KFA%20%EB%A6%AC%EB%AC%B4%EB%B2%84%EB%B8%94%20%EC%8A%A4%ED%8B%B0%EC%BB%A4">
								<h5>머플러 세트</h5>
								<p>66,000 원</p>
							</a>
						</div>
					</div>
					</div>
					<div class="col-lg-3 col-md-6">
					<div class="review-item">
						<div name="i_img" class="review-cover set-bg" data-setbg="${contextPath}/resources/img/items/40100.png">
						</div>
						<div class="review-text">
							<a href="${contextPath}/shopdetail.do?i_name=KFA%20%EB%A6%AC%EB%AC%B4%EB%B2%84%EB%B8%94%20%EC%8A%A4%ED%8B%B0%EC%BB%A4">
								<h5>KFA 리무머블 스티커</h5>
								<p>3,000 원</p>
							</a>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 쇼핑 영역 종료 -->
</body>
</html>