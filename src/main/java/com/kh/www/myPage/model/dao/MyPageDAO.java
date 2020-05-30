package com.kh.www.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Member.model.vo.Member;

@Repository("myDAO")
public class MyPageDAO {

    public int memberUpdate(Member m, SqlSessionTemplate sqlSession) {
        return sqlSession.update("myPageMapper.memberUpdate", m);
    }

}