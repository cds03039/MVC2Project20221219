package com.project.controller.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.controller.action.Action;
import com.project.dao.BoardDAO;
import com.project.dto.BoardVO;

public class BoardUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		ServletContext context = request.getSession().getServletContext();
		String path = context.getRealPath("upload");
		String encType = "utf-8";
		int maxSize = 10*1024*1024;
		System.out.println(path);
		
		MultipartRequest multi = new MultipartRequest(
				request, 
				path,
				maxSize,
				encType,
				new DefaultFileRenamePolicy());
		
		String board_title = multi.getParameter("board_title");
		String board_content =multi.getParameter("board_content");
		String PictureUrl = multi.getFilesystemName("pictureUrl");
		int board_number = Integer.parseInt(multi.getParameter("board_number"));
		
		BoardVO bvo = new BoardVO();
					
		
		bvo.setBoard_title(board_title);
		bvo.setBoard_content(board_content);
		bvo.setPictureUrl(PictureUrl);
		bvo.setBoard_number(board_number);
			
		BoardDAO bdao = BoardDAO.getInstance();
		bdao.updateBoard(bvo);
		new BoardListAction().execute(request, response);

	}

}
