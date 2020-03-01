package com.example.demo.Dao;

import com.example.demo.Data.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface CommentDao extends JpaRepository<Comment,String>,JpaSpecificationExecutor<Comment> {
    List<Comment> findByBlogIdAndCommentStatusAndParentId(Integer blogId,Integer commentStatus,Integer parentId);
    List<Comment> findByParentId(Integer parentId);
    Long countByBlogId(Integer blogId);
}
