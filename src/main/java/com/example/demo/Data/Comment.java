package com.example.demo.Data;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name = "comment")
@DynamicUpdate
@DynamicInsert
public class Comment {
    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Integer commentId;
    private Integer blogId;
    private Integer parentId;
    private String commentText;
    private String userName;
    private String userEmail;
    private Integer commentStatus;
    @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy年MM月dd日 HH:mm:ss",timezone="GMT+8")
    private Date createTime;
    @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy年MM月dd日 HH:mm:ss",timezone="GMT+8")
    private Date updateTime;

}
