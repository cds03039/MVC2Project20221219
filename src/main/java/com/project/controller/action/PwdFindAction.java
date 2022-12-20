package com.project.controller.action;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.UsersDAO;
import com.project.util.Gmail;

public class PwdFindAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String email = request.getParameter("find_userid");
		String phone = request.getParameter("find_phone");
		String name = request.getParameter("find_name");
		
		
		int status = 0;

		UsersDAO dao = UsersDAO.getInstance();
		boolean isUserExist = dao.isUserExist(email, name, phone);
		String password = dao.searchPw(email, name, phone);

		if (isUserExist) {
			// 회원으로 존재하는 경우, 존재 한다면 인증키를 메일로 발송

			Random rnd = new Random();
			String certificationCode = "";

			char randchar = ' ';
			for (int i = 0; i < 5; i++) {
				randchar = (char) (rnd.nextInt('z' - 'a' + 1) + 'a');
				certificationCode += randchar;
			}

			int rndNum = 0;

			for (int i = 0; i < 7; i++) {
				rndNum = rnd.nextInt(9 - 0 + 1) + 0;
				certificationCode += rndNum;
			}

			String from = "ste348311@gmail.com";
			String to = email;

			String subject = "비밀번호 찾기";
			String content = "코드 :  " + certificationCode;

			Properties p = new Properties();
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.host", "smtp.googlemail.com"); // google SMTP 주소
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			p.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 추가된 코드
			p.put("mail.smtp.ssl.enable", "true"); // 추가된 코드

			try {
				Authenticator auth = new Gmail();
				Session ses = Session.getInstance(p, auth);
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
				msg.setSubject(subject); // 메일 제목
				Address fromAddr = new InternetAddress(from); // 보내는 사람 정보
				msg.setFrom(fromAddr);
				Address toAddr = new InternetAddress(to); // 받는 사람 정보
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				msg.setContent(content, "text/html;charset=UTF-8");
				Transport.send(msg); // 메세지 전송
				status = 1;
				
				request.setAttribute("email", email);
				request.setAttribute("password", password);
				request.setAttribute("code", certificationCode);
				
			} catch (Exception e) {
				e.printStackTrace();
				status = -1;
			}

		} else {
			// 회원으로 존재하지 않는 경우
			status = 0;
		}
		request.setAttribute("status", status);
		
		RequestDispatcher rd = request.getRequestDispatcher("/findPage.jsp");
		rd.forward(request, response);
	}
}
