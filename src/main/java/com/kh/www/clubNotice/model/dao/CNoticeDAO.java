package com.kh.www.clubNotice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.clubNotice.model.vo.ClubNotice;
import com.kh.www.common.model.vo.PageInfo;
import com.sun.xml.internal.bind.v2.runtime.NameList;

@Repository
public class CNoticeDAO {
	
	//동호회-공지사항 전체 리스트 갯수 가져오기
	public int getCNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("ClubNoticeMapper.getCNoticeListCount");
	}
	
	//동호회-공지사항 리스트 페이지 가져오기
	public ArrayList<ClubNotice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("ClubNoticeMapper.selectList", null, rowBounds);
	}
	
	//동호회 공지사항 작성
	public int insertNotice(SqlSessionTemplate sqlSession, ClubNotice cn) {
		return sqlSession.insert("ClubNoticeMapper.insertClubNotice", cn);
	}
	
	//동호회-이름목록 받아오기
	public ArrayList<String[]> selectcNamelist(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("ClubNoticeMapper.selectcNamelist");
	}
	
	//조회수 증가 체크하기
	public int addReadCount(SqlSessionTemplate sqlSession, int cnNo) {
		return sqlSession.update("ClubNoticeMapper.addReadCount", cnNo);
	}
	
	//동호회-공지사항 상세조회
	public ClubNotice selectNotice(SqlSessionTemplate sqlSession, int cnNo) {
		return sqlSession.selectOne("ClubNoticeMapper.selectClubNotice", cnNo);
	}
	
	
	
}
