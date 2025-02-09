package com.springboot.tasteexplorer.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springboot.tasteexplorer.model.BoardDao;
import com.springboot.tasteexplorer.model.BoardDo;
import com.springboot.tasteexplorer.model.MemberDo;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value="/insertBoard.do")
	public String insertBoard() {
		System.out.println("[JDBC] insertBoard() ~~> ");
		
		return "insertBoard";
	}
	
	@RequestMapping(value="/insertBoardProc.do")
	public String insertBoardProc(BoardDo bdo, BoardDao bdao) {
		System.out.println("[JDBC] insertBoardProc() ~~> ");
		System.out.println("title : " + bdo.getTitle());
		System.out.println("menu : " + bdo.getMenu());
		
		boardDao.insertBoard(bdo);
		
		return "redirect:getBoardList.do";
	}
	
	@RequestMapping(value="/getBoardList.do")
	public String getBoardList(BoardDo bdo, BoardDao bdao, Model model) {
		System.out.println("[JDBC] getBoardList() ~~> ");
		
		ArrayList<BoardDo> bList = boardDao.getBoardList();
		ArrayList<MemberDo> mList = boardDao.getMemberList();
		
		for(BoardDo bdo1 : bList) {
			System.out.println("~~> " + bdo1.toString());
		}
		
		model.addAttribute("bList", bList);
		model.addAttribute("mList", mList);
		
		return "getBoardList";
	}

	@RequestMapping(value="/modifyBoard.do")
	public ModelAndView modifyBoard(BoardDo bdo, BoardDao bdao, ModelAndView mav) {
		
		System.out.println("[JDBC] modifyBoard() ~~! ");
		System.out.println("num : " + bdo.getNum());
		
		BoardDo foodboard = boardDao.getBoard(bdo);
		
		mav.addObject("foodboard", foodboard);
		mav.setViewName("modifyBoard");
		
		return mav;
	}
	
	@RequestMapping(value="/modifyBoardProc.do")
	public ModelAndView modifyBoardProc(BoardDo bdo, BoardDao bdao, ModelAndView mav) {
		System.out.println("[JDBC] modifyBoardProc ~~! ");
		System.out.println("num : " + bdo.getNum());
		System.out.println("title : " + bdo.getTitle());
		
		boardDao.modifyBoard(bdo);
		
		mav.setViewName("redirect:getBoardList.do");
		
		return mav;
	}
	
	@RequestMapping(value="/deleteBoard.do")
	public ModelAndView deleteBoard(BoardDo bdo, BoardDao bdao, ModelAndView mav) {
		System.out.println("[JDBC] deleteBaord ~~!");
		System.out.println("num : " + bdo.getNum());
		
		boardDao.deleteBoard(bdo);
		
		mav.setViewName("redirect:getBoardList.do");
		
		return mav;
	}

	@RequestMapping(value="/searchBoardList.do")
	public ModelAndView searchBoardList(@RequestParam(value="searchCon") String searchCon,
										@RequestParam(value="searchKey") String searchKey,
										BoardDao bdao, ModelAndView mav) {
		
		System.out.println("[JDBC] searchBoardList() ~~!");
		System.out.println("searchCon : " + searchCon);
		System.out.println("searchKey : " + searchKey);
		
		ArrayList<BoardDo> bList = boardDao.searchBoardList(searchCon, searchKey);
		
		mav.addObject("bList", bList);
		
		mav.setViewName("getBoardList");
		
		return mav;
	}
	
	@RequestMapping(value="/joinBoard.do")
	public String joinBoard() {
		System.out.println("[JDBC] joinBoard() ~~> ");
		
		return "joinBoard";
	}
	
	@RequestMapping(value="/joinBoardProc.do")
	public String joinBoardProc(MemberDo mdo) {
		System.out.println("[JDBC] joinBoardProc() ~~> ");
		System.out.println("name : " + mdo.getName());
		
		boardDao.joinBoard(mdo);
		
		return "redirect:mainBoard.do";
	}
	
	@RequestMapping(value="/loginBoard.do")
	public String loginBoard() {
		System.out.println("[JDBC] loginBoard() ~~> ");
		
		return "loginBoard";
	}
	
	@RequestMapping(value="/loginBoardProc.do")
	public String loginBoardProc(MemberDo mdo, HttpSession session, Model model) {
		System.out.println("[JDBC] loginBoardProc() ~~> ");
		
		MemberDo mdo1 = boardDao.loginBoard(mdo.getId(), mdo.getPwd());
		
		if(mdo1 != null) {
			System.out.println("[JDBC] loginBoardProc() 완료!");
			model.addAttribute("mdo1", mdo);
			session.setAttribute("loginName", mdo1);
			return "redirect:getBoardList.do";
		} else {
			System.out.println("[JDBC] loginBoardProc() 실패!");
			return "mainBoard";
		}

	}
	
	@RequestMapping(value="/mainBoard.do")
	public String mainBoard() {
		System.out.println("[JDBC] mainBoard() ~~> ");
		
		return "mainBoard";
	}
	
	@RequestMapping(value="/rouletteBoard.do")
	public String rouletteBoard(Model model) {
		
		System.out.println("[JDBC] rouletteBoard() ~~> ");
		
		ArrayList<BoardDo> bList = boardDao.getBoardList();
		List<String> mList = bList.stream().map(BoardDo::getMenu).collect(Collectors.toList());
		
		Random random = new Random();
		String rMenu = mList.get(random.nextInt(mList.size()));
		
		model.addAttribute("rMenu", rMenu);
		return "rouletteBoard";
	}

	@RequestMapping(value="/modifyMember.do")
	public ModelAndView modifyMember(HttpSession session, ModelAndView mav) {
		
		System.out.println("[JDBC] modifyMember() ~~! ");
		
		// 데이터 조회
		MemberDo loginUser = (MemberDo) session.getAttribute("loginName");
		
		MemberDo memberboard = boardDao.getMember(loginUser); // 세션 정보를 기반으로 조회
	    mav.addObject("memberboard", memberboard);
	    mav.setViewName("modifyMember");
		
		return mav;
	}
	
	@RequestMapping(value="/modifyMemberProc.do")
	public String modifyMemberProc(MemberDo mdo, HttpSession session) {
		System.out.println("[JDBC] modifyMemberProc ~~! ");

		
		MemberDo loginUser = (MemberDo) session.getAttribute("loginName");
		
	    if (loginUser == null) {
	        // 로그인 정보가 없으면 로그인 페이지로 리다이렉트
	        return "redirect:mainBoard.do";
	    }
		
		boardDao.modifyMember(mdo);
		
		System.out.println("[JDBC] modifyMemberProc 완료 ~~! ");
		
		session.setAttribute("loginName", mdo);
		
		return "redirect:getBoardList.do";
	}

	

}
