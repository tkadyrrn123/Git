package com.kh.www.club.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.club.model.vo.Club;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.Comment2;
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

	public int deleteClub(SqlSessionTemplate sqlSession, Integer boardNo) {
		return sqlSession.update("clubMapper.deleteClub", boardNo);
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

	public int updateClub(SqlSessionTemplate sqlSession, Club c) {
		return sqlSession.update("clubMapper.updateClub", c);
	}

	public int updateClubMember(SqlSessionTemplate sqlSession, Club c) {
		return sqlSession.update("clubMapper.updateClubMember", c);
	}

	public int checkClubMember(SqlSessionTemplate sqlSession, HashMap m) {
		return sqlSession.selectOne("clubMapper.checkClubMember", m);
	}

	public int deleteClubMember(SqlSessionTemplate sqlSession, HashMap m) {
		return sqlSession.delete("clubMapper.deleteClubMember", m);
	}

	public int updateComment(SqlSessionTemplate sqlSession, Comment c) {
		return sqlSession.update("clubMapper.updateComment", c);
	}

	public int deleteComment(SqlSessionTemplate sqlSession, int rNo) {
		return sqlSession.update("clubMapper.deleteComment", rNo);
	}

	public ArrayList<Comment2> selectComment2(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("clubMapper.selectComment2");
	}

	public int insertComment2(SqlSessionTemplate sqlSession, Comment2 c) {
		return sqlSession.insert("clubMapper.insertComment2", c);
	}

	public ArrayList<Comment2> selectComment2(SqlSessionTemplate sqlSession, int rNo) {
		return (ArrayList)sqlSession.selectList("clubMapper.selectComment23",rNo);
	}

	public int updateComment2(SqlSessionTemplate sqlSession, int rrNo) {
		return sqlSession.update("clubMapper.updateComment2", rrNo);
	}

}













