package com.kh.www.Notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.Notice.model.dao.NoticeDAO;
import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.PageInfo;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO nDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override //공지사항 작성
	public int insertNotice(Notice n) {
		return nDAO.insertNotice(sqlSession, n);
	}
	
	 @Override //공지사항 전체 리스트 갯수 가져오기
	public int getNoticeListCount(String aptName) { 
		return nDAO.getNoticeListCount(sqlSession, aptName);
	}
	 
	 @Override //공지사항 리스트 페이지 가져오기
	public ArrayList<Notice> selectList(PageInfo pi, String aptName) {
		return nDAO.selectList(sqlSession, pi, aptName);
	}
	
	@Override //공지사항 상세조회
	public Notice selectNotice(int nNo) {
		
		Notice n = null;
		
		//조회수 증가 체크하기
		int result = nDAO.addReadCount(sqlSession, nNo);
		
		if(result > 0) { //공지사항 상세조회
			n = nDAO.selectNotice(sqlSession, nNo);
		}
		return n;
	}
	
	 @Override //수정하기 폼으로 이동 - 수정할 글 상세조회
	public Notice selectUpdateNotice(int nNo) {
		 return nDAO.selectNotice(sqlSession, nNo);
	}
	 
	@Override //공지사항 업데이트 - 파일만 업데이트(파일테이블)
	public int updateNotice_File(Notice n) {
		return nDAO.updateNotice_File(sqlSession, n);
	}
	
	@Override //공지사항 업데이트 - 글만 업데이트(노티스테이블)
	public int updateNotice_Content(Notice n) {
		return nDAO.updateNotice_Content(sqlSession, n);
	}
	
	@Override //공지사항 삭제
	public int deleteNotice(int nNo) {
		return nDAO.deleteNotice(sqlSession, nNo);
	}
	
	@Override //댓글 리스트 가져오기
	public ArrayList<Comment> noticeCommentList(int nNo) {
		return nDAO.NoticeCommentList(sqlSession, nNo);
	}
	
	@Override //댓글등록
	public int insertNoticeComment(Comment nc) {
		return nDAO.insertNoticeComment(sqlSession, nc);
	}
	
	@Override //댓글 수정
	public int commentUpdate(Comment comment) {
		return nDAO.commentUpdate(sqlSession, comment);
	}
	
	@Override //댓글 삭제
	public int commentUpdate(int rNo) {
		return nDAO.commentUpdate(sqlSession, rNo);
	}
	
	@Override //공지사항 검색키워드에 따른 전체 수 가져오기
	public int getSearchResultListCount(Notice n) {
		return  nDAO.getSearchResultListCount(sqlSession, n);
	}
	
	@Override //공지사항 검색한 리스트 가져오기
	public ArrayList<Notice> selectSearchResultList(Notice n, PageInfo pi) {
		return nDAO.selectSearchResultList(sqlSession, n, pi);
	}
	
	@Override //아파트 동 전체 리스트 가져오기
	public String selectcDonglist(String aptName) {
		return nDAO.selectcDonglist(sqlSession, aptName);

	}
}
