package web.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MessageDao;
import web.dto.Member;
import web.dto.Message;
import web.service.face.MessageService;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao messageDao;
	
	@Override
	public List<Message> findList(String receiver_name) {
		
		return messageDao.findList(receiver_name);
	}

	@Override
	public int insertMessage(Message message) {
		
		int result = 0;
		
		message.setDivision(0);
		message.setReadYn(0);
		
		System.out.println("서비스시작");
		if(messageDao.insertMessage(message) > 0 ) {
			System.out.println("서비스 끝");
			result = 1;
		}
		return result;
	}

	@Override
	public List<Member> searchMember() {
		
		List<Member> userList = messageDao.searchMember();
		
		return userList;
	}

	@Override
	public void updateRead(Message message) {
		
		messageDao.updateRead(message);
	}

	@Override
	public int deleteMessage(Message message) {
		
		int result = 0;
		if(messageDao.deleteMessage(message) > 0 ) {
			result = 1;
		}
		return result;
		
	}

}
