package com.example.demo.Controller;

import com.example.demo.Data.Blog;
import com.example.demo.Enum.CodeEnum;
import com.example.demo.Response.Result;
import com.example.demo.Service.BlogService;
import com.example.demo.Service.CommentService;
import com.example.demo.Util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/Blog")
public class BlogController {
    @Autowired
    BlogService blogService;
    @Autowired
    CommentService commentService;
    @CrossOrigin
    @GetMapping("/List")
    public Result blogList(){
        try {
            List<Blog> blogServiceAll = blogService.findByBlogStatus(0);
            blogServiceAll.forEach(i->{
                Long count = commentService.countByBlogIdAndCommentStatus(i.getBlogId(),0);
                i.setCommentCount(count);
            });
            return ResultUtil.success(blogServiceAll);
        }catch (Exception e){
            return ResultUtil.error(CodeEnum.NOT_FOUND);
        }
    }

    @CrossOrigin
    @GetMapping("/findOne")
    public Result blogText(Integer id){
        try {
            Blog byBlogId = blogService.findByBlogId(id);
            return ResultUtil.success(byBlogId);
        }catch (Exception e){
            return ResultUtil.error(CodeEnum.NOT_FOUND);
        }
    }

    @CrossOrigin
    @GetMapping("/findBy")
    public Result blogFindBy(String blogContent){
        try {
            List<Blog> byBlogContent = blogService.findByBlogContentLikeAndBlogStatus("%" + blogContent + "%",0);
            return ResultUtil.success(byBlogContent);
        }catch (Exception e){
            return ResultUtil.error(CodeEnum.NOT_FOUND);
        }
    }

    @CrossOrigin
    @GetMapping("/findByType")
    public Result findByType(String blogType){
        try {
            List<Blog> byBlogType = blogService.findByBlogTypeAndBlogStatus(blogType,0);
            return ResultUtil.success(byBlogType);
        }catch (Exception e){
            return ResultUtil.error(CodeEnum.NOT_FOUND);
        }
    }

}
