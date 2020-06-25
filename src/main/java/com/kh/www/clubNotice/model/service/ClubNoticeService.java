package com.kh.www.clubNotice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.clubNotice.model.vo.ClubNotice;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.PageInfo;

public interface ClubNoticeService {
	
	//동호회-공지사항 전체 리스트 갯수 가져오기
	int getCNoticeListCount(String aptName);
	
	//동호회-공지사항 리스트 페이지 가져오기
	ArrayList<ClubNotice> selectList(PageInfo pi, String aptName);
	
	//동호회-공지사항 작성
	int insertNotice(ClubNotice cn);
	
	//동호회-이름목록 받아오기
	ArrayList<String[]> selectcNamelist(String aptName);

	//동호회-공지사항 상세조회
	ClubNotice selectclubNotice(int cnNo);

	//동호회-공지사항 수정하기 폼으로 이동 - 수정할 글 상세조회
	ClubNotice selectUpdateClubNotice(int cnNo);

	//동호회-공지사항 업데이트 - 파일만 업데이트(파일테이블)
	int updateClubNotice_File(ClubNotice cn);

	//동호회-공지사항 업데이트 - 글만 업데이트(노티스테이블)
	int updateClubNotice_Content(ClubNotice cn);

	//공지사항 업데이트 - 클럽명만 업데이트(클럽노티스 테이블)
	int updateClubNotice_Name(ClubNotice cn);
	
	//동호회 공지사항 삭제
	int deleteClubNotice(int cnNo);
	
	//동호회 공지사항 검색키워드에 따른 전체 수 가져오기
	int getSearchResultListCount(ClubNotice cn);

	//동호회 공지사항 검색한 리스트 가져오기
	ArrayList<ClubNotice> selectSearchResultList(ClubNotice cn, PageInfo pi);
	
	//동호회 공지사항 정렬 리스트 가져오기
	ArrayList<ClubNotice> selectSortCondition(HashMap map);

	//댓글리스트 가져오기
	ArrayList<Comment> noticeCommentList(int cnNo);

	//댓글 등록
	int insertNoticeComment(Comment nc);

	//댓글 수정
	int commentUpdate(Comment comment);

	//댓글 삭제
	int commentUpdate(int rNo);

	
	
	
	
	
	
	
}
