package com.project.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.UsersDAO;

public class EmailFindAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url = "findPage.jsp";
		
		UsersDAO dao = UsersDAO.getInstance();
		
		String name = request.getParameter("find_name");
		String phone = request.getParameter("find_phone");
		
		String email = dao.searchEmailbyNameAndPhone(name, phone);
		
		System.out.println(email);
		
		if(email.equals("")) {
			request.setAttribute("message", "입력하신 정보가 없습니다");
		}else {
			request.setAttribute("message", "아이디는 " + email + " 입니다.");
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
