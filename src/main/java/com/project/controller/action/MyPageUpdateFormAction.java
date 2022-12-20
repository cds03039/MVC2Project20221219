package com.project.controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.BoardDAO;
import com.project.dao.UsersDAO;
import com.project.dto.BoardVO;
import com.project.dto.UsersVO;

public class MyPageUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url = "userDetail.jsp";
		UsersVO vo = null;
		String email = request.getParameter("email");
		String nickname = "";
		HttpSession session = request.getSession();
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardVO> list = new ArrayList<>();
		
		// 로그인 했을때
		if((Object)session.getAttribute("loginUser") != null) {
			// 다른사람꺼 클릭했을떄
			if(email == null) {
				nickname = request.getParameter("nickname");
			}else {
				vo = (UsersVO)session.getAttribute("loginUser");
				nickname = vo.getNickname();
			}
		// 비로그인 일때
		}else {
			nickname = request.getParameter("nickname");
		}
		
		System.out.println("nickname : " + nickname);
		
		System.out.println(dao.userWriteCount(nickname));
		// 최근 작성글 가져오기
		list = dao.recentWrite(nickname);
		
		System.out.println(list);
		request.setAttribute("userList", list);
		request.setAttribute("email", email);
		request.setAttribute("nickname", nickname);
		request.setAttribute("list", dao.userWriteCount(nickname));
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
