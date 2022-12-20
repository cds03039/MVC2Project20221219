package com.project.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.action.Action;
import com.project.dao.BoardDAO;
import com.project.dto.BoardVO;

public class BoardUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "boardUpdate.jsp";

		int board_number = Integer.parseInt(request.getParameter("board_number"));

		BoardDAO bdao = BoardDAO.getInstance();
		bdao.updateReadCount(board_number);
		BoardVO bvo = bdao.selectBoardByNum(board_number);

		request.setAttribute("board", bvo);

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}

}
