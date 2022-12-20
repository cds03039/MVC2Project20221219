package com.project.controller.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.dao.BoardDAO;
import com.project.dto.BoardVO;

public class BoardWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=UTF-8");
		ServletContext context = request.getSession().getServletContext();
		String path = context.getRealPath("upload");
		String encType = "utf-8";
		int maxSize = 10*1024*1024;
		
		MultipartRequest multi = new MultipartRequest(
				request, 
				path,
				maxSize,
				encType,
				new DefaultFileRenamePolicy());
		String nickname = multi.getParameter("nickname");
		String board_title = multi.getParameter("board_title");
		String board_content =multi.getParameter("board_content");
		String category = multi.getParameter("category");
		String PictureUrl = multi.getFilesystemName("pictureUrl");
		
//		System.out.println("category : " + category);
//		System.out.println("nickname : " + nickname);
		
		BoardVO bvo = new BoardVO();
					
		bvo.setNickname(nickname);
		bvo.setBoard_title(board_title);
		bvo.setBoard_content(board_content);
		bvo.setCategory(category);
		bvo.setPictureUrl(PictureUrl);
			
		BoardDAO bdao = BoardDAO.getInstance();
		bdao.insertBoard(bvo);
		new BoardListAction().execute(request, response);
	}
}
