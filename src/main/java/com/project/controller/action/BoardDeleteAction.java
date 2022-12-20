package com.project.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.BoardDAO;

public class BoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int board_number = Integer.parseInt(request.getParameter("board_number"));
		
		BoardDAO bdao = BoardDAO.getInstance();
		bdao.deleteBoard(board_number);
		
		new BoardListAction().execute(request, response);

	}

}
