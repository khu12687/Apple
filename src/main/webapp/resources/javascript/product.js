
function changeImg(index){    
	if(index==0){		
		var color = document.getElementById("colorPhone").options[document.getElementById("colorPhone").selectedIndex].value;
		var img = "";
		img += "<img style='width: 150px; height: 150px;' id='img_outPhone' src='/resources/images/"+color+".png'>";    
		document.getElementById("img_outPhone").remove();
		document.getElementById("img_divPhone").innerHTML = img;
		var filename = color+".png";
		document.getElementById("filenamePhone").value = filename;
	}else if(index==1){
		var color = document.getElementById("colorMac").options[document.getElementById("colorMac").selectedIndex].value;
		var img = "";
		img += "<img style='width: 150px; height: 150px;' id='img_outMac' src='/resources/images/"+color+".png'>";    
		document.getElementById("img_outMac").remove();
		document.getElementById("img_divMac").innerHTML = img;
		var filename = color+".png";
		document.getElementById("filenameMac").value = filename;		
	}
}
function changePrice(index){    
	if(index==0){
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
	}else if(index==1){
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
}