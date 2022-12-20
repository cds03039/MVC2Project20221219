package com.project.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.BoardDAO;
import com.project.dto.BoardVO;

public class SideAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "sideBar.jsp";
		BoardDAO bdao = BoardDAO.getInstance();
		
		
		
		List<BoardVO> board_viewsList = bdao.selectBoardByBoard_views(10);
		
		System.out.println(board_viewsList);
		request.setAttribute("board_viewsList", board_viewsList);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}

}
