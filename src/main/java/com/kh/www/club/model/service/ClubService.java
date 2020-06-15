package com.kh.www.club.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.www.club.model.vo.Club;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.PageInfo;

public interface ClubService {

	int getListCount();

	ArrayList<Club> selectList(PageInfo pi);

	int insertClub(Club c);

	int insertBoard(String writer);

	int insertFile(String renameFileName);

	int deleteClub();

	Club selectClub(String clubName);

	int insertClubMember(HashMap m);

	int insertComment(Comment c);

	ArrayList<Comment> selectComment(int boardNo);

}
