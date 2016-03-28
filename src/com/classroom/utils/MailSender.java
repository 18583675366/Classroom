package com.classroom.utils;

import java.util.Date;


public class MailSender {
	public static void sendMail(String toAddress, String content) {
		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setValidate(true);
		mailInfo.setToAddress(toAddress);
		mailInfo.setContent(content);
		/*SimpleMailSender sms = new SimpleMailSender();
		sms.sendTextMail(mailInfo);*/
		SimpleMailSender.sendHtmlMail(mailInfo);
		System.out.println("给"+ toAddress +"邮件发送完毕,时间：" + new Date());
	}
}
