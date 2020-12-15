package com.offcn.myexception;

public class UsernameException extends Exception {
    public UsernameException() {
    }

    public UsernameException(String message) {
        super(message);
    }
}
