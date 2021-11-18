<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/header.jsp"></jsp:include>
<title>Insert title here</title>
<script>
function login(){
	$("#loginForm").submit();
}
function nonMember(){
	$("#nonMemberForm").submit();
}

</script>
</head>
<body>
	<h1 style="margin-top: 4%;">Apple ID</h1>
	<div style="width: 60%; margin-left: 15%; margin-top: 7%;">
		<h2>Apple 로그인</h2>
		<form action="/member/loginIndex" method="post" id="loginForm">
			<input type="text" name="id" placeholder="Apple ID">
			<input type="password" name="password" placeholder="Apple password">
			<input type="button" onclick="login()" value="로그인">	
		</form>
		<div>
			<a href="/member/appleid">Apple ID 또는 암호를 잊으셨나요?</a>
		</div>
		<div style="margin-top: 10px;">		
			<a href="/member/regist">Apple ID가 없으신가요? 지금 생성.</a>
		</div>
		<hr>
		<h2>비회원 주문이신가요?</h2>
		<div>주문번호 입력</div>
		<form id="nonMemberForm" action="/member/nmoCheckPhone" method="get">
			<input type="text" name="nonMemberOrder_id">
			<input type="button" onclick="nonMember()" value="입력">
		</form>
	</div>
	<div style="margin-top: 13%;">
		<img src="/resources/images/footer.png" width="100%" >
	</div>
</body>
</html>