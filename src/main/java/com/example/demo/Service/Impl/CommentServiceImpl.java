package com.example.demo.Service.Impl;

import com.example.demo.Dao.CommentDao;
import com.example.demo.Data.Comment;
import com.example.demo.Service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentDao commentDao;

    @Override
    public List<Comment> findAll() {
        return commentDao.findAll();
    }

    @Override
    public Comment save(Comment comment) {
        return commentDao.save(comment);
    }

    @Override
    public List<Comment> findByBlogIdAndCommentStatusAndParentId(Integer blogId,Integer commentStatus,Integer parentId) {
        return commentDao.findByBlogIdAndCommentStatusAndParentId(blogId,commentStatus,parentId);
    }

    @Override
    public List<Comment> findByParentId(Integer parentId) {
        return commentDao.findByParentId(parentId);
    }
}
