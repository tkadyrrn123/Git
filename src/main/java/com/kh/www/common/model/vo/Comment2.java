package com.kh.www.common.model.vo;

import java.sql.Date;

public class Comment2 {
	private int rrNo; //게시글 번호
	private int rNo; //댓글번호
	private String rUserId; //댓글 작성자 Id
	private String rContent;//댓글내용
	private Date rCreateDate; //댓글 생성 날짜
	private String rDecYN;//신고여부
	private String rState;//댓글 상태
	
	private String nickname;//유저테이블 닉네임
	private String userFile;//유저테이블 프로필 사진
	
	public Comment2() {}

	public Comment2(int rrNo, int rNo, String rUserId, String rContent, Date rCreateDate, String rDecYN, String rState,
			String nickname, String userFile) {
		super();
		this.rrNo = rrNo;
		this.rNo = rNo;
		this.rUserId = rUserId;
		this.rContent = rContent;
		this.rCreateDate = rCreateDate;
		this.rDecYN = rDecYN;
		this.rState = rState;
		this.nickname = nickname;
		this.userFile = userFile;
	}

	public int getRrNo() {
		return rrNo;
	}

	public void setRrNo(int rrNo) {
		this.rrNo = rrNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
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

	@Override
	public String toString() {
		return "Comment2 [rrNo=" + rrNo + ", rNo=" + rNo + ", rUserId=" + rUserId + ", rContent=" + rContent
				+ ", rCreateDate=" + rCreateDate + ", rDecYN=" + rDecYN + ", rState=" + rState + ", nickname="
				+ nickname + ", userFile=" + userFile + "]";
	}

	
}
