<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>apple</title>
<meta charset="utf-8">
<jsp:include page="../include/header.jsp"></jsp:include>
<style>

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
<script src="/resources/javascript/product.js"></script>
<script>

//로그인선택 페이지로
function choiceLogin(){
	$("form").attr({
		"action":"/buy/choiceLogin",
		"method":"post"
	});
	$("form").submit();	
}

function edit(index, id){
	var n=id.split("_")[1];
	var ea = document.getElementById("t_"+n).value;
	if(confirm(index+"상품의 갯수를 "+ea+"개로 수정할래요?")){
		location.href="/buy/bag/edit/"+index+"/"+ea;
	}
}

function del(index){
	if(confirm("상품코드 "+index+" 를 삭제하시겠어요?")){
		location.href="/buy/bag/del/"+index;
	}
}

</script>
</head>
<body>
<div id="body">
  <div id="content">
		<h2 style="margin-top: 5%">장바구니에 들어 있는 제품입니다</h2>
		
		<form>
			<table width="100%">
			  <tr>
			    <th>이미지</th>
			    <th>카테고리</th>
			    <th>상품명</th>
			    <th>색깔</th>
			    <th>가격</th>
			    <th>용량</th>
			    <th>수량</th>
			    <th>관리</th>
			  </tr>
			  <c:if test="${sessionScope.cartList != null }">
				  <c:forEach var="item" items="${sessionScope.cartList}" varStatus="status">
				  <c:set var="totalBuy" value="${totalBuy+item.getPrice()}"></c:set>
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
					    
					    <td><input type="number" id="t_${status.index}" value="${item.getEa()}"/></td>
					     <td colspan="1">
					    	<button id="bt_${status.index}" onClick="edit(${status.index}, this.id)">수정</button>
		    				<button onClick="del(${status.index})">삭제</button>
				    	</td>
				  </tr>
			   </c:forEach>
			</c:if>
			<c:if test="${sessionScope.cartList.size() < 1}">					
				<tr>
					<td colspan="8">장바구니가 비어있습니다</td>
				</tr>
			</c:if>
			  <tr>
			  	<td colspan="8" style="text-align:right">장바구니에 들어 있는 제품입니다 : \ ${totalBuy}원</td>
			  </tr>
			</table>
		  <input type="button" value="결제" onClick="choiceLogin()"/>
	  </form>
  </div>
</div>

	<div style="width: 100%; height: 60px;"></div>
	<div class="container" style="width: 30%;">
		<h2 style="margin-bottom: 5%;">다른 상품을 더 원하시나요?</h2>
		<div id="img_divPhone" style="display: inline; margin-left: 30%;">
			<img id="img_outPhone" src="/resources/images/SierraBlue.png" style="width: 150px; height: 150px;">
		</div>
		<form method="post" action="/buy/bag" class="mt-4">
			<input type="hidden" name="filename" id="filenamePhone" value="SierraBlue.png">
			<div class="mt-2">
				<label>제품명:</label>	
				<select name="product_name" id="pid" class="form-select">
					<option value="아이폰13pro">아이폰13pro</option>
					<option value="아이폰13pro Max">아이폰13pro Max</option>
				</select>
			</div>						
			<div class="mt-2">				
				<label>색깔</label>
				<select name="color" id="colorPhone" class="form-select" onchange="changeImg(0)">
					<option value="SierraBlue">시에라 블루</option>
					<option value="Silver">실버</option>
					<option value="Gold">골드</option>
					<option value="Graffite">그래파이트</option>
				</select>	
			</div>
			<div class="mt-2">
				<label>용량:</label>
				<select name="volume" class="form-select" id="volumePhone" onchange="changePrice(0)">
					<option value="128">128GB</option>
					<option value="256">256GB</option>
					<option value="512">512GB</option>
					<option value="1">1TB</option>
				</select>							
			</div>
			<div class="mt-2">					
				<label>가격:</label>	
				<select name="price" id="pricePhone" class="form-select">
					<option value="1350000">1,350,000</option>
				</select>
			</div>
			<input type="hidden" name = "category" value="0">
			<div class="row mt-4">
				<div class="col"></div>
				<div class="col"><button class="btn btn-primary form-control">장바구니 담기</button></div>
				<div class="col"></div>	
			</div>
		</form>
	</div>

	<div style="width: 100%; height: 60px;"></div>
	<div class="container" style="width: 30%;">
		<div id="img_divMac" style="display: inline; margin-left: 30%;">
			<img id="img_outMac" src="/resources/images/SpaceGrayMac.png" style="width: 150px; height: 150px;">
		</div>
		<form method="post" action="/buy/bag" class="mt-4">
			<input type="hidden" name="filename" id="filenameMac" value="SpaceGrayMac.png">
			
			<div class="mt-2">
				<label>제품명:</label>	
				<select name="product_name" id="macName" class="form-select" onchange="changePrice(1)">
					<option value="MacBookPro13">MacBookPro13</option>
					<option value="MacBookPro14">MacBookPro14</option>
					<option value="MacBookPro16">MacBookPro16</option>
				</select>
			</div>						
			<div class="mt-2">				
				<label>색깔</label>
				<select name="color" id="colorMac" class="form-select" onchange="changeImg(1)">
					<option value="SpaceGrayMac">스페이스 그레이</option>
					<option value="SilverMac">실버</option>
				</select>	
			</div>
			<div class="mt-2">
				<label>용량:</label>
				<select name="volume" class="form-select" id="volumeMac" onchange="changePrice(1)">
					<option value="256">256GB</option>
					<option value="512">512GB</option>
				</select>
			</div>		
			<div class="mt-2">					
				<label>가격:</label>	
				<select name="price" id="priceMac" class="form-select">
					<option value="1690000">1,690,000</option>
				</select>
			</div>
			<input type="hidden" name = "category" value="1">
			<div class="row mt-4">
				<div class="col"></div>
				<div class="col"><button class="btn btn-primary form-control">장바구니 담기</button></div>
				<div class="col"></div>	
			</div>
		</form>
	</div>

	<div style="margin-top: 20%;">
		<img src="/resources/images/footer.png" width="100%" >
	</div>
</body>
</html>