<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연구방 관리</title>
</head>
<body>
	<div>	
		<h1>${admin.name} 관리자님 환영합니다.</h1>
		<ul>
			<li><a href="memberList">회원정보</a></li>
			<li><a href="monthInfo">이달의 소식관리</a></li>
			<li><a href="suppInfo">구비물품 신청내역</a></li>
			<li><a href="qnaInfo">QNA 관리</a></li>
			<li><a href="reqInfo">요청사항 관리</a></li>
		</ul>
	</div>
</body>
</html>