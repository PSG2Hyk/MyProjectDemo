package com.example.demo.Controller;

import com.example.demo.Config.ProjectUrlConfig;
import com.example.demo.Data.Admin;
import com.example.demo.Service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@RestController
@RequestMapping("/Admin")
public class AdminController {
    @Autowired
    AdminService adminService;
    @Autowired
    ProjectUrlConfig projectUrlConfig;

    Admin admin;
    @RequestMapping("/Index")
    private ModelAndView index(){
        return new ModelAndView("login/index") ;
    }
    @RequestMapping("/Login")
    private ModelAndView Login(@RequestParam(value = "adminName",required = false) String adminName,
                               @RequestParam(value = "adminPassword",required = false) String adminPassword,
                               HttpServletResponse response,
                               HttpServletRequest request,
                               Map<String,Object> map){
        try {
            if (!StringUtils.isEmpty(adminName) && !StringUtils.isEmpty(adminPassword)){ //判断用户名和用户密码是否为空
                admin = adminService.findByAdminNameAndAdminPassword(adminName, adminPassword);
            }
            if (admin == null){
                map.put("msg","账户密码错误");
                map.put("url","/Admin/Index");
                return new ModelAndView("/content/error",map);//跳转到错误页面
            }else {
                request.getSession().setAttribute("user",admin);
                System.out.println("登录我有session："+ request.getSession().getAttribute("user"));
                admin=null;
            }
        }catch (Exception e){
            map.put("msg","账户密码错误,或者账户不存在");
            map.put("url","/Admin/Index");
            return new ModelAndView("/content/error",map);//跳转到错误页面
        }
        return new ModelAndView("redirect:"+projectUrlConfig.getDomain()+"/Admin/Blog/BlogList");//跳转到Admin管理页面
    }

    @RequestMapping("/LoginOut")
    private ModelAndView LoginOut(HttpServletResponse response,
                                  HttpServletRequest request,
                                  Map<String,Object>map){
        try {
            request.getSession().invalidate();//清除session
            System.out.println("我有session："+ request.getSession().getAttribute("user"));
            map.put("msg","注销成功");
            map.put("url","/Admin/Index");
        }catch (Exception e){
            map.put("msg","注销失败");
            map.put("url","/Admin/Blog/BlogList");
            return new ModelAndView("/content/error",map);
        }
        return new ModelAndView("/content/success",map);
    }

}
