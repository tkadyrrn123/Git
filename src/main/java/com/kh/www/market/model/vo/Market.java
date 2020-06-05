package com.kh.www.market.model.vo;

import java.sql.Date;

public class Market {
	private int boardNo;
	private int price;
	private char saleStatus;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private String userId;
	private int boardCount;
	private char boardStatus;
	private String fileName;
	public Market() {}

	public Market(int boardNo, int price, String boardTitle, String boardContent, Date createDate, String userId,
			int boardCount, char saleStatus, char boardStatus, String fileName) {
		super();
		this.boardNo = boardNo;
		this.price = price;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.userId = userId;
		this.boardCount = boardCount;
		this.saleStatus = saleStatus;
		this.boardStatus = boardStatus;
		this.fileName = fileName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public char getSaleStatus() {
		return saleStatus;
	}

	public void setSaleStatus(char saleStatus) {
		this.saleStatus = saleStatus;
	}

	public char getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(char boardStatus) {
		this.boardStatus = boardStatus;
	}
	
	public char getFileName() {
		return boardStatus;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "Market [boardNo=" + boardNo + ", price=" + price + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", createDate=" + createDate + ", userId=" + userId + ", boardCount=" + boardCount
				+ ", saleStatus=" + saleStatus + ", boardStatus=" + boardStatus + ", fileName=" + fileName + "]";
	}
	
}
