package com.kh.www.comment.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.comment.model.dao.CommentDAO;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.Comment2;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertComment(Comment c) {
		return cDAO.insertComment(sqlSession, c);
	}

	@Override
	public ArrayList<Comment> selectComment(int boardNo) {
		return cDAO.selectComment(sqlSession, boardNo);
	}
	
	@Override
	public int updateComment(Comment c) {
		return cDAO.updateComment(sqlSession, c);
	}

	@Override
	public int deleteComment(int rNo) {
		return cDAO.deleteComment(sqlSession, rNo);
	}

	@Override
	public int insertComment2(Comment2 c) {
		return cDAO.insertComment2(sqlSession, c);
	}

	@Override
	public ArrayList<Comment2> selectComment2(int rNo) {
		return cDAO.selectComment2(sqlSession, rNo);
	}

	@Override
	public int deleteComment3(int rrNo) {
		return cDAO.deleteComment3(sqlSession, rrNo);
	}

	@Override
	public int updateComment2(Comment2 c) {
		return cDAO.updateComment2(sqlSession, c);
	}

	@Override
	public ArrayList<Comment2> selectComment2() {
		return cDAO.selectComment2(sqlSession);
	}

	@Override
	public ArrayList<Comment> selectVoteComment(int vId) {
		return cDAO.selectVoteComment(sqlSession, vId);
	}

	@Override
	public int updateVoteComment(Comment c) {
		return cDAO.updateVoteComment(sqlSession, c);
	}

}
