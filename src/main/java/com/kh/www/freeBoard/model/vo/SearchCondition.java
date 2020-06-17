package com.kh.www.freeBoard.model.vo;

public class SearchCondition {
	private String title;
	private String writer;
	private String content;

	public SearchCondition() {}

	public SearchCondition(String title, String writer, String content) {
		super();
		this.title = title;
		this.writer = writer;
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "SearchCondition [title=" + title + ", writer=" + writer + ", content=" + content + "]";
	}
	
}	

	