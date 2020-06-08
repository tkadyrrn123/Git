package com.kh.www.Notice.model.service;

import java.util.ArrayList;

import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.Notice.model.vo.NoticeComment;
import com.kh.www.common.model.vo.PageInfo;

public interface NoticeService {
	
	//공지사항 작성
	int insertNotice(Notice n);
	
	//공지사항 전체 리스트 갯수 가져오기
	int getNoticeListCount();
	
	//공지사항 리스트 페이지 가져오기
	ArrayList<Notice> selectList(PageInfo pi);
	
	//공지사항 상세조회
	Notice selectNotice(int nNo);
	
	//수정하기 폼으로 이동 - 수정할 글 상세조회
	Notice selectUpdateNotice(int nNo);
	
	//공지사항 업데이트 - 파일만 업데이트(파일테이블)
	int updateNotice_File(Notice n);

	//공지사항 업데이트 - 글만 업데이트(노티스테이블)
	int updateNotice_Content(Notice n);
	
	//댓글리스트 가져오기
	ArrayList<NoticeComment> noticeCommentList(int nNo);
	
	//댓글 등록
	int insertNoticeComment(NoticeComment nc);

	
}
