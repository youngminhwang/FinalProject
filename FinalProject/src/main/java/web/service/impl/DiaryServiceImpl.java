package web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.DiaryDao;
import web.dto.Diary;
import web.service.face.DiaryService;
import web.util.StoreImg;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired DiaryDao diaryDao;
	@Autowired ServletContext context;

	@Override
	public List<Diary> list(int myPlantNo, String week) {
		
		String[] days = week.split(",");
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Diary> diary = new ArrayList<Diary>();
		
		map.put("myPlantNo", myPlantNo);
		for(int i =0; i < 7; ++i) {
			map.put("date", days[i]);
			diary.add(diaryDao.selectSum(map));
		}
		
		return diary;
		
	}
	
	@Override
	public Diary diary(int myPlantNo, String date) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("myPlantNo", myPlantNo);
		map.put("ddate", date);
		
		return diaryDao.select(map);
		
	}

	@Override
	public void write(Diary diary, MultipartFile file) {
		
		if(diary.getDirt() == null) {
			diary.setDirt("");
		}
		
		if(diary.getWater() != null) {
			diary.setWater("1");
		} else {
			diary.setWater("0");
		}
		
		if(diary.getRepot() != null) {
			diary.setRepot("1");
		} else {
			diary.setRepot("0");
		}
		
		if(file.getSize() > 0) {
			
			StoreImg fileUpload = new StoreImg();
			String stored = fileUpload.on(file, context);
		
			diary.setOrigin(file.getOriginalFilename());
			diary.setStored(stored);
			
		}
		
		diaryDao.insert(diary);
		
	}
	
	@Override
	public void alter(Diary diary, MultipartFile file) {
		
		if(diary.getDirt() == null) {
			diary.setDirt("");
		}
		
		if(diary.getWater() != null) {
			diary.setWater("1");
		} else {
			diary.setWater("0");
		}
		
		if(diary.getRepot() != null) {
			diary.setRepot("1");
		} else {
			diary.setRepot("0");
		}
		
		if(file.getSize() > 0) {
			
			StoreImg fileUpload = new StoreImg();
			String stored = fileUpload.on(file, context);
		
			diary.setOrigin(file.getOriginalFilename());
			diary.setStored(stored);
			
		}
		
		diaryDao.update(diary);
		
	}

	@Override
	public void drop(int myPlantNo, String date) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("myPlantNo", myPlantNo);
		map.put("ddate", date);
		
		diaryDao.delete(map);
		
	}

}
