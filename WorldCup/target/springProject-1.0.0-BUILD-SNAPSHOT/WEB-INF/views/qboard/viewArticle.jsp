<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 보기</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/board.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css"/>
<style type="text/css">
	#sec_btn {
		display: none;
	}
	#tr_image_upload {
		display: none;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function backToList(obj) {
		obj.action = "${contextPath}/qBoard/listArticles.do";
		obj.submit();
	}
	function fn_enable(obj) {
		document.getElementById("id_title").disabled=false;
		document.getElementById("id_content").disabled=false;
		let imgName = document.getElementById("id_imageFileName");
		if(imgName != null) {
			imgName.disabled = false;
		} else {
			document.getElementById("tr_image_upload").style.display="block";
		}
		document.getElementById("sec_btn").style.display="block";
		document.getElementById("all_btn").style.display="none";
	}
	function fn_modify_article(obj) {
		obj.action = "${contextPath}/qBoard/modArticle.do";
		obj.submit();
	}
	function fn_remove_article(url, q_ano) {
		let newForm = document.createElement('form');
		newForm.setAttribute("method", "post");
		newForm.setAttribute("action", url);
		let q_anoInput = document.createElement("input");
		q_anoInput.setAttribute("type", "hidden");
	    q_anoInput.setAttribute("name", "q_ano");
	    q_anoInput.setAttribute("value", q_ano);
	    newForm.appendChild(q_anoInput);
		document.body.appendChild(newForm);
		newForm.submit();
	}
	function fn_reply_form(url, q_pno) {
		let reForm = document.createElement("form");
		reForm.setAttribute("method", "post");
		reForm.setAttribute("action", url);
		let q_pnoInput = document.createElement("input");
		q_pnoInput.setAttribute("type", "hidden");
		q_pnoInput.setAttribute("name", "q_pno");
		q_pnoInput.setAttribute("value", q_pno);
	    reForm.appendChild(q_pnoInput);
		document.body.appendChild(reForm);
		reForm.submit();
	}
	
	//jquery로 이미지 파일 첨부시 미리보기 기능
	function readURL(input) {
    	if(input.files && input.files[0]) {
        	var reader = new FileReader();
         	reader.onload = function(event) {
            	$('#preview').attr('src', event.target.result);
    		}
        	reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<body>
<!-- 게시판 페이지 시작 -->
	<section class="notice">
		<div class="page-title">
			<div class="container">
				<h3>문의게시판</h3>
			</div>
		</div>
		<div id="board-list">
			<div class="container">
				<form name="frmArticle" method="post" action="${contextPath}" enctype="multipart/form-data">
					<table align="center">
						<tbody>
						<tr>
							<th width="150" align="center" bgcolor="#ff9933">글번호</th>
							<td>
								<input type="text" value="${article.q_ano}" disabled>
								<input type="hidden" name="q_ano" value="${article.q_ano}" />
							</td>
						</tr>	
						<tr>
							<th width="150" align="center" bgcolor="#ff9933">작성자 아이디</th>
							<td><input type="text" name="id" value="${article.id}" disabled></td>
						</tr>
							
						<tr>
							<th width="150" align="center" bgcolor="#ff9933">제목</th>
							<td><input type="text" name="q_title" id ="id_title" value="${article.q_title}" disabled></td>
						</tr>
						<tr>
							<th width="150" align="center" bgcolor="#ff9933">상품명</th>
							<td width="200"><input type="text" value="${i_name}" disabled></td>
						</tr>
						<tr>
							<th width="150" align="center" bgcolor="#ff9933">내용</th>
							<td>
								<textarea rows="20" cols="118" name="q_content" id="id_content" disabled>${article.q_content}</textarea>
							</td>
						</tr>
						<c:choose>
							<c:when test="${not empty article.q_img}">
								<tr>
									<th width="150" align="center" bgcolor="#ff9933" rowspan="2">이미지</th>
									<td>
										<input type="hidden" name="originalFileName" value="${article.q_img}">
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<img src="${contextPath}/download.do?q_ano=${article.q_ano}&q_img=${article.q_img}" id="preview" width="200px"><br>
										<input type="file" name="q_img" id="id_imageFileName" disabled onchange="readURL(this);">
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr id ="tr_image_upload">
									<th width="150" align="center" bgcolor="#ff9933">이미지</th>
									<td>
										<input type="file" name="q_img" onchange="readURL(this);">
										<img id="preview">
									</td>
									<td>
										<input type="hidden" name="originalFileName" value="${article.q_img}">
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
						<tr>
							<th width="150" align="center" bgcolor="#ff9933">등록일자</th>
							<td><input type="text" value='<fmt:formatDate value="${article.q_date}"/>' disabled></td>
						</tr>
						</tbody>
						<tfoot>
							<tr id="all_btn">
							   	<td colspan="2" align="center" >
								   	<c:if test="${member.id == article.id}">
							     		<input class="board_btn" type=button value="수정하기" onclick="fn_enable(this.form)">
							          	<input class="board_btn" type=button value="삭제하기" onclick="fn_remove_article('${contextPath}/qBoard/removeArticle.do', ${article.q_ano})">
							        </c:if>  	
							          	<input class="board_btn" type=button value="리스트로 돌아가기" onclick="backToList(this.form)">
							        <c:if test="${member.id == 'admin'}">
							          	<input class="board_btn" type=button value="답글쓰기" onclick="fn_reply_form('${contextPath}/qBoard/replyForm.do?i_num=${article.i_num}', ${article.q_ano})">
							        </c:if>
							   	</td>   
						  	</tr>
					  	</tfoot>
					</table>
					<div id="sec_btn" align="center">
						<input class="board_btn" type="button" value="수정반영하기" onclick="fn_modify_article(frmArticle)">
						<input class="board_btn" type="button" value="취소" onclick="backToList(frmArticle)">
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>