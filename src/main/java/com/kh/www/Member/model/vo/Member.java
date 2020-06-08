package com.kh.www.Member.model.vo;

import java.sql.Date;

public class Member {
	private String userId;
	private String userPwd;
	private String userName;
	private String nickName;
	private String phone;
	private String email;
	private String aptName;
	private String aptDong;
	private String aptHosu;
	private int userLevel;
	private String userFile;
	private Date createDate;
	private String ACCEPT;
	private String status;
	
	public Member() {}
	

	public Member(String userId, String userPwd, String userName, String nickName, String phone, String email,
			String aptName, String aptDong, String aptHosu, int userLevel, String userFile, Date createDate, String ACCEPT, String status) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.phone = phone;
		this.email = email;
		this.aptName = aptName;
		this.aptDong = aptDong;
		this.aptHosu = aptHosu;
		this.userLevel = userLevel;
		this.userFile = userFile;
		this.createDate = createDate;
		this.ACCEPT = ACCEPT;
		this.status = status;
	}


	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	public String getAptDong() {
		return aptDong;
	}

	public void setAptDong(String aptDong) {
		this.aptDong = aptDong;
	}

	public String getAptHosu() {
		return aptHosu;
	}

	public void setAptHosu(String aptHosu) {
		this.aptHosu = aptHosu;
	}

	public int getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}

	public String getUserFile() {
		return userFile;
	}

	public void setUserFile(String userFile) {
		this.userFile = userFile;
	}
	
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getACCEPT() {
		return ACCEPT;
	}

	public void setACCEPT(String aCCEPT) {
		ACCEPT = aCCEPT;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", nickName=" + nickName
				+ ", phone=" + phone + ", email=" + email + ", aptName=" + aptName + ", aptDong=" + aptDong
				+ ", aptHosu=" + aptHosu + ", userLevel=" + userLevel + ", userFile=" + userFile + ", createDate="
				+ createDate + ", ACCEPT=" + ACCEPT + ", status=" + status + "]";
	}
	
}
