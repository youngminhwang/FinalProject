package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.sf.json.JSONArray;
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
import web.service.face.AdminService;
import web.util.Paging;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired AdminService adminService;
	
	private Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	//메인
	@RequestMapping(value = "/index")
	public void adminIndex() {}
	
	//카테고리분류
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void goodsRegister(Model model) {
		logger.info("/admin/goods/register [GET]");
		
		List<Category> category = adminService.category();
		
		//카테고리를 JSON타입으로 변환 후 모델값 전달
		model.addAttribute("category", JSONArray.fromObject(category));
		
		logger.info("category : {}", category);
	}
	
	//상품등록
	@Transactional
	@RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	public String goodsRegisterProc(Goods goods, @RequestParam("file") MultipartFile[] file) {
	
		logger.info("file : {}", file[0]);
		logger.info("file : {}", file[1]);
		
		adminService.register(goods, file);
		
		logger.info("goods : {}", goods);
		
		return "redirect:/admin/index";
	}
	
	//상품목록
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public void goodsList(Paging paramData, Model model) {
		
        Paging paging = adminService.getGoodsPaging( paramData );
		logger.info("{}", paging);
		
		//회원 리스트 가져오기
		List<GoodsView> list = adminService.goodsList(paging);
		
		//model값 전달
		model.addAttribute("paging", paging);        
		model.addAttribute("list", list);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	//상품 상세조회
	@RequestMapping(value = "/goods/view", method = RequestMethod.GET)
	public void goodsView(@RequestParam("n") int gdsNum, Model model) {
		
		GoodsView goods = adminService.goodsView(gdsNum);
		
		model.addAttribute("goods", goods);
	}
	
	//상품 수정 GET
	@RequestMapping(value = "/goods/update", method = RequestMethod.GET)
	public void goodsUpdate(@RequestParam("n")int gdsNum, Model model) {
		
		GoodsView goods = adminService.goodsView(gdsNum);
		logger.info("goods : {}", goods);
		model.addAttribute("goods", goods);
		
		List<Category> category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		
	}
	
	//상품 수정 POST
	@Transactional
	@RequestMapping(value = "/goods/update", method = RequestMethod.POST)
	public String goodsUpdateProc(GoodsView goods, MultipartFile[] file) {
		
		logger.info("/admin/goods/update [POST]");
		logger.info("goods : {}", goods);
		
		adminService.goodsUpdate(goods, file);
		
		return "redirect:/admin/goods/list";
	
	}
	
	//상품 삭제
	@Transactional
	@RequestMapping(value = "/goods/delete", method = RequestMethod.GET)
	public String goodsDelete(Goods goods) {
		
		adminService.goodsDelete(goods);
		
		return "redirect:/admin/goods/list";
	}
	
	//주문 목록
	@RequestMapping(value = "/goods/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, Order order, Model model) {
		
		List<OrderList> orderList = adminService.orderList(order);
		
		model.addAttribute("orderList", orderList);
	}
	
	//주문 상세 목록
	@RequestMapping(value = "/goods/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, @RequestParam("n") String orderId, Order order, Model model) {
		
		order.setOrderId(orderId);
		
		List<OrderList> orderView = adminService.orderView(order);
		
		model.addAttribute("orderView", orderView);
	}
	
	// 주문 상세 목록 - 상태 변경
	@Transactional
	@RequestMapping(value = "/goods/orderView", method = RequestMethod.POST)
	public String delivery(Order order) {
	   
	 adminService.delivery(order);
	 
	 List<OrderList> orderView = adminService.orderView(order);
	 Goods goods = new Goods();
	 
	 for(OrderList i : orderView) {
		 goods.setGdsNum(i.getGdsNum());
		 goods.setGdsStock(i.getCartStock());
		 adminService.changeStock(goods);
	 }

	 return "redirect:/admin/goods/orderView?n=" + order.getOrderId();
	}
	
	
	//--------------------------------------------------------------------
	
	//관리자 로그인 페이지로 이동
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public void adminLogin() {}
	
	//관리자 로그인 처리
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String adminLoginProcess(Admin admin,HttpSession session) {
		logger.info("관리자페이지 접속 환영, admin: {}",admin);
		
		int res;
		
		if(admin!=null) {
			res = adminService.adminLogin(admin);
			if(res>0) {
				session.setAttribute("adminid", admin.getAdminId());
				session.setAttribute("adminlogin", true);
				System.out.println();
			}else {
				session.invalidate();
				return "/admin/member/login";
			}
		}else {
			return "/admin/member/login";
		}
		
		return "redirect:/admin/index";
	}//adminLoginProcess
	
	//관리자 로그아웃
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String adminLogout(HttpSession session) {
		
		session.invalidate();
		
		return "/admin/index";
	}

	//관리자 에러페이지
	@RequestMapping(value="/error")
	public void adminError() {}
	
	//--------------------------------------------------------------------
	
	//회원리스트
	@RequestMapping(value="/member/list")
	public void adminMemberList(Paging paramData, Model model) {
		logger.info("paramdata: {}", paramData);
		//페이징 계산
		Paging paging = adminService.getPaging( paramData );
		logger.info("{}", paging);
		
		//회원 리스트 가져오기
		List<Member> memberinfo = adminService.getMemberList(paging);
		
		logger.info("memberinfo: {}",memberinfo);
		
		model.addAttribute("memberinfo", memberinfo);
		model.addAttribute("paging", paging);
		
	}//list
	
	//회원상세보기
	@RequestMapping(value="/member/detail")
	public void adminMemberDetail(Member member,Model model) {
		logger.info("adminMemberDetail 접속");
		logger.info("member: {}",member);
		
		//상세보기
		member = adminService.getMember(member);
		
		model.addAttribute("member", member);
		
	}//detail
	
	//회원수정
	@RequestMapping(value="/member/update", method=RequestMethod.GET)
	public void adminMemberUpdate(Member member, Model model) {
		logger.info("adminMemberUpdate get");
		logger.info("member: {}",member);
		
		//상세보기
		member = adminService.getMember(member);
		
		model.addAttribute("member", member);
	}//update get
	
	//회원수정처리
	@RequestMapping(value="/member/update", method=RequestMethod.POST)
	public String adminMemberUpdateProcess(Member member) {
		logger.info("adminMemberUpdate post");
		logger.info("member: {}",member);
		
		int res = adminService.updateMember(member);
		
		if(res>0) {
			//상세보기 화면으로 이동
			return "redirect:/admin/member/detail?memberNo="+member.getMemberNo();
			
		}else {			
			//실패면 수정화면 유지
			return "redirect:/admin/member/update?memberNo="+member.getMemberNo();
		}
		
	}//update post

	//회원삭제
	@RequestMapping(value="/member/delete", method=RequestMethod.GET)
	public String adminMemberDelete(Member member) {
		logger.info("adminMemberDelete 접속");
		logger.info("member: {}",member);
		
		int res = adminService.deleteMember(member);
		if(res>0) {
			//성공시 리스트로 이동
			return "redirect:/admin/member/list";
			
		}else {			
			//실패면 상세화면 유지
			return "redirect:/admin/member/detail?memberNo="+member.getMemberNo();
		}
	}

	//--------------------------------------------------------------------
	
	//게시판 리스트
	@RequestMapping(value="/board/list")
	public void adminBoardList(Paging paramData, Model model, Board board) {
		
		logger.info("paramdata: {}", paramData);
		//페이징 계산
		Paging paging = adminService.getboardPaging( paramData, board );
		logger.info("{}", paging);
		
		//게시판 리스트 가져오기
		List<Board> boardinfo = adminService.getBoardList(paging, board);
		
		logger.info("paging: {}",paging);
		
		
		model.addAttribute("boardinfo", boardinfo);
		model.addAttribute("paging", paging);
		
		logger.info("paging2: {}",paging);
		model.addAttribute("cateno", board.getCateno());

	}
	
	//게시글 상세보기
	@RequestMapping(value="/board/detail")
	public String adminBoardDetail(Paging paramData,Board board, Model model) {
		
		logger.info("/admin/board/detail 접속");
		logger.info("boardno:{}", board);
		
		if(board.getBoardno()<1) {
			return "redirect:/admin/board/list";
		}
		
		
		//해당 boardno의 게시글 정보 가져오기
		Board boardinfo = adminService.getBoardDetail(board);
		
		//첨부파일이 있으면 가져오기
		if(adminService.getBoardFileCnt(board)>0) {
			List<BoardFile> boardFile = adminService.getBoardFile(board);
			model.addAttribute("boardFile", boardFile);
		}
		
		//댓글이 있으면 가져오기
		if(adminService.getBoardReplyCnt(board)>0) {
			Paging paging = adminService.getCommentPaging( paramData, board );
			
			//게시판 리스트 가져오기
			List<Reply> reply = adminService.getReply(paging,board);
			model.addAttribute("reply", reply);
			model.addAttribute("paging", paging);
		}
		
		model.addAttribute("boardinfo", boardinfo);
		return null;
		
	}
	
	//게시글 삭제
	@RequestMapping(value="/board/delete")
	public String adminBoardDelete(Board board, String cateno) {
		logger.info("adminBoardDelete[접속]");
		
		adminService.deleteBoard(board);
		
		return "redirect:/admin/board/list?cateno="+cateno;
	}
	
	//게시글의 댓글 삭제
	@RequestMapping(value="/comment/delete")
	public String adminCommentDel(String replyNo, String boardNo) {
		logger.info("/comment/delete[접속]");
		logger.info("boardno:{}",boardNo);
		logger.info("replyno:{}",replyNo);
		
		if(Integer.parseInt(boardNo)<1) {
			return "redirect:/admin/board/detail?boardno="+boardNo;
		} 
			
		//댓글 삭제
		adminService.deleteReply(Integer.parseInt(replyNo));
		 
		logger.info("boardno2:{}",boardNo);
		return "redirect:/admin/board/detail?boardno="+boardNo;
	}
	
	//메인페이지 식물추천 글쓰기
	@RequestMapping(value = "/plant/insert", method = RequestMethod.GET)
	public void plantInfoInsertView() {}
	
	//식물추천 insert
	@Transactional
	@RequestMapping(value = "/plant/insert", method = RequestMethod.POST)
	public String plantInfoInsert(DailyPlant dailyPlant, MultipartFile file) {
		adminService.plantInfowrite(dailyPlant, file);
		return "redirect:/admin/index";
	}

}

