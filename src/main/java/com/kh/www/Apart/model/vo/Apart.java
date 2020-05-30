package com.kh.www.Apart.model.vo;

public class Apart {
	private String id;
	private String name;
	private String dong;
	private String address;
	private String tel;
	private String accept;
	private String delete;
	private String about;
	
	public Apart() {}
	
	public Apart(String name, String dong, String address, String tel) {
		super();
		this.name = name;
		this.dong = dong;
		this.address = address;
		this.tel = tel;
	}

	public Apart(String id, String name, String dong, String address, String tel, String accept, String delete,
			String about) {
		super();
		this.id = id;
		this.name = name;
		this.dong = dong;
		this.address = address;
		this.tel = tel;
		this.accept = accept;
		this.delete = delete;
		this.about = about;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAccept() {
		return accept;
	}

	public void setAccept(String accept) {
		this.accept = accept;
	}

	public String getDelete() {
		return delete;
	}

	public void setDelete(String delete) {
		this.delete = delete;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	@Override
	public String toString() {
		return "Apart [id=" + id + ", name=" + name + ", dong=" + dong + ", address=" + address + ", tel=" + tel
				+ ", accept=" + accept + ", delete=" + delete + ", about=" + about + "]";
	}
	
	
	
	
}
