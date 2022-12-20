package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.project.dto.UsersVO;
import com.project.util.DBManager;

public class UsersDAO {
	
	public UsersDAO() {}
	
	private static UsersDAO instance = new UsersDAO();
	
	public static UsersDAO getInstance() {
		return instance;
	}
	
	// 모든 회원 검색
	public ArrayList<UsersVO> selectAll(){
		String sql = "select * from users order by name";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<UsersVO> list = new ArrayList<>();
		UsersVO vo = null;		
		conn = DBManager.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getString("password"));
				vo = new UsersVO();	
				vo.setEmail(rs.getString("email"));
				vo.setPassword(rs.getString("password"));
				vo.setName(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setNickname(rs.getString("nickname"));
				vo.setJoinDate(rs.getDate("joinDate"));
				vo.setGrade(rs.getInt("grade"));
				vo.setEmailHash(rs.getString("emailHash"));
				vo.setEmailChecked(rs.getInt("emailChecked"));
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	// 회원 가입
	public int insertOne(UsersVO vo) {
		int result = 0;
		String sql = "insert into users values(?,?,?,?,?,sysdate,2,?,0)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getNickname());
			pstmt.setString(6, vo.getEmailHash());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		
		return result;
	}
	
	// 이메일 해쉬 코드를 이용해서 인증
	public String selectOneByCode(String code) {
		String sql = "select email from users where emailhash = ?";
		String email = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				email = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return email;
	}
	
	// 이메일 인증 하면 상태변경
	public void updateEmailCheck(String email) {
		String sql = "update users set emailchecked = 1 where email = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 로그인
	public int login(String email, String password) {
		int result = 0;
		String sql = "select * from users where email = ? and password = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			
			// 아이디 비밀번호가 일치 한다면
			if(rs.next()) {
				// 이메일 인증이 안되있다면
				if(rs.getInt("emailchecked") == 0) {
					result = 1;
				// 이메일 인증 되었다면
				}else {
					// 슈퍼 관리자
					if(rs.getInt("grade")==0) {
						result = 2;
					// 관리자
					}else if(rs.getInt("grade")==1) {
						result = 3;
					// 일반회원
					}else if(rs.getInt("grade")==2) {
						result = 4;
					// 블랙리스트(정지회원)
					}else {
						result = 5;
					}
				}
			// 아이디 비밀번호가 일치 하지 않는다면
			}else {
				result = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	// 회원 등급 교체
	public void changeGrade(String email, int grade) {
		String sql = "update users set grade = ? where email = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, grade);
			pstmt.setString(2, email);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 아이디(이메일) 찾기
	public String searchId(String name, String phone) {
		String sql = "select email from users where name = ? and phone = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String email = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				email = rs.getString("email");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return email;
	}
	// 비밀번호 찾기
	public String searchPw(String email, String name, String phone) {
		String sql = "select password from users where email = ? and name = ? and phone =?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String password = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				password = rs.getString("password");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return password;
	}
	
	// boolean 타입으로 회원 존재 여부
	public boolean isUserExist(String email, String name, String phone) {
		boolean flag = false;
		String sql = "select * from users where email = ? and name = ? and phone = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return flag;
	}
	
	// 비밀번호 변경
	public void updatePassword(String email, String password) {
		String sql = "update users set password = ? where email = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, password);
			pstmt.setString(2, email);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// 이메일로 회원 한명 검색
	public UsersVO selectOneByEmail(String email) {
		String sql = "select * from users where email = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UsersVO vo = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new UsersVO();
				vo.setGrade(rs.getInt("grade"));
				vo.setEmail(rs.getString("email"));
				vo.setJoinDate(rs.getDate("joindate"));
				vo.setName(rs.getString("name"));
				vo.setNickname(rs.getString("nickname"));
				vo.setPhone(rs.getString("phone"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return vo;
	}
	
	// 이메일 해쉬 찾기
	public String searchEmailHash(String email) {
		String sql = "select emailhash from users where email = ?";
		String emailHash = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				emailHash = rs.getString("emailhash");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return emailHash;
	}
	// 이름 전화번호로 이메일 주소 찾기
	public String searchEmailbyNameAndPhone(String name, String phone) {
		String sql = "select email from users where name = ? and phone = ?";
		String email = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				email = rs.getString("email");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return email;
	}
	
	public int updateUser(UsersVO vo) {
		String sql = "update users set name = ?, phone = ?, password = ? where email = ?";
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getPassword());
			pstmt.setString(4, vo.getEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
}
