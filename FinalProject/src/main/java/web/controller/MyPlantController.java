package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import web.dto.MyPlant;
import web.dto.PlantSum;
import web.service.face.MyPlantService;
import web.service.face.PlantService;
import web.util.TransDate;

@Controller
@RequestMapping(value = "/myplant")
public class MyPlantController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPlantController.class);
	
	@Autowired private MyPlantService myPlantService;
	@Autowired private PlantService plantService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList(HttpSession session, Model model) {
		
		logger.info("myplant/list [GET]");
		
		int memberNo = (int) session.getAttribute("memberNo");
		model.addAttribute("list", myPlantService.list(memberNo));
		
		return "/myplant/list";
		
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String getWrite() {
		
		logger.info("myplant/write [GET]");
		
		return "/myplant/write";
		
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(HttpSession session, MyPlant myPlant, MultipartFile file) {
		
		logger.info("myplant/write [POST]");

		myPlant.setMemberNo((int) session.getAttribute("memberNo"));
		myPlantService.write(myPlant, file);
		
		return "redirect:/myplant/list";
		
	}
	
	@RequestMapping(value = "/searchform", method = RequestMethod.GET)
	public String getSearch() {
		
		logger.info("myplant/search [GET]");
		
		return "/myplant/search";
		
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String getCnt(String stext) {
		
		ObjectMapper objectMapper = new ObjectMapper();
		String result = null;
		try {
			result = objectMapper.writeValueAsString(plantService.getCnt(stext));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	@RequestMapping(value = "/searchresult", method = RequestMethod.GET)
	public String getResult(String bname, String cnum, Model model) {
		
		logger.info("myplant/result [GET]");
		
		PlantSum plantSum = plantService.getSum(cnum);
		
		plantSum.setBname(bname);
		
		logger.info("{}",plantSum);
		
		model.addAttribute("plantSum", plantSum);
		
		return "/myplant/result";
		
	}

	@RequestMapping(value = "/alter", method = RequestMethod.GET)
	public String getAlter(String no, Model model) {
		
		logger.info("myplant/alter [GET]");
		
		int myPlantNo = Integer.parseInt(no);
		MyPlant myPlant = myPlantService.profile(myPlantNo);
		
		TransDate transDate = new TransDate();
		myPlant.setBirth(transDate.toString3(myPlant.getBirth()));
		
		model.addAttribute("myPlant", myPlant);
		
		return "/myplant/change";
		
	}
	
	@RequestMapping(value = "/alter", method = RequestMethod.POST)
	public String alter(MyPlant myPlant, MultipartFile file) {
		
		logger.info("myplant/alter [POST]");
		
		myPlantService.alter(myPlant, file);
		
		return "redirect:/myplant/list";
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String drop(String no, Model model) {
		
		logger.info("myplant/delete [GET]");
		
		int myPlantNo = Integer.parseInt(no);
		myPlantService.drop(myPlantNo);
		
		return "redirect:/myplant/list";
		
	}

}
