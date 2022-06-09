package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.AdminDao;
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

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired private AdminDao adminDao;
	@Autowired private ServletContext context;
	private static final Logger logger = LoggerFactory.getLogger(AdminService.class);
	
	//카테고리
	@Override
	public List<Category> category() {
		
		return adminDao.category();
	}

	//상품등록
	@Override
	public void register(Goods goods, MultipartFile[] file) {
		
		logger.info("update() - File");

		String[] filename = new String[file.length];
		File[] dest = new File[file.length];
		
		for (int i = 0; i < file.length; i++) {

			if (file[0].getSize() <= 0) {
				logger.info("파일 크기가 0 이하, 처리 중단");

				return; // 더이상 진행 안되게 막기
			}

			// 파일이 저장될 경로(RealPath)
			String storedPath = context.getRealPath("upload");
			logger.info("upload realPath: {}", storedPath);

			// upload폴더가 존재하지 않으면 생성한다
			File storedFolder = new File(storedPath);
			if (!storedFolder.exists()) {
				storedFolder.mkdir();
			}


			// 저장될 파일의 이름 지정하기
			filename[i] = file[i].getOriginalFilename(); // 원본파일명
			filename[i] += UUID.randomUUID().toString().split("-")[4]; // UUID추가
			logger.info("filename : {}", filename[i]);


			// 최종 저장할 파일의 정보 객체
			dest[i] = new File(storedFolder, filename[i]);
			logger.info("dest[i] : {}", dest[i]);

			// 업로드된 파일을 저장하기
			try {
				file[i].transferTo(dest[i]);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
						
		}
		
		goods.setImgOriginName(file[0].getOriginalFilename());
		goods.setImgStoredName(filename[0]);
		
		goods.setImgOriginName2(file[1].getOriginalFilename());
		goods.setImgStoredName2(filename[1]);
		
		logger.info("굿즈굿즈굿즈 : {}", goods);
		
		adminDao.register(goods);
	}
	
    @Override
    public Paging getGoodsPaging(Paging paramData) {
        
        //총 게시글 수 조회
        int totalCount = adminDao.selectProductCntAll(paramData);
        
        //페이징 계산
        Paging paging = new Paging(totalCount, paramData.getCurPage());
        
        paging.setSearch(paramData.getSearch());
        paging.setSearchOpt(paramData.getSearchOpt());
        
        System.out.println(paging);

        return paging;
    }

	//상품목록
	@Override
    public List<GoodsView> goodsList(Paging paging) {
		
        return adminDao.goodsList(paging);
	}

	//상품조회 + 카테고리 조인
	@Override
	public GoodsView goodsView(int gdsNum) {
		
		return adminDao.goodsView(gdsNum);
	}

	// 상품 수정
	@Override
	public void goodsUpdate(GoodsView goods, MultipartFile[] file) {

		logger.info("update() - File");
		
		String[] filename = new String[file.length];
		File[] dest = new File[file.length];

		for (int i = 0; i < file.length; i++) {

			if (file[i].getSize() <= 0) {
				logger.info("파일 크기가 0 이하, 처리 중단");

				return; // 더이상 진행 안되게 막기
			}

			// 파일이 저장될 경로(RealPath)
			String storedPath = context.getRealPath("upload");
			logger.info("upload realPath: {}", storedPath);

			// upload폴더가 존재하지 않으면 생성한다
			File storedFolder = new File(storedPath);
			if (!storedFolder.exists()) {
				storedFolder.mkdir();
			}


			// 저장될 파일의 이름 지정하기
			filename[i] = file[i].getOriginalFilename(); // 원본파일명
			filename[i] += UUID.randomUUID().toString().split("-")[4]; // UUID추가
			logger.info("filename : {}", filename[0]);


			// 최종 저장할 파일의 정보 객체
			dest[i] = new File(storedFolder, filename[i]);

			// 업로드된 파일을 저장하기
			try {
				file[i].transferTo(dest[i]);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

		}
		
		goods.setImgOriginName(file[0].getOriginalFilename());
		goods.setImgStoredName(filename[0]);
		goods.setImgOriginName2(file[1].getOriginalFilename());
		goods.setImgStoredName2(filename[1]);

		adminDao.goodsUpdate(goods);
	}

	//상품 수정
	public void goodsUpdate(GoodsView goods) {
		adminDao.goodsUpdate(goods);	
	}

	//상품 삭제
	@Override
	public void goodsDelete(Goods goods) {
		adminDao.goodsDelete(goods);
	}
	
	//주문 목록
	@Override
	public List<OrderList> orderList(Order order) {

		return adminDao.orderList(order);
	}

	//주문 상세 목록
	@Override
	public List<OrderList> orderView(Order order) {

		return adminDao.orderView(order);
	}
	
	//주문 상태 변경
	@Override
	public void delivery(Order order) {
		adminDao.delivery(order);
	}
	
	//상품 수량 조절
	@Override
	public void changeStock(Goods goods) {
		adminDao.changeStock(goods);
		
	}

	//----------------------------------------
	//관리자 로그인
	@Override
	public int adminLogin(Admin admin) {
		
		return adminDao.selectCntByadmin(admin);
	}

	@Override
	public List<Member> getMemberList(Paging paging) {
		return adminDao.selectMemberList(paging);
	}

	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = adminDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		paging.setSearch(paramData.getSearch());
		paging.setSearchOpt(paramData.getSearchOpt());
		
		System.out.println(paging);

		return paging;
	}

	@Override
	public Member getMember(Member member) {
		return adminDao.selectBymemeberNo(member);
	}

	@Override
	public int updateMember(Member member) {
		if(member!=null) {
			return adminDao.updateBymember(member);
		}
		return 0;
	}

	@Override
	public int deleteMember(Member member) {
		if(member!=null) {
			return adminDao.deleteBymember(member);
		}
		return 0;
	}

	@Override
	public List<Board> getBoardList(Paging paging, Board board) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("board", board);
		return adminDao.selectBoardList(map);
	}

	@Override
	public Paging getboardPaging(Paging paramData, Board board) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("paramData", paramData);
		map.put("board", board);
		
		logger.info("ServiceImpe-paramData:{}",paramData);
		//총 게시글 수 조회
		int totalCount = adminDao.selectCntBoardAll(map);
				
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		if(paramData.getSearch()!=null) {
			paging.setSearch(paramData.getSearch());
			paging.setSearchOpt(paramData.getSearchOpt());
		}
		
		System.out.println(paging);

		return paging;
	}

	@Override
	public Board getBoardDetail(Board board) {
		return adminDao.selectBoardNo(board);
	}

	@Override
	public int getBoardFileCnt(Board board) {
		return adminDao.selectBoardFileCntByBoardNo(board);
	}
	
	@Override
	public List<BoardFile> getBoardFile(Board board) {
		return adminDao.selectBoardFileByBoardNo(board);
	}
	
	@Override
	public int getBoardReplyCnt(Board board) {
		return adminDao.selectReplyCntByBoardNo(board);
	}
	
	@Override
	public List<Reply> getReply(Paging paging, Board board) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("board", board);
		return adminDao.selectRelyByBoardNo(map);
	}
	
	@Override
	public void deleteReply(int parseInt) {
		//댓글 삭제
		adminDao.deleteByReviewNo(parseInt);
	}
	
	@Override
	public void deleteBoard(Board board) {
		
		//파일이랑 댓글이 있으면 먼저 삭제하고 게시글 삭제한다
		if(adminDao.selectReplyCntByBoardNo(board)>0) {
			adminDao.deleteReviewByBoardNo(board);
		}
		if(adminDao.selectBoardFileCntByBoardNo(board)>0) {
			adminDao.deleteFileByBoardNo(board);
		}
		
		//게시글 삭제
		adminDao.deleteBoardByBoardNo(board);
	}
	
	@Override
	public Paging getCommentPaging(Paging paramData, Board board) {
		
		//총 댓글 수 조회
		int totalCount = adminDao.selectReplyCntByBoardNo(board);
				
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
				
		System.out.println(paging);

		return paging;
	}

	@Override
	public void plantInfowrite(DailyPlant dailyPlant, MultipartFile file) {
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
	
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일 정보 객체
		File dest = new File(storedFolder, storedName);
	
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		
		//-----------------------------------------------------
		dailyPlant.setImgOriginName(originName);
		dailyPlant.setImgStoredName(storedName);
		
		adminDao.dailyPlantInsert(dailyPlant);
	}

}

