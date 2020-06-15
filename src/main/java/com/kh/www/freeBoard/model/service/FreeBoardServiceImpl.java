package com.kh.www.freeBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.freeBoard.model.dao.FreeBoardDAO;
import com.kh.www.freeBoard.model.vo.FreeBoard;

@Service("freeService")
public class FreeBoardServiceImpl implements FreeBoardService{

	@Autowired
	private FreeBoardDAO fDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertBoard(FreeBoard fb) {
		return fDAO.insertBoard(sqlSession, fb);
	}

	@Override
	public int getListCount(String aptName) {

		return fDAO.getListCount(sqlSession, aptName);
	}

	@Override
	public ArrayList<FreeBoard> selectList(PageInfo pi, String aptName) {
		return fDAO.selectList(sqlSession, pi, aptName);
	}

	@Override
	public FreeBoard selectFreeBoard(int boardNo) {
		
		FreeBoard fb = null;
		int result = fDAO.addReadCount(sqlSession, boardNo);
		
		if(result > 0) {
			fb = fDAO.selectFreeBoard(sqlSession, boardNo); 
		}
		return fb;
	}

	@Override
	public int deleteFree(int boardNo) {
		return fDAO.deleteFree(sqlSession, boardNo);
	}

	@Override
	public ArrayList<Comment> selectRList(int boardNo) {
		return fDAO.selectRList(sqlSession, boardNo);
	}

	@Override
	public int insertReply(Comment c) {
		return fDAO.insertReply(sqlSession, c);
	}

	@Override
	public FreeBoard selectUpdateFreeBoard(int boardNo) {
		return fDAO.selectFreeBoard(sqlSession, boardNo);
	}

	@Override
	public int updateFreeBoard(FreeBoard fb) {
		return fDAO.updateFreeBoard(sqlSession, fb);
	}

	@Override
	public int updateFreeFile(FreeBoard fb) {
		return fDAO.updateFreeFile(sqlSession, fb);
	}

	@Override
	public int commentModify(Comment comment) {
		return fDAO.updateComment(sqlSession, comment);
	}

}
