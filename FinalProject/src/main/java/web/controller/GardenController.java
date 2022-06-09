package web.controller;


import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Garden;
import web.dto.GardenPriceDto;
import web.service.face.GardenService;
import web.util.Paging;


@Controller
public class GardenController {
	
	//로거
	private static final Logger logger = LoggerFactory.getLogger(GardenController.class);
	
	//수목원 서비스 객체
	@Autowired
	private GardenService gardenService;
	
	
	@RequestMapping(value="/garden/gardenMap", method=RequestMethod.GET)
	public void gardenMain() {
		logger.info("/garden/gardenMap[GET]");
		
	}//gardenMain
	
	@RequestMapping(value="/garden/list")
	public @ResponseBody HashMap<String,Object> list(Garden garden, Paging paramData, Model model) {
		logger.info("/garden/list[GET]");
		logger.info("garden:{}",garden);
		
		//garden번호 가져오기
		garden.setGardenNo(gardenService.getGardenNo(garden));
		logger.info("garden:{}",garden);
	
		
		//garden번호에 해당하는 리뷰 갯수 확인
		int cnt = gardenService.listCnt(garden.getGardenNo());
		if(cnt>0) {
			logger.info("0이상이면 리뷰 불러온다");	
			
			Paging paging = gardenService.getPaging( paramData, garden.getGardenNo() );
			logger.info("{}", paging);
			
			//garden번호에 해당하는 리뷰 리스트 가져오기
			List<HashMap<String,Object>> gardenInfo = gardenService.list(paging, garden.getGardenNo());
			
			HashMap<String, Object> info = new HashMap<String, Object>();
			info.put("list", gardenInfo);
			info.put("paging", paging);
			
			return info;
			
			
		}else {
			logger.info("0보다 작음");
			return null;
		}	
	}//list
	
	@RequestMapping(value="/garden/write")
	public void write(Garden garden,Writer out,HttpSession session) {
		logger.info("/garden/write 접속");
		logger.info("garden: {}", garden);
		
		//gardenNo 조회해서 설정한다
		garden.setGardenNo(gardenService.getGardenNo(garden));
		
		//아이디를 이용해서 회원번호를 조회한다->나중에 수정해야함
		garden.setMemberNo(gardenService.getMemberNo((String)session.getAttribute("id")));
		logger.info("garden: {}", garden);
		
		//리뷰 삽입
		int res = gardenService.write(garden);
		
		//리뷰 삽입 성공유무로 값 전달
		if(res>0) {
			try {
				out.write("{\"res\": true}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				out.write("{\"res\": false}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}//write
	
	@RequestMapping(value="/garden/delete")
	public void delete(Garden garden,Writer out) {
		logger.info("/garden/delete 접속");
		logger.info("garden:{}",garden);
		
		
		//해당 리뷰 삭제
		int res = gardenService.delete(garden);
		
		//리뷰 삭제 성공유무로 값 전달
		if(res>0) {
			try {
				out.write("{\"res\": true}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				out.write("{\"res\": false}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}		
	}//delete
	
	@RequestMapping(value="/garden/update")
	public void update(Garden garden,Writer out) {
		logger.info("/garden/update 접속");
		logger.info("garden:{}",garden);
		
		int res = gardenService.update(garden);
		if(res>0) {
			try {
				out.write("{\"res\": true}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}//update
	
}