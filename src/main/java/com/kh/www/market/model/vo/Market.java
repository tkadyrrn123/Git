package com.kh.www.market.model.vo;

import java.sql.Date;

public class Market {
	private int boardNo;
	private int price;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private String userId;
	private int boardCount;
	private String boardDelete;
	private char saleStatus;
	
	private int fileNo;
	private String fileName;
	
	private String nickName;
	private String userFile;
	private String userLevel;
	
	public Market() {}

	public Market(int boardNo, int price, String boardTitle, String boardContent, Date createDate, String userId,
			int boardCount, String boardDelete, char saleStatus, int fileNo, String fileName, String nickName,
			String userFile, String userLevel) {
		super();
		this.boardNo = boardNo;
		this.price = price;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.userId = userId;
		this.boardCount = boardCount;
		this.boardDelete = boardDelete;
		this.saleStatus = saleStatus;
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.nickName = nickName;
		this.userFile = userFile;
		this.userLevel = userLevel;
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

	public String getBoardDelete() {
		return boardDelete;
	}

	public void setBoardDelete(String boardDelete) {
		this.boardDelete = boardDelete;
	}

	public char getSaleStatus() {
		return saleStatus;
	}

	public void setSaleStatus(char saleStatus) {
		this.saleStatus = saleStatus;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getUserFile() {
		return userFile;
	}

	public void setUserFile(String userFile) {
		this.userFile = userFile;
	}

	public String getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}

	@Override
	public String toString() {
		return "Market [boardNo=" + boardNo + ", price=" + price + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", createDate=" + createDate + ", userId=" + userId + ", boardCount=" + boardCount
				+ ", boardDelete=" + boardDelete + ", saleStatus=" + saleStatus + ", fileNo=" + fileNo + ", fileName="
				+ fileName + ", nickName=" + nickName + ", userFile=" + userFile + ", userLevel=" + userLevel + "]";
	}

	
}
