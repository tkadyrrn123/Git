package com.kh.www.myPage.model.vo;

import java.sql.Date;

public class MyComment {
	private int replyNo;
	private int boardNo;
	private int noticeNo;
	private int voteId;
	private String replyContent;
	private Date commentDate;
	private String type;
	private String cName;
	public MyComment() {}
	public MyComment(int replyNo, int boardNo, int noticeNo, int voteId, String replyContent, Date commentDate,
			String type) {
		super();
		this.replyNo = replyNo;
		this.boardNo = boardNo;
		this.noticeNo = noticeNo;
		this.voteId = voteId;
		this.replyContent = replyContent;
		this.commentDate = commentDate;
		this.type = type;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
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
	public int getVoteId() {
		return voteId;
	}
	public void setVoteId(int voteId) {
		this.voteId = voteId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
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
		return "MyComment [replyNo=" + replyNo + ", boardNo=" + boardNo + ", noticeNo=" + noticeNo + ", voteId="
				+ voteId + ", replyContent=" + replyContent + ", commentDate=" + commentDate + ", type=" + type + "]";
	}

}
