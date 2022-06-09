package web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import web.dto.MyPlant;
import web.service.face.MyPlantService;

@Service
public class WaterPerService {
	
	private final static Logger logger = LoggerFactory.getLogger(WaterPerService.class);
	@Autowired MyPlantService myPlantService;
	
	public List<MyPlant> isWaterToday(int memberNo) {
		
		//회원의 식물 목록을 불러온다. 
		List<MyPlant> myPlants = new ArrayList<MyPlant>();
		myPlants = myPlantService.list(memberNo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmdd");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy년 mm월 dd일");
		Date today = new Date();
		
		//조회결과 담기용 리스트
		List<MyPlant> forAlarmList = new ArrayList<MyPlant>();
		
		try {
			for(MyPlant m : myPlants) {
				Long timeDiff =	today.getTime() - sdf1.parse(m.getBirth()).getTime();
				int watPer = Integer.parseInt(m.getWater());
				long dayDiff = (timeDiff / 1000) / (24*60*60);
				if(dayDiff % watPer == 0) {
					logger.info(" myPlant m {}",m.toString());
					forAlarmList.add(m);
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return forAlarmList;
	}//isWaterToday end
}
