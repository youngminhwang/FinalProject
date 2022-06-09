package web.service.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.zxing.WriterException;

import web.controller.ReserveController;
import web.dao.face.ReserveDao;
import web.dto.GardenPriceDto;
import web.dto.ReserveInfo;
import web.service.face.ReserveService;
import web.util.QrUtil;

@Service
public class ReserveServiceImpl implements ReserveService {
	
	private static final Logger logger = LoggerFactory.getLogger(ReserveController.class);
	
	
	@Autowired ReserveDao reserveDao;
	@Autowired ServletContext context;
	
	@Override
	public List<String> getGardenList() {
		
		List<String> gerdenList = reserveDao.getGardenNameList();
		
		return gerdenList;
	}

	@Override
	public GardenPriceDto getGardenPrice(String garden) {
		
		GardenPriceDto gardenPrice = reserveDao.getGardenPrice(garden);		
		
		return gardenPrice;
	}

	@Override
	public void saveResInfo(ReserveInfo info) {
		logger.info("saving info {}" , info.toString());
		reserveDao.saveResInfo(info);
	}

	@Override
	public int getReserveNo(int memberNo) {
		return reserveDao.getReserveNo(memberNo);
	}

	@Override
	public ReserveInfo getResInfo (int resNo) {
		return reserveDao.getResInfo(resNo);
	}

	@Override
	public String getQrCode(ReserveInfo info, int resNo) {
		
		QrUtil qrUtil = new QrUtil();
		
		String storedPath = context.getRealPath("qrImg");
		logger.info("storedPath {}" ,storedPath);
		File folder = new File(storedPath);
		if(!folder.exists()) 
		folder.mkdir();
		
		Gson gson = new Gson();
		String context = gson.toJson(info);
		
		String qrImgName = Integer.toString(info.getMemberNo()) + Integer.toString(info.getReserveNo());
//		File dest = new File( folder, qrImgName);
		
		try {
			
		BufferedImage qrCode = qrUtil.makeQR(context);
			ImageIO.write(qrCode, "png", new File(storedPath+File.separator+qrImgName+".png"));
		} catch (IOException e) {
			e.printStackTrace();
		} catch (WriterException e) {
			e.printStackTrace();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("qrImgName", qrImgName);
		map.put("resNo", resNo);
		
		reserveDao.saveQrName(map);
		String qrNo = (String) map.get("qrImgName");
		return qrNo;
	}

	@Override
	public void updateResInfo(ReserveInfo info) {
		reserveDao.updateResInfo(info);
	}

	@Override
	public void updateQrCode(String qrNo, int resNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("qrNo", qrNo);
		map.put("resNo", resNo);
		
		reserveDao.updateResInfo(map);
	}




}
