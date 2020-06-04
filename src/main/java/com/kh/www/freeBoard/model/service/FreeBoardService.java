package com.kh.www.freeBoard.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.freeBoard.model.vo.FreeBoard;

public interface FreeBoardService {

	int insertBoard(FreeBoard fb);

	int getListCount();

	ArrayList<FreeBoard> selectList(PageInfo pi);
	
}
