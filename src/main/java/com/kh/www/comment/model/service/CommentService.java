package com.kh.www.comment.model.service;

import java.util.ArrayList;

import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.Comment2;

public interface CommentService {

	int insertComment(Comment c);

	ArrayList<Comment> selectComment(int boardNo);

	int updateComment(Comment c);

	int deleteComment(int rNo);

	int insertComment2(Comment2 c);

	ArrayList<Comment2> selectComment2(int rNo);

	int deleteComment3(int rrNo);

	int updateComment2(Comment2 c);

	ArrayList<Comment2> selectComment2();

	ArrayList<Comment> selectVoteComment(int vId);

	int updateVoteComment(Comment c);

	int CommentLike(Comment c);

	int CommentNotLike(Comment c);

	ArrayList<Comment> selectLike();


}
