package web.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.MyPlantDao;
import web.dto.MyPlant;
import web.service.face.MyPlantService;
import web.util.StoreImg;
import web.util.TransDate;

@Service
public class MyPlantServiceImpl implements MyPlantService {

	@Autowired MyPlantDao myPlantDao;
	@Autowired ServletContext context;
	
	@Override
	public List<MyPlant> list(int memberNo) {
		
		List<MyPlant> list = myPlantDao.selectList(memberNo);
		
		TransDate transDate = new TransDate();
		for(int i = 0; i < list.size(); ++i) {
			list.get(i).setBirth(transDate.toString(list.get(i).getBirth()));
		}
		
		return list;
		
	}

	@Override
	public String nick(int myPlantNo) {
		
		return myPlantDao.selectNick(myPlantNo);
		
	}

	@Override
	public MyPlant profile(int myPlantNo) {
		
		return myPlantDao.select(myPlantNo);
		
	}
	
	@Override
	public void write(MyPlant myPlant, MultipartFile file) {
		
		TransDate transDate = new TransDate();
		myPlant.setBirth(transDate.toString2(myPlant.getBirth()));
		
		if(file.getSize() > 0) {
			
			StoreImg fileUpload = new StoreImg();
			String stored = fileUpload.on(file, context);
		
			myPlant.setOrigin(file.getOriginalFilename());
			myPlant.setStored(stored);
			
		}
		
		myPlantDao.insert(myPlant);
		
	}

	@Override
	public void alter(MyPlant myPlant, MultipartFile file) {
		
		TransDate transDate = new TransDate();
		myPlant.setBirth(transDate.toString2(myPlant.getBirth()));
		
		if(file.getSize() > 0) {
			
			StoreImg fileUpload = new StoreImg();
			String stored = fileUpload.on(file, context);
		
			myPlant.setOrigin(file.getOriginalFilename());
			myPlant.setStored(stored);
			
		}
		
		myPlantDao.update(myPlant);
		
	}
	
	@Override
	public void drop(int myPlantNo) {
		
		myPlantDao.delete(myPlantNo);
		
	}

}
