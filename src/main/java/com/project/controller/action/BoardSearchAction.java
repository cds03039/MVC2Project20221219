package com.project.controller.action;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.action.Action;
import com.project.dao.BoardDAO;
import com.project.dto.BoardVO;

public class BoardSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "boardList.jsp";
		List<BoardVO> boardList = null;
		BoardDAO bdao = BoardDAO.getInstance();
		String search = request.getParameter("searchType");
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
//		String all = request.getParameter("all");
//		String titleAndcontent = request.getParameter("titleAndcontent");
//		String title = request.getParameter("title");
//		String content = request.getParameter("content");
//		String nickname = request.getParameter("nickname");
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String end1 = request.getParameter("end1");
		
		if (search.equals("all")) {
			boardList = bdao.getAllSearch(keyword, category);
		} else if (search.equals("titleAndcontent")) {
			boardList = bdao.gettitleAndcontentSearch(keyword, category); 
		} else if (search.equals("title")) {
			boardList = bdao.getTitleSearch(keyword, category); 
		} else if (search.equals("content")) {
			boardList = bdao.getContentSearch(keyword, category); 
		} else if (search.equals("nickname")) {
			boardList = bdao.getNicknameSearch(keyword, category); 
		} else if (search.equals("dateSearch")) {
			boardList = bdao.getDateSearch(start,end1, category); 
			request.setAttribute("start", start);
			request.setAttribute("end1", end1);
		}
		request.setAttribute("search", search);
		request.setAttribute("boardList", boardList);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
