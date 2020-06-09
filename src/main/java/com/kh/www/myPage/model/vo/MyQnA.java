package com.kh.www.myPage.model.vo;

import java.sql.Date;

public class MyQnA {
	private int QNAId;
	private String QNATitle;
	private String QNAContent;
	private String userId;
	private Date QNADate;
	private String QNAFileName;
	private String deleteYN;
	public MyQnA() {}
	
	public MyQnA(String userId, String qNATitle, String qNAContent) {
		super();
		QNATitle = qNATitle;
		QNAContent = qNAContent;
		this.userId = userId;
	}

	public MyQnA(int qNAId, String qNATitle, String qNAContent, String userId, Date qNADate, String qNAFileName,
			String deleteYN) {
		super();
		QNAId = qNAId;
		QNATitle = qNATitle;
		QNAContent = qNAContent;
		this.userId = userId;
		QNADate = qNADate;
		QNAFileName = qNAFileName;
		this.deleteYN = deleteYN;
	}

	public int getQNAId() {
		return QNAId;
	}

	public void setQNAId(int qNAId) {
		QNAId = qNAId;
	}

	public String getQNATitle() {
		return QNATitle;
	}

	public void setQNATitle(String qNATitle) {
		QNATitle = qNATitle;
	}

	public String getQNAContent() {
		return QNAContent;
	}

	public void setQNAContent(String qNAContent) {
		QNAContent = qNAContent;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getQNADate() {
		return QNADate;
	}

	public void setQNADate(Date qNADate) {
		QNADate = qNADate;
	}

	public String getQNAFileName() {
		return QNAFileName;
	}

	public void setQNAFileName(String qNAFileName) {
		QNAFileName = qNAFileName;
	}

	public String getDeleteYN() {
		return deleteYN;
	}

	public void setDeleteYN(String deleteYN) {
		this.deleteYN = deleteYN;
	}

	@Override
	public String toString() {
		return "MyQnA [QNAId=" + QNAId + ", QNATitle=" + QNATitle + ", QNAContent=" + QNAContent + ", userId=" + userId
				+ ", QNADate=" + QNADate + ", QNAFileName=" + QNAFileName + ", deleteYN=" + deleteYN + "]";
	}

	
	
}
