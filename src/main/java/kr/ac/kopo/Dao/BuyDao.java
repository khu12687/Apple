package kr.ac.kopo.Dao;

import java.util.List;

import kr.ac.kopo.model.Cart;
import kr.ac.kopo.model.Member;
import kr.ac.kopo.model.NonMemberOrder;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.Product;
import kr.ac.kopo.model.Receiver;
import kr.ac.kopo.util.Pager;

public interface BuyDao {

	void insert(Orders orders);

	void insert(Cart cart);

	void insertNM(Cart cart);
	
	void insert(NonMemberOrder nmo);

	List<Orders> selectOrders(int order_id);

	List<Orders> selectMember(String id);

	List<NonMemberOrder> selectNonMemberOrder(int nonMemberOrder_id);

	List<Orders> selectOrders(Pager pager);

	List<NonMemberOrder> selectNonMemberOrder(Pager pager);


	

}
