package com.kh.www.Member.model.vo;

public class LevelCount {
	private int lv1;
	private int lv2;
	
	public LevelCount() {}

	public LevelCount(int lv1, int lv2) {
		super();
		this.lv1 = lv1;
		this.lv2 = lv2;
	}

	public int getLv1() {
		return lv1;
	}

	public void setLv1(int lv1) {
		this.lv1 = lv1;
	}

	public int getLv2() {
		return lv2;
	}

	public void setLv2(int lv2) {
		this.lv2 = lv2;
	}

	@Override
	public String toString() {
		return "LevelCount [lv1=" + lv1 + ", lv2=" + lv2 + "]";
	}
	
}
