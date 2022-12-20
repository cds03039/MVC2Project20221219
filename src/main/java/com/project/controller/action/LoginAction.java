package com.project.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.UsersDAO;
import com.project.dto.UsersVO;

public class LoginAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url = "";
		String email = request.getParameter("userid");
		String password = request.getParameter("pass");
		
		HttpSession session = request.getSession();
		
		
		UsersDAO dao = UsersDAO.getInstance();
		UsersVO vo = null;
		
		int result = dao.login(email, password);
		if(result == 1) {
			request.setAttribute("message", "이메일 인증이 되있지 않습니다");
			request.setAttribute("emailCheck", "0");
			request.setAttribute("email", email);
			url = "loginPage.jsp";
		}else if(result == 2) {
			//request.setAttribute("message", "페이지 개발자 입니다.");
			url = "index.jsp";
			vo = dao.selectOneByEmail(email);
			session.setAttribute("loginUser", vo);
		}else if(result == 3) {
			//request.setAttribute("message", "관리자 입니다.");
			url = "index.jsp";
			vo = dao.selectOneByEmail(email);
			session.setAttribute("loginUser", vo);
		}else if(result == 4) {
			//request.setAttribute("message", "일반회원입니다.");
			url = "index.jsp";
			vo = dao.selectOneByEmail(email);
			session.setAttribute("loginUser", vo);
		}else if(result == 5) {
			request.setAttribute("message", "정지회원 입니다.");
			url = "loginPage.jsp";
		}else {
			request.setAttribute("message", "아이디 혹은 비밀번호가 일치하지 않습니다.");
			url = "loginPage.jsp";
		}
		
//		session.setAttribute("result", result);
		
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
