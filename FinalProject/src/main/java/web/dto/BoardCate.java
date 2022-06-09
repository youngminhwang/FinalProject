package web.dto;

public class BoardCate {
	
	private int cateno;
	private String catename;
	
	
	@Override
	public String toString() {
		return "BoardCate [cateno=" + cateno + ", catename=" + catename + "]";
	}
	public int getCateno() {
		return cateno;
	}
	public void setCateno(int cateno) {
		this.cateno = cateno;
	}
	public String getCatename() {
		return catename;
	}
	public void setCatename(String catename) {
		this.catename = catename;
	}

	
	
	
}
