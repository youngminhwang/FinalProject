package web.dto;

public class PlantCode {
	
	private String temp;
	private String tempW;
	private String humid;
	private String dirt;
	private String dirtW;
	
	@Override
	public String toString() {
		return "PlantTip [temp=" + temp + ", tempW=" + tempW + ", humid=" + humid + ", dirt=" + dirt + ", dirtW="
				+ dirtW + "]";
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	public String getTempW() {
		return tempW;
	}

	public void setTempW(String tempW) {
		this.tempW = tempW;
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

	public String getDirtW() {
		return dirtW;
	}

	public void setDirtW(String dirtW) {
		this.dirtW = dirtW;
	}
	
}
