package com.kh.www.club.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.club.model.vo.Club;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.PageInfo;

@Repository("cDAO")
public class ClubDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		int listCount = sqlSession.selectOne("clubMapper.getListCount");
		return listCount;
	}

	public ArrayList<Club> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		pi.setBoardLimit(9);
		pi.setMaxPage((int)((double)pi.getListCount() / pi.getBoardLimit() + 0.9));
		pi.setStartPage(((int)((double)pi.getCurrentPage() / pi.getPageLimit() + 0.9) - 1) * pi.getPageLimit() + 1);
		pi.setEndPage(pi.getStartPage() + pi.getPageLimit() - 1);
		
		if(pi.getMaxPage() < pi.getEndPage()) {
			pi.setEndPage(pi.getMaxPage());
		}
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("clubMapper.selectList", null, rowBounds);
	}

	public int insertClub(SqlSessionTemplate sqlSession, Club c) {
		return sqlSession.insert("clubMapper.insertClub", c);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, String writer) {
		return sqlSession.insert("clubMapper.insertBoard", writer);
	}

	public int insertFile(SqlSessionTemplate sqlSession, String renameFileName) {
		return sqlSession.insert("clubMapper.insertFile", renameFileName);
	}

	public int deleteClub(SqlSessionTemplate sqlSession) {
		return sqlSession.update("clubMapper.deleteClub");
	}

	public Club selectClub(SqlSessionTemplate sqlSession, String clubName) {
		return sqlSession.selectOne("clubMapper.selectClub", clubName);
	}

	public int insertClubMember(SqlSessionTemplate sqlSession, HashMap m) {
		return sqlSession.insert("clubMapper.insertClubMember", m);
	}

	public int insertComment(SqlSessionTemplate sqlSession, Comment c) {
		return sqlSession.insert("clubMapper.insertComment", c);
	}

	public ArrayList<Comment> selectComment(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("clubMapper.selectComment", boardNo);
	}

}













