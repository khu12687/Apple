<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/style.css">
<head>
<meta charset="UTF-8">
<title>detail</title>
<jsp:include page="../include/header.jsp"></jsp:include>

<script>
function changeImg(){    
	var color = document.getElementById("colorPhone").options[document.getElementById("colorPhone").selectedIndex].value;
	var img = "";
	img += "<img id='img_outPhone' src='/resources/images/"+color+".png'>";    
	document.getElementById("img_outPhone").remove();
	document.getElementById("img_divPhone").innerHTML = img;
	var filename = color+".png";
	document.getElementById("filenamePhone").value = filename;
}
function changePrice(){    
	var volume = document.getElementById("volumePhone").options[document.getElementById("volumePhone").selectedIndex].value;
	var price = document.getElementById("pricePhone");
	if(volume == 256){		
		price.options[price.selectedIndex].text = "1,490,000";
		price.options[price.selectedIndex].value =1490000;
	}else if(volume == 512){
		price.options[price.selectedIndex].text = "1,760,000";
		price.options[price.selectedIndex].value =1760000;
	}else if(volume == 1){
		price.options[price.selectedIndex].text = "2,030,000";
		price.options[price.selectedIndex].value =2030000;
	}else{
		price.options[price.selectedIndex].text = "1,350,000";
		price.options[price.selectedIndex].value =1350000;
	}
}
</script>
</head>
<body>
	<div style="width: 100%; height: 60px;"></div>
	<div id="img_divPhone" style="display: inline; margin-left: 30%;">
		<img id="img_outPhone" src="/resources/images/SierraBlue.png">
	</div>
	<div class="container">
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
</body>
</html>