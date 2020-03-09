package com.example.demo.Service;

import com.example.demo.Data.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BlogService {
    List<Blog>findByBlogStatus(Integer blogStatus);
    Blog findByBlogId(Integer blogId);
    List<Blog>findByBlogContentLikeAndBlogStatus(String blogContent,Integer blogStatus);
    List<Blog>findByBlogTypeAndBlogStatus(String blogType, Integer blogStatus);
    Page<Blog> findAll(Pageable pageable);
}
