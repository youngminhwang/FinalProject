package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.MyPlant;

public interface MyPlantService {
	
	public List<MyPlant> list(int memberNo);
	
	public String nick(int myPlantNo);
	
	public MyPlant profile(int myPlantNo);
	
	public void write(MyPlant myPlant, MultipartFile file);
	
	public void alter(MyPlant myPlant, MultipartFile file);
	
	public void drop(int myPlantNo);

}