package com.example.demo.Controller;

import com.example.demo.Data.Blog;
import com.example.demo.Service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@RestController
@RequestMapping("/Admin/Blog")
public class AdminBlogController {
    @Autowired
    BlogService blogService;

    @RequestMapping("/BlogList")
    private ModelAndView BlogList(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                  @RequestParam(value = "size",defaultValue = "10")Integer size,
                                  Map<String,Object> map){
        try {
            Page<Blog> blogPage = blogService.findAll(PageRequest.of(page - 1, size));
            map.put("blogPage",blogPage);
            map.put("currentPage",page);
            map.put("size",size);
            return new ModelAndView("content/blogList",map);
        }catch (Exception e){
            map.put("msg","查找错误");
            map.put("url","/Admin/Index");
            return new ModelAndView("content/error",map);
        }
    }
}
