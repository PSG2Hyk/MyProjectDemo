package com.example.demo.Service.Impl;

import com.example.demo.Dao.BlogDao;
import com.example.demo.Data.Blog;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@RunWith(SpringRunner.class)
class BlogServiceImplTest {
    @Autowired
    BlogDao blogDao;
    @Test
    void findByBlogContentLike() {
        List<Blog> byBlogContent = blogDao.findByBlogContentLike("Vue");
        System.out.println(byBlogContent);
        System.out.println(blogDao);
    }
}