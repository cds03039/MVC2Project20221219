package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import com.project.dto.BoardVO;
import com.project.util.DBManager;

public class BoardDAO {

	public BoardDAO() {
	}

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	// 전체 게시글 가져오는 메소드
	public List<BoardVO> selectAllBoard() {
		String sql = "select * from board order by Board_number desc";

		List<BoardVO> list = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO bvo = new BoardVO();
				bvo.setNickname(rs.getString("nickname"));
				bvo.setBoard_title(rs.getString("board_title"));
				bvo.setBoard_content(rs.getString("board_content"));
				bvo.setCategory(rs.getString("category"));
				bvo.setBoard_date(rs.getDate("board_date"));
				bvo.setBoard_number(rs.getInt("board_number"));
				bvo.setBoard_views(rs.getInt("board_views"));
				bvo.setBoard_recommend(rs.getInt("board_recommend"));

				list.add(bvo);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}

	// insert 메소드
	public void insertBoard(BoardVO bvo) {
		String sql = "insert into board(Board_number, Board_title, Nickname, Board_date, Board_views, Category, Board_content,pictureUrl) values(board_seq.nextval,?,?,to_date(sysdate,'RRRR-MM-DD'),0,?,?,?) ";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getBoard_title());
			pstmt.setString(2, bvo.getNickname());
			pstmt.setString(3, bvo.getCategory());
			pstmt.setString(4, bvo.getBoard_content());
			pstmt.setString(5, bvo.getPictureUrl());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DBManager.close(conn, pstmt);
		}
	}

	// 조회수 증가 메소드
	public void updateReadCount(int Board_number) {
		String sql = "update board set Board_views = Board_views+1 where Board_number= ? ";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Board_number);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	// 게시판 글 클릭시 상세보기 메소드(글 번호로 찾음, 실패시 null)
	public BoardVO selectBoardByNum(int Board_number) {
		String sql = "select * from board where Board_number = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		BoardVO bvo = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Board_number);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bvo = new BoardVO();
				
				bvo.setNickname(rs.getString("nickname"));
				bvo.setBoard_title(rs.getString("board_title"));
				bvo.setBoard_content(rs.getString("board_content"));
				bvo.setCategory(rs.getString("category"));
				bvo.setBoard_date(rs.getDate("board_date"));
				bvo.setBoard_number(rs.getInt("board_number"));
				bvo.setBoard_views(rs.getInt("board_views"));
				bvo.setPictureUrl(rs.getString("pictureUrl"));
				bvo.setBoard_recommend(rs.getInt("board_recommend"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);

		}
		return bvo;

	}

	// 게시글 수정
	public void updateBoard(BoardVO bvo) {
		String sql = "update board set pictureUrl=?, Board_title=?, Board_date=sysdate, Board_content=?  where board_number=?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getPictureUrl());
			pstmt.setString(2, bvo.getBoard_title());
			pstmt.setString(3, bvo.getBoard_content());
			pstmt.setInt(4, bvo.getBoard_number());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);

		}
	}

	// 게시글삭제
	public void deleteBoard(int board_number) {
		String sql = "delete from board where board_number =?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_number);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

	}

	// 게시글 검색 전체
	public ArrayList<BoardVO> getAllSearch(String searchText, String category) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		String sql = "select * from board where category =? and board_title || board_content || nickname like '%'||?||'%' order by Board_number desc";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, searchText);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO bvo = new BoardVO();
				bvo.setNickname(rs.getString("nickname"));
				bvo.setBoard_title(rs.getString("board_title"));
				bvo.setBoard_content(rs.getString("board_content"));
				bvo.setCategory(rs.getString("category"));
				bvo.setBoard_date(rs.getDate("board_date"));
				bvo.setBoard_number(rs.getInt("board_number"));
				bvo.setBoard_views(rs.getInt("board_views"));
				bvo.setBoard_recommend(rs.getInt("board_recommend"));

				list.add(bvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	//게시글 제목/내용 검색
	public ArrayList<BoardVO> gettitleAndcontentSearch(String searchText, String category) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		String sql = "select * from board where category =? and board_title || board_content like '%'||?||'%' order by Board_number desc";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, searchText);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO bvo = new BoardVO();
				bvo.setNickname(rs.getString("nickname"));
				bvo.setBoard_title(rs.getString("board_title"));
				bvo.setBoard_content(rs.getString("board_content"));
				bvo.setCategory(rs.getString("category"));
				bvo.setBoard_date(rs.getDate("board_date"));
				bvo.setBoard_number(rs.getInt("board_number"));
				bvo.setBoard_views(rs.getInt("board_views"));
				bvo.setBoard_recommend(rs.getInt("board_recommend"));

				list.add(bvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return list;
	}
	//게시글 제목 검색
		public ArrayList<BoardVO> getTitleSearch(String searchText, String category) {
			ArrayList<BoardVO> list = new ArrayList<BoardVO>();
			String sql = "select * from board where category =? and board_title like '%'||?||'%' order by Board_number desc";

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setString(2, searchText);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					BoardVO bvo = new BoardVO();
					bvo.setNickname(rs.getString("nickname"));
					bvo.setBoard_title(rs.getString("board_title"));
					bvo.setBoard_content(rs.getString("board_content"));
					bvo.setCategory(rs.getString("category"));
					bvo.setBoard_date(rs.getDate("board_date"));
					bvo.setBoard_number(rs.getInt("board_number"));
					bvo.setBoard_views(rs.getInt("board_views"));
					bvo.setBoard_recommend(rs.getInt("board_recommend"));

					list.add(bvo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			return list;
		}
		
		// 내용 검색
		public ArrayList<BoardVO> getContentSearch(String searchText, String category) {
			ArrayList<BoardVO> list = new ArrayList<BoardVO>();
			String sql = "select * from board where category =? and board_content like '%'||?||'%' order by Board_number desc";

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setString(2, searchText);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					BoardVO bvo = new BoardVO();
					bvo.setNickname(rs.getString("nickname"));
					bvo.setBoard_title(rs.getString("board_title"));
					bvo.setBoard_content(rs.getString("board_content"));
					bvo.setCategory(rs.getString("category"));
					bvo.setBoard_date(rs.getDate("board_date"));
					bvo.setBoard_number(rs.getInt("board_number"));
					bvo.setBoard_views(rs.getInt("board_views"));
					bvo.setBoard_recommend(rs.getInt("board_recommend"));

					list.add(bvo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			return list;
		}
		
		// 닉네임 검색
		public ArrayList<BoardVO> getNicknameSearch(String searchText, String category) {
			ArrayList<BoardVO> list = new ArrayList<BoardVO>();
			String sql = "select * from board where category =? and nickname like '%'||?||'%' order by Board_number desc";

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setString(2, searchText);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					BoardVO bvo = new BoardVO();
					bvo.setNickname(rs.getString("nickname"));
					bvo.setBoard_title(rs.getString("board_title"));
					bvo.setBoard_content(rs.getString("board_content"));
					bvo.setCategory(rs.getString("category"));
					bvo.setBoard_date(rs.getDate("board_date"));
					bvo.setBoard_number(rs.getInt("board_number"));
					bvo.setBoard_views(rs.getInt("board_views"));
					bvo.setBoard_recommend(rs.getInt("board_recommend"));

					list.add(bvo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			return list;
		}
		
		
		//날짜 검색
		public ArrayList<BoardVO> getDateSearch(String start , String end, String category) {
			ArrayList<BoardVO> list = new ArrayList<BoardVO>();
			String sql = "select * from board where category =? and board_date between ? and ? order by Board_number desc";

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setString(2, start);
				pstmt.setString(3, end);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					BoardVO bvo = new BoardVO();
					bvo.setNickname(rs.getString("nickname"));
					bvo.setBoard_title(rs.getString("board_title"));
					bvo.setBoard_content(rs.getString("board_content"));
					bvo.setCategory(rs.getString("category"));
					bvo.setBoard_date(rs.getDate("board_date"));
					bvo.setBoard_number(rs.getInt("board_number"));
					bvo.setBoard_views(rs.getInt("board_views"));
					bvo.setBoard_recommend(rs.getInt("board_recommend"));

					list.add(bvo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			return list;
		}
		// 메인에 10개 나오게 하는 메소드
		public List<BoardVO> selectBoardByCategory(String category, int num) {
			String sql = "select * from (select * from board order by to_number(Board_number) desc) where category = ? and rownum <= ?";

			List<BoardVO> list = new ArrayList<>();

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2, num);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					BoardVO bvo = new BoardVO();
					bvo.setNickname(rs.getString("nickname"));
					bvo.setBoard_title(rs.getString("board_title"));
					bvo.setBoard_content(rs.getString("board_content"));
					bvo.setCategory(rs.getString("category"));
					bvo.setBoard_date(rs.getDate("board_date"));
					bvo.setBoard_number(rs.getInt("board_number"));
					bvo.setBoard_views(rs.getInt("board_views"));
					bvo.setBoard_recommend(rs.getInt("board_recommend"));

					list.add(bvo);

				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			return list;
		}
		// 최근 작성글 가져오기
		public List<BoardVO> recentWrite(String nickname) {
			String sql = "select * from (select * from board order by to_number(Board_number) desc) where nickname = ? and rownum <= 10";

			List<BoardVO> list = new ArrayList<>();

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, nickname);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					BoardVO bvo = new BoardVO();
					bvo.setNickname(rs.getString("nickname"));
					bvo.setBoard_title(rs.getString("board_title"));
					bvo.setBoard_content(rs.getString("board_content"));
					bvo.setCategory(rs.getString("category"));
					bvo.setBoard_date(rs.getDate("board_date"));
					bvo.setBoard_number(rs.getInt("board_number"));
					bvo.setBoard_views(rs.getInt("board_views"));
					bvo.setBoard_recommend(rs.getInt("board_recommend"));

					list.add(bvo);

				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			return list;
		}
		
		// 카테고리별로 게시판 글 찾기
		public List<BoardVO> selectBoardByCategory(String category) {
			String sql = "select * from board where category = ? order by to_number(Board_number) desc";

			List<BoardVO> list = new ArrayList<>();

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					BoardVO bvo = new BoardVO();
					bvo.setNickname(rs.getString("nickname"));
					bvo.setBoard_title(rs.getString("board_title"));
					bvo.setBoard_content(rs.getString("board_content"));
					bvo.setCategory(rs.getString("category"));
					bvo.setBoard_date(rs.getDate("board_date"));
					bvo.setBoard_number(rs.getInt("board_number"));
					bvo.setBoard_views(rs.getInt("board_views"));
					bvo.setBoard_recommend(rs.getInt("board_recommend"));

					list.add(bvo);

				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			return list;
		}
		
		// 신고/건의 게시글 가져오기
		public List<BoardVO> selectReportBoard() {
			String sql = "select * from board where category in('욕설','도배','건의','기타') order by Board_number";

			List<BoardVO> list = new ArrayList<>();

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					BoardVO bvo = new BoardVO();
					bvo.setNickname(rs.getString("nickname"));
					bvo.setBoard_title(rs.getString("board_title"));
					bvo.setBoard_content(rs.getString("board_content"));
					bvo.setCategory(rs.getString("category"));
					bvo.setBoard_date(rs.getDate("board_date"));
					bvo.setBoard_number(rs.getInt("board_number"));
					bvo.setBoard_views(rs.getInt("board_views"));
					bvo.setBoard_recommend(rs.getInt("board_recommend"));

					list.add(bvo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			return list;
		}
		
		// 카테고리별 게시글 가져오기
				public List<BoardVO> selectCategoryBoard(String category) {
					String sql = "select * from board where category = ? order by Board_number";

					List<BoardVO> list = new ArrayList<>();

					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					try {
						conn = DBManager.getConnection();
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, category);
						rs = pstmt.executeQuery();

						while (rs.next()) {
							BoardVO bvo = new BoardVO();
							bvo.setNickname(rs.getString("nickname"));
							bvo.setBoard_title(rs.getString("board_title"));
							bvo.setBoard_content(rs.getString("board_content"));
							bvo.setCategory(rs.getString("category"));
							bvo.setBoard_date(rs.getDate("board_date"));
							bvo.setBoard_number(rs.getInt("board_number"));
							bvo.setBoard_views(rs.getInt("board_views"));
							bvo.setBoard_recommend(rs.getInt("board_recommend"));

							list.add(bvo);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						DBManager.close(conn, pstmt, rs);
					}
					return list;
				}
		
				
				// 조회수별 글리스트 사이드바 
				public List<BoardVO> selectBoardByBoard_views(int num) {
					String sql = "select * from board WHERE ROWNUM <= ? ORDER by board_views desc ";

					List<BoardVO> list = new ArrayList<>();

					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;

					try {
						conn = DBManager.getConnection();
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, num);
						rs = pstmt.executeQuery();

						while (rs.next()) {
							BoardVO bvo = new BoardVO();
							bvo.setNickname(rs.getString("nickname"));
							bvo.setBoard_title(rs.getString("board_title"));
							bvo.setBoard_content(rs.getString("board_content"));
							bvo.setCategory(rs.getString("category"));
							bvo.setBoard_date(rs.getDate("board_date"));
							bvo.setBoard_number(rs.getInt("board_number"));
							bvo.setBoard_views(rs.getInt("board_views"));
							bvo.setBoard_recommend(rs.getInt("board_recommend"));

							list.add(bvo);

						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						DBManager.close(conn, pstmt, rs);
					}
					return list;
				}
				
				public List userWriteCount(String nickname){
					String sql = "   select count(*) cnt, category from board where nickname = ? and category in('sports', 'game', 'photo','himedia', 'movie') group by category";
					List list = new ArrayList<>();
					
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;

					try {
						conn = DBManager.getConnection();
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, nickname);
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							list.add(rs.getInt("cnt"));
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
					return list;
				}

}
