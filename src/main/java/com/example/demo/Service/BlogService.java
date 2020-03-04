package com.example.demo.Service;

import com.example.demo.Data.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BlogService {
    List<Blog> findAll();
    Blog findByBlogId(Integer blogId);
    List<Blog>findByBlogContentLike(String blogContent);
    List<Blog>findByBlogType(String blogType);
    Page<Blog> findAll(Pageable pageable);
}
