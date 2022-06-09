package web.dto;

public class Diary {
	
	private int diaryNo;
	private int myPlantNo;
	private String temp;
	private String humid;
	private String dirt;
	private String water;
	private String repot;
	private String cmt;
	private String ddate;
	private String origin;
	private String stored;
	
	@Override
	public String toString() {
		return "Diary [diaryNo=" + diaryNo + ", myPlantNo=" + myPlantNo + ", temp=" + temp + ", humid=" + humid
				+ ", dirt=" + dirt + ", water=" + water + ", repot=" + repot + ", cmt=" + cmt + ", ddate=" + ddate
				+ ", origin=" + origin + ", stored=" + stored + "]";
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public int getMyPlantNo() {
		return myPlantNo;
	}

	public void setMyPlantNo(int myPlantNo) {
		this.myPlantNo = myPlantNo;
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	public String getHumid() {
		return humid;
	}

	public void setHumid(String humid) {
		this.humid = humid;
	}

	public String getDirt() {
		return dirt;
	}

	public void setDirt(String dirt) {
		this.dirt = dirt;
	}

	public String getWater() {
		return water;
	}

	public void setWater(String water) {
		this.water = water;
	}

	public String getRepot() {
		return repot;
	}

	public void setRepot(String repot) {
		this.repot = repot;
	}

	public String getCmt() {
		return cmt;
	}

	public void setCmt(String cmt) {
		this.cmt = cmt;
	}

	public String getDdate() {
		return ddate;
	}

	public void setDdate(String ddate) {
		this.ddate = ddate;
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
