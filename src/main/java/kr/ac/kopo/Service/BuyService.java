package kr.ac.kopo.Service;

import java.util.List;

import kr.ac.kopo.model.Cart;
import kr.ac.kopo.model.Member;
import kr.ac.kopo.model.NonMemberOrder;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.Product;
import kr.ac.kopo.model.Receiver;

public interface BuyService {

	void insert(Orders orders);

	List<Orders> selectOrders(int order_id);

	List<Orders> selectMember(String id);

	void insert(NonMemberOrder nmo);

	List<NonMemberOrder> selectNonMemberOrder(int nonMemberOrder_id);

	

}
