package web.dto;

import java.util.Date;

public class Board {
	
	private int boardno;
	private String btitle;
	private String bcontent;
	private String id;
	private String nick;
	private int hit;
	private Date bdate;
	private int cateno;
	
	
	
	@Override
	public String toString() {
		return "Board [boardno=" + boardno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", id=" + id + ", nick="
				+ nick + ", hit=" + hit + ", bdate=" + bdate + ", cateno=" + cateno + "]";
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public int getCateno() {
		return cateno;
	}
	public void setCateno(int cateno) {
		this.cateno = cateno;
	}
	
	
	

}
