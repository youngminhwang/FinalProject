package web.dto;

public class MyPlant {
	
	private int myPlantNo;
	private int memberNo;
	private String cnum;
	private String bname;
	private String nick;
	private String birth;
	private String water;
	private String origin;
	private String stored;
	
	@Override
	public String toString() {
		return "MyPlant [myPlantNo=" + myPlantNo + ", memberNo=" + memberNo + ", cnum=" + cnum + ", bname=" + bname
				+ ", nick=" + nick + ", birth=" + birth + ", water=" + water + ", origin=" + origin + ", stored="
				+ stored + "]";
	}

	public int getMyPlantNo() {
		return myPlantNo;
	}

	public void setMyPlantNo(int myPlantNo) {
		this.myPlantNo = myPlantNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getCnum() {
		return cnum;
	}

	public void setCnum(String cnum) {
		this.cnum = cnum;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getWater() {
		return water;
	}

	public void setWater(String water) {
		this.water = water;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getStored() {
		return stored;
	}

	public void setStored(String stored) {
		this.stored = stored;
	}
	
}
