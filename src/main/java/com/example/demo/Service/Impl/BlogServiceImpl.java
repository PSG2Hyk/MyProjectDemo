package com.example.demo.Service.Impl;

import com.example.demo.Dao.BlogDao;
import com.example.demo.Data.Blog;
import com.example.demo.Service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    BlogDao blogDao;
    @Override
    public List<Blog> findAll() {
        return blogDao.findAll();
    }

    @Override
    public Blog findByBlogId(Integer blogId) {
        return blogDao.findByBlogId(blogId);
    }

    @Override
    public List<Blog> findByBlogContentLike(String blogContent) {
        return blogDao.findByBlogContentLike(blogContent);
    }

    @Override
    public List<Blog> findByBlogType(String blogType) {
        return blogDao.findByBlogType(blogType);
    }
}
