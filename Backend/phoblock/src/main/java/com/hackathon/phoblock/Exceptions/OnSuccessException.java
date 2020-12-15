package com.hackathon.phoblock.Exceptions;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.OK)
public class OnSuccessException extends Exception {
    public OnSuccessException(String message){
        super(message);
    }
}
