package com.kh.www.Vote.model.vo;

public class VKeyword {
	private String option;
	private String search;
	private String sOption;
	private String apt;
	public VKeyword() {}
	public VKeyword(String option, String search, String sOption, String apt) {
		super();
		this.option = option;
		this.search = search;
		this.sOption = sOption;
		this.apt = apt;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getsOption() {
		return sOption;
	}
	public void setsOption(String sOption) {
		this.sOption = sOption;
	}
	public String getApt() {
		return apt;
	}
	public void setApt(String apt) {
		this.apt = apt;
	}
	@Override
	public String toString() {
		return "VKeyword [option=" + option + ", search=" + search + ", sOption=" + sOption + ", apt=" + apt + "]";
	}
	
	
	
}
