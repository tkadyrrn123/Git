package com.kh.www.freeBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.freeBoard.model.vo.FreeBoard;

@Repository
public class FreeBoardDAO {

	public int insertBoard(SqlSessionTemplate sqlSession, FreeBoard fb) {
//		int result = sqlSession.insert("freeMapper.insertFile", fb.getFileName());
		return sqlSession.insert("freeMapper.insertBoard", fb);					
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("freeMapper.getListCount");
	}

	public ArrayList<FreeBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("freeMapper.selectList", null, rowBounds);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("freeMapper.addReadCount", boardNo);
	}

	public FreeBoard selectFreeBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("freeMapper.selectFreeBoard", boardNo);
	}

	public int deleteFree(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("freeMapper.deleteFree", boardNo);
	}

	public ArrayList<Comment> selectRList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("freeMapper.getReplyList", boardNo);
	}

}
