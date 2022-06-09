package web.dto;


public class ReserveInfo {
	private int reserveNo;
	private int gardenNo;
	private String gardenName;
	private int memberNo;
	private String visitDate;
	private String visitTime;
	private int adultMem;
	private int childMem;
	private int disabMem;
	private double totalPrice;
	private String qrCode;
	
	
	public int getReserveNo() {
		return reserveNo;
	}


	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
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


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getVisitDate() {
		return visitDate;
	}


	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}


	public String getVisitTime() {
		return visitTime;
	}


	public void setVisitTime(String visitTime) {
		this.visitTime = visitTime;
	}


	public int getAdultMem() {
		return adultMem;
	}


	public void setAdultMem(int adultMem) {
		this.adultMem = adultMem;
	}


	public int getChildMem() {
		return childMem;
	}


	public void setChildMem(int childMem) {
		this.childMem = childMem;
	}


	public int getDisabMem() {
		return disabMem;
	}


	public void setDisabMem(int disabMem) {
		this.disabMem = disabMem;
	}


	public double getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}


	public String getQrCode() {
		return qrCode;
	}


	public void setQrCode(String qrNo) {
		this.qrCode = qrNo;
	}


	@Override
	public String toString() {
		return "ReserveInfo [reserveNo=" + reserveNo + ", gardenNo=" + gardenNo + ", gardenName=" + gardenName
				+ ", memberNo=" + memberNo + ", visitDate=" + visitDate + ", visitTime=" + visitTime + ", adultMem="
				+ adultMem + ", childMem=" + childMem + ", disabMem=" + disabMem + ", totalPrice=" + totalPrice
				+ ", qrCode=" + qrCode + "]";
	}
	
	
	
}