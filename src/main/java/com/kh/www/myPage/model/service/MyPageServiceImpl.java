package com.kh.www.myPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.myPage.model.dao.MyPageDAO;
import com.kh.www.myPage.model.vo.Meal;

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
	public int insertBreak(Meal meal) {
		return myDAO.insertBreak(meal, sqlSession);
	}

}