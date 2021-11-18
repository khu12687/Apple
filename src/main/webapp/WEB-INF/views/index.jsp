<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/style.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="include/header.jsp"></jsp:include>
<style>
body { padding: 0px; margin: 0px; }
.jb-box { width: 100%; height: 100%; margin: 0px auto; position: absolute; top:60px}
video { width: 100%;}
.jb-text { position: relative; top: -10px; width: 100%; font-size: 20px; text-align: center;}
.jb-text p { margin-top: -24px; text-align: center; font-size: 48px; color: #ffffff; padding-top: 20px; font-size: 25px;}
a {
	text-decoration: none;
}
</style>
</head>
<body>
  <div class="jb-box">
    <video muted autoplay loop>
      <source src="/resources/videos/Apple Don't Blink Korean Version.mp4" type="video/mp4">
      <strong>Your browser does not support the video tag.</strong>
    </video>
    <div class="jb-text">
		<div><img src="/resources/images/iphone-13-pro.png" width="100%" height="60%"></div>
		<div><a href="https://www.apple.com/kr/iphone-13/">더 알아보기</a></div>
		<div><a href="/buy/detail">구입하기</a></div>
    </div>
     <div class="jb-text">
		<div><img src="/resources/images/macbookMain.png" width="100%" height="60%"></div>
		<div><a href="https://www.apple.com/kr/iphone-13/">더 알아보기</a></div>
		<div><a href="/buy/detailMac">구입하기</a></div>
    </div>
  </div>
</body>
</html>