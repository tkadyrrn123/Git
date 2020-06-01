package com.kh.www.Apart.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Apart.model.vo.Apart;

@Repository
public class ApartDAO {

	public int aptInsert(SqlSessionTemplate sqlSession, Apart apt) {
		return sqlSession.insert("aptMapper.aptInsert", apt);
	}

	public ArrayList<Apart> searchApt(SqlSessionTemplate sqlSession, String text) {
		return (ArrayList)sqlSession.selectList("aptMapper.searchApt", text);
	}

	public String donglist(SqlSessionTemplate sqlSession, String name) {
		return sqlSession.selectOne("aptMapper.donglist", name);
	}

	public int aptDupName(SqlSessionTemplate sqlSession, String name) {
		return sqlSession.selectOne("aptMapper.aptDupName", name);
	}

}
