package com.example.demo.Service.Impl;

import com.example.demo.Dao.AdminDao;
import com.example.demo.Data.Admin;
import com.example.demo.Service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminDao adminDao;
    @Override
    public Admin findByAdminNameAndAdminPassword(String adminName, String adminPassword) {
        return adminDao.findByAdminNameAndAdminPassword(adminName,adminPassword);
    }
}
