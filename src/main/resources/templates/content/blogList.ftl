<html>
<#include "../common/head.ftl">
<body>
<div class="toggled" id="wrapper">
    <#include "../common/nav.ftl">
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table">
                        <form role="form" action="/Admin/Blog/findBy" method="get">
                            <div class="input-group" style="margin: 10px;" >
                                <input type="text" class="form-control" style="width: 150px" placeholder="内容搜索" name="blogContent" >
                                <button type="submit" class="btn btn-default">搜索</button>
                            </div>
                        </form>
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>博客标题</th>
                            <th>博客内容</th>
                            <th>博客类型</th>
                            <th>博客状态</th>
                            <th>创建时间</th>
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list blogPage.content as blogPage>
                            <tr>
                                <td style="max-width: 50px;overflow: hidden; text-overflow:ellipsis;white-space: nowrap">${blogPage.blogId}</td>
                                <td>${blogPage.blogTitle}</td>
                                <td style="max-width: 200px;overflow: hidden; text-overflow:ellipsis;white-space: nowrap">${blogPage.blogContent}</td>
                                <td>${blogPage.blogType}</td>
                                <td>
                                    <#if blogPage.blogStatus==0>上线
                                        <#elseif blogPage.blogStatus==1>删除
                                    </#if>
                                </td>
                                <td>${blogPage.createTime}</td>
                                <td><a href="/Admin/Blog/Detail?blogId=${blogPage.blogId}">博客详情</a></td>
                                <td><a href="/Admin/Blog/Status?blogId=${blogPage.blogId}">状态更改</a></td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

                <div class="col-md-12 column">
                    <ul class="pagination pull-right">
                        <#if currentPage lte 1>
                            <li class="disabled"><a href="#">上一页</a></li>
                        <#else >
                            <li><a href="/Admin/Blog/BlogList?page=${currentPage - 1}&size=${size}">上一页</a></li>
                        </#if>

                        <#list 1..blogPage.getTotalPages() as index>
                            <li>
                                <a href="/Admin/Blog/BlogList?page=${index}&size=${size}">${index}</a>
                            </li>
                        </#list>

                        <#if currentPage gte blogPage.getTotalPages()>
                            <li class="disabled"><a href="#">下一页</a></li>
                        <#else >
                            <li><a href="/Admin/Blog/BlogList?page=${currentPage + 1}&size=${size}">下一页</a></li>
                        </#if>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
<#--<script>-->
<#--$(function () {-->
    <#--$(".line-limit-length").validate({-->
        <#--overflow: hidden;-->
        <#--text-overflow: ellipsis;-->
        <#--white-space: nowrap; //文本不换行，这样超出一行的部分被截取，显示...-->
    <#--})-->
<#--})-->
<#--</script>-->
</html>