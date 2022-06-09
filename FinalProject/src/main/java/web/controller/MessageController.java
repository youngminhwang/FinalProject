package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Member;
import web.dto.Message;
import web.service.face.MessageService;
import web.ws.MessageHandler;

@Controller
public class MessageController {
	
	@Autowired private MessageService messageService;
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	//메시지 리스트 불러오기
	@ResponseBody
	@RequestMapping(value = "/message/list", method = RequestMethod.POST)
	public Map<String, Object> findMessageList(Message message, Model model) {
		
		message.setDivision(1);
		message.setReadYn(0);
		messageService.updateRead(message);
		
		List<Message> msg_result = messageService.findList(message.getReceiverName());
		Map<String, Object> result = new HashMap<>();
		result.put("result", msg_result);
		
		logger.info("message : {}", message);
		logger.info("msg_result : {}", msg_result);
		
		model.addAttribute("message", message);
		
		return result;
	}
	
	//메시지 보내기
	@Transactional
	@ResponseBody
	@RequestMapping(value = "/message/proc")
	public int addMessageSend(Message message, HttpSession session) {
//		switch(flag) {
//		case "insert" : 

		int result = 0;

//		System.out.println("하하하");

		message.setMemberNo((Integer) session.getAttribute("memberNo"));

		System.out.println(message);

		if (messageService.insertMessage(message) > 0) {

			result = 1;
		}
		return result;
//			break;
//		}
	}
	
	//유저리스트
	@ResponseBody
	@RequestMapping(value = "/layout/header", method = RequestMethod.GET)
	public List<Member> searchMember() {
		
		List<Member> userList = messageService.searchMember();
		
		return userList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/layout/header2", method = RequestMethod.GET)
	public List<Member> searchMember2(Model model) {
		List<Member> userList = messageService.searchMember();

		return userList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/message/delete", method = RequestMethod.POST)
	public int deleteMessage(Message message) {

		int result = 0;

		if (messageService.deleteMessage(message) > 0) {

			result = 1;
		}
		return result;

	}
}
