package web.service.face;

import java.util.List;

import web.dto.Cart;
import web.dto.CartList;
import web.dto.GoodsView;
import web.dto.Order;
import web.dto.OrderDetail;
import web.dto.OrderList;

public interface ShopService {

	/**
	 * 카테고리별 상품 리스트 목록 조회
	 * 
	 * @param cateCode - 1차 카테고리
	 * @param level - 1:1차 카테고리만 있음, 2:2차 카테고리까지 있음
	 * @return 상품 리스트
	 */
	public List<GoodsView> list(int cateCode, int level);
	
	/**
	 * 상품 상세조회 + 카테고리 조인
	 * 
	 * @param gdsNum - 상세보기 하려는 상품 번호
	 * @return - 상품 정보
	 */
	public GoodsView goodsView(int gdsNum);
	
	/**
	 * 장바구니 추가
	 * 
	 * @param cart - 장바구니에 담길 객체
	 */
	public void addCart(Cart cart);
	
	/**
	 * 장바구니 목록
	 * 
	 * @param id - 장바구니 담는 회원
	 * @return 장바구니 목록
	 */
	public List<CartList> cartList(int member_no);
	
	/**
	 * 장바구니 삭제
	 * 
	 * @param cart - 삭제할 장바구니
	 */
	public void deleteCart(Cart cart);

	/**
	 * 장바구니 수량 변경
	 * 
	 * @param cart - 수량 변경할 장바구니
	 */
	public void updateCart(Cart cart);
	
	/**
	 * 장바구니에 담을 상품이 중복되어 담기는 지 체크
	 * 
	 * @param cart - 장바구니
	 * @return int - 1이면 중복, 0이면 중복아님
	 */
	public int selectCart(Cart cart);
	
	/**
	 * 주문 정보
	 * 
	 * @param order - 주문 정보 DTO
	 */
	public void orderInfo(Order order);
	
	/**
	 * 주문 상세 정보
	 * 
	 * @param orderDetail - 주문 상세 정보 DTO
	 */
	public void orderInfo_Details(OrderDetail orderDetail);
	
	/**
	 * 주문 번호 만들기
	 * 
	 * @return - 주문 번호
	 */
	public String makeOrderId();
	
	/**
	 * 주문이 완료되면 장바구니 비우기
	 * 
	 * @param memberNo - 멤버 번호
	 */
	public void cartAllDelete(int memberNo);
	
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
	 * 주문 취소 전, 주문 확인
	 * 
	 * @param order - 확인할 주문 DTO
	 * @return 1 : 주문O, 0 : 주문X
	 */
	public int countOrder(Order order);
}
