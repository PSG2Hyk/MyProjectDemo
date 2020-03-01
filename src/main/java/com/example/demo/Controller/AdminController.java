package com.example.demo.Controller;

import com.example.demo.Service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/Admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    @RequestMapping("/index")
    private ModelAndView index(){
        return new ModelAndView("login/index") ;
    }
}
