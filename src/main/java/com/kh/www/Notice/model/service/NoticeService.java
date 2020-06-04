package com.kh.www.Notice.model.service;

import java.util.ArrayList;

import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.common.model.vo.PageInfo;

public interface NoticeService {

	int insertNotice(Notice n);

	int getNoticeListCount();

	ArrayList<Notice> selectList(PageInfo pi);

}
