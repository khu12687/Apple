<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<style>
a{
	text-decoration: none;
}
input[type=button] {
  background-color: #1567F9;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit] {
  background-color: #1567F9;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #096CDF;
}

button {
	background-color: #096CDF;
	border: 1px;
}
</style>
<header>
 <ul>
	  <li><a href="/"><img src="/resources/images/apple-logo.png" alt="로고"></a></li>
	  <li><a href="/store/list">스토어</a></li>
	  <li><a href="/store/mac">Mac</a></li>
	  <li><a href="/store/ipad">iPad</a></li>
	  <li><a href="/store/iphone">iPhone</a></li>
	  <li><a href="/store/watch">Watch</a></li>
	  <li><a href="/store/music">Music</a></li>
	  <li><a href="https://support.apple.com/ko-kr">고객지원</a></li>
	  <li><a href=""><img src="/resources/images/search.png" alt="검색"></a></li>
	  <li><a href="/buy/bag"><img src="/resources/images/mybag.png" alt="장바구니"></a></li>
	  <li>
	  <c:if test="${sessionScope.member == null}">
		  <a href="/member/login">로그인</a>
		  </c:if>
		  <c:if test="${sessionScope.member != null}">
		  	<a href="/member/mypage">주문확인</a>
		  	<a href="/member/logout" style="margin-left: 1%;">로그아웃</a>
		  </c:if>
	  </li>
 </ul>
</header>
