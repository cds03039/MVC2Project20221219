package com.project.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.UsersDAO;
import com.project.util.SHA256;

public class EmailChcekAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		UsersDAO dao = UsersDAO.getInstance();
		
		String code = request.getParameter("code");
		
		String userEmail = dao.selectOneByCode(code); 
		
		String a = new SHA256().getSHA256(userEmail);
		
		System.out.println("a : " + a);
		
		boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
		
		if(isRight) {
			dao.updateEmailCheck(userEmail);
			response.sendRedirect("index.jsp");
		}else
			System.out.println("인증 실패");
	}
	
}
