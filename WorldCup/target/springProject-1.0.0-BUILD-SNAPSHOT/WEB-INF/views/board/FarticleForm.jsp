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
<meta charset="UTF-8">

<link rel="stylesheet" href="${contextPath}/resources/css/board.css">

</head>
<body>
	<div style="width: 80%; text-align: center; margin: 0 auto; padding: 100px;">
		<div class="col-lg-12">
		    <div class="contact-form-warp">
		        <h4 class="comment-title">자유 게시판</h4>
		        <form name="articleForm" action="${contextPath}/fBoard/addArticle.do" \
		        method="post" class="comment-form" enctype="multipart/form-data">
		            <div class="row">
		                <div class="col-lg-12">
		                    <input type="text" placeholder="제목" name="f_title" autocomplete="off">
                		    <div class="col-md-3">
			                    <input type="text" placeholder="이미지파일 첨부" autocomplete="off" disabled>
			                </div>
			                 <div class="col-md-9">
			                    <input type="file" name="f_img" >
			                </div>
		                    <textarea placeholder="내용" name="f_content"></textarea>
		                    <input type="submit" class="site-btn" style="font-weight: bold;" value="작성하기">
		                </div>
		            </div>
		        </form>
		    </div>
		</div>
	</div>	


</body>
</html>