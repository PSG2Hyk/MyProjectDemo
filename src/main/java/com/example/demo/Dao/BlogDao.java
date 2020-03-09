package com.example.demo.Dao;

import com.example.demo.Data.Blog;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import org.springframework.data.domain.Pageable;
import java.util.List;

public interface BlogDao extends JpaRepository<Blog,String>, JpaSpecificationExecutor<Blog> {
    Blog findByBlogId(Integer blogId);

    List<Blog>findByBlogStatus(Integer blogStatus);

    List<Blog>findByBlogContentLikeAndBlogStatus(String blogContent,Integer blogStatus);

    List<Blog>findByBlogTypeAndBlogStatus(String blogType, Integer blogStatus);

    Page<Blog> findAll(Pageable pageable);
}
