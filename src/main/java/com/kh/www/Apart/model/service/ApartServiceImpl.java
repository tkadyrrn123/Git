package com.kh.www.Apart.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.Apart.model.dao.ApartDAO;
import com.kh.www.Apart.model.vo.Apart;

@Service
public class ApartServiceImpl implements ApartService{
	
	@Autowired
	private ApartDAO aptDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int aptInsert(Apart apt) {
		return aptDAO.aptInsert(sqlSession, apt);
	}

	@Override
	public ArrayList<Apart> searchApt(String text) {
		return aptDAO.searchApt(sqlSession, text);
	}

	@Override
	public String donglist(String name) {
		return aptDAO.donglist(sqlSession, name);
	}

	@Override
	public int aptDupName(String name) {
		return aptDAO.aptDupName(sqlSession, name);
	}
	
}
