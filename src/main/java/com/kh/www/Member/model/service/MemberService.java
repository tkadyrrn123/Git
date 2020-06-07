package com.kh.www.Member.model.service;

import java.util.ArrayList;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.Member.model.vo.MemberCount;

public interface MemberService {

	int dupid(String id);

	int InsertMember(Member m);

	Member Login(String id);

	ArrayList<Integer> newCount();

	MemberCount memberCount();

	ArrayList<Member> memberList();

	int dupNick(String nick);

}
