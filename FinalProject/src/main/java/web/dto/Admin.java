package web.dto;

public class Admin {
	private int adminNo;
	private String adminId;
	private String adminPw;
	
	//toString
	@Override
	public String toString() {
		return "Admin [adminNo=" + adminNo + ", adminId=" + adminId + ", adminPw=" + adminPw + "]";
	}
	
	//getter, setter
	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPw() {
		return adminPw;
	}

	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	
	
}
