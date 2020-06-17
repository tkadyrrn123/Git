package com.kh.www.Notice.model.vo;

import java.sql.Date;

public class Notice {
	private int nNo; //공지사항 번호
	// 단지는 여기 필요없음.. 나 이해 못했음 근오한테 물어보기~
	private String userId; //공지사항 작성자
	private String nTitle; //공지사항 제목
	private String nContent; //공지사항 내용
	private int nCount; //조회수
	private Date nCreateDate; //공지사항 작성일
	private Date nModifyDate; //공지사항 수정일
	private String nStatus; //게시글 상태
	private String originalFileName; //오리지널 첨부파일 
	private String renameFileName; //리네이밍 첨부파일- nuploadFiles 폴더로 들어감
	
	private String noticeNickname;//유저테이블 닉네임
	private String noticeFile;//유저테이블 프로필 사진
	
	private String nTotal; //전체검색 키워드
	private String nDong; // 관리자 동 키워드
	private String aptName; //아파트이름
	
	public Notice() {}

	public Notice(int nNo, String userId, String nTitle, String nContent, int nCount, Date nCreateDate,
			Date nModifyDate, String nStatus, String originalFileName, String renameFileName) {
		super();
		this.nNo = nNo;
		this.userId = userId;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nCount = nCount;
		this.nCreateDate = nCreateDate;
		this.nModifyDate = nModifyDate;
		this.nStatus = nStatus;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
	}
	
	public Notice(int nNo, String userId, String nTitle, String nContent, int nCount, Date nCreateDate,
			Date nModifyDate, String nStatus, String originalFileName, String renameFileName, String noticeNickname,
			String noticeFile) {
		super();
		this.nNo = nNo;
		this.userId = userId;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nCount = nCount;
		this.nCreateDate = nCreateDate;
		this.nModifyDate = nModifyDate;
		this.nStatus = nStatus;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.noticeNickname = noticeNickname;
		this.noticeFile = noticeFile;
	}
	
	public Notice(String userId, String nTitle, String nContent, String nTotal, String nDong, String aptName) {
		super();
		this.userId = userId;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nTotal = nTotal;
		this.nDong = nDong;
		this.aptName = aptName;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	public Date getnCreateDate() {
		return nCreateDate;
	}

	public void setnCreateDate(Date nCreateDate) {
		this.nCreateDate = nCreateDate;
	}

	public Date getnModifyDate() {
		return nModifyDate;
	}

	public void setnModifyDate(Date nModifyDate) {
		this.nModifyDate = nModifyDate;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
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

	public String getNoticeNickname() {
		return noticeNickname;
	}

	public void setNoticeNickname(String noticeNickname) {
		this.noticeNickname = noticeNickname;
	}

	public String getNoticeFile() {
		return noticeFile;
	}

	public void setNoticeFile(String noticeFile) {
		this.noticeFile = noticeFile;
	}

	public String getnTotal() {
		return nTotal;
	}

	public void setnTotal(String nTotal) {
		this.nTotal = nTotal;
	}

	public String getnDong() {
		return nDong;
	}

	public void setnDong(String nDong) {
		this.nDong = nDong;
	}

	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	@Override
	public String toString() {
		return "Notice [nNo=" + nNo + ", userId=" + userId + ", nTitle=" + nTitle + ", nContent=" + nContent
				+ ", nCount=" + nCount + ", nCreateDate=" + nCreateDate + ", nModifyDate=" + nModifyDate + ", nStatus="
				+ nStatus + ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName
				+ ", noticeNickname=" + noticeNickname + ", noticeFile=" + noticeFile + ", nTotal=" + nTotal
				+ ", nDong=" + nDong + ", aptName=" + aptName + "]";
	}

}
