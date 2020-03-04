package com.example.demo.Service;

import com.example.demo.Data.Admin;

public interface AdminService {
    Admin findByAdminNameAndAdminPassword(String adminName, String adminPassword);
}
