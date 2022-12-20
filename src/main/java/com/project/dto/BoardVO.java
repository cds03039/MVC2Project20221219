package com.project.dto;

import java.util.Date;

public class BoardVO {
	private String nickname, board_title, board_content, category,pictureUrl;
	private Date board_date;
	private int board_number, board_views, board_recommend;
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getBoard_number() {
		return board_number;
	}
	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}
	public int getBoard_views() {
		return board_views;
	}
	public void setBoard_views(int board_views) {
		this.board_views = board_views;
	}
	public int getBoard_recommend() {
		return board_recommend;
	}
	public void setBoard_recommend(int board_recommend) {
		this.board_recommend = board_recommend;
	}
	@Override
	public String toString() {
		return "BoardVO [nickname=" + nickname + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", category=" + category + ", pictureUrl=" + pictureUrl + ", board_date=" + board_date
				+ ", board_number=" + board_number + ", board_views=" + board_views + ", board_recommend="
				+ board_recommend + "]";
	}
	
	
}
