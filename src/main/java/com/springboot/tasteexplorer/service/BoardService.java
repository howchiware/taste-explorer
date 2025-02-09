package com.springboot.tasteexplorer.service;

import java.util.ArrayList;

import com.springboot.tasteexplorer.model.BoardDo;
import com.springboot.tasteexplorer.model.MemberDo;

public interface BoardService {
	
	void insertBoard(BoardDo bdo);
	
	void joinBoard(MemberDo mdo);
	
	ArrayList<BoardDo> getBoardList();
	
}
