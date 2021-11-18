package kr.ac.kopo.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Receiver;

@Repository
public class ReceiverDaoImpl implements ReceiverDao{

	@Autowired
	SqlSession sql;
	
	@Override
	public void insert(Receiver receiver) {
		sql.insert("Receiver.insert",receiver);
	}
}
