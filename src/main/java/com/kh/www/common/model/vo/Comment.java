package com.kh.www.common.model.vo;

import java.sql.Date;

public class Comment {
	private int rNo; //댓글번호
	private int boardNo; //게시글 번호
	private int noticeNo; //공지사항 번호
	private int voteId; // 투표 아이디
	private String rUserId; //댓글 작성자 Id
	private String rContent;//댓글내용
	private Date rCreateDate; //댓글 생성 날짜
	private String rDecYN;//신고여부
	private String rState;//댓글 상태
	
	private String nickname;//유저테이블 닉네임
	private String userFile;//유저테이블 프로필 사진
	
	public Comment() {}

	public Comment(int rNo, int boardNo, int noticeNo, String rUserId, String rContent, Date rCreateDate, String rDecYN,
			String rState) {
		super();
		this.rNo = rNo;
		this.boardNo = boardNo;
		this.noticeNo = noticeNo;
		this.rUserId = rUserId;
		this.rContent = rContent;
		this.rCreateDate = rCreateDate;
		this.rDecYN = rDecYN;
		this.rState = rState;
	}

	public Comment(int rNo, int boardNo, int noticeNo, String rUserId, String rContent, Date rCreateDate, String rDecYN,
			String rState, String nickname, String userFile) {
		super();
		this.rNo = rNo;
		this.boardNo = boardNo;
		this.noticeNo = noticeNo;
		this.rUserId = rUserId;
		this.rContent = rContent;
		this.rCreateDate = rCreateDate;
		this.rDecYN = rDecYN;
		this.rState = rState;
		this.nickname = nickname;
		this.userFile = userFile;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getrUserId() {
		return rUserId;
	}

	public void setrUserId(String rUserId) {
		this.rUserId = rUserId;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrCreateDate() {
		return rCreateDate;
	}

	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}

	public String getrDecYN() {
		return rDecYN;
	}

	public void setrDecYN(String rDecYN) {
		this.rDecYN = rDecYN;
	}

	public String getrState() {
		return rState;
	}

	public void setrState(String rState) {
		this.rState = rState;
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

	public int getVoteId() {
		return voteId;
	}

	public void setVoteId(int voteId) {
		this.voteId = voteId;
	}

	@Override
	public String toString() {
		return "Comment [rNo=" + rNo + ", boardNo=" + boardNo + ", noticeNo=" + noticeNo + ", rUserId=" + rUserId
				+ ", rContent=" + rContent + ", rCreateDate=" + rCreateDate + ", rDecYN=" + rDecYN + ", rState="
				+ rState + ", nickname=" + nickname + ", userFile=" + userFile + "]";
	}
	
}
