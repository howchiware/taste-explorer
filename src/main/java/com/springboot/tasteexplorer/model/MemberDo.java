package com.springboot.tasteexplorer.model;

public class MemberDo {
	
	private String id;
	private String pwd;
	private String name;
	
	@Override
	public String toString() {
		return "MemberDo [id=" + id + ", pwd=" + pwd + ", name=" + name + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
	

}
