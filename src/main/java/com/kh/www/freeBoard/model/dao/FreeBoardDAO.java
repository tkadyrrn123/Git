package com.kh.www.freeBoard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.freeBoard.model.vo.FreeBoard;

@Repository
public class FreeBoardDAO {

	public int insertBoard(SqlSessionTemplate sqlSession, FreeBoard fb) {
		
//		int result = sqlSession.insert("freeMapper.insertFile", fb.getFileName());
		

		return sqlSession.insert("freeMapper.insertBoard", fb);					
	
		
		
	}

}
