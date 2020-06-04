package com.kh.www.myPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.myPage.model.vo.Meal;
import com.kh.www.myPage.model.vo.MyBoard;

@Repository("myDAO")
public class MyPageDAO {

    public int memberUpdate(Member m, SqlSessionTemplate sqlSession) {
        return sqlSession.update("myPageMapper.memberUpdate", m);
    }

	public int imageUpdate(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.update("myPageMapper.imageUpdate", m);
	}

	public int insertBreakfast(Meal meal, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("myPageMapper.insertBreakfast", meal);
	}

	public ArrayList<Meal> getBreakfastList(String userId, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectBreakfast", userId);
	}

	public int getListCount(String userId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("myPageMapper.getListCount", userId);
	}

	public ArrayList<MyBoard> getBoardList(String userId, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("myPageMapper.getBoardList", userId, rowBounds);
	}

}