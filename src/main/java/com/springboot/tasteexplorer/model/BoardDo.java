package com.springboot.tasteexplorer.model;

public class BoardDo {
	
	private int num;
	private String title;
	private String menu;
	private String review;
	private int grade;
	
	
	
	
	
	@Override
	public String toString() {
		return "BoardDo [num=" + num + ", title=" + title + ", menu=" + menu + ", review=" + review + ", grade=" + grade
				+ "]";
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int i) {
		this.grade = i;
	}
	
	
	
	
	

}
