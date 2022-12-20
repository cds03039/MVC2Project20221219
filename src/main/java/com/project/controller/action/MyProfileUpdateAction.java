package com.project.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.UsersDAO;
import com.project.dto.UsersVO;

public class MyProfileUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url = "userDetail.jsp";
		
		String email = request.getParameter("userid");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String pass = request.getParameter("pass");
		
		UsersVO vo = new UsersVO();
		vo.setEmail(email);
		vo.setName(name);
		vo.setPhone(phone);
		vo.setPassword(pass);
		
		UsersDAO dao = UsersDAO.getInstance();
		
		int result = dao.updateUser(vo);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", dao.selectOneByEmail(email));
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
