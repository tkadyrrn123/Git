package com.kh.www.myPage.model.vo;

import java.sql.Date;

public class MyBoard {
	private int boardNo;
	private String boardTitle;
	private Date createDate;
	private int free;
	private int market;
	private int club;
	private int clubNotice;
	private String cName;
	private String type;
	public MyBoard() {}
	public MyBoard(int boardNo, String boardTitle, Date createDate, int free, int market, int club, int clubNotice,
			String type) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.createDate = createDate;
		this.free = free;
		this.market = market;
		this.club = club;
		this.clubNotice = clubNotice;
		this.type = type;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	@Override
	public String toString() {
		return "MyBoard [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", createDate=" + createDate + ", free="
				+ free + ", market=" + market + ", club=" + club + ", clubNotice=" + clubNotice + ", type=" + type
				+ "]";
	}
}
