package com.kh.www.club.model.service;

import java.util.ArrayList;

import com.kh.www.club.model.vo.Club;
import com.kh.www.common.model.vo.PageInfo;

public interface ClubService {

	int getListCount();

	ArrayList<Club> selectList(PageInfo pi);

}
