package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.Service.AdminService;
import kr.ac.kopo.Service.BuyService;
import kr.ac.kopo.Service.MemberService;
import kr.ac.kopo.exception.DataNotFoundException;
import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.Member;
import kr.ac.kopo.model.NonMemberOrder;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.util.Pager;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BuyService buyService;
	
	final String path= "/admin";
	
	@GetMapping("/index")
	public String index(@SessionAttribute Admin admin) {
		
		return path + "/index";
	}
	
	@GetMapping("/login")
	public String goLogin() {
		
		return path + "/login";
	}
	
	@PostMapping("/login")
	public String login(Admin admin, Model model, HttpSession session) {
		Admin obj = adminService.loginCheck(admin);
		session.setAttribute("admin", obj);
		model.addAttribute("msg", obj.getName()+"님 안녕하세요");
		model.addAttribute("url", "/admin/index");
		
		return "/message";
	}
	
	@GetMapping("/memberList")
	public String memberList(Model model, Pager pager) {
		List<Member> members = memberService.selectAll(pager);
		model.addAttribute("list",members);
		return path + "/memberList";
	}
	
	@GetMapping("/orders")
	public String orders(Model model, Pager pager) {
		List<Orders> orders = buyService.selectOrders(pager);
		model.addAttribute("orders",orders);
		return path + "/orders";
	}
	
	@GetMapping("/nmorders")
	public String nmorders(Model model, Pager pager) {
		List<NonMemberOrder> nmo = buyService.selectNonMemberOrder(pager);
		System.out.println(nmo.get(0).getCart().get(0).getEa());
		model.addAttribute("nmo",nmo);
		return path + "/nmorders";
	}
	
	@ExceptionHandler(DataNotFoundException.class)
	public String handle(DataNotFoundException e, Model model) {
		System.out.println("로그인 실패 메서드 수행");
		model.addAttribute("msg", "아이디나 비밀번호를 확인해 주세요.");
		model.addAttribute("url", "/admin/login");
		return "message";
	}
}
