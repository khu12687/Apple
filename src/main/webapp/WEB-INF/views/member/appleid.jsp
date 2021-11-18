<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apple ID 복구</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
h2{
	font-weight: 900; 
	color: black;
}
#AppleIdInput{
	margin-top: 10px; 
	width: 350px; 
	height: 45px; 
	border-radius: 5px; 
	border-color: #cccccc;
	background: transparent;
}
</style>
</head>
<body>
	<h1 style="margin-top: 4%;">Apple ID</h1>
	<hr>
	<div style="margin-left: 20%; margin-top: 100px;">
		<ul style="display: flex;">
			<li>
				<form method="post" action="/member/selectAppleId">
					<h2>로그인이 안 되나요?</h2>
					<div style="margin-top: 50px;">시작하려면 Apple ID를 입력하십시오.</div>
					<input type="text" name="id" id="AppleIdInput" placeholder="Apple ID" ><br><br>
					<span>Apple ID를 잊어버린 경우 </span><a href="selectId">아이디 찾기</a><br><br>
					<input type="submit" value="계속">		
				</form>			
			</li>
			<li>		
				<img src="/resources/images/applepasswd.png">
			</li>
		</ul>	
	</div>
	<div style="margin-top: 200px;">
		<hr>
		<img src="/resources/images/footer.png" width="100%" >
	</div>
</body>
</html>