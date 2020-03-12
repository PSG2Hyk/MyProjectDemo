package com.example.demo.Controller;

import com.example.demo.Data.Blog;
import com.example.demo.Data.Comment;
import com.example.demo.Service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.rmi.MarshalledObject;
import java.util.Map;

@RestController
@RequestMapping("/Admin/Comment")
public class AdminCommentController {

    @Autowired
    CommentService commentService;
    @RequestMapping("/CommentList")
    private ModelAndView CommentList(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                     @RequestParam(value = "size",defaultValue = "15")Integer size,
                                     Map<String,Object> map){
        try {
            Page<Comment> commentPage = commentService.findAll(PageRequest.of(page - 1, size));
            map.put("commentPage",commentPage);
            map.put("currentPage",page);
            map.put("size",size);
            return new ModelAndView("content/commentList",map);
        }catch (Exception e){
            map.put("msg","查找错误");
            map.put("url","/Admin/Index");
            return new ModelAndView("content/error",map);
        }
    }
    @RequestMapping("/Status")
    private ModelAndView status(Map<String,Object> map,
                                @RequestParam(value = "commentId" )Integer commentId){
        Comment comment=commentService.findByCommentId(commentId);
        try {
            if (comment.getCommentStatus()==0){
                comment.setCommentStatus(1);
            }else {
                comment.setCommentStatus(0);
            }
            System.out.println(comment);
            commentService.save(comment);
        }catch (Exception e){
            map.put("msg","修改失败");
            map.put("url","/Admin/Blog/BlogList");
            return new ModelAndView("content/error",map);
        }
        map.put("msg","修改成功");
        map.put("url","/Admin/Blog/BlogList");
        return new ModelAndView("content/success",map);
    }

    @RequestMapping("/CommentFindBy")
    private ModelAndView CommentFindBy(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                     @RequestParam(value = "size",defaultValue = "15")Integer size,
                                     String commentText,
                                     Map<String,Object> map){
        try {
            Page<Comment> commentPage = commentService.findByCommentTextLike("%"+commentText+"%",PageRequest.of(page - 1, size));
            System.out.println(commentPage);
            map.put("commentPage",commentPage);
            map.put("currentPage",page);
            map.put("size",size);
            return new ModelAndView("content/commentList",map);
        }catch (Exception e){
            map.put("msg","查找错误");
            map.put("url","/Admin/Comment/CommentList");
            return new ModelAndView("content/error",map);
        }
    }
}
