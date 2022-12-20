package com.project.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.controller.action.Action;
import com.project.dao.BoardDAO;
import com.project.dao.UsersDAO;
import com.project.dto.UsersVO;

public class BoardWriteFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url = "writingPage.jsp";
		String category = request.getParameter("category");
		
//		HttpSession session = request.getSession();
//		UsersVO email = (UsersVO)session.getAttribute("loginUser");
		
//		System.out.println("email : " + email);
//		System.out.println("cate : " + category);
		
//		UsersDAO dao = UsersDAO.getInstance();
//		UsersVO vo = dao.selectOneByEmail(email);
//		
//		System.out.println("vo : " + vo);
		
//		request.setAttribute("vo", vo);
		request.setAttribute("category", category);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}

}
