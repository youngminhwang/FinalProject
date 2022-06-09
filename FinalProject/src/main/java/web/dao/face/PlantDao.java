package web.dao.face;

import java.util.List;

import web.dto.PlantCode;

public interface PlantDao {
	
	public List<String> select(PlantCode plantCode);

}
