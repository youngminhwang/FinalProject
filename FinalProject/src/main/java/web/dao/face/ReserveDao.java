package web.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import web.dto.GardenPriceDto;
import web.dto.ReserveInfo;

public interface ReserveDao {
	
	
	/**
	 * DB에 저장된 수목원 목록을 조회한다.
	 * 
	 * @return 수목원 목록이 담긴 list 객체
	 * */
	public List<String> getGardenNameList();


	/**
	 * 해당 수목원의 가격을 조회한다.
	 * @param garden 
	 * 
	 * @return 수목원 목록이 담긴 list 객체
	 * */
	public GardenPriceDto getGardenPrice(String garden);

	/**
	 * 예약 내역을 저장한다. 
	 * @param 예약 내역이 들어있는 DTO
	 * */
	public void saveResInfo(ReserveInfo info);

	/**
	 * 예약 번호를 불러온다. 
	 * @param 예약한 사람의 유저번호
	 * @return 
	 * */
	public int getReserveNo(int memberNo);

	/**
	 * 예약 내역을 불러온다
	 * @param 예약번호
	 * @return 예약내역 DTO*/
	public ReserveInfo getResInfo(int resNo);

	/**
	 * 생성된 QR코드 이미지 경로를 예약정보DTO내에 추가로 저장한다. 
	 * @param resNo 
	 * @param qrImgName qr코드 이미지 이름
	 * @param resNo 예약번호
	 * */
	public void saveQrName(Map map);

	/**
	 * 예약 내역을 수정(업데이트)
	 * @param resNo 예약번호
	 * 		  info 수정된 예약내역
	 * */
	public void updateResInfo(ReserveInfo info);

	/**
	 * QR코드 이미지 이름을 수정(업데이트)
	 * @param 예약번호(int) , qr이름 (String) 이 요소로 있는 MAP객체
	 * */

	public void updateResInfo(HashMap<String, Object> map);


	






}


