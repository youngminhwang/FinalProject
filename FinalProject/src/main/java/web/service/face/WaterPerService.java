package web.service.face;

import java.util.List;

import web.dto.MyPlant;

public interface WaterPerService {

	/**
	 * 오늘이 물주는 날인 식물들 리스트를 반환한다.
	 * @param 멤버 번호
	 * @return 물주는 날인 식물들 list*/
	public List<MyPlant> isWaterToday(int memberNo);
}
