package web.dto;

import java.util.Date;

public class Cart {

	private int cartNum;
	private int memberNo;
	private int gdsNum;
	private int cartStock;
	private Date addDate;
	@Override
	public String toString() {
		return "Cart [cartNum=" + cartNum + ", memberNo=" + memberNo + ", gdsNum=" + gdsNum + ", cartStock=" + cartStock
				+ ", addDate=" + addDate + "]";
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	
	
	


	
	
	
	
	
	
}
