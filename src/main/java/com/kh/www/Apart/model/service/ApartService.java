package com.kh.www.Apart.model.service;

import java.util.ArrayList;

import com.kh.www.Apart.model.vo.Apart;
import com.kh.www.Member.model.vo.MemberCount;
import com.kh.www.admin.model.vo.SearchOption;
import com.kh.www.common.model.vo.PageInfo;

public interface ApartService {

	int aptInsert(Apart apt);

	ArrayList<Apart> searchApt(String text);

	String donglist(String name);

	int aptDupName(String name);
	
	String address(String loc);

	ArrayList<Apart> apartList();

	//아파트 카운트
	MemberCount aptCount();
	//아파트 리스트 카운트
	int aptlistCount(int num);
	//아파트 리스트
	ArrayList<Apart> apartAllList(PageInfo pi, Integer num);
	//리스트카운트
	int acceptlistCount();

	ArrayList<Apart> aptAcceptList(PageInfo pi);

	int searchApartCount(SearchOption so, int num);

	ArrayList<Apart> SearchApartList(PageInfo pi, SearchOption so, int num);

	int searchAptAcceptCount(SearchOption so);

	ArrayList<Apart> searchAptAcceptList(PageInfo pi, SearchOption so);

	int ApartAccept(String[] chkId);

	int ApartDelete(String[] chkId);

	Apart info(String userId);

}
