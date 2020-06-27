package com.kh.www.Vote.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.Vote.model.exception.VoteException;
import com.kh.www.Vote.model.vo.VChoice;
import com.kh.www.Vote.model.vo.VInvote;
import com.kh.www.Vote.model.vo.VKeyword;
import com.kh.www.Vote.model.vo.Vote;
import com.kh.www.common.model.vo.PageInfo;

@Repository
public class VoteDAO {

	public int getListCount(SqlSessionTemplate sqlSession, VKeyword keyword) {
		return sqlSession.selectOne("voteMapper.getListCount", keyword);
	}

	public ArrayList<Vote> getVoteList(PageInfo pi, SqlSessionTemplate sqlSession, VKeyword keyword) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("voteMapper.getVoteList",keyword,rowBounds);
	}

	public int insertVote(Vote v, SqlSessionTemplate sqlSession) {
		sqlSession.insert("voteMapper.insertVote", v);
		return v.getvId();
	}

	public int insertVChoice(ArrayList<VChoice> vclist, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("voteMapper.insertVChoice", vclist);
	}

	public Vote selectVote(int vId, SqlSessionTemplate sqlSession) {
		sqlSession.insert("voteMapper.updateCount", vId);
		return sqlSession.selectOne("voteMapper.selectVote", vId);
	}

	public ArrayList<VChoice> selectVChoiceList(int vId, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("voteMapper.selectVChoiceList", vId);
	}

	public ArrayList<VInvote> selectVInvoteList(ArrayList<Integer> vcIdList, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("voteMapper.selectVInvoteList", vcIdList);
	}

	public Member selectWriteUser(String userId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("voteMapper.selectWriteUser", userId);
	}

	public int insertVInvote(ArrayList<VInvote> invoteList, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("voteMapper.insertVInvote", invoteList);
	}
	
	public int deleteVote(int vId, ArrayList<VChoice> vclist, SqlSessionTemplate sqlSession) {
		if(vclist != null && !vclist.isEmpty()) {
			sqlSession.delete("voteMapper.deleteVInvote", vclist);
		}
		int result1 = sqlSession.delete("voteMapper.deleteVChoice", vId);
		if(result1 > 0) {
			return sqlSession.delete("voteMapper.deleteVote", vId);
		}else {
			throw new VoteException("투표 글 삭제에 실패하였습니다.");
		}
		
	}
	public int updateVote(Vote v, 
						ArrayList<VChoice> vclist, 
						ArrayList<VChoice> originVClist, 
						SqlSessionTemplate sqlSession) {
		int result1 = 0;
		int result2 = 0;
		System.out.println(v.getOverlapYN());
		if(vclist != null && !vclist.isEmpty()) {
			
			// 원래 있던 목록 제거
			sqlSession.delete("voteMapper.deleteVInvote", originVClist);
			result1 = sqlSession.delete("voteMapper.deleteVChoice", v.getvId());
		}
		if(result1 > 0) {
			// 새로운걸로 insert
			result2 = sqlSession.insert("voteMapper.insertVChoice", vclist);
		}
	
		if(result2 > 0) {
			// 마지막으로 투표 수정
			return sqlSession.update("voteMapper.updateVote", v);
		}
		return 0;
		
	}

}
