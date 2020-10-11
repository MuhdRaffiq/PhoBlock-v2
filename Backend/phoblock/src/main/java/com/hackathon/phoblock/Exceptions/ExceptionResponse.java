package com.hackathon.phoblock.Exceptions;

import java.util.Date;

public class ExceptionResponse {
    private Date timeStamp;
    private String detailMessage;
    private String details;
    private String httpCodeMessage;

    public ExceptionResponse(Date timeStamp, String detailMessage, String details, String httpCodeMessage){
        super();
        this.timeStamp = timeStamp;
        this.detailMessage = detailMessage;
        this.details = details;
        this.httpCodeMessage = httpCodeMessage;
    }

    public Date getTimeStamp() {
        return timeStamp;
    }

    public String getDetailMessage() {
        return detailMessage;
    }

    public String getDetails() {
        return details;
    }

    public String getHttpCodeMessage() {
        return httpCodeMessage;
    }

    public void setTimeStamp(Date timeStamp) {
        this.timeStamp = timeStamp;
    }

    public void setDetailMessage(String detailMessage) {
        this.detailMessage = detailMessage;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public void setHttpCodeMessage(String httpCodeMessage) {
        this.httpCodeMessage = httpCodeMessage;
    }
}
