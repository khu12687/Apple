<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apple 비회원 주문 확인</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<style>
h2{
	font-weight: 900; 
	color: black;
}
#ApplePhoneInput{
	margin-top: 10px; 
	width: 350px; 
	height: 45px; 
	border-radius: 5px; 
	border-color: #cccccc;
	background: transparent;
}
</style>
<script>
function back(){
	location.href="appleid";
}
</script>
</head>
<body>
	<h1 style="margin-top: 4%;">Apple ID</h1>
	<hr>
	<div style="margin-left: 20%; margin-top: 100px;">
		<ul style="display: flex;">
			<li>
				<form method="post" action="/member/nmoCheckPhone">
					<h2>전화번호를 확인하십시오.</h2>
					<div style="margin-top: 50px;">Apple 비회원 주문에 사용한 전화번호를 입력하십시오.</div>
					<input type="hidden" name="nonMemberOrder_id" value="${nonMemberOrder_id}">
					<input type="text" name="nm_phone" id="ApplePhoneInput" placeholder="전화번호" ><br><br>
					<input type="button" value="취소" onclick="back();">
					<input type="submit" value="계속" style="margin-left: 1%;">	
				</form>			
			</li>
			<li>		
				<img src="/resources/images/appleIdCheck.png">
			</li>
		</ul>	
	</div>
	<div style="margin-top: 200px;">
		<hr>
		<img src="/resources/images/footer.png" width="100%" >
	</div>
</body>
</html>