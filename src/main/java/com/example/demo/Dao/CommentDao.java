package com.example.demo.Dao;

import com.example.demo.Data.Comment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface CommentDao extends JpaRepository<Comment,String>,JpaSpecificationExecutor<Comment> {
    List<Comment> findByBlogIdAndCommentStatusAndParentId(Integer blogId,Integer commentStatus,Integer parentId);
    List<Comment> findByParentIdAndCommentStatus(Integer parentId,Integer commentStatus);
    Long countByBlogIdAndCommentStatus(Integer blogId, Integer commentStatus);
    Page<Comment> findAll(Pageable pageable);
    Comment findByCommentId(Integer commentId);
    Page<Comment>findByCommentTextLike(String commentText,Pageable pageable);
}
