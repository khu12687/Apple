package kr.ac.kopo.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class NonMemberOrder {
	private int nonMemberOrder_id;
	private String nm_name;
	private String nm_email;
	private String nm_address;
	private String nm_phone;
	@DateTimeFormat(pattern = "yyyy-mm-dd HH:mm:ss")
	private Date nm_order_date;
	private List<Cart> cart;

	public List<Cart> getCart() {
		return cart;
	}

	public void setCart(List<Cart> cart) {
		this.cart = cart;
	}

	public int getNonMemberOrder_id() {
		return nonMemberOrder_id;
	}

	public void setNonMemberOrder_id(int nonMemberOrder_id) {
		this.nonMemberOrder_id = nonMemberOrder_id;
	}

	public String getNm_name() {
		return nm_name;
	}

	public void setNm_name(String nm_name) {
		this.nm_name = nm_name;
	}

	public String getNm_email() {
		return nm_email;
	}

	public void setNm_email(String nm_email) {
		this.nm_email = nm_email;
	}

	public String getNm_address() {
		return nm_address;
	}

	public void setNm_address(String nm_address) {
		this.nm_address = nm_address;
	}

	public String getNm_phone() {
		return nm_phone;
	}

	public void setNm_phone(String nm_phone) {
		this.nm_phone = nm_phone;
	}

	public Date getNm_order_date() {
		return nm_order_date;
	}

	public void setNm_order_date(Date nm_order_date) {
		this.nm_order_date = nm_order_date;
	}

}
