package com.hackathon.phoblock.Exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_ACCEPTABLE) //406
public class NotAcceptableException extends Exception {
    public NotAcceptableException(String message){
        super(message);
    }
}
