package com.springboot.tasteexplorer.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.tasteexplorer.model.BoardDao;
import com.springboot.tasteexplorer.model.BoardDo;
import com.springboot.tasteexplorer.model.MemberDo;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao bdao;
	
	@Override
	public void insertBoard(BoardDo bdo) {
		bdao.insertBoard(bdo);
	}
	
	@Override
	public ArrayList<BoardDo> getBoardList() {
		return bdao.getBoardList();
	}
	
	@Override
	public void joinBoard(MemberDo mdo) {
		bdao.joinBoard(mdo);
	}


	
	
	

}
