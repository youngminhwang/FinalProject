package web.service.impl;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.ShopDao;
import web.dto.Cart;
import web.dto.CartList;
import web.dto.GoodsView;
import web.dto.Order;
import web.dto.OrderDetail;
import web.dto.OrderList;
import web.service.face.ShopService;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired ShopDao shopDao;

	//카테고리별 상품 리스트
	@Override
	public List<GoodsView> list(int cateCode, int level) {
		
		return shopDao.list_2(cateCode);

	}

	//상품 상세조회
	@Override
	public GoodsView goodsView(int gdsNum) {
		
		return shopDao.goodsView(gdsNum);
	}

	//장바구니 담기
	@Override
	public void addCart(Cart cart) {
		shopDao.addCart(cart);
	}

	//장바구니 목록
	@Override
	public List<CartList> cartList(int member_no) {		
		return shopDao.cartList(member_no);
	}

	//장바구니 삭제
	@Override
	public void deleteCart(Cart cart) {
		shopDao.deleteCart(cart);
	}

	//장바구니 수량 변경
	@Override
	public void updateCart(Cart cart) {
		shopDao.updateCart(cart);
	}

	//장바구니에 담을 상품이 중복인지 체크
	@Override
	public int selectCart(Cart cart) {
		
		int result = shopDao.selectCart(cart);
		
		return result;
	}

	//주문 정보
	@Override
	public void orderInfo(Order order) {
		shopDao.orderInfo(order);
	}

	//주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetail orderDetail) {
		shopDao.orderInfo_Details(orderDetail);
	}
	
	//주문 번호 만들기
	public String makeOrderId() {
		
		 Calendar cal = Calendar.getInstance();
		 int year = cal.get(Calendar.YEAR);
		 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		 String subNum = "";
		 
		 for(int i = 1; i <= 6; i ++) {
		  subNum += (int)(Math.random() * 10);
		 }
		 
		 String orderId = ymd + "_" + subNum;
		 
		 return orderId;
	}

	//주문 완료되면 장바구니 비우기
	@Override
	public void cartAllDelete(int memberNo) {
		shopDao.cartAllDelete(memberNo);		
	}

	//주문 목록
	@Override
	public List<OrderList> orderList(Order order) {
		
		return shopDao.orderList(order);
	}

	//주문 상세 목록
	@Override
	public List<OrderList> orderView(Order order) {
		
		return shopDao.orderView(order);
	}

	//주문 카운트
	@Override
	public int countOrder(Order order) {
		
		return shopDao.countOrder(order);
	}

	

}
