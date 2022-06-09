package web.dto;

public class PlantSum {
	
	private String bname;
	private String plname;
	private String sort;
	private String home;
	private String clevel;
	private String glevel;
	
	@Override
	public String toString() {
		return "PlantSum [bname=" + bname + ", plname=" + plname + ", sort=" + sort + ", home=" + home + ", clevel="
				+ clevel + ", glevel=" + glevel + "]";
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getPlname() {
		return plname;
	}

	public void setPlname(String plname) {
		this.plname = plname;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	public String getClevel() {
		return clevel;
	}

	public void setClevel(String clevel) {
		this.clevel = clevel;
	}

	public String getGlevel() {
		return glevel;
	}

	public void setGlevel(String glevel) {
		this.glevel = glevel;
	}
	
}