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
<style type="text/css">
	#sec_btn {
		display: none;
	}
	#tr_image_upload {
		display: none;
	}
</style>
<script type="text/javascript">
function backToList(obj) {
	obj.action = "${contextPath}/fBoard/listArticles.do";
	obj.submit();
}
function fn_remove_article(url, f_aNo) {
	let newform = document.createElement("form");  // 새로운 form 제작
	newform.setAttribute("method", "post");  // form 의 작동 방식 설정
	newform.setAttribute("action", url);
	let articleNoInput = document.createElement("input"); // form에 input 태그 하나 넣음
	articleNoInput.setAttribute("type", "hidden"); // 속성들 넣는것. (자바스크립트의 속성!)
	articleNoInput.setAttribute("name", "f_aNo");
	articleNoInput.setAttribute("value", f_aNo);

	newform.appendChild(articleNoInput);  // newform에 위에서 만든 input태그를 append
	document.body.appendChild(newform); // body에 newform을 append
	newform.submit(); // 이동
} 	
function fn_articleForm(isLogOn, articleForm, loginForm) {
	if(isLogOn != '' && isLogOn != 'false') {
		location.href=articleForm;
	}else {
		alert('로그인 후 댓글 쓰기가 가능합니다.');
		location.href=loginForm + '?action=/fboard/articleForm.do';
	}
function fn_modify_article(obj) {
	obj.action = "${contextPath}/fBoard/modArticle.do";
	obj.submit();
}
}
</script>
<meta charset="UTF-8">

<link rel="stylesheet" href="${contextPath}/resources/css/board.css">

</head>
<body>
<section class="notice">
		<div class="page-title">
			<div class="container">
				<h3>자유 게시판</h3>
			</div>
		</div>
	<div class="emtpyblock"><br></div>
	<section class="page-section spad contact-page">
		<div class="container">
			<!-- 폼 유지용 -->
			<div class="section">
				<div class="container">
					<div class="row justify-content-center">
					</div>
				</div>
			</div>
			<!-- 폼 유지용 -->
		<%-- 
		<form name="frmArticle" action="" method="post" enctype="multipart/form-data">
			<h2 class="con">글 제목</h2>
			<section class="article-detail table-common con row">
				<table class="cell" style="border:1px">
					<colgroup>
						<col width="100px">
					</colgroup>
					<tbody></tbody>
					<tr class="article-title">
						<th>[글번호]제목</th>
						<td colspan="3"><input type="text" name="f_title" value="${farticle.f_title}" disabled></td>
					</tr>
					<tr class="article-info">
						<th>작성일</th>
						<td><input type="text" name="f_date" value="${farticle.f_date}" disabled></td>
						<th>작성자</th>
						<td><input type="text" value="${farticle.id}" disabled></td>
					</tr>
					<tr>
						<c:if test="${not empty farticle.f_img}">
							<tr>
								<td width="150" align="center" rowspan="2">이미지</td>
								<td>
									<input type="hidden" name="originalFileName"value="${farticle.f_img}"> 
									<img src="${contextPath}/fdownload.do?f_aNo=${farticle.f_aNo}&f_img=${farticle.f_img}" id="preview" alt="글 이미지">
								</td>
							</tr>
							<tr>
								<td><input type="file" name="f_img" id="f_img" disabled onchange=""></td>
							</tr>
						</c:if>
					</tr>
					<tr class="article-body">
						<td colspan="4"><input type="text" name="f_content" value="${farticle.f_content}" disabled></td>
					</tr>
					</tbody>
				</table>
			</section>
			<div class="freebtn">
				
					<input type="button" value="수정하기" onclick="fn_enable(this.form)"> 
					<input type="button" value="삭제하기" onclick="fn_remove_article('${contextPath}/fBoard/removeArticle.do', ${farticle.f_aNo})"> 
					<c:if test="${member.id == farticle.id}">
				</c:if>
				<input type="button" value="목록으로 돌아가기" onclick="backToList(this.form)"> 
			</div>
--%>
			<form name="frmArticle" method="post" action="${contextPath}" enctype="multipart/form-data">
					<table align="center">
						<tbody>
						<tr>
							<th width="150" align="center" bgcolor="#ff9933">글번호</th>
							<td>
								<input type="text" value="${farticle.f_aNo}" disabled>
								<input type="hidden" name="f_aNo" value="${farticle.f_aNo}" />
							</td>
						</tr>	
						<tr>
							<th width="150" align="center" bgcolor="#ff9933">작성자 아이디</th>
							<td><input type="text" name="id" value="${farticle.id}" disabled></td>
						</tr>
							
						<tr>
							<th width="150" align="center" bgcolor="#ff9933">제목</th>
							<td><input type="text" name="f_title" id ="id_title" value="${farticle.f_title}" disabled></td>
						</tr>
						<tr>
							<th width="150" align="center" bgcolor="#ff9933">내용</th>
							<td>
								<textarea rows="20" cols="118" name="f_content" id="f_content" disabled>${farticle.f_content}</textarea>
							</td>
						</tr>
						<c:choose>
							<c:when test="${not empty farticle.f_img}">
								<tr>
									<th width="150" align="center" bgcolor="#ff9933" rowspan="2">이미지</th>
									<td>
										<input type="hidden" name="originalFileName" value="${farticle.f_img}">
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<img src="${contextPath}/fdownload.do?f_aNo=${farticle.f_aNo}&f_img=${farticle.f_img}" id="preview" width="200px"><br>
										<input type="file" name="f_img" id="f_img" disabled onchange="readURL(this);">
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr id ="tr_image_upload">
									<th width="150" align="center" bgcolor="#ff9933">이미지</th>
									<td>
										<input type="file" name="f_img" onchange="readURL(this);">
										<img id="preview">
									</td>
									<td>
										<input type="hidden" name="originalFileName" value="${farticle.f_img}">
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
						<tr>
							<th width="150" align="center" bgcolor="#ff9933">등록일자</th>
							<td><input type="text" value='<fmt:formatDate value="${farticle.f_date}"/>' disabled></td>
						</tr>
						</tbody>
						<tfoot>
							<tr id="all_btn">
							   	<td colspan="2" align="center" >
								   	<c:if test="${member.id == farticle.id}">
							     		<input class="board_btn" type=button value="수정하기" onclick="fn_enable(this.form)">
							          	<input class="board_btn" type=button value="삭제하기" onclick="fn_remove_article('${contextPath}/fBoard/removeArticle.do', ${farticle.f_aNo})">
							        </c:if>  	
							          	<input class="board_btn" type=button value="리스트로 돌아가기" onclick="backToList(this.form)">
							   	</td>   
						  	</tr>
					  	</tfoot>
					</table>
					<div id="sec_btn" align="center">
						<input class="board_btn" type="button" value="수정반영하기" onclick="fn_modify_article(frmArticle)">
						<input class="board_btn" type="button" value="취소" onclick="backToList(frmArticle)">
					</div>
				</form>
				
			<div class="con reply">
				<!-- <h3 class="">댓글 입력창</h3>
				<section class="reply-form">
					<form action="${contextPath}/fBoard/addReply.do">
						<div>
							<input type="text" name="id" value="ID" disabled>
						</div>
						<div>
							<textarea></textarea>
							<a href="javascript:fn_articleForm('${isLogOn}', '${contextPath}/fBoard/addReply.do', '${contextPath}/member/loginForm.do')">댓글 작성</a>
						</div>
					</form>
					<table class="board-table">
					<tbody>
						<c:choose>
							<c:when test="${empty replyList}">
								<tr>
									<td align="center" colspan="4">등록된 글이 없습니다.</td>
								</tr>
							</c:when>
							<c:when test="${!empty replyList}">
								<div class="reply_plint">
								<c:forEach var="replyList" items="${replyList}" varStatus="f_pNo">
									<div class="reply_box">
										<span class="ID">${replyList.id}</span>
								        <span class="reply">${replyList.f_content}</span>
								        <span class="date">${replyList.f_date}</span>
							        </div>
								</c:forEach>
								</div>
							</c:when>
						</c:choose>
					</tbody>
				</table>
				</section> -->
				<div class="reply_con">
				    <div class="reply_input">
				    	<c:choose>
                       		<c:when test="${isLogOn == true && member != null}">
                          		<form action="${contextPath}/fBoard/addReply.do">
                          		  <input type="hidden" name="f_aNo" value="${farticle.f_aNo}" />
						          <input type="text" name="ID" id="ID" value="ID" disabled>
						          <input type="text" name="f_content" id="reply" placeholder="답글을 입력해주세요">
						          <input type="submit" class="reply_input_submit" value="답글달기">
						       </form>
                        	</c:when>
                        	<c:otherwise>
                        		<input type="text" name="ID" id="ID" value="ID" disabled>
					            <input type="text" name="reply" id="reply" placeholder="로그인 후 작성해 주세요" disabled>
					            <input type="submit" class="reply_input_submit" value="답글달기">
                        	</c:otherwise>
                        </c:choose>
				    </div>
				    <div class="reply_plint">
				    <c:choose>
						<c:when test="${empty replyList}">
							<div class="reply_box">
						          <span class="ID"></span>
						          <span class="reply">작성된 댓글이 없습니다.</span>
						          <span class="date"></span>
				       		</div>
						</c:when>
				    	<c:when test="${!empty replyList}">
				      		<c:forEach var="replyList" items="${replyList}" varStatus="f_pNo">
						       <div class="reply_box">
						          <span class="ID">${replyList.id}</span>
						          <span class="reply">${replyList.f_content}</span>
						          <span class="date">${replyList.f_date}</span>
						       </div>
				       		</c:forEach>
     			     	</c:when>
   					 </c:choose>
   				 	</div>
				 </div>
			</div>
		</div>
		</div>
	</section>

</body>
</html>