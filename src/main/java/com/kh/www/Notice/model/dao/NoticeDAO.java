package com.kh.www.Notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.common.model.vo.PageInfo;

@Repository
public class NoticeDAO {

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

}
