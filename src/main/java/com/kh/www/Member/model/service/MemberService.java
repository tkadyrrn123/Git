package com.kh.www.Member.model.service;

import com.kh.www.Member.model.vo.Member;

public interface MemberService {

	int dupid(String id);

	int InsertMember(Member m);

}
