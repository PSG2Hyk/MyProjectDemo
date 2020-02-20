package com.example.demo.Enum;

import lombok.Getter;

@Getter
public enum  CodeEnum {
    NOT_FOUND(404,"未找到数据"),

    ;
    private Integer code;
    private String msg;

    CodeEnum(Integer code,String msg){
        this.code=code;
        this.msg=msg;
    }
}
