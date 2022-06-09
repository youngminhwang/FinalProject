package web.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import web.dao.face.PlantDao;
import web.dto.PlantCode;
import web.dto.PlantSum;
import web.service.face.PlantService;

@Service
public class PlantServiceImpl implements PlantService{
	
	@Autowired PlantDao plantDao;
	

	@Override
	public HashMap<String, Object> getCnt(String stext) {
		
		String url = "";
		url += "http://api.nongsaro.go.kr/service/garden/gardenList";
		url	+= "?apiKey=20220425VJTSFIKU8XZEEQVAAD6UWG&sType=sCntntsSj&sText=" + stext;
		
		URL api = null;
		InputStream is = null;

		try {
			
			api = new URL(url);
			
			is = api.openStream();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<String> blist = new ArrayList<String>();
		List<String> clist = new ArrayList<String>();
		Document doc = null;

		try {
			
			doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
				
			doc.getDocumentElement().normalize();
			
			for(int i = 0; i < doc.getElementsByTagName("cntntsSj").getLength(); ++i) {
				blist.add((doc.getElementsByTagName("cntntsSj").item(i).getFirstChild().getNodeValue()));
				clist.add((doc.getElementsByTagName("cntntsNo").item(i).getFirstChild().getNodeValue()));
			}
			
		} catch (SAXException | IOException | ParserConfigurationException e) {
			e.printStackTrace();
		}
		
		map.put("bname", blist);
		map.put("cnum", clist);
		
		return map;
		
	}
	

	@Override
	public PlantSum getSum(String cnum) {
		
		String url = "";
		url = "http://api.nongsaro.go.kr/service/garden/gardenDtl";
		url	+= "?apiKey=20220425VJTSFIKU8XZEEQVAAD6UWG&cntntsNo=" + cnum;
		
		URL api = null;
		InputStream is = null;

		try {
			
			api = new URL(url);
			
			is = api.openStream();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		PlantSum plantSum = new PlantSum();
		Document doc = null;

		try {
			
			doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
				
			doc.getDocumentElement().normalize();
			
				plantSum.setPlname(doc.getElementsByTagName("plntbneNm").item(0).getFirstChild().getNodeValue());
				plantSum.setSort(doc.getElementsByTagName("fmlCodeNm").item(0).getFirstChild().getNodeValue());
				plantSum.setHome(doc.getElementsByTagName("orgplceInfo").item(0).getFirstChild().getNodeValue());
				plantSum.setClevel(doc.getElementsByTagName("managelevelCodeNm").item(0).getFirstChild().getNodeValue());
				plantSum.setGlevel(doc.getElementsByTagName("grwtveCodeNm").item(0).getFirstChild().getNodeValue());
			
		} catch (SAXException | IOException | ParserConfigurationException e) {
			e.printStackTrace();
		}
		
		return plantSum;
		
	}

	
	
	@Override
	public PlantCode getCode(String cnum) {
		
		String url = "";
		url += "http://api.nongsaro.go.kr/service/garden/gardenDtl";
		url	+= "?apiKey=20220425VJTSFIKU8XZEEQVAAD6UWG&cntntsNo=" + cnum;
		
		URL api = null;
		InputStream is = null;
			
		try {
			
			api = new URL(url);
			
			is = api.openStream();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
			
			
		Document doc = null;
		
		String temp = null;
		String tempW = null;
		String humid = null;
		String dirt = null;
		String dirtW = null;
		
		try {
				
			doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
				
			doc.getDocumentElement().normalize();
			
			temp = doc.getElementsByTagName("grwhTpCode").item(0).getFirstChild().getNodeValue();
			tempW = doc.getElementsByTagName("winterLwetTpCode").item(0).getFirstChild().getNodeValue();
			humid = doc.getElementsByTagName("hdCode").item(0).getFirstChild().getNodeValue();
			dirt = doc.getElementsByTagName("watercycleSummerCode").item(0).getFirstChild().getNodeValue();
			dirtW = doc.getElementsByTagName("watercycleWinterCode").item(0).getFirstChild().getNodeValue();
				
		} catch (SAXException | IOException | ParserConfigurationException e) {
			e.printStackTrace();
		}
		
		PlantCode code = new PlantCode();
		
		code.setTemp(temp);
		code.setTempW(tempW);
		code.setHumid(humid);
		code.setDirt(dirt);
		code.setDirtW(dirtW);
		
		return code;
		
	}

	@Override
	public HashMap<String, String> getTip(PlantCode plantCode) {
		
		List<String> text = plantDao.select(plantCode);
		
		HashMap<String, String> tip = new HashMap<String, String>();
		
		tip.put("temp", text.get(0));
		tip.put("tempW", text.get(1));
		tip.put("humid", text.get(2));
		tip.put("dirt", text.get(3));
		tip.put("dirtW", text.get(4));
		
		return tip;
		
	}

}
