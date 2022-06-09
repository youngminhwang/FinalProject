package web.dto;

public class Recommend {
	
	private String id;
	private int boardno;
	
	
	@Override
	public String toString() {
		return "Recommend [id=" + id + ", boardno=" + boardno + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	
	
	

}
