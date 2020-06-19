package com.kh.www.Vote.model.vo;

public class VChoice {
	private int vcId;
	private int vId;
	private String vcName;

	public VChoice() {}

	public VChoice(int vId, String vcName) {
		super();
		this.vId = vId;
		this.vcName = vcName;
	}

	public VChoice(int vcId, int vId, String vcName) {
		super();
		this.vcId = vcId;
		this.vId = vId;
		this.vcName = vcName;
	}

	public int getVcId() {
		return vcId;
	}

	public void setVcId(int vcId) {
		this.vcId = vcId;
	}

	public int getvId() {
		return vId;
	}

	public void setvId(int vId) {
		this.vId = vId;
	}

	public String getVcName() {
		return vcName;
	}

	public void setVcName(String vcName) {
		this.vcName = vcName;
	}

	@Override
	public String toString() {
		return "VChoise [vcId=" + vcId + ", vId=" + vId + ", vcName=" + vcName + "]";
	}

}
