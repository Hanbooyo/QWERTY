<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404</title>
<style type="text/css">
div{
	height:100vh;
	display:flex;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body>
	<div>
		<a href="${contextPath}/main.do"><img alt="500" src="${contextPath}/resources/img/error/500.jpg"></a>
	</div>
</body>
</html>