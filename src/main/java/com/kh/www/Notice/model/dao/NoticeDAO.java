package com.kh.www.Notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.PageInfo;

@Repository
public class NoticeDAO {
	
	//공지사항 작성
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("NoticeMapper.insertNotice", n);
	}
	
	//공지사항 전체 리스트 갯수 가져오기
	public int getNoticeListCount(SqlSessionTemplate sqlSession,String aptName) {
		return sqlSession.selectOne("NoticeMapper.getNoticeListCount", aptName);
	}
	
	//공지사항 리스트 페이지 가져오기
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String aptName) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("NoticeMapper.selectList", aptName, rowBounds);
	}
	
	//상세보기 조회수 증가 체크하기 
	public int addReadCount(SqlSessionTemplate sqlSession, int nNo) {
		return sqlSession.update("NoticeMapper.addReadCount", nNo);
	}
	
	//공지사항 상세조회
	public Notice selectNotice(SqlSessionTemplate sqlSession, int nNo) {
		return sqlSession.selectOne("NoticeMapper.selectNotice", nNo);
	}
	
    //공지사항 업데이트 - 파일만 업데이트(파일테이블)
	public int updateNotice_File(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("NoticeMapper.updateNotice_tb_file",n);
	}
	
	//공지사항 업데이트 - 글만 업데이트(노티스테이블)
	public int updateNotice_Content(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("NoticeMapper.updateNotice_tb_notice",n);
	}
	//공지사항 삭제
	public int deleteNotice(SqlSessionTemplate sqlSession, int nNo) {
		return sqlSession.update("NoticeMapper.deleteNotice", nNo);
	}
	
	//댓글 리스트 가져오기
	public ArrayList<Comment> NoticeCommentList(SqlSessionTemplate sqlSession, int nNo) {
		return (ArrayList)sqlSession.selectList("NoticeMapper.NoticeCommentList", nNo);
	}

	//댓글등록
	public int insertNoticeComment(SqlSessionTemplate sqlSession, Comment nc) {
		return sqlSession.update("NoticeMapper.insertNoticeComment",nc);
	}
	
	//댓글 수정
	public int commentUpdate(SqlSessionTemplate sqlSession, Comment comment) {
		return sqlSession.update("NoticeMapper.updateNoticeComment",comment);
	}
	
	//댓글 삭제
	public int commentUpdate(SqlSessionTemplate sqlSession, int rNo) {
		return sqlSession.update("NoticeMapper.deleteNoticeComment",rNo);
	}

	//공지사항 검색키워드에 따른 전체 수 가져오기
	public int getSearchResultListCount(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.selectOne("NoticeMapper.getSearchResultListCount",n);
	}

	public ArrayList<Notice> selectSearchResultList(SqlSessionTemplate sqlSession, Notice n, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("NoticeMapper.selectSearchResultList", n, rowBounds);
	}

	//아파트 동 전체 리스트 가져오기
	public String selectcDonglist(SqlSessionTemplate sqlSession, String aptName) {
		return sqlSession.selectOne("NoticeMapper.selectcDonglist", aptName);
	}

	//공지사항 검색한 리스트 가져오기
	public ArrayList<Notice> nSortCondition(SqlSessionTemplate sqlSession, HashMap map) {
		return (ArrayList)sqlSession.selectList("NoticeMapper.selectSortCondition", map);
	}



}
