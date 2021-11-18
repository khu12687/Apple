<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2{
	font-weight: 900; 
	color: black;
}
input[type=button] {
  background-color: #1567F9;
  width: 260px;
  height: 50px;
  margin-top: 20px;
  margin-left: 80%;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #096CDF;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
  margin-top:50px;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

</style>

</head>
<body>
	<div style="width: 100%; height: 70px;"></div>
	<img style="margin-left: 23%;" src="/resources/images/thank.png">
	<div style="margin-left: 25%; width: 60%;">	
	<div>
		<div>주문 일시:${list[0].order_date}</div>
		<hr>
	</div>
	<div>
		<h2>주문 세부 정보</h2>
		<div>
		<table>
	  		<c:forEach var="item" items="${list[0].cart}">
			   <tr>
				    <td><img src="/resources/images/${item.filename}" style="width: 50px; height: 50px;"></td>
				    <td>
				    	<c:if test="${item.category == 0 }">
				    		아이폰
				    	</c:if>
				    	<c:if test="${item.category == 1 }">
				    		mac
				    	</c:if>
				    </td>
				    <td>${item.product_name }</td>
				    <td>${item.color }</td>
				    <td>${item.price }</td>
				    
				    <c:choose>	
					    <c:when test="${item.volume == 1}">
						    <td>${item.volume }TB</td>
					    </c:when>
					    <c:when test="${item.volume == 128}">
						    <td>${item.volume }GB</td>
					    </c:when>
			   		    <c:when test=" ${item.volume == 256}">
						    <td>${item.volume }GB</td>
					    </c:when>
					    <c:otherwise>
						    <td>${item.volume}GB</td>
					    </c:otherwise>
				    </c:choose>
			  </tr>
		   </c:forEach>
	   </table>
		</div>
		<hr>
		<h2>결제 및 청구 세부정보</h2>
		<div style="margin-top: 2%;">
		<hr>
			<h2>배송 상세정보</h2>
			<div style="margin-bottom: 1%; margin-top: 1%;">배송지:</div>
			<form action="finish" method="post" id="fin">
				<div class="form-group" id="divName">
			     <label for="inputName" class="col-lg-2 control-label">이름</label>
			     <div class="col-lg-10">
			         <input type="text" name="rname" class="form-control onlyHangul" id="name" data-rule-required="true" value="${list[0].receiver.rname}" maxlength="15" readonly>
			     </div>
			 	</div>
			 
				<div class="form-group" id="divEmail">
			     <label for="inputEmail" class="col-lg-2 control-label">주소</label>
			     <div class="col-lg-10">
			         <input type="text" name="raddr" class="form-control" id="address" data-rule-required="true" value="${list[0].receiver.raddr}" maxlength="40" readonly>
			     </div>
				</div>
			 	<div style="margin-bottom: 1%; margin-top: 1%;">연락처 정보:</div>
				<div class="form-group" id="divEmail">
			     <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
			     <div class="col-lg-10">
			         <input type="email" name="remail" class="form-control" id="email" data-rule-required="true" value="${list[0].receiver.remail}" maxlength="40" readonly>
			     </div>
				</div>
				<div class="form-group" id="divPhoneNumber">
			     <label for="inputPhoneNumber" class="col-lg-2 control-label">전화번호</label>
			     <div class="col-lg-10">
			         <input type="tel" name="rphone" class="form-control onlyNumber" id="phoneNumber" data-rule-required="true" value="${list[0].receiver.rphone}" maxlength="11" readonly>
			     </div>
				</div>
			</form>
		</div>
		<hr>
		<div style="margin-top: 2%;">
			<h2>결제 상세정보</h2>
			<div style="margin-bottom: 1%; margin-top: 1%;">청구 주소:</div>
			<div class="form-group" id="divName">
		     <label for="inputName" class="col-lg-2 control-label">이름</label>
		     <div class="col-lg-10">
		         <input type="text" name="name" class="form-control onlyHangul" id="name" data-rule-required="true" value="${member.name}" maxlength="15" readonly>
		     </div>
		 	</div>
		 
			<div class="form-group" id="divEmail">
		     <label for="inputEmail" class="col-lg-2 control-label">주소</label>
		     <div class="col-lg-10">
		         <input type="text" name="address" class="form-control" id="address" data-rule-required="true" value="${member.address}" maxlength="40" readonly>
		     </div>
			</div>
		</div>
		<hr>
		<h2>질문</h2>
		<div>이 다음 순서는 무엇입니까?<br>지불이 처리되면 주문 확인 이메일을 보내 드립니다. <br>이 메일에는 주문 정보와 주문의 가장 최신 상태를 볼 수 있는 링크가 포함되어 있습니다. <br>또한 주문하신 제품이 배송되면 배송 알림 이메일도 보내 드립니다.</div>
	</div>

	</div>
	<div style="margin-top: 10%;">
		<img src="/resources/images/footer.png" width="100%" >
	</div>
</body>
</html>