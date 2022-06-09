package web.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import web.dto.Diary;
import web.dto.MyPlant;
import web.dto.PlantCode;
import web.service.face.DiaryService;
import web.service.face.MyPlantService;
import web.service.face.PlantService;
import web.util.TransDate;

@Controller
@RequestMapping(value = "/diary")
public class DiaryController {

	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);
	
	@Autowired private DiaryService diaryService;
	@Autowired private PlantService plantService;
	@Autowired private MyPlantService myPlantService;
	
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String calendar(String no, HttpSession session, Model model) {
		
		logger.info("diary/calendar [GET]");
		
		session.setAttribute("myPlantNo", no);
		
		int myPlantNo = Integer.parseInt((String) session.getAttribute("myPlantNo"));
		model.addAttribute("nick", myPlantService.nick(myPlantNo));
		
		return "/myplant/calendar";
		
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String week(HttpSession session, @RequestParam(value="param") String week) {
	
		logger.info("diary/list [GET]");
		
		int myPlantNo = Integer.parseInt((String) session.getAttribute("myPlantNo"));
		ObjectMapper objectMapper = new ObjectMapper();
		String result = null;
		try {
			result = objectMapper.writeValueAsString(diaryService.list(myPlantNo, week));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	@RequestMapping(value = "/view", method = {RequestMethod.GET, RequestMethod.POST})
	public String getView(String date, HttpSession session, Diary diary, Model model) throws IOException {
		
		int myPlantNo = Integer.parseInt((String) session.getAttribute("myPlantNo"));
		if(date == null) {
			date = diary.getDdate();
		}
		
		logger.info("/diary/view [GET, POST]");
		logger.info("{}", date);
		
		MyPlant myPlant = myPlantService.profile(myPlantNo);
		Diary newDiary = diaryService.diary(myPlantNo, date);
		PlantCode code = plantService.getCode(myPlant.getCnum());
		HashMap<String, String> tip = plantService.getTip(code);
		TransDate transDate = new TransDate();
		
		model.addAttribute("diary", newDiary);
		model.addAttribute("code", code);
		model.addAttribute("tip", tip);
		model.addAttribute("newDate", transDate.toString(date));
		model.addAttribute("gapDays", transDate.interval(myPlant.getBirth(), newDiary.getDdate()));
		myPlant.setBirth(transDate.toString(myPlant.getBirth()));
		model.addAttribute("myPlant", myPlant);
		
		return "/myplant/diaryview";
		
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String getWrite(HttpSession session, String date, Model model) {
		
		logger.info("diary/write [GET]");
		logger.info("{}", date);
		
		int myPlantNo = Integer.parseInt((String) session.getAttribute("myPlantNo"));
		MyPlant myPlant = myPlantService.profile(myPlantNo);
		TransDate transDate = new TransDate();
		
		model.addAttribute("ddate", date);
		model.addAttribute("newDate", transDate.toString(date));
		model.addAttribute("gapDays", transDate.interval(myPlant.getBirth(), date));
		myPlant.setBirth(transDate.toString(myPlant.getBirth()));
		model.addAttribute("myPlant", myPlant);
		
		return "/myplant/diarywrite";
		
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(HttpSession session, Diary diary, MultipartFile file) {
		
		logger.info("diary/write [POST]");
		
		diary.setMyPlantNo(Integer.parseInt((String) session.getAttribute("myPlantNo")));
		diaryService.write(diary, file);
		
		return "forward:/diary/view";
		
	}
	
	@RequestMapping(value = "/alter", method = RequestMethod.POST)
	public String alter(HttpSession session, Diary diary, MultipartFile file) {
		
		logger.info("diary/alter [POST]");
		
		diary.setMyPlantNo(Integer.parseInt((String) session.getAttribute("myPlantNo")));
		diaryService.alter(diary, file);
		
		return "forward:/diary/view";
		
	}
	
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String drop(HttpSession session, String date) {
		
		logger.info("diary/delete [GET]");
		logger.info("{}", date);
		
		int myPlantNo = Integer.parseInt((String) session.getAttribute("myPlantNo"));
		diaryService.drop(myPlantNo, date);
		
		return "redirect:/diary/calendar?no=" + myPlantNo;
		
	}

}