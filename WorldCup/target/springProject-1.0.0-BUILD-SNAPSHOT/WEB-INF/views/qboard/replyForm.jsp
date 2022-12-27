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
<title>문의하기 작성</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/board.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function listView(obj) {
		obj.action = "${contextPath}/qBoard/listArticles.do";
		obj.submit();
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
				<form name="frmReply" method="post" action="${contextPath}/qBoard/addReply.do?i_name=${i_name}" enctype="multipart/form-data">
					<table align="center">
						<tbody>	
							<tr>
								<th width="150" align="center" bgcolor="#ff9933">작성자</th>
								<td><input type="text" name="id" value="관리자" readonly></td>
							</tr>
								
							<tr>
								<th width="150" align="center" bgcolor="#ff9933">제목</th>
								<td><input type="text" name="q_title" id ="id_title"></td>
							</tr>
							<tr>
								<th width="150" align="center" bgcolor="#ff9933">상품명</th>
								<td width="200"><input type="text" value="${i_name}" disabled></td>
							</tr>
							<tr>
								<th width="150" align="center" bgcolor="#ff9933">내용</th>
								<td>
									<textarea rows="20" cols="118" name="q_content" id="id_content"></textarea>
								</td>
							</tr>
							<tr>
					        	<th width="150" align="center" bgcolor="#ff9933">이미지</th>
					            <td><input type="file" name="q_img" onchange="readURL(this)"></td>
					        </tr>
						</tbody>
						<tfoot>
							<tr id="all_btn">
							   	<td colspan="3" align="center">
					               <input type="submit" value="답글 반영하기">
					               <input type="button" value="목록으로" onclick="listView(this.form)">
					            </td>
						  	</tr>
					  	</tfoot>
					</table>
				</form>
			</div>
		</div>
	</section>
</body>
</html>