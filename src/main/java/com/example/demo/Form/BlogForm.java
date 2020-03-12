package com.example.demo.Form;

import lombok.Data;

import java.util.Date;

@Data
public class BlogForm {
    private Integer blogId;
    private String blogTitle;
    private String blogContent;
    private String blogType;
    private String imgUrl;
}
