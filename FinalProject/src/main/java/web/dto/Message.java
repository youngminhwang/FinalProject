package web.dto;

import java.util.Date;

public class Message {
//	MS_TITLE	VARCHAR2(200 BYTE)
//	RECEIVER_NAME	VARCHAR2(200 BYTE)
//	DIVISION	NUMBER
//	MS_DATE	DATE
//	MS_CONTENT	VARCHAR2(2000 BYTE)
//	SENDER_NAME	VARCHAR2(200 BYTE)
//	MEMBER_NO	NUMBER
//	READ_YN	NUMBER
	
	private int messageNo;
	private String msTitle;
	private String receiverName;
	private int division;
	private Date msDate;
	private String msContent;
	private String senderName;
	private int memberNo;
	private int readYn;
	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", msTitle=" + msTitle + ", receiverName=" + receiverName
				+ ", division=" + division + ", msDate=" + msDate + ", msContent=" + msContent + ", senderName="
				+ senderName + ", memberNo=" + memberNo + ", readYn=" + readYn + "]";
	}
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public String getMsTitle() {
		return msTitle;
	}
	public void setMsTitle(String msTitle) {
		this.msTitle = msTitle;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public int getDivision() {
		return division;
	}
	public void setDivision(int division) {
		this.division = division;
	}
	public Date getMsDate() {
		return msDate;
	}
	public void setMsDate(Date msDate) {
		this.msDate = msDate;
	}
	public String getMsContent() {
		return msContent;
	}
	public void setMsContent(String msContent) {
		this.msContent = msContent;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getReadYn() {
		return readYn;
	}
	public void setReadYn(int readYn) {
		this.readYn = readYn;
	}
	
	
	
	
	
	
	
	
	
}
