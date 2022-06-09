package web.dto;

import java.util.Date;

public class Order {

	private String orderId;
	private int memberNo;
	private String orderRec;
	private String addr1;
	private String addr2;
	private String addr3;
	private String phone;
	private int amount;
	private Date orderDate;
	private String delivery;
	
	// 결제 정보
	private String impUid;
	private String merchantUid;
	private String paidAmount;
	private String applyNum;
	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", memberNo=" + memberNo + ", orderRec=" + orderRec + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", addr3=" + addr3 + ", phone=" + phone + ", amount=" + amount + ", orderDate="
				+ orderDate + ", delivery=" + delivery + ", impUid=" + impUid + ", merchantUid=" + merchantUid
				+ ", paidAmount=" + paidAmount + ", applyNum=" + applyNum + "]";
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getOrderRec() {
		return orderRec;
	}
	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getImpUid() {
		return impUid;
	}
	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}
	public String getMerchantUid() {
		return merchantUid;
	}
	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}
	public String getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(String paidAmount) {
		this.paidAmount = paidAmount;
	}
	public String getApplyNum() {
		return applyNum;
	}
	public void setApplyNum(String applyNum) {
		this.applyNum = applyNum;
	}

	
	
	
	
	
	
}
