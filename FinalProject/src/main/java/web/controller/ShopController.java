package web.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Cart;
import web.dto.CartList;
import web.dto.GoodsView;
import web.dto.Member;
import web.dto.Order;
import web.dto.OrderDetail;
import web.dto.OrderList;
import web.service.face.ShopService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	@Autowired ShopService shopService;
	
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	//상품 홈
	@RequestMapping(value = "/home")
	public void home() {}
	
	//상품 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(@RequestParam("c") int cateCode,
						@RequestParam("L") int level, Model model) {
		logger.info("/shop/list [GET]");
		
		logger.info("cateCode : {}", cateCode);
		logger.info("level : {}", level);
		
		List<GoodsView> list = shopService.list(cateCode, level);
		
		model.addAttribute("list", list);
		
	}
	
	//상품 상세조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("n") int gdsNum, Model model) {
		
		GoodsView view = shopService.goodsView(gdsNum);
		model.addAttribute("view", view);
	}
	
	//카트 담기
	@Transactional
	@ResponseBody
	@RequestMapping(value = "/view/addCart",method = RequestMethod.POST)
	public int addCart(Cart cart, HttpSession session) throws Exception {
		
		//로그인 되어있는 지 체크
		int result = 0;
		
		if(session.getAttribute("memberNo") != null && !"".equals(session.getAttribute("memberNo"))) {
			
			int memberNo = (Integer)session.getAttribute("memberNo");
			logger.info("memberNo : {}", memberNo);
			
			if(memberNo != 0) {
				
				cart.setMemberNo(memberNo);
				
				if(shopService.selectCart(cart) >= 1) {
					result = 2;
					
				} else {
					
					cart.setMemberNo(memberNo);
					shopService.addCart(cart);
					result = 1;
				}
			}
		} 
		
		
		return result;
	}
	
	//카트 목록
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public String getCartList(HttpSession session, Model model, HttpServletResponse response) {
		
		if(session.getAttribute("memberNo") != null && !"".equals(session.getAttribute("memberNo"))) {
		
			int memberNo = (Integer)session.getAttribute("memberNo");
			
			logger.info("memberNo : {}", memberNo);
		
			List<CartList> cartList = shopService.cartList(memberNo);
		
			logger.info("cartList : {}", cartList );
		
			model.addAttribute("cartList", cartList);
			
			Member member = new Member();
			member.setName((String)session.getAttribute("name"));
			member.setEmail((String)session.getAttribute("email"));
			member.setPhone((String)session.getAttribute("phone"));
			member.setAddr1((String)session.getAttribute("addr1"));
			member.setAddr2((String)session.getAttribute("addr2"));
			member.setAddr3((String)session.getAttribute("addr3"));
			
			model.addAttribute("member", member);
			
			return "/shop/cartList";
		
		} else {
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out;
			try {
				out = response.getWriter();
				
				out.println("<script>alert('로그인이 필요한 서비스입니다.'); location.href='/member/login';</script>");
				
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return null;
		}
	}
	
	//카트 삭제
	@Transactional
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session,
							@RequestParam(value = "chbox[]") List<String> chArr, Cart cart) {
		
		int memberNo = (Integer)session.getAttribute("memberNo");
		
		int result = 0;
		int cartNum = 0;
		
		if(memberNo != 0) {
			cart.setMemberNo(memberNo);
			
			for(String i : chArr) {
				//jsp에서 String으로 넘어온 배열을 Integer(cartNum타입)로 형변환
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				shopService.deleteCart(cart);
			}
			result = 1;
		}
		
		return result;
	}
	
	//카트 수량 변경
	@Transactional
	@ResponseBody
	@RequestMapping(value = "/updateCart", method = RequestMethod.POST)
	public int updateCart(HttpSession session, 
						@RequestParam(value = "cartStock") int cartStock, 
						@RequestParam(value = "cartNum") int cartNum, Cart cart) {
		
		int memberNo = (Integer)session.getAttribute("memberNo");
		
		int result = 0;
//		int cartNum = 0;
//		int cartStock = 0;
		
		if(memberNo != 0) {
			/* cart.setMember_no(memberNo); */
			

				cart.setCartNum(cartNum);
				cart.setCartStock(cartStock);
				shopService.updateCart(cart);	
			

			result = 1;
		}
		
		return result;
	}
	
	//주문
	@Transactional
	@RequestMapping(value = "/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, Order order, OrderDetail orderDetail, HttpServletResponse response) {
		
		
		if(session.getAttribute("memberNo") != null && !"".equals(session.getAttribute("memberNo"))) {
			
			int memberNo = (Integer)session.getAttribute("memberNo");
			
			order.setMemberNo(memberNo);
			orderDetail.setMemberNo(memberNo);
			
			String orderId = shopService.makeOrderId();
			
			order.setOrderId(orderId);
			shopService.orderInfo(order);
			
			orderDetail.setOrderId(orderId);
			shopService.orderInfo_Details(orderDetail);
			
			shopService.cartAllDelete(memberNo);
			
			
			return "redirect:/shop/orderList";
		
		} else {
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out;
			try {
				out = response.getWriter();
				
				out.println("<script>alert('로그인이 필요한 서비스입니다.'); location.href='/member/login';</script>");
				
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return null;
		}
		
	}
	
	//주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, Order order, Model model) {
		
		int memberNo = (Integer)session.getAttribute("memberNo");
		
		order.setMemberNo(memberNo);
		
		List<OrderList> orderList = shopService.orderList(order);
		
		model.addAttribute("orderList", orderList);
	}
	
	//주문 상세 목록
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, @RequestParam("n") String orderId, Order order, Model model) {
		
		int memberNo = (Integer)session.getAttribute("memberNo");
		
		order.setMemberNo(memberNo);
		order.setOrderId(orderId);
		
		List<OrderList> orderView = shopService.orderView(order);
		
		model.addAttribute("orderView", orderView);
	}
	
//	//주문 취소
////	@Transactional
////	@ResponseBody
//	@RequestMapping(value = "/shop/cancelPay", method = RequestMethod.POST)
//	public String cancelPayment(HttpSession session, Order order, Model model) {
//		
//		
//		int memberNo = (Integer)session.getAttribute("memberNo");
//		order.setMemberNo(memberNo);
//		
//		//토큰 발급 작업
//		
//		HttpURLConnection conn = null;
//		String access_token = null; // 발급받을 액세스 토큰
//		try {
//			URL url = new URL("https://api.iamport.kr/users/getToken");
//			conn = (HttpURLConnection)url.openConnection();
//			
//			//요청방식 : POST
//			conn.setRequestMethod("POST");
//			
//			//Header 설정(application/json 형식으로 데이터를 전송)
//			conn.setRequestProperty("Content-Type", "application/json");
//			conn.setRequestProperty("Accept", "application/json");
//			//conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
//			
//			//Data 설정
//			conn.setDoOutput(true); //OutputStream으로 POST 데이터를 넘겨주겠다는 옵션
//			
//			//서버로 보낼 데이터 JSON 형태로 변환(imp_apikey, imp_secret)
//			JSONObject obj = new JSONObject();
//			obj.put("imp_key", "0642048779903770");
//			obj.put("imp_secret", "a534e9d69b1714ebf2a92a0ee0c4932e6b1f21acd478eefb0ceb62bc0b428bbc1dd69cfa94f9828b");
//			
//			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
//			bw.write(obj.toString());
//			bw.flush();
//			bw.close();
//			
//			
//			
//			int responseCode = conn.getResponseCode(); //응답 코드 받기
//			logger.info("응답 코드 : {}", responseCode); //응답 코드 확인
//			
//			if(responseCode == 200) { //성공
//				logger.info("환불 성공!!!!!!!!!");
//				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//				StringBuilder sb = new StringBuilder();
//				String line = null;
//				while((line = br.readLine()) != null) {
//					sb.append(line + "\n");
//				}
//				br.close();
//				logger.info("" + sb.toString());
//				
//				//	1. JSONParser 라이브러리 -> JSON 형태로 되어있는 데이터들 중 원하는 것을 추출하기 위해 사용
//				JSONParser jsonParser = new JSONParser();
//				
//				try {
//					//	2. Json데이터를 JSON 객체 형태로 변환
//					JSONObject jsonObj = (JSONObject)jsonParser.parse(sb.toString());
//
//					//	3.응답(Response)데이터를 가져옴
//					JSONObject responseData = (JSONObject)jsonObj.get("response");
//					
//					//	4. 응답 데이터 중에서 Key가 access_token Value 값을 가져옴
//					access_token = (String)responseData.get("access_token");
//					
//					logger.info("access_token : {}", access_token);
//					
//					
//				} catch (ParseException e) {
//					e.printStackTrace();
//				}
//				
//			} else { //실패
//				logger.info("환불 실패 응답 코드 : {}", conn.getResponseMessage());	//환불 실패시 정수값 0 반환(응답코드 400, 404.. 등)	
//			}
//			
//			
//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	
//		model.addAttribute("access_token", access_token);
//		
//		return "shop/orderView";
//		
//		
//	}
	
	
}
