package com.kh.www.club.model.vo;

public class Club {
	private String clubName;
	private int boardNo;
	private String clubIntro;
	private String clubPlan;
	private String clubPlace;
	private String clubEtc;
	private int maxPeople;
	private String endYn;
	
	public Club() {}

	public Club(String clubName, int boardNo, String clubIntro, String clubPlan, String clubPlace, String clubEtc,
			int maxPeople, String endYn) {
		super();
		this.clubName = clubName;
		this.boardNo = boardNo;
		this.clubIntro = clubIntro;
		this.clubPlan = clubPlan;
		this.clubPlace = clubPlace;
		this.clubEtc = clubEtc;
		this.maxPeople = maxPeople;
		this.endYn = endYn;
	}

	public String getClubName() {
		return clubName;
	}

	public void setClubName(String clubName) {
		this.clubName = clubName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getClubIntro() {
		return clubIntro;
	}

	public void setClubIntro(String clubIntro) {
		this.clubIntro = clubIntro;
	}

	public String getClubPlan() {
		return clubPlan;
	}

	public void setClubPlan(String clubPlan) {
		this.clubPlan = clubPlan;
	}

	public String getClubPlace() {
		return clubPlace;
	}

	public void setClubPlace(String clubPlace) {
		this.clubPlace = clubPlace;
	}

	public String getClubEtc() {
		return clubEtc;
	}

	public void setClubEtc(String clubEtc) {
		this.clubEtc = clubEtc;
	}

	public int getMaxPeople() {
		return maxPeople;
	}

	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}

	public String getEndYn() {
		return endYn;
	}

	public void setEndYn(String endYn) {
		this.endYn = endYn;
	}

	@Override
	public String toString() {
		return "Club [clubName=" + clubName + ", boardNo=" + boardNo + ", clubIntro=" + clubIntro + ", clubPlan="
				+ clubPlan + ", clubPlace=" + clubPlace + ", clubEtc=" + clubEtc + ", maxPeople=" + maxPeople
				+ ", deleteYn=" + ", endYn=" + endYn + "]";
	}
	
	
	
	
}
