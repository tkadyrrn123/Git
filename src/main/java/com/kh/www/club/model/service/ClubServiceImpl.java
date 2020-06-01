package com.kh.www.club.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.club.model.dao.ClubDAO;

@Service("cService")
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private ClubDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return cDAO.getListCount(sqlSession);
	}

}
