package kr.ac.kopo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import kr.ac.kopo.Dao.BuyDao;
import kr.ac.kopo.model.Cart;
import kr.ac.kopo.model.NonMemberOrder;
import kr.ac.kopo.model.Orders;
import kr.ac.kopo.util.Pager;

@Service
public class BuyServiceImpl implements BuyService{

	@Autowired
	BuyDao buyDao;
	
	@Override
	@Transactional
	public void insert(Orders orders) {
		buyDao.insert(orders);
		
		if(orders.getCart() != null) {
			for(Cart cart : orders.getCart()) {
				cart.setOrder_id( orders.getOrder_id() );
				buyDao.insert(cart);
			}
		}		
	}

	@Override
	@Transactional
	public void insert(NonMemberOrder nmo) {
		buyDao.insert(nmo);
		
		if(nmo.getCart() != null) {
			for(Cart cart : nmo.getCart()) {
				cart.setNonMemberOrder_id( nmo.getNonMemberOrder_id() );
				buyDao.insertNM(cart);
			}
		}		
	}
	
	@Override
	public List<Orders> selectOrders(int order_id) {
		
		return buyDao.selectOrders(order_id);
	}

	@Override
	public List<NonMemberOrder> selectNonMemberOrder(int nonMemberOrder_id) {

		return buyDao.selectNonMemberOrder(nonMemberOrder_id);
	}
	
	@Override
	public List<Orders> selectMember(String id) {

		return buyDao.selectMember(id);
	}

	@Override
	public List<Orders> selectOrders(Pager pager) {

		return buyDao.selectOrders(pager);
	}

	@Override
	public List<NonMemberOrder> selectNonMemberOrder(Pager pager) {
		
		return buyDao.selectNonMemberOrder(pager);
	}


	
}
