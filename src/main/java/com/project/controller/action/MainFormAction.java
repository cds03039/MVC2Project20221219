package com.project.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.BoardDAO;
import com.project.dto.BoardVO;

public class MainFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardVO> list1 = dao.selectBoardByCategory("sports",10);
		List<BoardVO> list2 = dao.selectBoardByCategory("photo",10);
		List<BoardVO> list3 = dao.selectBoardByCategory("game",10);
		List<BoardVO> list4 = dao.selectBoardByCategory("himedia",10);
		List<BoardVO> list5 = dao.selectBoardByCategory("movie",10);
		List<BoardVO> topList = dao.selectBoardByBoard_views(10);
		
		request.setAttribute("sportsList", list1);
		request.setAttribute("photoList", list2);
		request.setAttribute("gameList", list3);
		request.setAttribute("himediaList", list4);
		request.setAttribute("movieList", list5);
		request.setAttribute("topList", topList);
		
		

		RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
		rd.forward(request, response);
		
	}

}
