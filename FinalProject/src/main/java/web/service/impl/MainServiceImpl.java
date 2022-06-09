package web.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;

import web.dao.face.MainDao;
import web.dto.DailyPlant;
import web.dto.PlantInfo;
import web.dto.WeatherInfo;
import web.service.face.MainService;


@Service
public class MainServiceImpl implements MainService{
	
	private static final Logger logger = LoggerFactory.getLogger(MainService.class);
	
	@Autowired
	MainDao mainDao;
	
	@Override
	public WeatherInfo getWeather(Double latitude, Double longitude) {
		
		//날씨 DTO
		WeatherInfo weatherInfo = new WeatherInfo();
		
		//openweathermap API의 key값
		String key = "bf7fe27e6ebec6e3f196b29df3e68178";
		
		 try{

	            //OpenAPI call하는 URL
	            String urlstr = "http://api.openweathermap.org/data/2.5/weather?"
	                        + "lat=" + latitude + "&lon=" + longitude
	                        + "&appid=" + key;
	            URL url = new URL(urlstr);
	            BufferedReader bf;
	            String line;
	            String result="";

	            //날씨 정보를 받아온다
	            bf = new BufferedReader(new InputStreamReader(url.openStream()));

	            //버퍼에 있는 정보를 문자열로 변환
	            while((line=bf.readLine())!=null){
	                result=result.concat(line);
	            }

	            //문자열을 JSON으로 파싱
	            JSONParser jsonParser = new JSONParser();
	            JSONObject jsonObj = (JSONObject) jsonParser.parse(result);

	            //지역 가져오기
	            weatherInfo.setcity(String.valueOf(jsonObj.get("name")));

	            //날씨 가져오기
	            JSONArray weatherArray = (JSONArray) jsonObj.get("weather");
	            JSONObject obj = (JSONObject) weatherArray.get(0);
	            weatherInfo.setIcon(String.valueOf(obj.get("icon")));
	            int condition = (Integer.parseInt(String.valueOf(obj.get("id"))));
	            weatherInfo.setCondition(matching(condition));
	            
	            //온도 출력(절대온도라서 변환 필요)
	            JSONObject mainArray = (JSONObject) jsonObj.get("main");
	            int ktemp = (int)(Double.parseDouble(mainArray.get("temp").toString()));
	            weatherInfo.setTemp(ktemp-273);
	            weatherInfo.setHumidity(Integer.parseInt(mainArray.get("humidity").toString()));
	            
	            //풍속 가져오기
	            JSONObject windArray = (JSONObject) jsonObj.get("wind");
	            weatherInfo.setWindSpeed((int)(Double.parseDouble(windArray.get("speed").toString())));
	            
	            bf.close();
	            
	        }catch(Exception e){
	            e.printStackTrace();
	        }
		 
		 logger.info("날씨 정보 : {}", weatherInfo);
		 return weatherInfo;
		 
	} //end getWeather()
	
	public String matching(int condition) {
		
		//openweathermap API의 날씨 상태 코드
		int[] idArr = {201,200,202,210,211,212,221,230,231,232,
		                300,301,302,310,311,312,313,314,321,500,
		                501,502,503,504,511,520,521,522,531,600,
		                601,602,611,612,615,616,620,621,622,701,
		                711,721,731,741,751,761,762,771,781,800,
		                801,802,803,804,900,901,902,903,904,905,
		                906,951,952,953,954,955,956,957,958,959,
		                960,961,962};
		
		String[] korArr = {"가벼운 비를 동반한 천둥구름","비를 동반한 천둥구름","폭우를 동반한 천둥구름","약한 천둥구름",
		                 "천둥구름","강한 천둥구름","불규칙적 천둥구름","약한 연무를 동반한 천둥구름","연무를 동반한 천둥구름",
		                 "강한 안개비를 동반한 천둥구름","가벼운 안개비","안개비","강한 안개비","가벼운 적은비","적은비",
		                 "강한 적은비","소나기와 안개비","강한 소나기와 안개비","소나기","악한 비","중간 비","강한 비",
		                 "매우 강한 비","극심한 비","우박","약한 소나기 비","소나기 비","강한 소나기 비","불규칙적 소나기 비",
		                 "가벼운 눈","눈","강한 눈","진눈깨비","소나기 진눈깨비","약한 비와 눈","비와 눈","약한 소나기 눈",
		                 "소나기 눈","강한 소나기 눈","박무","연기","연무","모래 먼지","안개","모래","먼지","화산재","돌풍",
		                 "토네이도","구름 한 점 없는 맑은 하늘","약간의 구름이 낀 하늘","드문드문 구름이 낀 하늘","구름이 거의 없는 하늘",
		                 "구름으로 뒤덮인 흐린 하늘","토네이도","태풍","허리케인","한랭","고온","바람부는","우박","바람이 거의 없는",
		                 "약한 바람","부드러운 바람","중간 세기 바람","신선한 바람","센 바람","돌풍에 가까운 센 바람","돌풍",
		                 "심각한 돌풍","폭풍","강한 폭풍","허리케인"};
		
		String korCondition = "";
		
	    for(int i=0; i<idArr.length; i++) {
	    	
	    		if(idArr[i]==condition) {
	    			korCondition =  korArr[i];
	    		}
	    }
	    
	    return korCondition;
	} //end matching()
	
	@Override
	public HashMap<String, Object> getAddress(String address) {

		String addr = "";
		String x = "";
		String y = "";
		
		try {
			addr = URLEncoder.encode(address, "utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		String api = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="+addr;
		StringBuffer sb = new StringBuffer();
		
		try {
			URL url = new URL(api);
			HttpsURLConnection http = (HttpsURLConnection)url.openConnection();
			http.setRequestProperty("Content-Type", "application/json");
			http.setRequestProperty("X-NCP-APIGW-API-KEY-ID", "08s0co3rzw");
			http.setRequestProperty("X-NCP-APIGW-API-KEY", "9Wt0GvHIcXhJDk5op2K9vW48COUTzDLsnq2mDJFn");
			http.setRequestMethod("GET");
			http.connect();
			
			InputStreamReader in = new InputStreamReader(http.getInputStream(), "utf-8");
			BufferedReader br = new BufferedReader(in);
			String line;
			while( (line = br.readLine()) != null) {
				sb.append(line).append("\n");
			}
			
			JSONParser parser = new JSONParser();
			JSONObject jsonObject;
			JSONObject jsonObject2;
			JSONArray jsonArray;
			
			jsonObject = (JSONObject)parser.parse(sb.toString());
			jsonArray = (JSONArray)jsonObject.get("addresses");
			for(int i=0; i<jsonArray.size(); i++) {
				jsonObject2 = (JSONObject)jsonArray.get(i);
				if(null != jsonObject2.get("x")) {
					x = (String)jsonObject2.get("x").toString();
				}
				if(null != jsonObject2.get("y")) {
					y = (String)jsonObject2.get("y").toString();
				}
				
			}
			
			br.close();
			in.close();
			http.disconnect();
			
			logger.info("x : {}, y : {}", x, y);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("x", x);
		map.put("y", y);
		
		return map;
		
	}
	
	@Override
	public List<HashMap<String, Object>> getNaverInfo(String searchTxt) {
		
		String addr = "";
		List<HashMap<String, Object>> list = new ArrayList<>();
		
		try {
			addr = URLEncoder.encode(searchTxt, "utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		String api = "https://openapi.naver.com/v1/search/encyc.json?query="+addr;
		StringBuffer sb = new StringBuffer();
		
		try {
			URL url = new URL(api);
			HttpsURLConnection http = (HttpsURLConnection)url.openConnection();
			http.setRequestProperty("Content-Type", "application/json");
			http.setRequestProperty("X-Naver-Client-Id", "Bg9AFYUskueEXBaYhHjX");
			http.setRequestProperty("X-Naver-Client-Secret", "IuaoLe6Qxh");
			http.setRequestMethod("GET");
			http.connect();
			
			InputStreamReader in = new InputStreamReader(http.getInputStream(), "utf-8");
			BufferedReader br = new BufferedReader(in);
			String line;
			while( (line = br.readLine()) != null) {
				sb.append(line).append("\n");
			}
			
			JSONParser parser = new JSONParser();
			JSONObject jsonObject;
			JSONObject jsonObject2;
			JSONArray jsonArray;
			
			jsonObject = (JSONObject)parser.parse(sb.toString());
			jsonArray = (JSONArray)jsonObject.get("items");
			for(int i=0; i<jsonArray.size(); i++) {
				HashMap<String, Object> map = new HashMap<>();
				
				jsonObject2 = (JSONObject)jsonArray.get(i);
				
				map.put("title", (String)jsonObject2.get("title").toString());
				map.put("description", (String)jsonObject2.get("description").toString());
				map.put("link", (String)jsonObject2.get("link").toString());
				map.put("thumbnail", (String)jsonObject2.get("thumbnail").toString());
				list.add(map);
			}
			
			br.close();
			in.close();
			http.disconnect();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		logger.info("list: {}", list);
		
		
		return list;
	}
	
	@Override
	public PlantInfo getPlantInfo(String searchTxt) {
		String cntntsNo = getCntntsNo(searchTxt);
		
		logger.info("cntntsNo: {}",cntntsNo);
		
		String apiKey="202204198GZGO1I4VEMJF2UN6GDIUW";
		//서비스 명
		String serviceName="garden";
		//오퍼레이션 명
		String operationName="gardenDtl";
		
		//XML 받을 URL 생성
		String parameter = "/"+serviceName+"/"+operationName;
		parameter += "?apiKey="+ apiKey;
		parameter += "&cntntsNo="+ cntntsNo;
		
		URL apiUrl = null;
		try {
			apiUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
		} catch (MalformedURLException e1) {
			e1.printStackTrace();
		}
		
		InputStream apiStream = null;
		try {
			apiStream = apiUrl.openStream();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		Document doc = null;
		try{
			//xml document
			doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				apiStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String resultCode="";
		String resultMsg="";
		try{resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultCode = "";}
		try{resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultMsg = "";}
		
		PlantInfo plantInfo = new PlantInfo();
		
		
		try{plantInfo.setNo(doc.getElementsByTagName("cntntsNo").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setNo("");}
		try{plantInfo.setPlntbneNm(doc.getElementsByTagName("plntbneNm").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setPlntbneNm("");}
		try{plantInfo.setPlntzrNm(doc.getElementsByTagName("plntzrNm").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setPlntzrNm("");}
		try{plantInfo.setDistbNm(doc.getElementsByTagName("distbNm").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setDistbNm("");}
		try{plantInfo.setFmlCodeNm(doc.getElementsByTagName("fmlCodeNm").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setFmlCodeNm("");}
		try{plantInfo.setOrgplceInfo(doc.getElementsByTagName("orgplceInfo").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setOrgplceInfo("");}
		try{plantInfo.setGrowthHgInfo(doc.getElementsByTagName("growthHgInfo").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setGrowthHgInfo("");}
		try{plantInfo.setGrowthAraInfo(doc.getElementsByTagName("growthAraInfo").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setGrowthAraInfo("");}
		try{plantInfo.setGrwtveCodeNm(doc.getElementsByTagName("grwtveCodeNm").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setGrwtveCodeNm("");}
		try{plantInfo.setGrwhTpCodeNm(doc.getElementsByTagName("grwhTpCodeNm").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setGrwhTpCodeNm("");}
		try{plantInfo.setWinterLwetTpCodeNm(doc.getElementsByTagName("winterLwetTpCodeNm").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setWinterLwetTpCodeNm("");}
		try{plantInfo.setHdCodeNm(doc.getElementsByTagName("hdCodeNm").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setHdCodeNm("");}
		try{plantInfo.setFrtlzrInfo(doc.getElementsByTagName("frtlzrInfo").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setFrtlzrInfo("");}
		try{plantInfo.setSoilInfo(doc.getElementsByTagName("soilInfo").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setSoilInfo("");}
		try{plantInfo.setWatercycleSprngCodeNm(doc.getElementsByTagName("watercycleSprngCodeNm").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setWatercycleSprngCodeNm("");}
		try{plantInfo.setWatercycleSummerCodeNm(doc.getElementsByTagName("watercycleSummerCodeNm").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setWatercycleSummerCodeNm("");}
		try{plantInfo.setWatercycleAutumnCodeNm(doc.getElementsByTagName("watercycleAutumnCodeNm").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setWatercycleAutumnCodeNm("");}
		try{plantInfo.setWatercycleWinterCodeNm(doc.getElementsByTagName("watercycleWinterCodeNm").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setWatercycleWinterCodeNm("");}
		try{plantInfo.setDlthtsManageInfo(doc.getElementsByTagName("dlthtsManageInfo").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setDlthtsManageInfo("");}
		try{plantInfo.setSpeclmanageInfo(doc.getElementsByTagName("speclmanageInfo").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setSpeclmanageInfo("");}
		try{plantInfo.setFncltyInfo(doc.getElementsByTagName("fncltyInfo").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setFncltyInfo("");}
		try{plantInfo.setLighttdemanddoCodeNm(doc.getElementsByTagName("lighttdemanddoCodeNm").item(0).getFirstChild().getNodeValue());}catch(Exception e){plantInfo.setLighttdemanddoCodeNm("");} 
		

		
		//XML파일 출력
//		Transformer tf= null;
//		try {
//			tf = TransformerFactory.newInstance().newTransformer();
//		} catch (TransformerConfigurationException e1) {
//			e1.printStackTrace();
//		} catch (TransformerFactoryConfigurationError e1) {
//			e1.printStackTrace();
//		}
//		tf.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
//		tf.setOutputProperty(OutputKeys.INDENT, "yes");
//		Writer out = new StringWriter();
//		try {
//			tf.transform(new DOMSource(doc), new StreamResult(out));
//		} catch (TransformerException e) {
//			e.printStackTrace();
//		}
//		System.out.println(out.toString());
		
		logger.info("resultcode: {}",resultCode);
		logger.info("resultMsg: {}",resultMsg);
		
		return plantInfo;
	}
	
	@Override
	public String getInitialSound(String text) {
		 String[] chs = { 
			        "ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", 
			        "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", 
			        "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", 
			        "ㅋ", "ㅌ", "ㅍ", "ㅎ" 
			    };
			
	    if(text.length() > 0) {
	        char chName = text.charAt(0);
	        if(chName >= 0xAC00)
	        {
	            int uniVal = chName - 0xAC00;
	            int cho = ((uniVal - (uniVal % 28))/28)/21;

	            return chs[cho];
	        }
	    }
		return null;
	}
	
	@Override
	public String getCntntsNo(String searchTxt) {
		String apiKey="202204198GZGO1I4VEMJF2UN6GDIUW";
		//서비스 명
		String serviceName="garden";
		//오퍼레이션 명
		String operationName="gardenList";
		
		String initialSound = getInitialSound(searchTxt);
		
		//XML 받을 URL 생성
		String parameter = "/"+serviceName+"/"+operationName;
		parameter += "?apiKey="+ apiKey;
		parameter += "&sText="+ searchTxt;
		parameter += "&word="+ initialSound;
		parameter += "&sType=sCntntsSj";
		parameter += "&wordType=cntntsSj";
		
		URL apiUrl = null;
		try {
			apiUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
		} catch (MalformedURLException e1) {
			e1.printStackTrace();
		}
		
		InputStream apiStream = null;
		try {
			apiStream = apiUrl.openStream();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		Document doc = null;
		try{
			//xml document
			doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				apiStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String resultCode="";
		String resultMsg="";
		try{resultCode = doc.getElementsByTagName("resultCode").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultCode = "";}
		try{resultMsg = doc.getElementsByTagName("resultMsg").item(0).getFirstChild().getNodeValue();}catch(Exception e){resultMsg = "";}
		
		String cntntsNo = "";
		
		try{cntntsNo             = doc.getElementsByTagName("cntntsNo").item(0).getFirstChild().getNodeValue();             }catch(Exception e){cntntsNo             = "";}
		
		//XML파일 출력
//		Transformer tf= null;
//		try {
//			tf = TransformerFactory.newInstance().newTransformer();
//		} catch (TransformerConfigurationException e1) {
//			e1.printStackTrace();
//		} catch (TransformerFactoryConfigurationError e1) {
//			e1.printStackTrace();
//		}
//		tf.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
//		tf.setOutputProperty(OutputKeys.INDENT, "yes");
//		Writer out = new StringWriter();
//		try {
//			tf.transform(new DOMSource(doc), new StreamResult(out));
//		} catch (TransformerException e) {
//			e.printStackTrace();
//		}
//		System.out.println(out.toString());
		
		logger.info("resultcode: {}",resultCode);
		logger.info("resultMsg: {}",resultMsg);
		
		return cntntsNo;
	}
	
	@Override
	public DailyPlant getDailyPlnat() {
		int sumcnt = mainDao.dailyPlantCnt();
		logger.info("sumcnt: {}", sumcnt);
		int ranNo = (int)(Math.random()*(sumcnt)) + 1;
		return mainDao.getDailyPlant(ranNo);
	}
} //end class