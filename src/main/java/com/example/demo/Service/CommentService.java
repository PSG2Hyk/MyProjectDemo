package com.example.demo.Service;

import com.example.demo.Data.Comment;

import java.util.List;

public interface CommentService {
    List<Comment>findAll();
    Comment save(Comment comment);
    List<Comment> findByBlogIdAndCommentStatusAndParentId(Integer blogId,Integer commentStatus,Integer parentId);
    List<Comment> findByParentIdAndCommentStatus(Integer parentId,Integer commentStatus);
    Long countByBlogIdAndCommentStatus(Integer blogId, Integer commentStatus);
}
