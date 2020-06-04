package com.kh.www.myPage.model.service;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.myPage.model.vo.Meal;

public interface MyPageService {

    int memberUpdate(Member m);

	int imageUpdate(Member m);

	int insertBreak(Meal meal);

}