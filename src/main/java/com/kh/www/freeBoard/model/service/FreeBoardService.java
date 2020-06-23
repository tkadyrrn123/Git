package com.kh.www.freeBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.freeBoard.model.vo.FreeBoard;
import com.kh.www.freeBoard.model.vo.SearchCondition;

public interface FreeBoardService {

	int insertBoard(FreeBoard fb);

	int getListCount(String aptName);

	ArrayList<FreeBoard> selectList(PageInfo pi, String aptName);

	FreeBoard selectFreeBoard(int boardNo);

	int deleteFree(int boardNo);

	ArrayList<Comment> selectRList(int boardNo);

	int insertReply(Comment c);

	FreeBoard selectUpdateFreeBoard(int boardNo);

	int updateFreeBoard(FreeBoard fb);

	int updateFreeFile(FreeBoard fb);

	int commentModify(Comment comment);

	int getSearchResultListCount(HashMap hm);

	ArrayList<FreeBoard> selectSearchResultList(HashMap hm, PageInfo pi);

	ArrayList<FreeBoard> selectSortResultList(HashMap hm);

	int deleteReply(int rNo);

	int modifyReply(Comment c);


	
}
