package com.kh.www.Member.model.service;

import java.util.ArrayList;

import com.kh.www.Member.model.vo.LevelCount;
import com.kh.www.Member.model.vo.Member;
import com.kh.www.Member.model.vo.MemberCount;
import com.kh.www.admin.model.vo.SearchOption;
import com.kh.www.common.model.vo.PageInfo;

public interface MemberService {

	int dupid(String id);

	int InsertMember(Member m);

	Member Login(String id);

	ArrayList<Integer> newCount();

	MemberCount memberCount();

	ArrayList<Member> memberList();

	int dupNick(String nick);

	ArrayList<Member> memberAllList(PageInfo pi);
	//전체 리스트 count
	int getListCount();
	//버튼에 따라 달라지는 리스트 count
	int getListCount(int num);
	//버튼에 따른 회원 리스트
	ArrayList<Member> memberAllList(PageInfo pi, int num);
	//검색 회원 count
	int SearchListCount(SearchOption so, int num);
	//검색 회원 리스트
	ArrayList<Member> SearchList(PageInfo pi, SearchOption so, int num);
	//유저 레벨 별 카운트
	LevelCount levelCount();
	//승인 전체 count
	int AcceptListCount();
	//승인 전체 리스트
	ArrayList<Member> AcceptList(PageInfo pi);
	//승인 선택 리스트 count
	int AcceptSelectCount(int num);
	//승인 선택 리스트
	ArrayList<Member> AcceptSelectList(PageInfo pi, int num);
	//검색한 리스트 키운트
	int searchAcceptCount(SearchOption so, int num);
	//검색한 리스트
	ArrayList<Member> searchAcceptlist(PageInfo pi, SearchOption so, int num);
	//멤버 승인
	int MemberAccept(String[] chkId);
	//관리자 회원가입
	int InsertAdmin(Member m);
	//승인 삭제
	int MemberDelete(String[] chkId);
	//회원가입 카운트
	int createCount(String aptName);
	//아파트에 속한 총 회원수
	MemberCount AptMemberCount(String aptName);
	//아파트에 속한 회원 리스트 5건
	ArrayList<Member> AptMemberfiveList(String aptName);

}
