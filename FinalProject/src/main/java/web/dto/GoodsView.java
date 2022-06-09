package web.dto;

import java.util.Date;

public class GoodsView {

	//상품 + 카테고리 조인 DTO
	
	private int gdsNum;
	private String gdsName;
	private String cateCode;
	private int gdsPrice;
	private int gdsStock; //상품 수량
	private String gdsDes; //설명
	private Date gdsDate; //등록날짜
	
	private String cateCodeRef;
	private String cateName;
	
	private String ImgOriginName; //썸네일 이미지 원본이름
	private String ImgStoredName; //썸네일 이미지 저장이름
	private String ImgOriginName2; //설명 이미지 원본이름
	private String ImgStoredName2; //설명 이미지 저장이름
	@Override
	public String toString() {
		return "GoodsView [gdsNum=" + gdsNum + ", gdsName=" + gdsName + ", cateCode=" + cateCode + ", gdsPrice="
				+ gdsPrice + ", gdsStock=" + gdsStock + ", gdsDes=" + gdsDes + ", gdsDate=" + gdsDate + ", cateCodeRef="
				+ cateCodeRef + ", cateName=" + cateName + ", ImgOriginName=" + ImgOriginName + ", ImgStoredName="
				+ ImgStoredName + ", ImgOriginName2=" + ImgOriginName2 + ", ImgStoredName2=" + ImgStoredName2 + "]";
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public String getGdsName() {
		return gdsName;
	}
	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public int getGdsPrice() {
		return gdsPrice;
	}
	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}
	public int getGdsStock() {
		return gdsStock;
	}
	public void setGdsStock(int gdsStock) {
		this.gdsStock = gdsStock;
	}
	public String getGdsDes() {
		return gdsDes;
	}
	public void setGdsDes(String gdsDes) {
		this.gdsDes = gdsDes;
	}
	public Date getGdsDate() {
		return gdsDate;
	}
	public void setGdsDate(Date gdsDate) {
		this.gdsDate = gdsDate;
	}
	public String getCateCodeRef() {
		return cateCodeRef;
	}
	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
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
	public String getImgOriginName2() {
		return ImgOriginName2;
	}
	public void setImgOriginName2(String imgOriginName2) {
		ImgOriginName2 = imgOriginName2;
	}
	public String getImgStoredName2() {
		return ImgStoredName2;
	}
	public void setImgStoredName2(String imgStoredName2) {
		ImgStoredName2 = imgStoredName2;
	}
	
	
	
	

	
	
	
	
	
	
	
}
