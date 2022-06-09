package web.dto;

import java.util.Date;

public class OrderList {
	
	//주문 테이블, 주문 상세 테이블, 상품 테이블 3개의 테이블을 조인
	
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
	
	private int orderDetailsNum;
	private int gdsNum;
	private int cartStock;
	
	private String gdsName;
	private String ImgOriginName;
	private String ImgStoredName;
	private int gdsPrice;
	
	// 결제 정보
	private String impUid;
	private String merchantUid;
	private String paidAmount;
	private String applyNum;

	@Override
	public String toString() {
		return "OrderList [orderId=" + orderId + ", memberNo=" + memberNo + ", orderRec=" + orderRec + ", addr1="
				+ addr1 + ", addr2=" + addr2 + ", addr3=" + addr3 + ", phone=" + phone + ", amount=" + amount
				+ ", orderDate=" + orderDate + ", delivery=" + delivery + ", orderDetailsNum=" + orderDetailsNum
				+ ", gdsNum=" + gdsNum + ", cartStock=" + cartStock + ", gdsName=" + gdsName + ", ImgOriginName="
				+ ImgOriginName + ", ImgStoredName=" + ImgStoredName + ", gdsPrice=" + gdsPrice + ", impUid=" + impUid
				+ ", merchantUid=" + merchantUid + ", paidAmount=" + paidAmount + ", applyNum=" + applyNum + "]";
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

	public int getOrderDetailsNum() {
		return orderDetailsNum;
	}

	public void setOrderDetailsNum(int orderDetailsNum) {
		this.orderDetailsNum = orderDetailsNum;
	}

	public int getGdsNum() {
		return gdsNum;
	}

	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}

	public int getCartStock() {
		return cartStock;
	}

	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}

	public String getGdsName() {
		return gdsName;
	}

	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}

	public String getImgOriginName() {
		return ImgOriginName;
	}

	public void setImgOriginName(String imgOriginName) {
		ImgOriginName = imgOriginName;
	}

	public String getImgStoredName() {
		return ImgStoredName;
	}

	public void setImgStoredName(String imgStoredName) {
		ImgStoredName = imgStoredName;
	}

	public int getGdsPrice() {
		return gdsPrice;
	}

	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
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
