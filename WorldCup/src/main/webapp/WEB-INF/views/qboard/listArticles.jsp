<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${contextPath}/resources/css/board.css">
<head>
	<meta charset="UTF-8">
	<title>글 목록창</title>
<script>
	function fn_articleForm(isLogOn, articleForm, loginForm) {
		if(isLogOn != '' && isLogOn != 'false') {
			location.href = articleForm;
		}else {
			alert('로그인 후 글쓰기가 가능합니다.');
			location.href = loginForm + '?action=/qBoard/articleForm.do';
		}
		
	}
</script>	
</head>
<body>
	<!-- 페이지 상단 시작 -->
	<section class="page-info-section set-bg" data-setbg="${contextPath}/resources/img/commbg.jpg">
		
	</section>
	<!-- 페이지 상단 종료 -->
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
					<thead>
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
							<c:forEach var="article" items="${q_articleList}" varStatus="articleNum">
								<tr>
									<td width="5%" align="center">${articleNum.count}</td>
									<td width="50%" align="left">
										<span style="padding-left:15px"></span>
										<c:choose>
											<c:when test="${article.level > 1}">
												<c:forEach begin="1" end="${article.level}" step="1">
													<span style="padding-left:15px"></span>
												</c:forEach>
												[답변]<a href="${contextPath}/qBoard/viewArticle.do?q_ano=${article.q_ano}">${article.q_title}</a>
											</c:when>
											<c:otherwise>
												<a href="${contextPath}/qBoard/viewArticle.do?q_ano=${article.q_ano}">${article.q_title}</a>
											</c:otherwise>
										</c:choose>
									</td>
									<td width="10%" align="center">${article.id}</td>
									<td width="10%" align="center"><fmt:formatDate value="${article.q_date}"/></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</table>
				<br>
				<div class="pagebtn" align="center">
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
								<c:forEach var="page" begin="1" end="${totArticles/10+1}" step="1">
									<c:choose>
										<c:when test="${page==pageNum}">
											<a class="sel_page" href="${contextPath}/qBoard/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
										</c:when>
										<c:otherwise>
											<a class="noSel_page" href="${contextPath}/qBoard/listArticles.do?section=${section}&pageNum=${page}">${page}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
						</c:choose>
					</c:if>
				</div>
			</div>
		</div>
		<p class="addArticle" align="center"><a class="board_btn" href="javascript:fn_articleForm('${isLogOn}','${contextPath}/qBoard/articleForm.do', '${contextPath}/member/loginForm.do')" >글쓰기</a></p>
	</section>
</body>
</html>