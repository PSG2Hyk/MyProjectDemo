package com.example.demo.Service.Impl;

import com.example.demo.Dao.BlogDao;
import com.example.demo.Data.Blog;
import com.example.demo.Service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    BlogDao blogDao;

    @Override
    public List<Blog> findByBlogStatus(Integer blogStatus) {
        return blogDao.findByBlogStatus(blogStatus);
    }

    @Override
    public Blog findByBlogId(Integer blogId) {
        return blogDao.findByBlogId(blogId);
    }

    @Override
    public List<Blog> findByBlogContentLikeAndBlogStatus(String blogContent, Integer blogStatus) {
        return blogDao.findByBlogContentLikeAndBlogStatus(blogContent,blogStatus);
    }

    @Override
    public List<Blog> findByBlogTypeAndBlogStatus(String blogType, Integer blogStatus) {
        return blogDao.findByBlogTypeAndBlogStatus(blogType,blogStatus);
    }


    @Override
    public Page<Blog> findAll(Pageable pageable) {
        return blogDao.findAll(pageable);
    }


}
