package com.kh.www.myPage.model.service;

import java.util.ArrayList;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.myPage.model.vo.Meal;
import com.kh.www.myPage.model.vo.MyBoard;
import com.kh.www.myPage.model.vo.MyComment;
import com.kh.www.myPage.model.vo.MyQnA;
import com.kh.www.myPage.model.vo.REQnA;

public interface MyPageService {

    int memberUpdate(Member m);

	int imageUpdate(Member m);

	int insertBreakfast(Meal meal);

	ArrayList<Meal> getBreakfastList(String userId);

	int getListCount(String userId);

	ArrayList<MyBoard> getBoardList(String userId, PageInfo pi);

	int getCommentListCount(String userId);

	ArrayList<MyComment> getCommentList(String userId, PageInfo pi);

	int insertQnA(MyQnA qNA);

	int insertQnAFileName(MyQnA qNA);

	int getQnAListCount(String userId);

	ArrayList<MyQnA> getQnAList(String userId, PageInfo pi);

	int REQNA(REQnA reQNA);

	int answerQNA(int qNAId);

	ArrayList<REQnA> getREQnAList(String userId);

}