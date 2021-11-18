package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	private String path = "/store";
	
	@RequestMapping("/list")
	public String list() {
		
		return path + "/list";
	}
	
	@RequestMapping("/mac")
	public String mac() {
		
		return path+"/mac";
	}
	
	@RequestMapping("/ipad")
	public String ipad() {
		
		return path+"/ipad";
	}
	
	@RequestMapping("/iphone")
	public String iPhone() {
		
		return path+"/iphone";
	}
	
	@RequestMapping("/watch")
	public String watch() {
		
		return path+"/watch";
	}
	
	@RequestMapping("/music")
	public String music() {
		
		return path+"/music";
	}
}
