package web.dao.face;

import java.util.Map;

import web.dto.Diary;

public interface DiaryDao {
	
	public Diary selectSum(Map<String, Object> map);
	
	public Diary select(Map<String, Object> map);
	
	public void insert(Diary diary);
	
	public void update(Diary diary);

	public void delete(Map<String, Object> map);
	
}