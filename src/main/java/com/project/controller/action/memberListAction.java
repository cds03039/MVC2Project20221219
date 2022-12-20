package com.project.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.BoardDAO;
import com.project.dao.UsersDAO;
import com.project.dto.BoardVO;
import com.project.dto.UsersVO;

public class memberListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "memberList.jsp";
		BoardDAO bdao = BoardDAO.getInstance();
		UsersDAO udao = UsersDAO.getInstance();
		
		List<UsersVO> memberList = udao.selectAll();
		List<BoardVO> reportList = bdao.selectReportBoard();
		
//		System.out.println("ddd"+reportList);
		request.setAttribute("reportList", reportList);
		request.setAttribute("memberList", memberList);
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
