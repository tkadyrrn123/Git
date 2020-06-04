package com.kh.www.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.myPage.model.vo.Meal;

@Repository("myDAO")
public class MyPageDAO {

    public int memberUpdate(Member m, SqlSessionTemplate sqlSession) {
        return sqlSession.update("myPageMapper.memberUpdate", m);
    }

	public int imageUpdate(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.update("myPageMapper.imageUpdate", m);
	}

	public int insertBreak(Meal meal, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("myPageMapper.insertBreak", meal);
	}

}