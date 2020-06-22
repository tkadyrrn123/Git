package com.kh.www.Member.model.vo;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;


public class EmailSender {

    public void SendEmail(Email email, JavaMailSender emailSender)  {
    	System.out.println("받아온값(emailSender):"+email);
        System.out.println("Bean값(emailSender):"+emailSender);
        
        MimeMessage msg = emailSender.createMimeMessage();
        try {
            msg.setSubject(email.getSubject());
            msg.setText(email.getContent(), "utf-8", "html");
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        
        try {
        	System.out.println("보내진다 ㅋ");
        	emailSender.send(msg);
        }catch(MailException e) {
            System.out.println("MailException발생");
            e.printStackTrace();
        }
    }
}
