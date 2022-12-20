package com.project.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.UsersDAO;
import com.project.dto.UsersVO;
import com.project.util.SHA256;

public class UserRegisterAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String name = null;
		String url = null;
		
//		if(session.getAttribute("name")!= null) {
//			name = (String)session.getAttribute("name");
//		}
//		
//		if(name != null) {
//			name = (String)session.getAttribute("name");
//		}
		
		UsersDAO dao = UsersDAO.getInstance();
		
		UsersVO vo = new UsersVO();
		
		vo.setName(request.getParameter("name"));
		vo.setPassword(request.getParameter("pass"));
		vo.setEmail(request.getParameter("userid"));
		vo.setPhone(request.getParameter("phone"));
		vo.setEmailHash(SHA256.getSHA256(request.getParameter("userid")));
		vo.setNickname(request.getParameter("nick"));
		
		int result = dao.insertOne(vo);
		
		System.out.println("result : " +  result);
		if(result != 1) {
//			System.out.println("존재하는 아이디 있음");
//			request.setAttribute("message", "<div style='font-size: 20px; color: red;'>아이디가 존재 합니다.</div>");
		}else {
			url = "UserServlet?command=emailSend";
			request.setAttribute("vo", vo);
			System.out.println("회원가입은 성공");
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
	}
}
