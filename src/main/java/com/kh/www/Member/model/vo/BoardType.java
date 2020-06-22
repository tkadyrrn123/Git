package com.kh.www.Member.model.vo;

import java.sql.Date;

public class BoardType {
	private int bId;
	private String title;
	private Date createDate;
	private String writer;
	private int count;
	private int free;
	private int market;
	private int club;
	private int clubNotice;
	private String type;
	private String delete;
	
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getFree() {
		return free;
	}
	public void setFree(int free) {
		this.free = free;
	}
	public int getMarket() {
		return market;
	}
	public void setMarket(int market) {
		this.market = market;
	}
	public int getClub() {
		return club;
	}
	public void setClub(int club) {
		this.club = club;
	}
	public int getClubNotice() {
		return clubNotice;
	}
	public void setClubNotice(int clubNotice) {
		this.clubNotice = clubNotice;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDelete() {
		return delete;
	}
	public void setDelete(String delete) {
		this.delete = delete;
	}
	@Override
	public String toString() {
		return "BoardType [bId=" + bId + ", title=" + title + ", createDate=" + createDate + ", writer=" + writer
				+ ", count=" + count + ", free=" + free + ", market=" + market + ", club=" + club + ", clubNotice="
				+ clubNotice + ", type=" + type + ", delete=" + delete + "]";
	}
	
	
}
