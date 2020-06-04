package com.kh.www.Notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.Notice.model.dao.NoticeDAO;
import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.common.model.vo.PageInfo;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO nDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertNotice(Notice n) {
		return nDAO.insertNotice(sqlSession, n);
	}
	
	 @Override
	public int getNoticeListCount() {
		return nDAO.getNoticeListCount(sqlSession);
	}
	 
	 @Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return nDAO.selectList(sqlSession, pi);
	}
	
	@Override
	public Notice selectNotice(int nNo) {
		//조회수 증가 체크하기
		Notice n = null;
		
		int result = nDAO.addReadCount(sqlSession, nNo);
		
		if(result > 0) {
			n = nDAO.selectNotice(sqlSession, nNo);
		}
		return n;
	}
	
	 @Override
	public Notice selectUpdateNotice(int nNo) {
		 return nDAO.selectNotice(sqlSession, nNo);
	}
}
