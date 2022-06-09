package web.dto;

import java.util.Date;

public class Garden {
	private int gardenNo; //수목원 정보
	private String gardenName;
	private int grNo; //리뷰 정보
	private String grContent;
	private Date grDate;
	private int memberNo;//회원정보
//	private String id;
	
	@Override
	public String toString() {
		return "Garden [gardenNo=" + gardenNo + ", gardenName=" + gardenName + ", grNo=" + grNo + ", grContent="
				+ grContent + ", grDate=" + grDate + ", memberNo=" + memberNo + "]";
	}

	public int getGardenNo() {
		return gardenNo;
	}

	public void setGardenNo(int gardenNo) {
		this.gardenNo = gardenNo;
	}

	public String getGardenName() {
		return gardenName;
	}

	public void setGardenName(String gardenName) {
		this.gardenName = gardenName;
	}

	public int getGrNo() {
		return grNo;
	}

	public void setGrNo(int grNo) {
		this.grNo = grNo;
	}

	public String getGrContent() {
		return grContent;
	}

	public void setGrContent(String grContent) {
		this.grContent = grContent;
	}

	public Date getGrDate() {
		return grDate;
	}

	public void setGrDate(Date grDate) {
		this.grDate = grDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	
	
}
