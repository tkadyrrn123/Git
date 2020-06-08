package com.kh.www.Notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.Notice.model.vo.NoticeComment;
import com.kh.www.common.model.vo.PageInfo;

@Repository
public class NoticeDAO {
	
	//공지사항 작성
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("NoticeMapper.insertNotice", n);
	}
	
	//공지사항 전체 리스트 갯수 가져오기
	public int getNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("NoticeMapper.getNoticeListCount");
	}
	
	//공지사항 리스트 페이지 가져오기
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("NoticeMapper.selectList", null, rowBounds);
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
	
	//댓글 리스트 가져오기
	public ArrayList<NoticeComment> NoticeCommentList(SqlSessionTemplate sqlSession, int nNo) {
		return (ArrayList)sqlSession.selectList("NoticeMapper.NoticeCommentList", nNo);
	}

	//댓글등록
	public int insertNoticeComment(SqlSessionTemplate sqlSession, NoticeComment nc) {
		return sqlSession.update("NoticeMapper.insertNoticeComment",nc);
	}


}
