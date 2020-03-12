package com.example.demo.Service.Impl;

import com.example.demo.Dao.CommentDao;
import com.example.demo.Data.Comment;
import com.example.demo.Service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
    public List<Comment> findByParentIdAndCommentStatus(Integer parentId, Integer commentStatus) {
        return commentDao.findByParentIdAndCommentStatus(parentId,commentStatus);
    }


    @Override
    public Long countByBlogIdAndCommentStatus(Integer blogId, Integer commentStatus) {
        return commentDao.countByBlogIdAndCommentStatus(blogId,commentStatus);
    }

    @Override
    public Page<Comment> findAll(Pageable pageable) {
        return commentDao.findAll(pageable);
    }

    @Override
    public Comment findByCommentId(Integer commentId) {
        return commentDao.findByCommentId(commentId);
    }

    @Override
    public Page<Comment> findByCommentTextLike(String commentText,Pageable pageable) {
        return commentDao.findByCommentTextLike(commentText,pageable);
    }


}
