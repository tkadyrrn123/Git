package com.kh.www.Apart.model.service;

import java.util.ArrayList;

import com.kh.www.Apart.model.vo.Apart;

public interface ApartService {

	int aptInsert(Apart apt);

	ArrayList<Apart> searchApt(String text);
	
}
