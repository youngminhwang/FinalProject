package web.dao.face;

import java.util.HashMap;
import java.util.List;

import web.dto.Garden;

public interface GardenDao {

	/**
	 * 수목원 또는 공원 이름으로 수목원 또는 공원 조회
	 * @param garden 조회할 수목원 또는 공원 이름
	 * @return 수목원번호
	 */
	public int selectByGardenName(Garden garden);

	/**
	 * 리스트 갯수 조회
	 * @param garden 조회할 번호
	 * @return 리뷰 갯수
	 */
	public int selectCntByGardenNo(int gardenNo);


	/**
	 * 번호에 해당하는 리스트 목록 조회
	 * @param gardenNo 조회하려는 번호
	 * @return 리뷰 리스트
	 */
	public List<HashMap<String, Object>> selectListAll(HashMap<String, Object> map);

	/**
	 * 아이디에 해당하는 회원번호 조회
	 * @param id 조회할 아이디
	 * @return 회원번호
	 */
	public int selectNumByMemberId(String id);

	/**
	 * 수목원 리뷰를 데이터베이스에 삽입한다
	 * @param garden 삽입할 리뷰
	 * @return 성공1, 실패0
	 */
	public int insertReview(Garden garden);

	/**
	 * 리뷰번호에 해당하는 리뷰를 삭제한다
	 * @param garden 삭제할 리뷰번호
	 * @return 성공1, 실패0
	 */
	public int deleteReview(Garden garden);

	/**
	 * 리뷰번호에 해당하는 리뷰를 수정한다
	 * @param garden 수정할 리뷰내용과 리뷰번호
	 * @return 성공1, 실패0
	 */
	public int updateReview(Garden garden);

	/**
	 * 해당 리뷰의 전체 게시글 수를 조회한다
	 * 
	 * @param paramData - search를 포함한 페이징 객체
	 * @return 해당 리뷰의 전체 수
	 */
	public int selectCntAll(HashMap<String, Object> map);


}
