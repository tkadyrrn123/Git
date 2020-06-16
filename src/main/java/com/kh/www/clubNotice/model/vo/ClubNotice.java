package com.kh.www.clubNotice.model.vo;

import java.sql.Date;

public class ClubNotice {
	private int cnNo; //동호회 공지사항 번호
	private String clubName;// 동호회 이름
	private String userId; //동호회  공지사항 작성자
	private String cnTitle; //동호회  공지사항 제목
	private String cnContent; //동호회  공지사항 내용
	private int cnCount; //동호회  조회수
	private Date cnCreateDate; //동호회  공지사항 작성일
	private Date cnModifyDate; //동호회  공지사항 수정일
	private String cnStatus; //동호회  게시글 상태
	private String originalFileName; //오리지널 첨부파일 
	private String renameFileName; //리네이밍 첨부파일- nuploadFiles 폴더로 들어감
	
	private String cnoticeNickname;//유저테이블 닉네임
	private String cnoticeFile;//유저테이블 프로필 사진
	
	private String cnTotal; //전체검색 키워드
	
	public ClubNotice() {}

	public ClubNotice(int cnNo, String clubName, String userId, String cnTitle, String cnContent, int cnCount,
			Date cnCreateDate, Date cnModifyDate, String cnStatus, String originalFileName, String renameFileName) {
		super();
		this.cnNo = cnNo;
		this.clubName = clubName;
		this.userId = userId;
		this.cnTitle = cnTitle;
		this.cnContent = cnContent;
		this.cnCount = cnCount;
		this.cnCreateDate = cnCreateDate;
		this.cnModifyDate = cnModifyDate;
		this.cnStatus = cnStatus;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
	}
	
	public ClubNotice(int cnNo, String clubName, String userId, String cnTitle, String cnContent, int cnCount,
			Date cnCreateDate, Date cnModifyDate, String cnStatus, String originalFileName, String renameFileName,
			String cnoticeNickname, String cnoticeFile) {
		super();
		this.cnNo = cnNo;
		this.clubName = clubName;
		this.userId = userId;
		this.cnTitle = cnTitle;
		this.cnContent = cnContent;
		this.cnCount = cnCount;
		this.cnCreateDate = cnCreateDate;
		this.cnModifyDate = cnModifyDate;
		this.cnStatus = cnStatus;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.cnoticeNickname = cnoticeNickname;
		this.cnoticeFile = cnoticeFile;
	}

	
	public ClubNotice(int cnNo, String clubName, String userId, String cnTitle, String cnContent, int cnCount,
			Date cnCreateDate, Date cnModifyDate, String cnStatus, String originalFileName, String renameFileName,
			String cnoticeNickname, String cnoticeFile, String cnTotal) {
		super();
		this.cnNo = cnNo;
		this.clubName = clubName;
		this.userId = userId;
		this.cnTitle = cnTitle;
		this.cnContent = cnContent;
		this.cnCount = cnCount;
		this.cnCreateDate = cnCreateDate;
		this.cnModifyDate = cnModifyDate;
		this.cnStatus = cnStatus;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.cnoticeNickname = cnoticeNickname;
		this.cnoticeFile = cnoticeFile;
		this.cnTotal = cnTotal;
	}

	public int getCnNo() {
		return cnNo;
	}

	public void setCnNo(int cnNo) {
		this.cnNo = cnNo;
	}

	public String getClubName() {
		return clubName;
	}

	public void setClubName(String clubName) {
		this.clubName = clubName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCnTitle() {
		return cnTitle;
	}

	public void setCnTitle(String cnTitle) {
		this.cnTitle = cnTitle;
	}

	public String getCnContent() {
		return cnContent;
	}

	public void setCnContent(String cnContent) {
		this.cnContent = cnContent;
	}

	public int getCnCount() {
		return cnCount;
	}

	public void setCnCount(int cnCount) {
		this.cnCount = cnCount;
	}

	public Date getCnCreateDate() {
		return cnCreateDate;
	}

	public void setCnCreateDate(Date cnCreateDate) {
		this.cnCreateDate = cnCreateDate;
	}

	public Date getCnModifyDate() {
		return cnModifyDate;
	}

	public void setCnModifyDate(Date cnModifyDate) {
		this.cnModifyDate = cnModifyDate;
	}

	public String getCnStatus() {
		return cnStatus;
	}

	public void setCnStatus(String cnStatus) {
		this.cnStatus = cnStatus;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public String getCnoticeNickname() {
		return cnoticeNickname;
	}

	public void setCnoticeNickname(String cnoticeNickname) {
		this.cnoticeNickname = cnoticeNickname;
	}

	public String getCnoticeFile() {
		return cnoticeFile;
	}

	public void setCnoticeFile(String cnoticeFile) {
		this.cnoticeFile = cnoticeFile;
	}

	public String getCnTotal() {
		return cnTotal;
	}

	public void setCnTotal(String cnTotal) {
		this.cnTotal = cnTotal;
	}

	@Override
	public String toString() {
		return "ClubNotice [cnNo=" + cnNo + ", clubName=" + clubName + ", userId=" + userId + ", cnTitle=" + cnTitle
				+ ", cnContent=" + cnContent + ", cnCount=" + cnCount + ", cnCreateDate=" + cnCreateDate
				+ ", cnModifyDate=" + cnModifyDate + ", cnStatus=" + cnStatus + ", originalFileName=" + originalFileName
				+ ", renameFileName=" + renameFileName + ", cnoticeNickname=" + cnoticeNickname + ", cnoticeFile="
				+ cnoticeFile + ", cnTotal=" + cnTotal + "]";
	}

}
