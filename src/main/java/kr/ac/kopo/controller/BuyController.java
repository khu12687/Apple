package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.Service.BuyService;
import kr.ac.kopo.Service.ReceiverService;
import kr.ac.kopo.model.Cart;
import kr.ac.kopo.model.Member;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.Product;
import kr.ac.kopo.model.Receiver;
import kr.ac.kopo.model.NonMemberOrder;

@Controller
@RequestMapping("/buy")
public class BuyController {
	
	@Autowired
	BuyService buyService;
	
	@Autowired
	ReceiverService receiverService;
	
	private String path = "/buy";
	
	public int setPriceFromV(Cart obj){
		int price=0;
		if(obj.getVolume() == 128 && obj.getCategory().equals("0")) {
			price = 1350000;
		}else if(obj.getVolume() == 256 && obj.getCategory().equals("0")) {
			price = 1490000;
		}else if(obj.getVolume() == 512 && obj.getCategory().equals("0")) {
			price = 176000;
		}else if(obj.getVolume()==1 && obj.getCategory().equals("0")){
			price = 2030000;
		}else if(obj.getVolume() == 256 && obj.getCategory().equals("1")) {
			price = 1690000;
		}else if(obj.getVolume() == 512 && obj.getCategory().equals("1")) {
			price = 2690000;
		}else if(obj.getVolume()==1 && obj.getCategory().equals("1")){
			price = 3060000;
		}
		return price;
	}
	
	public int getTotalPrice(List<Cart> cartList) {
		int totalPrice = 0;
		
		for(Cart item : cartList) {
			totalPrice += item.getPrice();
		}
		
		return totalPrice;
	}
	
	@GetMapping("/detail")
	public String detail() {
		
		return path+"/detail";
	}
	
	@GetMapping("/detailMac")
	public String detailMac() {
		
		return path+"/detailMac";
	}
	
	@PostMapping("/bag")
	public String detail(Model model, Cart cart, HttpSession session) {
		List<Cart> cartList =(List)session.getAttribute("cartList");
		if(cartList==null) {
			cartList = new ArrayList<Cart>();
			session.setAttribute("cartList", cartList);
		}	
		
		int count=0;
	
		Cart obj = null;
		
		for(int i=0; i<cartList.size(); i++) {
			obj = cartList.get(i);
			
			//obj와 cart가 같으면
			if(obj.getProduct_name().equals(cart.getProduct_name()) && obj.getVolume() ==  cart.getVolume() && obj.getColor().equals(cart.getColor())){
				count++;
				obj.setEa(obj.getEa()+1);
				
				int price = setPriceFromV(obj);
				obj.setPrice(price*obj.getEa());
			}
		}
		
		if(count==0) {
			cart.setEa(1);
			cartList.add(cart);
		}
		
		
		return  path + "/bag";
	}
	
	@GetMapping("/bag")
	public String bag(HttpSession session) {
		List<Cart> cartList =(List)session.getAttribute("cartList");
		session.setAttribute("cartList", cartList);
		if(cartList==null) {
			cartList = new ArrayList<Cart>();
			session.setAttribute("cartList", cartList);
		}	
		return path+"/bag";
	}
	
	@GetMapping("/bag/edit/{index}/{ea}")
	public String edit(Model model,Cart cart, @PathVariable int index, @PathVariable int ea, @SessionAttribute List<Cart> cartList, HttpSession session){
		System.out.println("edit호출 index = "+index+" ea = "+ea);
		Cart obj=cartList.get(index);
		System.out.println(obj.getColor());

		int price = setPriceFromV(obj);
		
		obj.setEa(ea);
		obj.setPrice(price*ea);
		session.setAttribute("cartList", cartList);
		return "redirect:bag";
	}
	
	@GetMapping("/bag/del/{index}")
	public String removeOne(@PathVariable int index,@SessionAttribute List<Cart> cartList) {

		Cart cart=cartList.get(index);		
		cartList.remove(cart);
		
		return path+"/bag";
	}
	
	@GetMapping("/choiceLogin")
	public String choiceLoginGet(Model model, @SessionAttribute List<Cart> cartList) {
		int totalPrice = getTotalPrice(cartList);
		
		model.addAttribute("totalPrice", totalPrice);
		
		return path + "/choiceLogin";
	}
	
	@PostMapping("/choiceLogin")
	public String choiceLogin(Model model, @SessionAttribute List<Cart> cartList) {
		int totalPrice = getTotalPrice(cartList);
		
		model.addAttribute("totalPrice", totalPrice);
		
		return path + "/choiceLogin";
	}
	
	@GetMapping("/cPay")
	public String cPay(Model model, @SessionAttribute List<Cart> cartList) {
		int totalPrice = getTotalPrice(cartList);
		
		model.addAttribute("totalPrice", totalPrice);
		
		return path+"/cPay";
	}
	
	@PostMapping("/cPayStep2")
	public String cPayStep2(Model model, @SessionAttribute List<Cart> cartList, NonMemberOrder nonMember) {
		int totalPrice = getTotalPrice(cartList);
		
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("nonMember", nonMember);
		return path+"/cPayStep2";
	}
	
	@PostMapping("/mPay")
	public String mPay(Model model, @SessionAttribute List<Cart> cartList, @SessionAttribute Member member, Receiver receiver) {
		int totalPrice = getTotalPrice(cartList);

		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("member", member);
		model.addAttribute("receiver",receiver);
		return path + "/mPay";
	}
	
	@GetMapping("/mChooseReceiver")
	public String mChooseReceiver(Model model, @SessionAttribute List<Cart> cartList, @SessionAttribute Member member) {
		int totalPrice = getTotalPrice(cartList);
		
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("member", member);
		return path + "/mChooseReceiver";
	}
	
	@PostMapping("/finish")
	public String finish(Receiver receiver, @SessionAttribute List<Cart> cartList, @SessionAttribute Member member, Orders orders, Model model) {
		orders.setReceiver(receiver);
		orders.setCart(cartList);
		orders.setMember(member);
		
		orders.setEa(cartList.size());
		receiverService.insert(receiver);
		
		buyService.insert(orders);
		
		List<Orders> list = buyService.selectOrders(orders.getOrder_id());
		model.addAttribute("list",list);
		cartList.removeAll(cartList);
		return path + "/finish";
	}

	@GetMapping("/nonMemberFin")
	public String nonMemberFin() {
		
		return path + "/nonMemberFin";
	}
	
	@PostMapping("/nonMemberFin")
	public String nonMemberFin(NonMemberOrder nmo, @SessionAttribute List<Cart> cartList, Model model) {
		System.out.println(nmo.getNm_name());
		System.out.println(nmo.getNm_address());
		nmo.setCart(cartList);
		System.out.println(nmo.getCart().get(0).getProduct_name());
		buyService.insert(nmo);
		System.out.println(nmo.getNonMemberOrder_id());
		List<NonMemberOrder> list = buyService.selectNonMemberOrder(nmo.getNonMemberOrder_id());
		model.addAttribute("list",list);
		cartList.removeAll(cartList);
		return path + "/nonMemberFin";
	}

}
