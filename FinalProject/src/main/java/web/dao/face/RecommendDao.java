package web.dao.face;

import web.dto.Recommend;

public interface RecommendDao {

	/**
	 * 추천수 
	 * 
	 * @param recommend
	 * @return
	 */
	int selectCntRecommend(Recommend recommend);

	/**
	 * 총 추천수 
	 * 
	 * @param recommend
	 * @return
	 */
	int selectTotalCntRecommend(Recommend recommend);

	/**
	 * 추천 지우기
	 * 
	 * @param recommend
	 */
	public void deleteRecommend(Recommend recommend);

	/**
	 * 추천 넣기
	 * 
	 * @param recommend
	 */
	public void insertRecommend(Recommend recommend);

}
