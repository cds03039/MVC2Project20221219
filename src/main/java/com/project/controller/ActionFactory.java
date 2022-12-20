package com.project.controller;

import com.project.controller.action.Action;
import com.project.controller.action.BoardDeleteAction;
import com.project.controller.action.BoardListAction;
import com.project.controller.action.BoardSearchAction;
import com.project.controller.action.BoardUpdateAction;
import com.project.controller.action.BoardUpdateFormAction;
import com.project.controller.action.BoardViewAction;
import com.project.controller.action.BoardWriteAction;
import com.project.controller.action.BoardWriteFormAction;
import com.project.controller.action.EmailChcekAction;
import com.project.controller.action.EmailFindAction;
import com.project.controller.action.EmailReSendAction;
import com.project.controller.action.EmailSendAction;
import com.project.controller.action.LoginAction;
import com.project.controller.action.LoginFormAction;
import com.project.controller.action.LogoutAction;
import com.project.controller.action.MainFormAction;
import com.project.controller.action.MyPageUpdateFormAction;
import com.project.controller.action.MyProfileUpdateAction;
import com.project.controller.action.MyProfileUpdateFormAction;
import com.project.controller.action.PwdFindAction;
import com.project.controller.action.PwdFindFormAction;
import com.project.controller.action.ReportAction;
import com.project.controller.action.SideAction;
import com.project.controller.action.UserRegisterAction;
import com.project.controller.action.chartAction;
import com.project.controller.action.memberListAction;
import com.project.controller.action.reportWriteAction;

public class ActionFactory {
	private ActionFactory() {
		super();
	}
	
	private static ActionFactory instance = new ActionFactory();
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		if(command.equals("regist")) {
			action = new UserRegisterAction();
		}else if(command.equals("emailSend")){
			action = new EmailSendAction();
		}else if(command.equals("emailCheckAction")) {
			action = new EmailChcekAction();
		}else if(command.equals("loginAction")) {
			action = new LoginAction();
		}else if(command.equals("pwdFindFormAction")) {
			action = new PwdFindFormAction();
		}else if(command.equals("pwdFindAction")) {
			action = new PwdFindAction();
		}else if(command.equals("logoutAction")) {
			action = new LogoutAction();
		}else if(command.equals("loginFormAction")) {
			action = new LoginFormAction();
		}else if(command.equals("myPageForm")) {
			action = new MyPageUpdateFormAction();
		}else if(command.equals("myProfileUpdateForm")) {
			action = new MyProfileUpdateFormAction();
		}else if(command.equals("emailReSendAction")) {
			action = new EmailReSendAction();
		}else if(command.equals("emailFindAction")) {
			action = new EmailFindAction();
		}else if(command.equals("myProfileUpdate")) {
			action = new MyProfileUpdateAction();
		}else if(command.equals("board_write")){
			action = new BoardWriteAction();
		}else if(command.equals("board_write_form")){
			action = new BoardWriteFormAction();
		}else if(command.equals("board_view")) {
			action = new BoardViewAction();
		}else if(command.equals("board_delete")){
			action = new BoardDeleteAction();
			//패스워드 체크 추가 필요함
		}else if(command.equals("board_update_form")){
			action = new BoardUpdateFormAction();
		}else if(command.equals("board_update")){
			action = new BoardUpdateAction();
		}else if(command.equals("board_search")) {
			action = new BoardSearchAction();
		}else if(command.equals("board_list")) {
			action = new BoardListAction();
		}else if(command.equals("mainFormAction")) {
			action = new MainFormAction();
		}else if(command.equals("report_write")) {
			action = new ReportAction();
		}else if(command.equals("member_list")) {
			action = new memberListAction();
		}else if(command.equals("chart_form")) {
			action = new chartAction();
		}else if(command.equals("report_action")) {
			action = new reportWriteAction();
		}else if(command.equals("sideBar")) {
			action = new SideAction();
			System.out.println("zz");
			
		}
		
		
		
		
		
		return action;
	}
}
