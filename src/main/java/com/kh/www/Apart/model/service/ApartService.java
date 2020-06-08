package com.kh.www.Apart.model.service;

import java.util.ArrayList;

import com.kh.www.Apart.model.vo.Apart;
import com.kh.www.Member.model.vo.MemberCount;

public interface ApartService {

	int aptInsert(Apart apt);

	ArrayList<Apart> searchApt(String text);

	String donglist(String name);

	int aptDupName(String name);
	
	String address(String loc);

	ArrayList<Apart> apartList();

	MemberCount aptCount();

}
