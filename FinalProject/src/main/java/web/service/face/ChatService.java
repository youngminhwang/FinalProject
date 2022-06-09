package web.service.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import web.dto.ChatDto;
import web.dto.ChatRoomDto;
import web.dto.Member;

public interface ChatService {

	/**
	 * 채팅 내역 저장하기
	 * @param 채팅 내역 DTO
	 * */
	public void saveMsg(ChatDto chatDto);
	
	
	/**
	 * 채팅 로그를 txt 파일로 만들어서 불러온다. 
	 * @param 유저 아이디
	 * @return 생성된 파일의 전체 경로 
	 * */
	String getLog(ChatDto chatDto);
	
	
	/**
	 * 채팅방을 만든다. 
	 * @param 채팅방 이름
	 * @return 채팅방 DTO
	 * */
	public ChatRoomDto createRoom(String name);

	
	/**
	 * 채팅방 목록 표시
	 * @return 채팅방 목록
	 * */
	public List<ChatRoomDto> findAllRooms();

	
	/**
	 * 채팅방 정보 불러오기
	 * @param 채팅방 PK ID
	 * @return ID값에 해당하는 채팅방 정보 DTO
	 * */
	public ChatRoomDto findRoomById(String roomId);

	/**
	 * 채팅방 참여자의 세션을 추가 
	 * @param userid , 채팅방 DTO
	 * */
	public void addSession(ChatRoomDto room, String userid);

	/**
	 * 채팅방 탈퇴자의 세션 제거  
	 * @param session , 채팅방 DTO
	 * */
	public void deleteSession(ChatRoomDto room, String userid);

	/**
	 * 채팅방 삭제   
	 * @param session , 채팅방 DTO
	 * */
	public void deleteRoom(ChatRoomDto room);


	/**일대일 채팅방 리스트를 불러온다. 
	 * 관리자가 답장하지 않은 순서대로 보여준다. 
	 * */
	public List<ChatDto> get11chatList();

	/**지난 채팅 내역을 불러온다. 
	 * @param 채팅방 번호 (1:1이므로 개인 아이디)
	 * @return 채팅 내역 DTO 리스트*/
	public List<ChatDto> getPastChat(String roomId);


	

	
}
