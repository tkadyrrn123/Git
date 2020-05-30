package com.kh.www.myPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.myPage.model.dao.MyPageDAO;

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

}