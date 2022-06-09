package web.service.face;

import java.util.HashMap;

import web.dto.PlantCode;
import web.dto.PlantSum;

public interface PlantService {
	
	public HashMap<String, Object> getCnt(String stext);
	
	public PlantSum getSum(String cnum);

	public PlantCode getCode(String cnum);
	
	public HashMap<String, String> getTip(PlantCode Code);
}