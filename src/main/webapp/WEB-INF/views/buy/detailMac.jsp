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
	var color = document.getElementById("colorMac").options[document.getElementById("colorMac").selectedIndex].value;
	var img = "";
	img += "<img style='width: 300px; height: 300px;' id='img_outMac' src='/resources/images/"+color+".png'>";    
	document.getElementById("img_outMac").remove();
	document.getElementById("img_divMac").innerHTML = img;
	var filename = color+".png";
	document.getElementById("filenameMac").value = filename;		
}
function changePrice(){  
	var volume = document.getElementById("volumeMac").options[document.getElementById("volumeMac").selectedIndex];
	var macName = document.getElementById("macName").options[document.getElementById("macName").selectedIndex].value;
	
	var price = document.getElementById("priceMac").options[document.getElementById("priceMac").selectedIndex];
	if(volume.value == 256 && macName == "MacBookPro13"){		
		price.text = "1,690,000";
		price.value =1690000;
	}else if(volume.value == 512 && macName == "MacBookPro13"){
		price.text = "1,960,000";
		price.value =1960000;
	}else if(volume.value == 256 && macName == "MacBookPro14"){
		price.text = "2,390,000";
		price.value =2390000;
	}else if(volume.value == 512 && macName == "MacBookPro14"){
		price.text = "2,690,000";
		price.value =2690000;
	}else if(volume.value == 512 && macName == "MacBookPro16"){
		price.text = "3,360,000";
		price.value =3360000;
	}else if(volume.value == 256 && macName == "MacBookPro16"){
		price.text = "3,060,000";
		price.value =3060000;
	}
}
</script>
</head>
<body>
	<div style="width: 100%; height: 160px;"></div>
	<div class="container">
		<div id="img_divMac" style="display: inline; margin-left: 30%;">
			<img id="img_outMac" src="/resources/images/SpaceGrayMac.png" style="width: 300px; height:300px;]">
		</div>
		<form method="post" action="/buy/bag" class="mt-4">
			<input type="hidden" name="filename" id="filenameMac" value="SpaceGrayMac.png">
			
			<div class="mt-2">
				<label>제품명:</label>	
				<select name="product_name" id="macName" class="form-select" onchange="changePrice()">
					<option value="MacBookPro13">MacBookPro13</option>
					<option value="MacBookPro14">MacBookPro14</option>
					<option value="MacBookPro16">MacBookPro16</option>
				</select>
			</div>						
			<div class="mt-2">				
				<label>색깔</label>
				<select name="color" id="colorMac" class="form-select" onchange="changeImg()">
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
</body>
</html>