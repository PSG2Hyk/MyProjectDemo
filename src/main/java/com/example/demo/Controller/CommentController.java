package com.example.demo.Controller;

import com.example.demo.Data.Comment;
import com.example.demo.Enum.CodeEnum;
import com.example.demo.Response.Result;
import com.example.demo.Service.CommentService;
import com.example.demo.Util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/Comment")
public class CommentController {
    @Autowired
    CommentService commentservice;

    @CrossOrigin
    @GetMapping("/List")
    public Result commentList(Integer id){
        try{
            List<Comment> commentList = commentservice.findByBlogIdAndCommentStatusAndParentId(id,0,0);
            return ResultUtil.success(commentList);
        }catch (Exception e){
            return ResultUtil.error(CodeEnum.NOT_FOUND);
        }
    }

    @CrossOrigin
    @PostMapping("/Save")
    public Result commentSave(String userName, String userMail, String commentText, Integer blogId, @RequestParam(value = "parentId",required=false)Integer parentId){
        try {
            Comment comment=new Comment();
            comment.setUserName(userName);
            comment.setUserEmail(userMail);
            comment.setCommentText(commentText);
            comment.setBlogId(blogId);
            comment.setParentId(parentId);
            commentservice.save(comment);
            return ResultUtil.success();
        }catch (Exception e){
            return ResultUtil.error(CodeEnum.NOT_FOUND);
        }
    }

    @CrossOrigin
    @GetMapping("/Son")
    public Result commentSon(Integer parentId){
        try {
            List<Comment> byParentId = commentservice.findByParentIdAndCommentStatus(parentId,0);
            return ResultUtil.success(byParentId);
        }catch (Exception e){
            return ResultUtil.error(CodeEnum.NOT_FOUND);
        }
    }

}
