package com.springboot.tasteexplorer.model;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.springboot.tasteexplorer.model.BoardDo;


@Repository("boardDao")
public class BoardDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//디비 저장 메소드
	public void insertBoard(BoardDo bdo) {
		System.out.println("[JDBC] insertBoard() 시작");
		
		String sql = "insert into foodboard values(null, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, bdo.getTitle(), bdo.getMenu(), bdo.getReview(), bdo.getGrade());
	}
	
	//전체 데이터 가져오는 메소드
	public ArrayList<BoardDo> getBoardList() {
		System.out.println("[JDBC] getBoardList() 시작");
		
		String sql = "select * from foodboard";
		
		return (ArrayList<BoardDo>) jdbcTemplate.query(sql, new BoardRowMapper() );
	}
	
	//전체 데이터 가져오는 메소드
	public ArrayList<MemberDo> getMemberList() {
		System.out.println("[JDBC] getMemberList() 시작");
		
		String sql = "select * from memberboard";
		
		return (ArrayList<MemberDo>) jdbcTemplate.query(sql, new MemberRowMapper() );
	}
	
	//한개의 레코드 가져오는 메소드
	public BoardDo getBoard(BoardDo temp) {
		System.out.println("[JDBC] getBoard() 시작");
		
		String sql = "select * from foodboard where num=?";
		
		Object[] args = {temp.getNum() };
		return jdbcTemplate.queryForObject(sql, args, new BoardRowMapper() );
	}
	
	
	//수정하는 메소드
	public void modifyBoard(BoardDo bdo) {
		System.out.println("[JDBC] modifyBoard() 시작");
		
		String sql = "update foodboard set title=?, menu=?, review=?, grade=? where num=?";
		
		jdbcTemplate.update(sql, bdo.getTitle(), bdo.getMenu(), bdo.getReview(), bdo.getGrade(), bdo.getNum());
	}
	
	
	//삭제하는 메소드
	public void deleteBoard(BoardDo bdo) {
		System.out.println("[JDBC] deleteBoard() 시작");
		
		String sql = "delete from foodboard where num=?";
		
		jdbcTemplate.update(sql, bdo.getNum());
	}
	
	//검색하는 메소드
	public ArrayList<BoardDo> searchBoardList(String searchCon, String searchKey) {
		System.out.println("[JDBC] searchBoardLIst() 시작");
		
		String sql = "";
		if(searchCon.equals("title")) {
			sql = "select * from foodboard where title=? order by num desc";
		} else if(searchCon.equals("menu")) {
			sql = "select * from foodboard where menu=? order by num desc";
		} else if(searchCon.equals("review")) {
			sql = "select * from foodboard where review=? order by num desc";
		} else {
			System.out.println("searchCon and searchKey Problem");
			return null;
		}
		Object[] args = {searchKey};
		
		return (ArrayList<BoardDo>) jdbcTemplate.query(sql, args, new BoardRowMapper());
		
		}
	
	//회원가입 메소드
	public void joinBoard(MemberDo mdo) {
		System.out.println("[JDBC] joinBoard() 시작");
		
		String sql = "insert into memberboard values(?, ?, ?)";
		jdbcTemplate.update(sql, mdo.getId(), mdo.getPwd(), mdo.getName());
	}
	
	//로그인 메소드
	public MemberDo loginBoard(String id, String pwd) {
		System.out.println("[JDBC] loginBoard() 시작");
		
		String sql = "select * from memberboard where id=? and pwd=?";
		 try {
		        // 쿼리 실행 및 결과 반환
		        return jdbcTemplate.queryForObject(sql, new Object[]{id, pwd}, new MemberRowMapper());
		    } catch (EmptyResultDataAccessException e) {
		        // 결과가 없는 경우 처리
		        System.out.println("로그인 실패: 유효하지 않은 사용자");
		        return null;
		    } catch (DataAccessException e) {
		        // 데이터베이스 접근 오류 처리
		        System.err.println("데이터베이스 오류: " + e.getMessage());
		        throw e; // 필요에 따라 호출부로 예외를 전달
		    }
		
		
	}
	
	
	//한개의 레코드 가져오는 메소드
	public MemberDo getMember(MemberDo temp) {
		System.out.println("[JDBC] getMember() 시작");
		
		String sql = "select * from memberboard where name=?";
		
		//Object[] args = {temp.getName() };
		return jdbcTemplate.queryForObject(sql, new Object[] {temp.getName()}, new MemberRowMapper() );
	}
	
	
	//수정하는 메소드
	public void modifyMember(MemberDo mdo) {
		System.out.println("[JDBC] modifyMember() 시작");
		
		String sql = "UPDATE memberboard SET pwd=?, name=? WHERE id=?";
		
		jdbcTemplate.update(sql, mdo.getPwd(), mdo.getName(), mdo.getId());
	}

	
}


class BoardRowMapper implements RowMapper<BoardDo> {
	
	@Override
	public BoardDo mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		System.out.println("[JDBC] mapRow() ~~> ");
		
		BoardDo bdo = new BoardDo();
		bdo.setNum(rs.getInt(1));
		bdo.setTitle(rs.getString(2));
		bdo.setMenu(rs.getString(3));
		bdo.setReview(rs.getString(4));
		bdo.setGrade(rs.getInt(5));
		
		return bdo;
	}	
}

class MemberRowMapper implements RowMapper<MemberDo> {
    @Override
    public MemberDo mapRow(ResultSet rs, int rowNum) throws SQLException {
        
    	System.out.println("[JDBC] mapRow() ~~> ");
    	
    	MemberDo mdo = new MemberDo();
        mdo.setId(rs.getString("id"));
        mdo.setPwd(rs.getString("pwd"));
        mdo.setName(rs.getString("name"));
        return mdo;
    }
}

