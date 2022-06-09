package web.dto;

import java.util.Date;

public class GardenPriceDto {

	private int gardenNo;
	private String gardenName;
	private int adult;
	private int children;
	private int rest;
	
	public int getGardenNo() {
		return gardenNo;
	}
	public void setGardenNo(int gardenNo) {
		this.gardenNo = gardenNo;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getchildren() {
		return children;
	}
	public void setchildren(int children) {
		this.children = children;
	}
	public int getRest() {
		return rest;
	}
	public void setRest(int rest) {
		this.rest = rest;
	}
	
	public String getGardenName() {
		return gardenName;
	}
	public void setGardenName(String gardenName) {
		this.gardenName = gardenName;
	}
	@Override
	public String toString() {
		return "GardenPriceDto [gardenNo=" + gardenNo + ", gardenName=" + gardenName + ", adult=" + adult + ", children="
				+ children + ", rest=" + rest + "]";
	}
	
	
}
