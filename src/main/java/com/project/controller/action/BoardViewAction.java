package com.project.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.action.Action;
import com.project.dao.BoardDAO;
import com.project.dto.BoardVO;

public class BoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "postViewPage.jsp";
		int  Board_number = Integer.parseInt(request.getParameter("board_number"));
		
		BoardDAO bdao = BoardDAO.getInstance();
		bdao.updateReadCount(Board_number);
		
		BoardVO BoardVO = bdao.selectBoardByNum(Board_number);
		request.setAttribute("board", BoardVO);
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}
}
