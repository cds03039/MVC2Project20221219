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

public class ReportAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardVO bvo = new BoardVO();
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
		String category = multi.getParameter("report");
		String nickname = multi.getParameter("nickname");
		String board_title = multi.getParameter("board_title");
		String board_content =multi.getParameter("board_content");
		String PictureUrl = multi.getFilesystemName("pictureUrl");
		
		if(category.equals("cuss")) {
			category = "욕설";
		}else if(category.equals("spam")) {
			category = "도배";
		}else if(category.equals("complain")) {
			category = "건의";
		}else if(category.equals("etc")) {
			category = "기타";
		}
		
		
		bvo.setCategory(category);
		bvo.setNickname(nickname);
		bvo.setBoard_title(board_title);
		bvo.setBoard_content(board_content);
		bvo.setPictureUrl(PictureUrl);
			
		BoardDAO bdao = BoardDAO.getInstance();
		bdao.insertBoard(bvo);
		
		new BoardReportAction().execute(request, response);

	}

}
