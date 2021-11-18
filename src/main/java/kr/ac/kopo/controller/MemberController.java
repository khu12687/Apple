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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.Service.BuyService;
import kr.ac.kopo.Service.MemberService;
import kr.ac.kopo.exception.DataNotFoundException;
import kr.ac.kopo.model.Cart;
import kr.ac.kopo.model.Member;
import kr.ac.kopo.model.NonMemberOrder;
import kr.ac.kopo.model.Orders;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BuyService buyService;
	
	final String path = "/member";
	
	@RequestMapping("/regist")
	public String regist() {
		
		return path + "/regist";
	}
	
	@PostMapping("/regist")
	public String regist(Member member, Model model) {

		memberService.insert(member);
		
		model.addAttribute("msg","회원가입을 축하드립니다.");
		model.addAttribute("url","/member/login");
		
		return "message";
	}
	
	@GetMapping("/login")
	public String login() {
		
		return path + "/login";
	}
	
	@PostMapping("/login")
	public String loginCheck(Member member, HttpSession session, Model model) {
		System.out.println(member.getId());
		System.out.println(member.getPassword());
		
		Member obj=memberService.loginCheck(member);
		
		session.setAttribute("member", obj);
		model.addAttribute("msg", obj.getName()+"님 안녕하세요");
		model.addAttribute("url", "/buy/mChooseReceiver");
		return "message";
	}
	
	@PostMapping("/loginIndex")
	public String loginCheckIndex(Member member, HttpSession session, Model model) {
		System.out.println(member.getId());
		System.out.println(member.getPassword());
		
		Member obj=memberService.loginCheck(member);
		
		session.setAttribute("member", obj);
		model.addAttribute("msg", obj.getName()+"님 안녕하세요");
		model.addAttribute("url", "/");
		return "message";
	}
	
	@GetMapping("/mypage")
	public String mypage(Model model, @SessionAttribute Member member) {
		
		//주문번호 가져오기 member 정보를 넣으면 주문테이블에 where id = member.member_id
		List<Orders> orders = buyService.selectMember(member.getId());

		model.addAttribute("list",orders);
		return path + "/mypage";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:../";
	}
	
	@ResponseBody
	@GetMapping("/checkId")
	public String checkId(String id) {
		if(memberService.checkId(id))
			return "OK";
		else
			return "FAIL";			
	}
	
	@GetMapping("/appleid")
	public String appleid() {
		
		return path+ "/appleid";
	}
	
	@PostMapping("/selectAppleId")
	public String selectAppleId(Member member, Model model) {
		boolean appleId = memberService.checkId(member.getId());
		
		if(!appleId) {			
			model.addAttribute("member",member);
			return path+"/appleidPhone";
		}else {
			model.addAttribute("msg","등록된 아이디가 없습니다.");
			model.addAttribute("url","/member/appleid");
			return "message";
		}
	}
	
	@GetMapping("/selectId")
	public String selectId() {
		
		return path + "/selectId";
	}
	
	@PostMapping("/selectId")
	public String selectId(Member member, Model model) {
		System.out.println(member.getPhone());
		Member obj = memberService.checkPhonetoId(member);
		if(obj !=null) {
			model.addAttribute("obj",obj);
			return path + "/selected";
		}else {			
			model.addAttribute("msg","등록된 전화번호와 일치하는 아이디가 없습니다.");
			model.addAttribute("url","/member/appleid");
			return "message";
		}
		
	}
	
	@PostMapping("/checkPhone")
	public String checkPhone(Member member, Model model) {
		System.out.println(member.getPhone());
		Member obj=memberService.checkPhone(member);
		
		System.out.println(obj.getPhone());
		if(obj.getPhone().equals(member.getPhone())) {
			model.addAttribute("obj",obj);
			return path + "/changePw";
		}else {			
			model.addAttribute("msg","등록된 전화번호와 일치하지 않습니다.");
			model.addAttribute("url","/member/appleid");
			return "message";
		}
	}
	
	@GetMapping("/appleidPhone")
	public String appleidPhone() {
		
		return path + "/appleidPhone";
	}
	
	@PostMapping("/changePw")
	public String changePw(Member member, Model model) {
		System.out.println(member.getPassword());
		memberService.changePw(member);
		model.addAttribute("msg","비밀번호가 변경되었습니다.");
		model.addAttribute("url","../buy/choiceLogin");
		return "message";
	}
	
	@GetMapping("/nmoCheckPhone")
	public String nmoCheckPhone(Model model, NonMemberOrder nonMemberOrder) {
		System.out.println(nonMemberOrder.getNonMemberOrder_id());
		int nonMemberOrder_id = nonMemberOrder.getNonMemberOrder_id();
		
		model.addAttribute("nonMemberOrder_id",nonMemberOrder_id);
		return path + "/nmoCheckPhone";
	}
	
	@PostMapping("/nmoCheckPhone")
	public String nmoCheckPhone1(Model model, NonMemberOrder nmo) {
		
		List<NonMemberOrder> list = buyService.selectNonMemberOrder(nmo.getNonMemberOrder_id());
		if(nmo.getNm_phone().equals(list.get(0).getNm_phone())) {			
			model.addAttribute("list",list);
			return "/buy/nonMemberFin";
		}else {
			model.addAttribute("msg","주문번호에 맞는 전화번호를 입력 해주세요.");
			model.addAttribute("url","/member/login");
			return "message";
		}
	}
	
	@ExceptionHandler(DataNotFoundException.class)
	public String handle(DataNotFoundException e, Model model) {
		System.out.println("로그인 실패 메서드 수행");
		model.addAttribute("msg", "아이디나 비밀번호를 확인해 주세요.");
		model.addAttribute("url", "/member/login");
		return "message";
	}
}










