package com.kh.www.Vote.model.vo;

import java.sql.Date;

public class Vote {
	private int vId;
	private String userId;
	private String vName;
	private String vContent;
	private Date createDate;
	private Date endDate;
	private String overlapYN;
	private int vCount;
	public Vote() {}
	
	public Vote(String userId, String vName, String vContent, Date endDate, String overlapYN) {
		super();
		this.userId = userId;
		this.vName = vName;
		this.vContent = vContent;
		this.endDate = endDate;
		this.overlapYN = overlapYN;
	}

	public Vote(int vId, String userId, String vName, String vContent, Date createDate, Date endDate, String overlapYN,
			int vCount) {
		super();
		this.vId = vId;
		this.userId = userId;
		this.vName = vName;
		this.vContent = vContent;
		this.createDate = createDate;
		this.endDate = endDate;
		this.overlapYN = overlapYN;
		this.vCount = vCount;
	}

	public int getvId() {
		return vId;
	}

	public void setvId(int vId) {
		this.vId = vId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getvName() {
		return vName;
	}

	public void setvName(String vName) {
		this.vName = vName;
	}

	public String getvContent() {
		return vContent;
	}

	public void setvContent(String vContent) {
		this.vContent = vContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getOverlapYN() {
		return overlapYN;
	}

	public void setOverlapYN(String overlapYN) {
		this.overlapYN = overlapYN;
	}

	public int getvCount() {
		return vCount;
	}

	public void setvCount(int vCount) {
		this.vCount = vCount;
	}

	@Override
	public String toString() {
		return "Vote [vId=" + vId + ", userId=" + userId + ", vName=" + vName + ", vContent=" + vContent
				+ ", createDate=" + createDate + ", endDate=" + endDate + ", overlapYN=" + overlapYN + ", vCount="
				+ vCount + "]";
	}

}
