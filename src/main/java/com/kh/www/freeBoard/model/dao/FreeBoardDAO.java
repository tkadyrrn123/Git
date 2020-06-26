package com.kh.www.freeBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.Comment2;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.freeBoard.model.vo.FreeBoard;

@Repository
public class FreeBoardDAO {

	public int insertBoard(SqlSessionTemplate sqlSession, FreeBoard fb) {
//		int result = sqlSession.insert("freeMapper.insertFile", fb.getFileName());
		return sqlSession.insert("freeMapper.insertBoard", fb);					
	}

	public int getListCount(SqlSessionTemplate sqlSession, String aptName) {
		return sqlSession.selectOne("freeMapper.getListCount", aptName);
	}

	public ArrayList<FreeBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String aptName) {
		
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("freeMapper.selectList", aptName, rowBounds);
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

	public int insertReply(SqlSessionTemplate sqlSession, Comment c) {
		return sqlSession.insert("freeMapper.insertReply", c);
	}

	public int updateFreeBoard(SqlSessionTemplate sqlSession, FreeBoard fb) {
		return sqlSession.update("freeMapper.updateFreeBoard", fb);
	}

	public int updateFreeFile(SqlSessionTemplate sqlSession, FreeBoard fb) {
		return sqlSession.update("freeMapper.updateFreeFile", fb);
	}

	public int updateComment(SqlSessionTemplate sqlSession, Comment comment) {
		return sqlSession.update("freeMapper.updateComment", comment);
	}

	public int getSearchResultListCount(SqlSessionTemplate sqlSession, HashMap hm) {
		return sqlSession.selectOne("freeMapper.selectSearchResultCount", hm);
	}

	public ArrayList<FreeBoard> selectSearchResultList(SqlSessionTemplate sqlSession, HashMap hm, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		System.out.println("selectSearchResultList : " + hm);
		return (ArrayList)sqlSession.selectList("freeMapper.selectSearchResultList", hm, rowBounds);
	}

	public ArrayList<FreeBoard> selectSortResultList(SqlSessionTemplate sqlSession, HashMap hm, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		System.out.println("selectSortResultList : " + hm);
		return (ArrayList)sqlSession.selectList("freeMapper.selectSortResultList", hm, rowBounds);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int rNo) {
		return sqlSession.update("freeMapper.deleteReply", rNo);
	}

	public int modifyReply(SqlSessionTemplate sqlSession, Comment c) {
		return sqlSession.update("freeMapper.updateReply", c);
	}

	public ArrayList<Comment2> selectRereList(SqlSessionTemplate sqlSession, String boardNo) {
		return (ArrayList)sqlSession.selectList("freeMapper.selectRereList", boardNo);
	}






}
