package com.example.demo.Service;

import com.example.demo.Data.Blog;
import java.util.List;

public interface BlogService {
    List<Blog> findAll();
    Blog findByBlogId(Integer blogId);
    List<Blog>findByBlogContentLike(String blogContent);
}
