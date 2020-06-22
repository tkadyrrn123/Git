package com.kh.www.comment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.Comment2;

@Repository
public class CommentDAO {

	public int insertComment(SqlSessionTemplate sqlSession, Comment c) {
		return sqlSession.insert("CommentMapper.insertComment",c);
	}

	public ArrayList<Comment> selectComment(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("CommentMapper.selectComment", boardNo);
	}

	public int updateComment(SqlSessionTemplate sqlSession, Comment c) {
		// TODO Auto-generated method stub
		return sqlSession.update("CommentMapper.updateComment", c);
	}

	public int deleteComment(SqlSessionTemplate sqlSession, int rNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("CommentMapper.deleteComment", rNo);
	}

	public int insertComment2(SqlSessionTemplate sqlSession, Comment2 c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("CommentMapper.insertComment2", c);
	}

	public ArrayList<Comment2> selectComment2(SqlSessionTemplate sqlSession, int rNo) {
		return (ArrayList)sqlSession.selectList("CommentMapper.selectComment2", rNo);
	}

	public int updateComment2(SqlSessionTemplate sqlSession, Comment2 c) {
		// TODO Auto-generated method stub
		return sqlSession.update("CommentMapper.updateComment2", c);
	}

	public int deleteComment3(SqlSessionTemplate sqlSession, int rrNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("CommentMapper.deleteComment2", rrNo);
	}

}
