package com.kh.www.Vote.model.service;

import java.util.ArrayList;

import com.kh.www.Member.model.vo.Member;
import com.kh.www.Vote.model.vo.VChoice;
import com.kh.www.Vote.model.vo.VInvote;
import com.kh.www.Vote.model.vo.VKeyword;
import com.kh.www.Vote.model.vo.Vote;
import com.kh.www.common.model.vo.PageInfo;

public interface VoteService {

	int getListCount(VKeyword keyword);

	ArrayList<Vote> getVoteList(PageInfo pi, VKeyword keyword);

	int insertVote(Vote v);
	
	int insertVChoice(ArrayList<VChoice> vclist);

	Vote selectVote(int vId);

	ArrayList<VChoice> selectVChoiceList(int vId);

	ArrayList<VInvote> selectVInvoteList(ArrayList<Integer> vcIdList);

	Member selectWriteUser(String userId);

	int insertVInvote(ArrayList<VInvote> invoteList);

	int deleteVote(int vId, ArrayList<VChoice> vclist);

	int updateVote(Vote v, ArrayList<VChoice> vclist, ArrayList<VChoice> originVClist);
}
