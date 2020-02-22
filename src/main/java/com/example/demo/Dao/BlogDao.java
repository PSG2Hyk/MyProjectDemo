package com.example.demo.Dao;

import com.example.demo.Data.Blog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface BlogDao extends JpaRepository<Blog,String>, JpaSpecificationExecutor<Blog> {
    Blog findByBlogId(Integer blogId);

    List<Blog>findByBlogContentLike(String blogContent);

    List<Blog>findByBlogType(String blogType);
}
