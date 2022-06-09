package web.dto;

public class WeatherInfo {
	private String city;
	private String icon;
	private String condition;
	private int temp;
	private int humidity;
	private int windSpeed;
	
	@Override
	public String toString() {
		return "WeatherInfo [city=" + city + ", icon=" + icon + ", condition=" + condition + ", temp=" + temp
				+ ", humidity=" + humidity + ", windSpeed=" + windSpeed + "]";
	}
	
	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getcity() {
		return city;
	}
	public void setcity(String city) {
		this.city = city;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public double getTemp() {
		return temp;
	}
	public void setTemp(int temp) {
		this.temp = temp;
	}
	public double getHumidity() {
		return humidity;
	}
	public void setHumidity(int humidity) {
		this.humidity = humidity;
	}
	public double getWindSpeed() {
		return windSpeed;
	}
	public void setWindSpeed(int windSpeed) {
		this.windSpeed = windSpeed;
	}
	
	
}