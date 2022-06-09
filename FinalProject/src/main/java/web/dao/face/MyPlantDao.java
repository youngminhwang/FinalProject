package web.dao.face;

import java.util.List;

import web.dto.MyPlant;

public interface MyPlantDao {
	
	public List<MyPlant> selectList(int memberNo);
	
	public MyPlant select(int myPlantNo);

	public String selectNick(int myPlantNo);
	
	public void insert(MyPlant myPlant);

	public void update(MyPlant myPlant);

	public void delete(int myPlantNo);

}