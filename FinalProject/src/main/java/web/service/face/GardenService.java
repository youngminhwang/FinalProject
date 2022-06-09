package web.service.face;

import java.util.HashMap;
import java.util.List;

import web.dto.Garden;
import web.util.Paging;


public interface GardenService {

	/**
	 * 해당 수목원 또는 공원 리스트를 가져오기 위해 수목원 이름으로 수목원 번호 가져오기
	 * @param garden 조회할 수목원 또는 공원 이름
	 * @return 수목원 또는 공원 번호
	 */
	public int getGardenNo(Garden garden);
	
	/**
	 * 리스트가 1개 이상인지 확인
	 * @param garden 확인할 수목원 번호
	 * @return 리스트 갯수
	 */
	public int listCnt(int gardenNo);

	/**
	 * 해당 수목원 또는 공원의 리뷰 리스트 불러오기
	 * @param gardenNo 확인할 수목원 번호
	 * @return 리뷰 리스트
	 */
	public List<HashMap<String, Object>> list(Paging paging, int gardenNo);

	/**
	 * 회원 아이디를 이용하여 회원번호를 조회한다
	 * @param id 조회할 아이디
	 * @return 회원번호
	 */
	public int getMemberNo(String id);

	/**
	 * 작성한 리뷰를 데이터베이스에 삽입한다
	 * @param garden 삽입할 리뷰
	 * @return 성공1, 실패0
	 */
	public int write(Garden garden);

	/**
	 * 삭제버튼을 누른 리뷰를 삭제한다
	 * @param garden 삭제할 리뷰번호
	 * @return 성공1, 실패0
	 */
	public int delete(Garden garden);

	/**
	 * 수정버튼을 누른 리뷰를 수정한다
	 * @param garden 수정할 리뷰번호와 리뷰내용
	 * @return 성공1, 실패0
	 */
	public int update(Garden garden);
	
	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @param gardenNo - 조회할 수목원 또는 공원 번호
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(Paging paramData, int gardenNo);




	

}
