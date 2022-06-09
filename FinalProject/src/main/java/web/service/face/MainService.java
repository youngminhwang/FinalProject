package web.service.face;

import java.util.HashMap;
import java.util.List;

import web.dto.DailyPlant;
import web.dto.PlantInfo;
import web.dto.WeatherInfo;


public interface MainService {
	
	/**
	 * openweathermap API를 사용하여 날씨 정보 가져오기
	 * @param latitude - 현재 접속 위도
	 * @param longitude - 현재 접속 경도
	 * @return - 현재 위치 날씨 정보 데이터
	 */
	public WeatherInfo getWeather(Double latitude, Double longitude);
	
	/**
	 * openweathermap API의 날씨상태 코드를 한국어로 매칭
	 * @param condition - 날씨상태 코드
	 * @return - 코드에 매칭된 한국어
	 */
	public String matching(int condition);
	
	/**
	 * 네이버 지도 API를 이용하여 위도, 경도 가져오기
	 * @param address - 검색한 지역
	 * @return - 위도, 경도
	 */
	public HashMap<String, Object> getAddress(String address);
	
	/**
	 * 네이버 검색 API를 이용하여 백과검색 결과 가져오기
	 * @param searchTxt - 검색어
	 * @return - 검색결과
	 */
	public List<HashMap<String, Object>> getNaverInfo(String searchTxt);
	
	/**
	 * 농사로 API를 이용하여 식물 검색 결과 가져오기
	 * @param searchTxt - 검색어
	 * @return - 검색한 식물 정보
	 */
	public PlantInfo getPlantInfo(String searchTxt);
	
	/**
	 * 농사로 API에 쿼리스트링으로 전달할 검색어의 초성 추출
	 * @param text - 검색어
	 * @return - 초성
	 */
	public String getInitialSound(String text);
	
	/**
	 * 농사로 API 검색한 식물에 컨텐츠 번호알아내기
	 * @param searchTxt - 검색어
	 * @return - 검색한 식물의 컨텐츠 번호
	 */
	public String getCntntsNo(String searchTxt);
	
	/**
	 * 추천 식물의 정보 가져오기
	 * @return 추천 식물의 정보
	 */
	public DailyPlant getDailyPlnat();
}