package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;

import com.project.util.DBManager;

public class Chart2DAO {
	
	private Chart2DAO() {}
	private static Chart2DAO instance = new Chart2DAO();
	public static Chart2DAO getInstance() {
		return instance;
	}
	// 그룹주소에 해당하는 카운트 메소드

	@SuppressWarnings("unchecked")
	public JSONArray getCountAddress() {

	Connection con = null;

	PreparedStatement pstmt = null;

	ResultSet rs = null;

	String sql = "";

	JSONArray jsonArray = new JSONArray();

	 

	JSONArray colNameArray = new JSONArray(); // 컬 타이틀 설정

	colNameArray.add("주소");

	colNameArray.add("인원수");

	jsonArray.add(colNameArray);

	 

	try {

	con = DBManager.getConnection();

	sql = "SELECT category ,COUNT(*) AS cnt FROM board where category in('sports','game','photo','himedia','movie') GROUP BY category";

	pstmt = con.prepareStatement(sql);

	rs = pstmt.executeQuery();

	 

	while(rs.next()){

	JSONArray rowArray = new JSONArray();
	
	rowArray.add(rs.getString("category"));
	rowArray.add(rs.getInt("cnt"));
	 

	jsonArray.add(rowArray);

	}//while

	} catch (Exception e) {

	e.printStackTrace();

	}finally {

	DBManager.close(con, pstmt, rs);

	}

	return jsonArray;

	}//getCountAddress
}
