package com.project.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.UsersDAO;
import com.project.dto.UsersVO;

public class MyProfileUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url = "profileChangePage.jsp";
//		String email = request.getParameter("email");
//		UsersDAO dao = UsersDAO.getInstance();
//		
//		UsersVO vo = dao.selectOneByEmail(email);
//		
//		request.setAttribute("vo", vo);
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
