package com.kh.www.clubNotice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.clubNotice.model.vo.ClubNotice;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.Comment2;
import com.kh.www.common.model.vo.PageInfo;
import com.sun.xml.internal.bind.v2.runtime.NameList;

@Repository
public class CNoticeDAO {
	
	//동호회-공지사항 전체 리스트 갯수 가져오기
	public int getCNoticeListCount(SqlSessionTemplate sqlSession, String aptName) {
		return sqlSession.selectOne("ClubNoticeMapper.getCNoticeListCount", aptName);
	}
	
	//동호회-공지사항 리스트 페이지 가져오기
	public ArrayList<ClubNotice> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String aptName) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("ClubNoticeMapper.selectList", aptName, rowBounds);
	}
	
	//동호회 공지사항 작성
	public int insertNotice(SqlSessionTemplate sqlSession, ClubNotice cn) {
		return sqlSession.insert("ClubNoticeMapper.insertClubNotice", cn);
	}
	
	//동호회-이름목록 받아오기
	public ArrayList<String[]> selectcNamelist(SqlSessionTemplate sqlSession, String aptName) {
		return (ArrayList)sqlSession.selectList("ClubNoticeMapper.selectcNamelist", aptName);
	}
	
	//조회수 증가 체크하기
	public int addReadCount(SqlSessionTemplate sqlSession, int cnNo) {
		return sqlSession.update("ClubNoticeMapper.addReadCount", cnNo);
	}
	
	//동호회-공지사항 상세조회
	public ClubNotice selectNotice(SqlSessionTemplate sqlSession, int cnNo) {
		return sqlSession.selectOne("ClubNoticeMapper.selectClubNotice", cnNo);
	}
	
	//동호회-공지사항 수정하기 폼으로 이동 - 수정할 글 상세조회
	public ClubNotice selectUpdateClubNotice(SqlSessionTemplate sqlSession, int cnNo) {
		return sqlSession.selectOne("ClubNoticeMapper.selectClubNotice", cnNo);
	}
	
	//동호회-공지사항 업데이트 - 파일만 업데이트(파일테이블)
	public int updateClubNotice_File(SqlSessionTemplate sqlSession, ClubNotice cn) {
		return sqlSession.update("ClubNoticeMapper.updateClubNotice_File", cn);
	}
	
	//동호회-공지사항 업데이트 - 글만 업데이트(노티스테이블)
	public int updateClubNotice_Content(SqlSessionTemplate sqlSession, ClubNotice cn) {
		return sqlSession.update("ClubNoticeMapper.updateClubNotice_Content", cn);
	}
	
	//공지사항 업데이트 - 클럽명만 업데이트(클럽노티스 테이블)
	public int updateClubNotice_Name(SqlSessionTemplate sqlSession, ClubNotice cn) {
		return sqlSession.update("ClubNoticeMapper.updateClubNotice_Name", cn);
	}

	//동호회 공지사항 삭제
	public int deleteClubNotice(SqlSessionTemplate sqlSession, int cnNo) {
		return sqlSession.update("ClubNoticeMapper.deleteClubNotice", cnNo);
	}

	//동호회 공지사항 검색키워드에 따른 전체 수 가져오기
	public int getSearchResultListCount(SqlSessionTemplate sqlSession, ClubNotice cn) {
		return sqlSession.selectOne("ClubNoticeMapper.getSearchResultListCount", cn);
	}

	//동호회 공지사항 검색한 리스트 가져오기
	public ArrayList<ClubNotice> selectSearchResultList(SqlSessionTemplate sqlSession, ClubNotice cn, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("ClubNoticeMapper.selectSearchResultList", cn, rowBounds);
	}

	//동호회 공지사항 정렬 리스트 가져오기
	public ArrayList<ClubNotice> selectSortCondition(SqlSessionTemplate sqlSession, HashMap map) {
		return (ArrayList)sqlSession.selectList("ClubNoticeMapper.selectSortCondition", map);
	}
	
	//댓글등록
	public int insertNoticeComment(SqlSessionTemplate sqlSession, Comment nc) {
		return sqlSession.update("ClubNoticeMapper.insertNoticeComment",nc);
	}
	
	//댓글리스트 가져오기
	public ArrayList<Comment> NoticeCommentList(SqlSessionTemplate sqlSession, int cnNo) {
		return (ArrayList)sqlSession.selectList("ClubNoticeMapper.NoticeCommentList", cnNo);
	}
	
	//댓글 수정
	public int commentUpdate(SqlSessionTemplate sqlSession, Comment comment) {
		return sqlSession.update("ClubNoticeMapper.updateNoticeComment",comment);
	}

	//댓글 삭제
	public int commentUpdate(SqlSessionTemplate sqlSession, int rNo) {
		return sqlSession.update("ClubNoticeMapper.deleteNoticeComment",rNo);
	}

	public ArrayList<Comment> selectComment(SqlSessionTemplate sqlSession, int cnNo) {
		return (ArrayList)sqlSession.selectList("ClubNoticeMapper.selectComment", cnNo);
	}

	public ArrayList<Comment2> selectComment2(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("ClubNoticeMapper.selectComment2");
	}

	public int updateComment(SqlSessionTemplate sqlSession, Comment c) {
		return sqlSession.update("ClubNoticeMapper.updateComment", c);
	}

	public int deleteComment(SqlSessionTemplate sqlSession, int rNo) {
		return sqlSession.update("ClubNoticeMapper.deleteComment", rNo);
	}

	public int insertComment2(SqlSessionTemplate sqlSession, Comment2 c) {
		return sqlSession.insert("ClubNoticeMapper.insertComment2", c);
	}

	public ArrayList<Comment2> selectComment2(SqlSessionTemplate sqlSession, int rNo) {
		return (ArrayList)sqlSession.selectList("ClubNoticeMapper.selectComment23",rNo);
	}

	
}
