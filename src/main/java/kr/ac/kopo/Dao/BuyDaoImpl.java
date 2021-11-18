package kr.ac.kopo.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Cart;
import kr.ac.kopo.model.Member;
import kr.ac.kopo.model.NonMemberOrder;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.model.Product;
import kr.ac.kopo.model.Receiver;

@Repository
public class BuyDaoImpl implements BuyDao{

	@Autowired
	SqlSession sql;

	@Override
	public void insert(Orders orders) {

		sql.insert("orders.insert",orders);
	}

	@Override
	public void insert(Cart cart) {
		sql.insert("orderProduct.insert",cart);
	}

	@Override
	public void insert(NonMemberOrder nmo) {
		sql.insert("nmo.insert",nmo);
	}
	
	@Override
	public void insertNM(Cart cart) {
		sql.insert("orderProduct.insertNM",cart);
	}
	
	@Override
	public List<Orders> selectOrders(int order_id) {
		
		return sql.selectList("orders.selectOrders", order_id);
	}

	@Override
	public List<NonMemberOrder> selectNonMemberOrder(int nonMemberOrder_id) {

		return sql.selectList("nmo.selectNonMemberOrder", nonMemberOrder_id);
	}

	@Override
	public List<Orders> selectMember(String id) {

		return sql.selectList("orders.selectMember",id);
	}



}
