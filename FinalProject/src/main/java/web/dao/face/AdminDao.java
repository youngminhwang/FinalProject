package web.dao.face;

import java.util.HashMap;
import java.util.List;

import web.dto.Admin;
import web.dto.Board;
import web.dto.BoardFile;
import web.dto.Category;
import web.dto.DailyPlant;
import web.dto.Goods;
import web.dto.GoodsView;
import web.dto.Member;
import web.dto.Order;
import web.dto.OrderList;
import web.dto.Reply;
import web.util.Paging;

public interface AdminDao {

	/**
	 * 카테고리에 있는 데이터 조회
	 * 
	 * @return - 카테고리 List
	 */
	public List<Category> category();
	
	/**
	 * 상품 등록
	 * 
	 * @param goods - 등록할 상품 DTO
	 */
	public void register(Goods goods);
   
	/**
     * 상품을 조회한다
     * @param paramData 페이징 객체
     * @return 상품갯수
     */
    public int selectProductCntAll(Paging paramData);

	/**
	 * 상품 목록 조회
	 * 
	 * @return - 상품 목록 List
	 */
    public List<GoodsView> goodsList(Paging paging);
	
	/**
	 * 상품 상세조회 + 카테고리 조인
	 * 
	 * @param gdsNum - 상세보기 하려는 상품 번호
	 * @return - 상품 정보
	 */
	public GoodsView goodsView(int gdsNum);
	
	/**
	 * 상품 수정
	 * 
	 * @param goods - 새로 수정한 상품 정보
	 */
	public void goodsUpdate(GoodsView goods);
	
	/**
	 * 상품 삭제
	 * 
	 * @param goods - 삭제할 상품 정보
	 */
	public void goodsDelete(Goods goods);
	
	/**
	 * 주문 목록
	 * 
	 * @param order - 주문 목록 DTO
	 * @return 주문 목록 리스트
	 */
	public List<OrderList> orderList(Order order);
	
	/**
	 * 주문 상세 목록
	 * 
	 * @param order - 주문 DTO
	 * @return 주문 상세 목록
	 */
	public List<OrderList> orderView(Order order);
	
	/**
	 * 주문 배송 상태 변경
	 * 
	 * @param order - 주문 배송 상태 DTO
	 */
	public void delivery(Order order);
	
	/**
	 * 주문 완료 시, 상품 수량 조절
	 * 
	 * @param goods - 수량 조절할 DTO
	 */
	public void changeStock(Goods goods);

	/**
	 * 데이터베이스에 form에서 보낸 데이터와 일치하는 아이디, 패스워드 확인
	 * @param admin 확인할 admin객체
	 * @return 성공:1, 실패:0
	 */
	public int selectCntByadmin(Admin admin);

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Member> selectMemberList(Paging paging);
	/**
	 * 전체 회원 게시글 수를 조회한다
	 * 
	 * @param paramData - 페이징 객체
	 * @return 총 게시글 수
	 */
	public int selectCntAll(Paging paramData);

	/**
	 * 해당 멤버번호에 해당하는 멤버정보를 조회한다
	 * @param member 조회할 멤버번호
	 * @return 멤버정보
	 */
	public Member selectBymemeberNo(Member member);

	/**
	 * 해당 멤버번호를 업데이트한다
	 * @param member 업데이트할 멤버정보
	 * @return 성공:1, 실패:0
	 */
	public int updateBymember(Member member);

	/**
	 * 해당 멤버를 삭제한다
	 * @param member 삭제할 멤버번호
	 * @return 성공:1, 실패:0
	 */
	public int deleteBymember(Member member);
	
	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param map paging - 페이징 정보 객체, board - 게시판 선택 정보
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Board> selectBoardList(HashMap<String, Object> map);
	
	/**
	 * 게시글 수를 조회한다
	 * 
	 * @param paramData - 페이징 객체
	 * @return 총 게시글 수
	 */
	public int selectCntBoardAll(HashMap<String, Object> map);

	/**
	 * 해당번호의 게시글 정보를 조회한다
	 * @param board 조회할 게시글 번호
	 * @return 게시글정보를 담은 board객체
	 */
	public Board selectBoardNo(Board board);

	/**
	 * 해당번호의 게시글의 파일을 조회한다
	 * @param board 조회할 게시글 번호
	 * @return 파일의 갯수
	 */
	public int selectBoardFileCntByBoardNo(Board board);

	/**
	 * 해당번호의 boardfile을 조회한다
	 * @param board 조회할 게시글 번호
	 * @return boardfile정보
	 */
	public List<BoardFile> selectBoardFileByBoardNo(Board board);

	/**
	 * 해당번호의 게시글의 댓글을 조회한다
	 * @param board 조회할 게시글 번호
	 * @return 댓글의 갯수
	 */
	public int selectReplyCntByBoardNo(Board board);

	/**
	 * 해당번호의 게시글의 댓글을 조회한다
	 * @param board 조회할 게시글 번호
	 * @return 댓글 정보
	 */
	public List<Reply> selectRelyByBoardNo(HashMap<String, Object> map);

	/**
	 * 해당 댓글을 삭제한다
	 * @param parseInt 삭제할 replyno
	 */
	public void deleteByReviewNo(int parseInt);

	/**
	 * 해당 게시글을 삭제한다
	 * @param board 삭제할 게시글번호
	 */
	public void deleteBoardByBoardNo(Board board);

	/**
	 * boardno에 해당하는 review를 삭제한다
	 * @param board 삭제할 boardno
	 */
	public void deleteReviewByBoardNo(Board board);

	/**
	 * boardno에 해당하는 file을 삭제한다
	 * @param board 삭제할 boardno
	 */
	public void deleteFileByBoardNo(Board board);
	
	/**
	 * 식물 추천 정보 입력
	 * @param daliyPlant - 식물 정보
	 */
	public void dailyPlantInsert(DailyPlant dailyPlant);
}
