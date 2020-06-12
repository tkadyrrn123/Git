package com.kh.www.clubNotice.model.service;

import java.util.ArrayList;

import com.kh.www.clubNotice.model.vo.ClubNotice;
import com.kh.www.common.model.vo.PageInfo;
import com.sun.xml.internal.bind.v2.runtime.NameList;

public interface ClubNoticeService {
	
	//동호회-공지사항 전체 리스트 갯수 가져오기
	int getCNoticeListCount();
	
	//동호회-공지사항 리스트 페이지 가져오기
	ArrayList<ClubNotice> selectList(PageInfo pi);
	
	//동호회-공지사항 작성
	int insertNotice(ClubNotice cn);
	
	//동호회-이름목록 받아오기
	ArrayList<String[]> selectcNamelist();

	//동호회-공지사항 상세조회
	ClubNotice selectclubNotice(int cnNo);
	
	
	//수정하기 폼으로 이동 - 수정할 글 상세조회
	//공지사항 업데이트 - 파일만 업데이트(파일테이블)
	//공지사항 업데이트 - 글만 업데이트(노티스테이블)
	//댓글리스트 가져오기
	//댓글 등록
	//댓글 수정
	//댓글 삭제
	
	
	
	
	
}
