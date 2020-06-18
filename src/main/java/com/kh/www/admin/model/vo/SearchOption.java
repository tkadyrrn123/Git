package com.kh.www.admin.model.vo;

public class SearchOption {
	private String userId;
	private String nickName;
	private String userName;
	private String phone;
	private String email;
	private String aptName;
	private String address;
	
	public SearchOption() {}

	public SearchOption(String userId, String nickName, String userName, String phone, String email, String aptName,
			String address) {
		super();
		this.userId = userId;
		this.nickName = nickName;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.aptName = aptName;
		this.address = address;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "SearchOption [userId=" + userId + ", nickName=" + nickName + ", userName=" + userName + ", phone="
				+ phone + ", email=" + email + ", aptName=" + aptName + ", address=" + address + "]";
	}

	
	
}
