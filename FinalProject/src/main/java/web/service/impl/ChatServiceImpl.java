package web.service.impl;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.ChatDao;
import web.dto.ChatDto;
import web.dto.ChatRoomDto;
import web.service.face.ChatService;

@Service
public class ChatServiceImpl implements ChatService{

	private static final Logger logger = LoggerFactory.getLogger(ChatServiceImpl.class);	
	
	@Autowired private ChatDao chatDao;
	private ChatDto chatDto = new ChatDto();
	
	@Autowired ServletContext context; // 파일저장용
	
	//채팅방 생성
	public ChatRoomDto createRoom(String roomName) {
		ChatRoomDto chatRoom = new ChatRoomDto(roomName);
		logger.info("chatRoom {}",chatRoom.toString());
		chatDao.setChatRoom(chatRoom);
		
		return chatRoom;
	}
	
	//메시지 DB에 저장하는 메서드
	@Override
	public void saveMsg(ChatDto chatDto) {
		chatDao.saveMsg(chatDto);
	}

	//저장된 메시지 클라이언트 쪽에서 다운로드하는 메서드
	@Override
	public String getLog(ChatDto chatDto) {
		//서버내 저장경로설정 
		String storedPath = context.getRealPath("chatlog"); // 서블릿컨텍스트의 실제경로
		File storedFolder = new File(storedPath); 
		if(!storedFolder.exists()) storedFolder.mkdir();
		
		//파일생성 준비
		String userid = chatDto.getUserID();
		String today = new SimpleDateFormat("yyyyMMdd_mmss").format(new Date());
		String fileName = userid + "_CHATLOG_"+ today + ".txt";
		
		String filepath = storedPath+ File.separator+fileName;
		
		//파일 생성 (txt 확장자를 위에서 부여했으므로 텍스트 파일 생성)
		File log = new File(filepath); 
		logger.info("will stored at {}",storedPath+ File.separator+fileName);
		try {
			log.createNewFile();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		//파일 내용 쓰기
		FileWriter filewriter = null;
		try {
			filewriter = new FileWriter(log, true); // 로그 txt 파일에 filewriter 얹음
			
			//DB조회
			List<ChatDto> chatLog = chatDao.getChatLog(chatDto); 
			logger.info("chatLog isEmpty ? {}",chatLog.isEmpty());
			logger.info("chatLog size ? {}",chatLog.size());
			
			//DB 조회내용 텍스트파일에 쓰기
			Iterator<ChatDto> iter = chatLog.iterator();
			
			while(iter.hasNext()) {
				
				ChatDto chatDtoLog = iter.next();
				logger.info("chatDtoLog ? {}",chatDtoLog.toString());
				int target2 = chatDtoLog.getChatDate().indexOf(".");
				String date = chatDtoLog.getChatDate().substring(5, target2);
				System.out.println(date);
				
				String str = "["+date+"] "+
						chatDtoLog.getUserID()+" : "+
						chatDtoLog.getChatLog() + "\n" ;	
				logger.info("chatlog {}" , str);
				
				filewriter.write(str);
			}
			
			//filewriter.flush();
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				filewriter.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// 컨텍스트 패스 내 chatlog 폴더에 채팅 대화내용이 저장됨.
		
//	다운로드는 chat.jsp 내에서 비동기적으로 처리되므로 별도의 뷰로 처리.
		
		return fileName; 
	}

	//채팅방 목록 
	List<ChatRoomDto> list = new ArrayList<ChatRoomDto>();

	@Override
	public List<ChatRoomDto> findAllRooms() {
		logger.info("findAllRooms() ");
		list = chatDao.getChatRooms();
		return list;
	}

	@Override
	public ChatRoomDto findRoomById(String roomId) {
		ChatRoomDto room = chatDao.getRoomToGo(roomId);
		logger.info("findRoomById() {}", room.nameList.toString());
		return room;
	}

	@Override
	public void addSession(ChatRoomDto room, String userid) {
		logger.info("addSession() {}", userid);
		room.nameList.add(userid);
	}

	@Override
	public void deleteSession(ChatRoomDto room, String userid) {
		logger.info("deleteSession() {}", userid);
		room.nameList.remove(userid);
	}

	@Override
	public void deleteRoom(ChatRoomDto room) {
		logger.info("deleteRoom() {}" , room.getRoomId());
		chatDao.deleteRoom(room);
	}


	@Override
	public List<ChatDto> get11chatList() {
		List<ChatDto> list = chatDao.get11chatList();
		return list;
	}

	@Override
	public List<ChatDto> getPastChat(String roomId) {
		
		
		ChatDto chatDto = new ChatDto();
		chatDto.setRoomId(roomId);
		chatDto.setUserID(roomId);
		
		List<ChatDto> list = chatDao.getPastChatLog(chatDto);
		return list;
	}
	






}
