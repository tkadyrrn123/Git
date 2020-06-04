package com.kh.www.Notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.common.model.vo.PageInfo;

@Repository
public class NoticeDAO {
	
	//등록
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★"+n);
		return sqlSession.insert("NoticeMapper.insertNotice", n);
	}
	
	public int getNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("NoticeMapper.getNoticeListCount");
	}

	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("NoticeMapper.selectList", null, rowBounds);
	}
	
	//디테일 카운트 
	public int addReadCount(SqlSessionTemplate sqlSession, int nNo) {
		return sqlSession.update("NoticeMapper.addReadCount", nNo);
	}
	
	//디테일 하나 선택
	public Notice selectNotice(SqlSessionTemplate sqlSession, int nNo) {
		return sqlSession.selectOne("NoticeMapper.selectNotice", nNo);
	}

}
