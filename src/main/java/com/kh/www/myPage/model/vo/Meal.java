package com.kh.www.myPage.model.vo;

import java.sql.Date;

public class Meal {
	private String userId;
	private Date rDate;
	private String rTime;
	private String rOption;
	public Meal() {
		// TODO Auto-generated constructor stub
	}
	public Meal(String userId, Date rDate, String rTime, String rOption) {
		super();
		this.userId = userId;
		this.rDate = rDate;
		this.rTime = rTime;
		this.rOption = rOption;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public String getrTime() {
		return rTime;
	}
	public void setrTime(String rTime) {
		this.rTime = rTime;
	}
	public String getrOption() {
		return rOption;
	}
	public void setrOption(String rOption) {
		this.rOption = rOption;
	}
	@Override
	public String toString() {
		return "Meal [userId=" + userId + ", rDate=" + rDate + ", rTime=" + rTime + ", rOption=" + rOption + "]";
	}
	
}
