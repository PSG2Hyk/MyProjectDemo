package com.example.demo.Service;

import com.example.demo.Data.Comment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CommentService {
    List<Comment>findAll();
    Comment save(Comment comment);
    List<Comment> findByBlogIdAndCommentStatusAndParentId(Integer blogId,Integer commentStatus,Integer parentId);
    List<Comment> findByParentIdAndCommentStatus(Integer parentId,Integer commentStatus);
    Long countByBlogIdAndCommentStatus(Integer blogId, Integer commentStatus);
    Page<Comment> findAll(Pageable pageable);
    Comment findByCommentId(Integer commentId);
    Page<Comment>findByCommentTextLike(String commentText,Pageable pageable);
}
