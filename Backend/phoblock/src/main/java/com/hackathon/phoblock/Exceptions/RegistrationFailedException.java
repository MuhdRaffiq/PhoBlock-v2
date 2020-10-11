package com.hackathon.phoblock.Exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_ACCEPTABLE)
public class RegistrationFailedException extends Exception {
    public RegistrationFailedException(String message){
        super(message);
    }
}
