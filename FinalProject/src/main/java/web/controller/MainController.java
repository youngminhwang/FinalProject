package web.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.PlantInfo;
import web.dto.WeatherInfo;
import web.service.face.MainService;

//ss
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	MainService mainService;
	
	@RequestMapping(value="/")
	public String welcome() {
		return "redirect:/main";
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void main(Model model) {
		model.addAttribute("dailyPlant", mainService.getDailyPlnat());
	}
	
	//날씨 정보 가져오기
	@RequestMapping(value="/main/weather", method=RequestMethod.GET)
	public @ResponseBody WeatherInfo weather(double latitude, double longitude) {

		//접속한 위도, 경도를 이용해 날씨 정보 가져오기 (openweathermap API)
		return mainService.getWeather(latitude, longitude);
		
	}
	
	//지역 검색을 통해 날씨 정보 가져오기
	@RequestMapping(value="/main/address", method=RequestMethod.GET)
	public @ResponseBody WeatherInfo searchAddress(String address) {
		
		//검색한 지역을 이용하여 위도, 경도 알아오기 (네이버지도 API)
		HashMap<String, Object> map =  mainService.getAddress(address);
		
		//알아온 위도, 경도를 이용해 날씨 정보 가져오기 (openweathermap API)
		return mainService.getWeather(Double.parseDouble(map.get("y").toString()), Double.parseDouble(map.get("x").toString()));
	}
	
	@RequestMapping(value="/main/naverSearch", method=RequestMethod.GET)
	public @ResponseBody List<HashMap<String, Object>> naverSearch(String searchTxt) {
		
		logger.info("param : {}", searchTxt);
		
		List<HashMap<String, Object>> list = mainService.getNaverInfo(searchTxt);
		
		return list;
	}
	
	@RequestMapping(value="/main/searchPlant", method=RequestMethod.GET)
	public @ResponseBody PlantInfo searchPlant(String searchTxt) {
		
		PlantInfo plantInfo = mainService.getPlantInfo(searchTxt);
		logger.info("info : {}", plantInfo);
		return plantInfo;
	}
	
//	@GetMapping(value="/main/myPlant")
//	public String getMyPlant() {
//		
//		return null;
//	}
}