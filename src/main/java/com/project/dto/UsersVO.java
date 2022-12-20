package com.project.dto;

import java.util.Date;

public class UsersVO {
	private String name, phone, email, password, nickname, emailHash;
	private Date joinDate;
	private int grade, emailChecked;
	
	public UsersVO() {
	
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmailHash() {
		return emailHash;
	}

	public void setEmailHash(String emailHash) {
		this.emailHash = emailHash;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getEmailChecked() {
		return emailChecked;
	}

	public void setEmailChecked(int emailChecked) {
		this.emailChecked = emailChecked;
	}

	@Override
	public String toString() {
		return "UsersVO [name=" + name + ", phone=" + phone + ", email=" + email + ", password=" + password
				+ ", nickname=" + nickname + ", emailHash=" + emailHash + ", joinDate=" + joinDate + ", grade=" + grade
				+ ", emailChecked=" + emailChecked + "]";
	}
	
	
	
}
