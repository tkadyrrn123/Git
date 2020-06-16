package com.kh.www.myPage.model.vo;

import java.sql.Date;

public class MyComment {
	private int replyNo;
	private int boardNo;
	private String replyContent;
	private Date commentDate;
	public MyComment() {}
	public MyComment(int replyNo, int boardNo, String replyContent, Date commentDate) {
		super();
		this.replyNo = replyNo;
		this.boardNo = boardNo;
		this.replyContent = replyContent;
		this.commentDate = commentDate;
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
	@Override
	public String toString() {
		return "MyComment [replyNo=" + replyNo + ", boardNo=" + boardNo + ", replyContent=" + replyContent
				+ ", commentDate=" + commentDate + "]";
	}
	
	
}
