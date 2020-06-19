package com.kh.www.Vote.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.Vote.model.dao.VoteDAO;
import com.kh.www.Vote.model.exception.VoteException;
import com.kh.www.Vote.model.vo.VChoice;
import com.kh.www.Vote.model.vo.VInvote;
import com.kh.www.Vote.model.vo.VKeyword;
import com.kh.www.Vote.model.vo.Vote;
import com.kh.www.common.model.vo.PageInfo;

@Service
public class VoteServiceImpl implements VoteService{

	@Autowired
	private VoteDAO vDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount(VKeyword keyword) {
		int count = vDAO.getListCount(sqlSession, keyword);
		return count;
	}
	
	@Override
	public ArrayList<Vote> getVoteList(PageInfo pi, VKeyword keyword) {
		ArrayList<Vote> vlist = vDAO.getVoteList(pi, sqlSession, keyword);
		return vlist;
	}

	@Override
	public int insertVote(Vote v) {
		return vDAO.insertVote(v, sqlSession);
	}

	@Override
	public int insertVChoice(ArrayList<VChoice> vclist) {
		return vDAO.insertVChoice(vclist, sqlSession);
	}

	@Override
	public Vote selectVote(int vId) {
		return vDAO.selectVote(vId, sqlSession);
	}

	@Override
	public ArrayList<VChoice> selectVChoiceList(int vId) {
		return vDAO.selectVChoiceList(vId, sqlSession);
	}

	@Override
	public ArrayList<VInvote> selectVInvoteList(ArrayList<Integer> vcIdList) {
		return vDAO.selectVInvoteList(vcIdList, sqlSession);
	}

	@Override
	public Member selectWriteUser(String userId) {
		return vDAO.selectWriteUser(userId, sqlSession);
	}
	@Override
	public int insertVInvote(ArrayList<VInvote> invoteList) {
		return vDAO.insertVInvote(invoteList, sqlSession);
	}

	@Override
	public int deleteVote(int vId, ArrayList<VChoice> vclist) {
		return vDAO.deleteVote(vId, vclist, sqlSession);
	}

	@Override
	public int updateVote(Vote v, ArrayList<VChoice> vclist, ArrayList<VChoice> originVClist) {
		System.out.println(v.getOverlapYN());
		return vDAO.updateVote(v, vclist, originVClist, sqlSession);
	}

}
