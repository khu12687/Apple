package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	final String path= "/admin";
	
	@RequestMapping("/index")
	public String index() {
		
		return path + "/index";
	}
}
