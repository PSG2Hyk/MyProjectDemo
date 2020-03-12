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
                        <form role="form" action="/Admin/Comment/CommentFindBy" method="get">
                            <div class="input-group" style="margin: 10px;" >
                                <input type="text" class="form-control" style="width: 150px" placeholder="内容搜索" name="commentText" >
                                <button type="submit" class="btn btn-default">搜索</button>
                            </div>
                        </form>
                        <thead>
                        <tr>
                            <th>评论编号</th>
                            <th>博客编号</th>
                            <th>评论内容</th>
                            <th>评论者</th>
                            <th>邮箱</th>
                            <th>评论状态</th>
                            <th>创建时间</th>
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list commentPage.content as commentPage>
                            <tr>
                                <td style="max-width: 50px;overflow: hidden; text-overflow:ellipsis;white-space: nowrap">${commentPage.commentId}</td>
                                <td>${commentPage.blogId}</td>
                                <td style="max-width: 200px;overflow: hidden; text-overflow:ellipsis;white-space: nowrap">${commentPage.commentText}</td>
                                <td>${commentPage.userName}</td>
                                <td>${commentPage.userEmail}</td>
                                <td>
                                    <#if commentPage.commentStatus==0>上线
                                    <#elseif commentPage.commentStatus==1>删除
                                    </#if>
                                </td>
                                <td>${commentPage.createTime}</td>
                                <td><a href="/Admin/Comment/Status?commentId=${commentPage.commentId}">状态更改</a></td>
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
                            <li><a href="/Admin/Comment/CommentList?page=${currentPage - 1}&size=${size}">上一页</a></li>
                        </#if>

                        <#list 1..commentPage.getTotalPages() as index>
                            <li>
                                <a href="/Admin/Comment/CommentList?page=${index}&size=${size}">${index}</a>
                            </li>
                        </#list>

                        <#if currentPage gte commentPage.getTotalPages()>
                            <li class="disabled"><a href="#">下一页</a></li>
                        <#else >
                            <li><a href="/Admin/Comment/CommentList?page=${currentPage + 1}&size=${size}">下一页</a></li>
                        </#if>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>