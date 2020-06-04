package com.kh.www.myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.myPage.model.dao.MyPageDAO;
import com.kh.www.myPage.model.vo.Meal;
import com.kh.www.myPage.model.vo.MyBoard;

@Service("myService")
public class MyPageServiceImpl implements MyPageService{

    @Autowired
    private MyPageDAO myDAO;

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public int memberUpdate(Member m) {
        return myDAO.memberUpdate(m,sqlSession);
    }

	@Override
	public int imageUpdate(Member m) {
		return myDAO.imageUpdate(m, sqlSession);
	}

	@Override
	public int insertBreakfast(Meal meal) {
		return myDAO.insertBreakfast(meal, sqlSession);
	}

	@Override
	public ArrayList<Meal> getBreakfastList(String userId) {
		return myDAO.getBreakfastList(userId, sqlSession);
	}

	@Override
	public int getListCount(String userId) {
		return myDAO.getListCount(userId, sqlSession);
	}

	@Override
	public ArrayList<MyBoard> getBoardList(String userId, PageInfo pi) {
		return myDAO.getBoardList(userId, pi, sqlSession);
	}

}