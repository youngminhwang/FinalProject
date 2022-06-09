package web.dto;

public class DailyPlant {
	private int plantNo;
	private String name;
	private String water;
	private String sun;
	private String humidity;
	
	private String ImgOriginName; //이미지 원본이름
	private String ImgStoredName; //이미지 저장이름	
	@Override
	public String toString() {
		return "DailyPlant [plantNo=" + plantNo + ", name=" + name + ", water=" + water + ", sun=" + sun + ", humidity="
				+ humidity + ", ImgOriginName=" + ImgOriginName + ", ImgStoredName=" + ImgStoredName + "]";
	}
	public int getPlantNo() {
		return plantNo;
	}
	public void setPlantNo(int plantNo) {
		this.plantNo = plantNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWater() {
		return water;
	}
	public void setWater(String water) {
		this.water = water;
	}
	public String getSun() {
		return sun;
	}
	public void setSun(String sun) {
		this.sun = sun;
	}
	public String getHumidity() {
		return humidity;
	}
	public void setHumidity(String humidity) {
		this.humidity = humidity;
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
	
	
	
}
