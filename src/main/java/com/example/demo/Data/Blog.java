package com.example.demo.Data;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name = "blog")
@DynamicUpdate
@DynamicInsert
public class Blog {
    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY)//自增
    private Integer blogId;
    private String blogTitle;
    private String  blogContent;
    @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy年MM月dd日 HH:mm:ss",timezone="GMT+8")
    private Date createTime;
    @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy年MM月dd日 HH:mm:ss",timezone="GMT+8")
    private Date updateTime;
    private Integer blogStatus;
    private String blogType;
    @Transient
    private Long commentCount;
}
