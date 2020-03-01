package com.example.demo.Data;

import lombok.Data;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Data
@Entity
@Table(name = "admin")
@DynamicUpdate
@DynamicInsert
public class Admin {
    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY)//自增
    private Integer adminId;
    private String adminName;
    private String adminPassword;

}
