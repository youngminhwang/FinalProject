package web.dao.face;

import web.dto.DailyPlant;

public interface MainDao {
	
	/**
	 * 식물 추천에 등록된 총 데이터 수 가져오기
	 * @return dailyplant의 데이터 개수
	 */
	public int dailyPlantCnt();
	
	/**
	 * 랜덤으로 식물 정보 가져오기
	 * @param ranNo dailyplant의 개수 중 랜덤 번호 힌 개
	 * @return 식물 정보
	 */
	public DailyPlant getDailyPlant(int ranNo);
}
