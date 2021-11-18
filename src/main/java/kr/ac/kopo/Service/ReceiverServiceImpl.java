package kr.ac.kopo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.Dao.ReceiverDao;
import kr.ac.kopo.model.Receiver;

@Service
public class ReceiverServiceImpl implements ReceiverService{

	@Autowired
	ReceiverDao receiverDao;
	
	@Override
	public void insert(Receiver receiver) {
		receiverDao.insert(receiver);
	}
	
}
