package com.kh.www.myPage.model.service;

import java.util.ArrayList;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.myPage.model.vo.Meal;
import com.kh.www.myPage.model.vo.MyBoard;

public interface MyPageService {

    int memberUpdate(Member m);

	int imageUpdate(Member m);

	int insertBreakfast(Meal meal);

	ArrayList<Meal> getBreakfastList(String userId);

	int getListCount(String userId);

	ArrayList<MyBoard> getBoardList(String userId, PageInfo pi);

}