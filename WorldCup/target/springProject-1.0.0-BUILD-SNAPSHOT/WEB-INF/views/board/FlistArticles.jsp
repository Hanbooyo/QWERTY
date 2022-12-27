<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>2022 카타르 월드컵</title>
<script>
	function fn_articleForm(isLogOn, articleForm, loginForm) {
		if(isLogOn != '' && isLogOn != 'false') {
			location.href=articleForm;
		}else {
			alert('로그인 후 글쓰기가 가능합니다.');
			location.href=loginForm + '?action=/fBoard/FarticleForm.do';
		}
	}
</script>
<meta charset="UTF-8">

<link rel="stylesheet" href="${contextPath}/resources/css/fboard.css">

</head>
<body>

	<!-- 페이지 상단 시작 -->
	<section class="page-info-section set-bg" data-setbg="${contextPath}/resources/img/commbg.jpg">
		<div class="pi-content">
			<div class="container_board">
				<div class="row">

				</div>
			</div>
		</div>
	</section>
	<!-- 페이지 상단 종료 -->

	<!-- 게시판 페이지 시작 -->
	<section class="notice">
		<div class="page-title">
			<div class="container">
				<h3>자유게시판</h3>
			</div>
		</div>

		<!-- 게시판 검색 영역 시작 -->
		<div id="board-search">
			<div class="container">
				<div class="search-window">
					<form action="">
						<div class="search-wrap">
							<form action="${contextPath}/fBoard/search.do" method="get">
								<label for="search" class="blind">내용 검색</label> 
								<input id="search" type="search" name="search" placeholder="검색어를 입력해주세요." autocomplete="off" value="">
								<button type="submit" class="btn btn-dark">검색</button>
							</form>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 게시판 검색 영역 종료 -->

		<!-- 게시판 리스트 영역 시작 -->
		<div id="board-list">
			<div class="container">
				<table class="board-table">
					<thead>
						<tr>
							<th scope="col" class="th-num">번호</th>
							<th scope="col" class="th-name">작성자</th>
							<th scope="col" class="th-title" style="text-align: center;">제목</th>
							<th scope="col" class="th-date">등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty articleList}">
								<tr>
									<td align="center" colspan="4">등록된 글이 없습니다.</td>
								</tr>
							</c:when>
							<c:when test="${!empty articleList}">
								<c:forEach var="article" items="${articleList}" varStatus="f_aNo">
									<tr>
										<td>${article.f_aNo}</td>
										<td>${article.id}</td>
							  			<th>
											<a href="${contextPath}/fBoard/viewArticle.do?f_aNo=${article.f_aNo}">${article.f_title}</a>
							  			</th>
							  			<td>${article.f_date}</td>
						  			</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
				<div>
					<a href="javascript:fn_articleForm('${isLogOn}', '${contextPath}/fBoard/FarticleForm.do', '${contextPath}/member/loginForm.do')">글쓰기</a>
				</div>
				<div style="text-align: center;">페이지 번호<br>
					<c:if test="${totArticles != null}">
							<c:choose>
								<c:when test="${totArticles >100}">
									<c:forEach var="page" begin="1" end="10" step="1">
										<c:if test="${section > 1 && page==1}">
											<a href="${contextPath}/fBoard/listArticles.do?section=${section-1}&pageNum=${(section-1)*10+1}"> prev </a>
										</c:if>
										<a href="${contextPath}/fBoard/listArticles.do?section=${section}&pageNum=${page}">${(section-1)*10+page}</a>
										<c:if test="${page==10}">
											<a href="${contextPath}/fBoard/listArticles.do?section=${section+1}&pageNum=${section*10+1}"> next </a>
										</c:if>
									</c:forEach>
								</c:when>
						<c:when test="${totArticles == 100}">
									<c:forEach var="page" begin="1" end="10" step="1">
										<a href="#">${page}</a>
									</c:forEach>
								</c:when>
								<c:when test="${totArticles <100}">
									<c:forEach var="page" begin="1" end="${totArticles/10+1}" step="1">
										<c:choose>
											<c:when test="${page==pageNum}">
												<a class="sel_page" href="${contextPath}/fBoard/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
											</c:when>
											<c:otherwise>
												<a class="noSel_page" href="${contextPath}/fBoard/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
							</c:choose>
						</c:if>
					</div>
			</div>
		</div>
		<!-- 게시판 리스트 영역 종료 -->
	</section>
	<!-- 게시판 페이지 종료 -->


</body>
</html>