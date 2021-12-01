package kr.ac.kopo.model;

public class Cart extends Product{
	private int order_id;
	private int nonMemberOrder_id;
	
	public int getNonMemberOrder_id() {
		return nonMemberOrder_id;
	}

	public void setNonMemberOrder_id(int nonMemberOrder_id) {
		this.nonMemberOrder_id = nonMemberOrder_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
}
