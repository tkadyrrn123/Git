package com.kh.www.freeBoard.model.vo;

import java.sql.Date;

public class FreeBoard {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private String userId;
	private int boardCount;
	private String boardDelete;
	
	private int fileNo;
	private String fileName;
	
	private String userName;
	private String nickname;
	private String userFile;
	private String userLevel;
	
	
	
	public FreeBoard() {}

	
	
	public FreeBoard(int boardNo, String boardTitle, String boardContent, Date createDate, int boardCount,
			String nickname, String userFile) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.boardCount = boardCount;
		this.nickname = nickname;
		this.userFile = userFile;
	}

	public FreeBoard(int boardNo, String boardTitle, String boardContent, Date createDate, String userId,
			int boardCount, String boardDelete, int fileNo, String fileName) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.userId = userId;
		this.boardCount = boardCount;
		this.boardDelete = boardDelete;
		this.fileNo = fileNo;
		this.fileName = fileName;
	}
	
	public FreeBoard(int boardNo, String boardTitle, String boardContent, Date createDate, String userId,
			int boardCount, String boardDelete, int fileNo, String fileName, String userName, String nickname,
			String userFile, String userLevel) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.userId = userId;
		this.boardCount = boardCount;
		this.boardDelete = boardDelete;
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.userName = userName;
		this.nickname = nickname;
		this.userFile = userFile;
		this.userLevel = userLevel;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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
		return "FreeBoard [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", createDate=" + createDate + ", userId=" + userId + ", boardCount=" + boardCount + ", boardDelete="
				+ boardDelete + ", fileNo=" + fileNo + ", fileName=" + fileName + ", userName=" + userName
				+ ", nickname=" + nickname + ", userFile=" + userFile + ", userLevel=" + userLevel + "]";
	}


}
