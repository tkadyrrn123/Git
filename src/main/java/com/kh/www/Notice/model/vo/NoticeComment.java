package com.kh.www.Notice.model.vo;

import java.sql.Date;

public class NoticeComment {
	private int rNo; //댓글번호
	private int noticeNo; //공지사항 번호
	private String rUserId; //회원Id
	private String rContent;//댓글내용
	private Date rCreateDate; //댓글 생성 날짜
	private String rDecYN;//신고여부
	private String rState;//댓글 상태
	
	public NoticeComment() {}

	public NoticeComment(int rNo, int noticeNo, String rUserId, String rContent, Date rCreateDate, String rDecYN,
			String rState) {
		super();
		this.rNo = rNo;
		this.noticeNo = noticeNo;
		this.rUserId = rUserId;
		this.rContent = rContent;
		this.rCreateDate = rCreateDate;
		this.rDecYN = rDecYN;
		this.rState = rState;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
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

	@Override
	public String toString() {
		return "NoticeComment [rNo=" + rNo + ", noticeNo=" + noticeNo + ", rUserId=" + rUserId + ", rContent="
				+ rContent + ", rCreateDate=" + rCreateDate + ", rDecYN=" + rDecYN + ", rState=" + rState + "]";
	}
	
}
