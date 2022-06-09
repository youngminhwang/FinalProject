package web.dto;

public class OrderDetail {

	private int orderDetailNum;
	private String orderId;
	private int gdsNum;
	private int cartStock;
	private int memberNo;

	// 결제 정보
	private String impUid;
	private String merchantUid;
	private String paidAmount;
	private String applyNum;
	
	@Override
	public String toString() {
		return "OrderDetail [orderDetailNum=" + orderDetailNum + ", orderId=" + orderId + ", gdsNum=" + gdsNum
				+ ", cartStock=" + cartStock + ", memberNo=" + memberNo + ", impUid=" + impUid + ", merchantUid="
				+ merchantUid + ", paidAmount=" + paidAmount + ", applyNum=" + applyNum + "]";
	}
	public int getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(int orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
