package web.dto;

public class ChatDto {

	private String roomId;
	private int isStart;
	private int isEnd;
	private String userID;
	private String chatLog;
	private String chatDate;
	
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public int getIsStart() {
		return isStart;
	}
	public void setIsStart(int isStart) {
		this.isStart = isStart;
	}
	public int getIsEnd() {
		return isEnd;
	}
	public void setIsEnd(int isEnd) {
		this.isEnd = isEnd;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getChatLog() {
		return chatLog;
	}
	public void setChatLog(String chatLog) {
		this.chatLog = chatLog;
	}
	public String getChatDate() {
		return chatDate;
	}
	public void setChatDate(String chatDate) {
		this.chatDate = chatDate;
	}
	@Override
	public String toString() {
		return "ChatDto [roomId=" + roomId + ", isStart=" + isStart + ", isEnd=" + isEnd + ", userID=" + userID
				+ ", chatLog=" + chatLog + ", chatDate=" + chatDate + "]";
	}

}
