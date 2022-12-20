package com.project.util;

import javax.mail.*;

public class Gmail extends Authenticator{
	 @Override
	 protected PasswordAuthentication getPasswordAuthentication() {
		 return new PasswordAuthentication("ste348311@gmail.com","ecdateiskkddduql");
	 }
}
	
