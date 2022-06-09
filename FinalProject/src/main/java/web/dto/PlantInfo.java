package web.dto;

public class PlantInfo {
	//컨텐츠 번호(결과 존재 여부확인)
	private String No;
	//식물학 명
	private String plntbneNm;
	//식물영 명
	private String plntzrNm;
	//유통 명
	private String distbNm;
	//과 명
	private String fmlCodeNm;
	//원산지 정보
	private String orgplceInfo;
	//성장 높이 정보
	private String growthHgInfo;
	//성장 넓이 정보
	private String growthAraInfo;
	//생장속도 코드명
	private String grwtveCodeNm;
	//생육 온도 코드명
	private String grwhTpCodeNm;
	//겨울 최저 온도 코드명
	private String winterLwetTpCodeNm;
	//습도 코드명
	private String hdCodeNm;
	//비료 정보
	private String frtlzrInfo;
	//토양 정보
	private String soilInfo;
	//물주기 봄 코드명
	private String watercycleSprngCodeNm;
	//물주기 여름 코드명
	private String watercycleSummerCodeNm;
	//물주기 가을 코드명
	private String watercycleAutumnCodeNm;
	//물주기 겨울 코드명
	private String watercycleWinterCodeNm;
	//병충해 관리 정보
	private String dlthtsManageInfo;
	//특별관리 정보
	private String speclmanageInfo;
	//기능성 정보
	private String fncltyInfo;
	//광요구도 코드명
	private String lighttdemanddoCodeNm;
	
	
	
	@Override
	public String toString() {
		return "PlantInfo [No=" + No + ", plntbneNm=" + plntbneNm + ", plntzrNm=" + plntzrNm + ", distbNm=" + distbNm
				+ ", fmlCodeNm=" + fmlCodeNm + ", orgplceInfo=" + orgplceInfo + ", growthHgInfo=" + growthHgInfo
				+ ", growthAraInfo=" + growthAraInfo + ", grwtveCodeNm=" + grwtveCodeNm + ", grwhTpCodeNm="
				+ grwhTpCodeNm + ", winterLwetTpCodeNm=" + winterLwetTpCodeNm + ", hdCodeNm=" + hdCodeNm
				+ ", frtlzrInfo=" + frtlzrInfo + ", soilInfo=" + soilInfo + ", watercycleSprngCodeNm="
				+ watercycleSprngCodeNm + ", watercycleSummerCodeNm=" + watercycleSummerCodeNm
				+ ", watercycleAutumnCodeNm=" + watercycleAutumnCodeNm + ", watercycleWinterCodeNm="
				+ watercycleWinterCodeNm + ", dlthtsManageInfo=" + dlthtsManageInfo + ", speclmanageInfo="
				+ speclmanageInfo + ", fncltyInfo=" + fncltyInfo + ", lighttdemanddoCodeNm=" + lighttdemanddoCodeNm
				+ "]";
	}
	public String getNo() {
		return No;
	}
	public void setNo(String no) {
		No = no;
	}
	public String getPlntbneNm() {
		return plntbneNm;
	}
	public void setPlntbneNm(String plntbneNm) {
		this.plntbneNm = plntbneNm;
	}
	public String getPlntzrNm() {
		return plntzrNm;
	}
	public void setPlntzrNm(String plntzrNm) {
		this.plntzrNm = plntzrNm;
	}
	public String getDistbNm() {
		return distbNm;
	}
	public void setDistbNm(String distbNm) {
		this.distbNm = distbNm;
	}
	public String getFmlCodeNm() {
		return fmlCodeNm;
	}
	public void setFmlCodeNm(String fmlCodeNm) {
		this.fmlCodeNm = fmlCodeNm;
	}
	public String getOrgplceInfo() {
		return orgplceInfo;
	}
	public void setOrgplceInfo(String orgplceInfo) {
		this.orgplceInfo = orgplceInfo;
	}
	public String getGrowthHgInfo() {
		return growthHgInfo;
	}
	public void setGrowthHgInfo(String growthHgInfo) {
		this.growthHgInfo = growthHgInfo;
	}
	public String getGrowthAraInfo() {
		return growthAraInfo;
	}
	public void setGrowthAraInfo(String growthAraInfo) {
		this.growthAraInfo = growthAraInfo;
	}
	public String getGrwtveCodeNm() {
		return grwtveCodeNm;
	}
	public void setGrwtveCodeNm(String grwtveCodeNm) {
		this.grwtveCodeNm = grwtveCodeNm;
	}
	public String getGrwhTpCodeNm() {
		return grwhTpCodeNm;
	}
	public void setGrwhTpCodeNm(String grwhTpCodeNm) {
		this.grwhTpCodeNm = grwhTpCodeNm;
	}
	public String getWinterLwetTpCodeNm() {
		return winterLwetTpCodeNm;
	}
	public void setWinterLwetTpCodeNm(String winterLwetTpCodeNm) {
		this.winterLwetTpCodeNm = winterLwetTpCodeNm;
	}
	public String getHdCodeNm() {
		return hdCodeNm;
	}
	public void setHdCodeNm(String hdCodeNm) {
		this.hdCodeNm = hdCodeNm;
	}
	public String getFrtlzrInfo() {
		return frtlzrInfo;
	}
	public void setFrtlzrInfo(String frtlzrInfo) {
		this.frtlzrInfo = frtlzrInfo;
	}
	public String getSoilInfo() {
		return soilInfo;
	}
	public void setSoilInfo(String soilInfo) {
		this.soilInfo = soilInfo;
	}
	public String getWatercycleSprngCodeNm() {
		return watercycleSprngCodeNm;
	}
	public void setWatercycleSprngCodeNm(String watercycleSprngCodeNm) {
		this.watercycleSprngCodeNm = watercycleSprngCodeNm;
	}
	public String getWatercycleSummerCodeNm() {
		return watercycleSummerCodeNm;
	}
	public void setWatercycleSummerCodeNm(String watercycleSummerCodeNm) {
		this.watercycleSummerCodeNm = watercycleSummerCodeNm;
	}
	public String getWatercycleAutumnCodeNm() {
		return watercycleAutumnCodeNm;
	}
	public void setWatercycleAutumnCodeNm(String watercycleAutumnCodeNm) {
		this.watercycleAutumnCodeNm = watercycleAutumnCodeNm;
	}
	public String getWatercycleWinterCodeNm() {
		return watercycleWinterCodeNm;
	}
	public void setWatercycleWinterCodeNm(String watercycleWinterCodeNm) {
		this.watercycleWinterCodeNm = watercycleWinterCodeNm;
	}
	public String getDlthtsManageInfo() {
		return dlthtsManageInfo;
	}
	public void setDlthtsManageInfo(String dlthtsManageInfo) {
		this.dlthtsManageInfo = dlthtsManageInfo;
	}
	public String getSpeclmanageInfo() {
		return speclmanageInfo;
	}
	public void setSpeclmanageInfo(String speclmanageInfo) {
		this.speclmanageInfo = speclmanageInfo;
	}
	public String getFncltyInfo() {
		return fncltyInfo;
	}
	public void setFncltyInfo(String fncltyInfo) {
		this.fncltyInfo = fncltyInfo;
	}
	public String getLighttdemanddoCodeNm() {
		return lighttdemanddoCodeNm;
	}
	public void setLighttdemanddoCodeNm(String lighttdemanddoCodeNm) {
		this.lighttdemanddoCodeNm = lighttdemanddoCodeNm;
	}
	
}