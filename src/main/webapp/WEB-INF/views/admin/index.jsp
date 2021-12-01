<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apple 관리</title>
<script>

</script>
<jsp:include page="../include/header.jsp"></jsp:include>
</head>
<body>
	<h2 style="margin-top: 5%">Apple 관리</h2>
	<div>	
		<c:if test="${admin == null}">
			<a href="login">로그인</a>
		</c:if>
		<c:if test="${admin != null }">		
			<h2>${admin.name} 관리자님 환영합니다.</h2>
		</c:if>
		<ul>
			<li><a href="memberList">회원정보</a></li>
			<li><a href="orders">회원 주문 관리</a></li>
			<li><a href="nmorders">비회원 주문 관리</a></li>
		</ul>
	</div>
</body>
</html>