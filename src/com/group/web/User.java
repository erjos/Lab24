package com.group.web;

public class User {
	private String username;
	private String password;
	private String email;
	private String fullname;
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(String us, String em, String fn){
		username = us;
		email = em;
		fullname = fn;
	}
	
	public String getUsername() {
		return username;
	}


	public String getPassword() {
		return password;
	}


	public String getEmail() {
		return email;
	}


	public String getFullname() {
		return fullname;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

}
