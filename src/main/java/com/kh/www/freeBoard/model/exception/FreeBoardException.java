package com.kh.www.freeBoard.model.exception;

public class FreeBoardException extends RuntimeException {
    public FreeBoardException() {}
    public FreeBoardException(String msg) {
        super(msg);
    }
}