package web.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.GardenDao;
import web.dto.Garden;
import web.service.face.GardenService;
import web.util.Paging;

@Service
public class GardenServiceImpl implements GardenService{
	
	@Autowired
	private GardenDao gardenDao;
	
	@Override
	public int getGardenNo(Garden garden) {
		return gardenDao.selectByGardenName(garden);
	}
	
	@Override
	public int listCnt(int gardenNo) {
		return gardenDao.selectCntByGardenNo(gardenNo);
	}

	@Override
	public List<HashMap<String, Object>> list(Paging paging, int gardenNo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("gardenNo", gardenNo);
		map.put("paging", paging);
		return gardenDao.selectListAll(map);
	}

	@Override
	public int getMemberNo(String id) {
		return gardenDao.selectNumByMemberId(id);
	}

	@Override
	public int write(Garden garden) {
		if(garden!=null) {
			return gardenDao.insertReview(garden);
		}
		return 0;
	}

	@Override
	public int delete(Garden garden) {
		if(garden!=null) {
			return gardenDao.deleteReview(garden);
		}
		return 0;
	}

	@Override
	public int update(Garden garden) {
		if(garden!=null) {
			return gardenDao.updateReview(garden);
		}
		return 0;
	}

	@Override
	public Paging getPaging(Paging paramData, int gardenNo) {
		//총 게시글 수 조회
		int totalCount = gardenDao.selectCntByGardenNo(gardenNo);
				
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());

		return paging;
	}
	

	

	

}
