package com.kh.www.myPage.model.vo;

import java.sql.Date;

public class REQnA {
	private int QNAREId;
	private int QNAId;
	private String QNATitle;
	private String QNAContent;
	private String userId;
	private Date QNADate;
	private String deleteYN;

	public REQnA(int qNAREId, int qNAId, String qNATitle, String qNAContent, String userId, Date qNADate,
			String deleteYN) {
		super();
		QNAREId = qNAREId;
		QNAId = qNAId;
		QNATitle = qNATitle;
		QNAContent = qNAContent;
		this.userId = userId;
		QNADate = qNADate;
		this.deleteYN = deleteYN;
	}

	public REQnA(int qNAId, String qNATitle, String qNAContent, String userId) {
		super();
		QNAId = qNAId;
		QNATitle = qNATitle;
		QNAContent = qNAContent;
		this.userId = userId;
	}

	public int getQNAREId() {
		return QNAREId;
	}

	public void setQNAREId(int qNAREId) {
		QNAREId = qNAREId;
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

	public String getDeleteYN() {
		return deleteYN;
	}

	public void setDeleteYN(String deleteYN) {
		this.deleteYN = deleteYN;
	}

	@Override
	public String toString() {
		return "REQnA [QNAREId=" + QNAREId + ", QNAId=" + QNAId + ", QNATitle=" + QNATitle + ", QNAContent="
				+ QNAContent + ", userId=" + userId + ", QNADate=" + QNADate + ", deleteYN=" + deleteYN + "]";
	}

}
