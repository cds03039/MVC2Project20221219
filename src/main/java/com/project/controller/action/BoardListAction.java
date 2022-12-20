package com.project.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.BoardDAO;
import com.project.dto.BoardVO;

public class BoardListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "boardList.jsp";
		BoardDAO bdao = BoardDAO.getInstance();
		
		String category = request.getParameter("category");
		
		List<BoardVO> boardList = bdao.selectBoardByCategory(category);
		
//		System.out.println("category : " + category);
		request.setAttribute("boardList", boardList);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
