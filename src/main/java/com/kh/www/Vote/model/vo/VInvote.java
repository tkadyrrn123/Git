package com.kh.www.Vote.model.vo;

public class VInvote {
	private String userId;
	private int vcId;
	public VInvote() {}
	public VInvote(String userId, int vcId) {
		super();
		this.userId = userId;
		this.vcId = vcId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getVcId() {
		return vcId;
	}
	public void setVcId(int vcId) {
		this.vcId = vcId;
	}
	@Override
	public String toString() {
		return "VInvote [userId=" + userId + ", vcId=" + vcId + "]";
	}
	
}
