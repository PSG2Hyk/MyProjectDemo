package com.example.demo.Controller;

import com.example.demo.Data.Blog;
import com.example.demo.Form.BlogForm;
import com.example.demo.Service.BlogService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Map;

@RestController
@RequestMapping("/Admin/Blog")
public class AdminBlogController {
    @Autowired
    BlogService blogService;

    @RequestMapping("/BlogList")
    private ModelAndView BlogList(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                  @RequestParam(value = "size",defaultValue = "10")Integer size,
                                  Map<String,Object> map){
        try {
            Page<Blog> blogPage = blogService.findAll(PageRequest.of(page - 1, size));
            map.put("blogPage",blogPage);
            map.put("currentPage",page);
            map.put("size",size);
            return new ModelAndView("content/blogList",map);
        }catch (Exception e){
            map.put("msg","查找错误");
            map.put("url","/Admin/Index");
            return new ModelAndView("content/error",map);
        }
    }

    @RequestMapping("/Detail")
    private ModelAndView BlogDetail(@RequestParam(value = "blogId" ,required = false)Integer blogId,Map<String,Object> map){
        try {
            if (!StringUtils.isEmpty(blogId)){
                Blog byBlogId = blogService.findByBlogId(blogId);
                map.put("blogPage",byBlogId);
            }else {
                return new ModelAndView("content/blogNew",map);
            }
            return new ModelAndView("content/blogDetail",map);
        }catch (Exception e){
            map.put("msg","查找错误");
            map.put("url","/Admin/Blog/BlogList");
            return new ModelAndView("content/error",map);
        }
    }

    @RequestMapping("/Save")
    private ModelAndView BlogSave(@Valid BlogForm blogForm,Map<String,Object> map){
        Blog blog= new Blog();
        try {
            if(!StringUtils.isEmpty(blogForm.getBlogId())){
                blog=blogService.findByBlogId(blogForm.getBlogId());
            }
            System.out.println("拜托Url在哪里"+blogForm);
            BeanUtils.copyProperties(blogForm,blog);
            blogService.save(blog);
            map.put("msg","保存成功!!!");
            map.put("url","/Admin/Blog/BlogList");
            System.out.println("----保存成功----------------"+blog);
            return new ModelAndView("content/success",map);
        }catch (Exception e){
            map.put("msg","保存失败!!!");
            map.put("url","/Admin/Blog/BlogList");
            return new ModelAndView("content/error",map);
        }
    }
    @RequestMapping("/Status")
    private ModelAndView status(Map<String,Object> map,
                                @RequestParam(value = "blogId" )Integer blogId){
        Blog blog=blogService.findByBlogId(blogId);
        try {
            if (blog.getBlogStatus()==0){
                blog.setBlogStatus(1);
            }else {
                blog.setBlogStatus(0);
            }
            System.out.println(blog);
            blogService.save(blog);
        }catch (Exception e){
            map.put("msg","修改失败");
            map.put("url","/Admin/Blog/BlogList");
            return new ModelAndView("content/error",map);
        }
        map.put("msg","修改成功");
        map.put("url","/Admin/Blog/BlogList");
        return new ModelAndView("content/success",map);
    }
    @RequestMapping("/findBy")
    private ModelAndView BlogFindBy(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                    @RequestParam(value = "size",defaultValue = "10")Integer size,
                                    String blogContent,
                                    Map<String,Object> map){
        try {
            Page<Blog> blogPage = blogService.findByBlogContentLike("%"+blogContent+"%",PageRequest.of(page - 1, size));
            System.out.println(blogPage);
            map.put("blogPage",blogPage);
            map.put("currentPage",page);
            map.put("size",size);
            return new ModelAndView("content/blogList",map);
        }catch (Exception e){
            map.put("msg","查找错误");
            map.put("url","/Admin/Blog/BlogList");
            return new ModelAndView("content/error",map);
        }
    }
}
