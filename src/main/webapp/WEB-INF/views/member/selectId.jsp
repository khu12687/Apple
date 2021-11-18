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
				<form method="post" action="/member/selectId">
					<h2>로그인이 안 되나요?</h2>
					<div style="margin-top: 50px;">Apple ID를 찾고 계시나요.</div>
					<input type="text" name="phone" id="AppleIdInput" placeholder="헨드폰 번호를 입력해주세요" ><br><br>
					
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