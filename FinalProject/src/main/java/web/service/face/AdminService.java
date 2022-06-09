package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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

public interface AdminService {

	/**
	 * 카테고리 조회
	 * 
	 * @return - 카테고리 List
	 */
	public List<Category> category();
	
	/**
	 * 상품 등록
	 * 
	 * @param goods - 등록할 상품 DTO
	 * @param file - 등록할 상품 썸네일이미지
	 */
	public void register(Goods goods,  MultipartFile[] file);
	
    
    /**
     * 상품 페이징 객체 생성
     * @param paramData curPage를 저장하고있는 객체
     * @return 계산이 완료된 Paging객체
     */
    public Paging getGoodsPaging(Paging paramData);

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
	 * @param file - 새로 수정한 상품 썸네일이미지
	 */
	public void goodsUpdate(GoodsView goods, MultipartFile[] file);
	
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
	 * 관리자 로그인
	 * @param admin 로그인할 아이디, 패스워드
	 * @return 성공:1, 실패:0
	 */
	public int adminLogin(Admin admin);

	/**
	 * 회원 리스트 가져오기
	 * @return 회원리스트
	 */
	public List<Member> getMemberList(Paging paging);

	/**
	 * 회원목록 페이징 객체 생성
	 * @param paramData curPage를 저장하고있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 회원 상세보기
	 * @param member 상세보기할 회원번호
	 * @return 해당 회원정보
	 */
	public Member getMember(Member member);

	/**
	 * 회원정보 업데이트 
	 * @param member 업데이트할 회원 정보
	 * @return 성공:1, 실패:0
	 */
	public int updateMember(Member member);

	/**
	 * 해당번호의 회원삭제
	 * @param member 삭제할 회원 번호
	 * @return 성공:1, 실패:0
	 */
	public int deleteMember(Member member);
	
	/**
	 * 자유게시판 리스트 가져오기
	 * @return 게시판리스트
	 */
	public List<Board> getBoardList(Paging paging, Board board);

	/**
	 * 게시판 페이징 객체 생성
	 * @param paramData curPage를 저장하고있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getboardPaging(Paging paramData, Board board);

	/**
	 * 게시판 번호에 해당하는 게시글 상세보기
	 * @param board 게시판 번호
	 * @return 게시글정보를 담은 board객체
	 */
	public Board getBoardDetail(Board board);

	/**
	 * boardno에 해당하는 게시글이 있는지 확인
	 * @param board 확인할 boardno을 담은 board
	 * @return boardfile갯수
	 */
	public int getBoardFileCnt(Board board);

	/**
	 * boardno에 해당하는 boardfile가져오기
	 * @param board 확인할 boardno을 담은 board
	 * @return boardfile
	 */
	public List<BoardFile> getBoardFile(Board board);

	/**
	 * boardno에 해당하는 reply갯수 가져오기
	 * @param board 확인할 boardno을 담은 board
	 * @return reply 갯수
	 */
	public int getBoardReplyCnt(Board board);

	/**
	 * boardno에 해당하는 reply가져오기
	 * @param board 확인할 boardno을 담은 board
	 * @return 댓글 정보담은 reply 객체
	 */
	public List<Reply> getReply(Paging paging, Board board);

	/**
	 * 댓글 삭제
	 * @param parseInt 삭제할 리뷰번호
	 */
	public void deleteReply(int parseInt);

	/**
	 * 게시글 삭제
	 * @param board 삭제할 게시글 번호
	 */
	public void deleteBoard(Board board);
	
	/**
	 * 댓글 페이징 객체 생성
	 * @param paramData curPage를 저장하고있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getCommentPaging(Paging paramData, Board board);

	/**
	 * 식물 추천 정보 입력
	 * @param goods
	 * @param file
	 */
	public void plantInfowrite(DailyPlant dailyPlant,  MultipartFile file);
}
