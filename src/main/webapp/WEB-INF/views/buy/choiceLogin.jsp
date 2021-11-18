<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/header.jsp"></jsp:include>
<title>Insert title here</title>
<script>
function cPay(){
	location.href="cPay";
	
}
</script>
</head>
<body>
	<div style="width: 100%; height: 60px;"></div>
	<div style="margin-left: 200px; margin-top: 100px;">	
		<span>결제금액 : ${totalPrice} 원</span>
		<hr>
		<h1 style="margin-bottom: 50px; ">더욱 빠르게 결제하시려면 로그인하세요.</h1>
	</div>
	<div style="margin-bottom: 50px; margin-left: 200px; margin-top: 100px;">
		<form method="post" action="/member/login">
			<h2>Apple Id로 결제하기</h2>
			<input type="text" name="id" placeholder="Apple ID">
			<input type="password" name="password" placeholder="Apple password">
			<input type="submit" value="로그인">		
		</form>
		<hr>
		<div>
			<a href="/member/appleid">Apple ID 또는 암호를 잊으셨나요?</a>
		</div>
		<div style="margin-top: 10px;">		
			<a href="/member/regist">Apple ID가 없으신가요? 지금 생성.</a>
		</div>
		<hr>
	</div>	
	<div style="margin-left: 200px; margin-top: 100px;">
		<form>
			<h2>방문객 결제</h2>
			<h3>결제를 진행하고 나중에 Apple Id를 생성하세요.</h3>
			<input type="button" onclick="cPay()" value="방문객으로 계속하기">
		</form>
	</div>	
	<div style="margin-top: 200px;">
		<img src="/resources/images/footer.png" width="100%" >
	</div>
</body>
</html>