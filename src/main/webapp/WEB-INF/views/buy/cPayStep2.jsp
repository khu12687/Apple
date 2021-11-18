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
</style>
<script>
function fin(){
	$("#nmf").submit();
}
</script>
</head>
<body>
	<div style="width: 100%; height: 70px;"></div>
	<div style="margin-left: 25%; width: 60%;">	
	<div>
		결제
		<hr>
	</div>
	<div>
		<h2>주문하시겠습니까?</h2>
		<h2>입력하신 사항이 모두 정확한지 확인해주십시오.</h2>
	</div>
		<div style="margin-top: 2%;">
			<form>
				<table width="50%">
				  <tr>
				    <th>이미지</th>
				    <th>상품명</th>
				    <th>색깔</th>
				    <th>용량</th>
				    <th>수량</th>
				    <th>가격</th>
				  <c:forEach var="item" items="${cartList}">
					   <tr>
						    <td><img src="/resources/images/${item.filename}" style="width: 50px; height: 50px;"></td>
						    <td>${item.product_name }</td>
						    <td>${item.color }</td>
						    <c:choose>	
							    <c:when test="${item.volume == 1}">
								    <td>${item.volume }TB</td>
							    </c:when>
							    <c:otherwise>
								    <td>${item.volume}GB</td>
							    </c:otherwise>
						    </c:choose>
						    <td>${item.getEa()}</td>
						    <td>${item.getPrice()}</td>
					  </tr>
				   </c:forEach>
				   
			   </table>
		   </form>
		</div>
		<hr>
		<div style="margin-top: 2%;">
			<h2>배송 상세정보</h2>
			<div style="margin-bottom: 1%; margin-top: 1%;">배송지:</div>
			<form action="nonMemberFin" method="post" id="nmf">
				<div class="form-group" id="divName">
			     <label for="inputName" class="col-lg-2 control-label">이름</label>
			     <div class="col-lg-10">
			         <input type="text" name="nm_name" class="form-control onlyHangul" id="name" data-rule-required="true" value="${nonMember.nm_name}" maxlength="15" readonly>
			     </div>
			 	</div>
			 
				<div class="form-group" id="divEmail">
			     <label for="inputEmail" class="col-lg-2 control-label">주소</label>
			     <div class="col-lg-10">
			         <input type="text" name="nm_address" class="form-control" id="address" data-rule-required="true" value="${nonMember.nm_address}" maxlength="40" readonly>
			     </div>
				</div>
			 	<div style="margin-bottom: 1%; margin-top: 1%;">연락처 정보:</div>
				<div class="form-group" id="divEmail">
			     <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
			     <div class="col-lg-10">
			         <input type="email" name="nm_email" class="form-control" id="email" data-rule-required="true" value="${nonMember.nm_email}" maxlength="40" readonly>
			     </div>
				</div>
				<div class="form-group" id="divPhoneNumber">
			     <label for="inputPhoneNumber" class="col-lg-2 control-label">전화번호</label>
			     <div class="col-lg-10">
			         <input type="tel" name="nm_phone" class="form-control onlyNumber" id="phoneNumber" data-rule-required="true" value="${nonMember.nm_phone}" maxlength="11" readonly>
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
		         <input type="text" class="form-control onlyHangul" id="name" data-rule-required="true" value="${nonMember.nm_name}" maxlength="15" readonly>
		     </div>
		 	</div>
		 
			<div class="form-group" id="divEmail">
		     <label for="inputEmail" class="col-lg-2 control-label">주소</label>
		     <div class="col-lg-10">
		         <input type="text" class="form-control" id="address" data-rule-required="true" value="${nonMember.nm_address}" maxlength="40" readonly>
		     </div>
			</div>
		</div>
		<hr>
		<div style="margin-top: 2%;">
			<h2>이용약관</h2>
            <div class="radio">
              <label>
                 <input type="checkbox">
                  <a href="https://support.apple.com/ko-kr" target="_blank">Apple 개인정보 취급방침</a>에 따라 개인정보를 수집하고, 사용하고, 제3자에 제공하고, 처리한다는 점에 동의합니다.
              </label>
            </div>
		</div>
		<hr>
		<div style="margin-top: 2%;">
			<h2>총계</h2>
		</div>
		<hr>
		<button onclick="fin()">KG 이니시스로 계속 진행</button>
	</div>
	<div style="margin-top: 10%;">
		<img src="/resources/images/footer.png" width="100%" >
	</div>
</body>
</html>