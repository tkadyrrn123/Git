package com.kh.www.Member.model.vo;

public class Email {
	
	private String subject;
    private String content;
    private String receiver;

    public Email() {}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	@Override
	public String toString() {
		return "Email [subject=" + subject + ", content=" + content + ", receiver=" + receiver + "]";
	}
    
}
