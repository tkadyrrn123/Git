package com.kh.www.Member.model.vo;

public class MemberCount {
	private int allMember;
	private int accept;
	private int disaccept;
	private int delete;
	
	public MemberCount() {}

	public int getAllMember() {
		return allMember;
	}
	
	public MemberCount(int allMember, int accept, int delete, int disaccept) {
		super();
		this.allMember = allMember;
		this.accept = accept;
		this.delete = delete;
		this.disaccept = disaccept;
	}

	public void setAllMember(int allMember) {
		this.allMember = allMember;
	}

	public int getAccept() {
		return accept;
	}

	public void setAccept(int accept) {
		this.accept = accept;
	}

	public int getDelete() {
		return delete;
	}

	public void setDelete(int delete) {
		this.delete = delete;
	}

	public int getDisaccept() {
		return disaccept;
	}

	public void setDisaccept(int disaccept) {
		this.disaccept = disaccept;
	}

	@Override
	public String toString() {
		return "MemberCount [allMember=" + allMember + ", accept=" + accept + ", delete=" + delete + ", disaccept="
				+ disaccept + ", getAllMember()=" + getAllMember() + ", getAccept()=" + getAccept() + ", getDelete()="
				+ getDelete() + ", getDisaccept()=" + getDisaccept() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
