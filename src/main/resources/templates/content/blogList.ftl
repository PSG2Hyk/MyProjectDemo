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
                                <td>${blogPage.blogStatus}</td>
                                <td>${blogPage.createTime}</td>
                                <#--<td>-->
                                    <#--&lt;#&ndash;<#if orderDTO.orderStatus==0>新订单&ndash;&gt;-->
                                    <#--&lt;#&ndash;<#elseif orderDTO.orderStatus==1>完结&ndash;&gt;-->
                                    <#--&lt;#&ndash;<#else >已取消&ndash;&gt;-->
                                    <#--&lt;#&ndash;</#if>&ndash;&gt;-->
                                    <#--${blogPage.orderStatusEnum.msg}-->
                                <#--</td>-->
                                <#--<td>-->
                                    <#--&lt;#&ndash;<#if orderDTO.payStatus==0>未支付&ndash;&gt;-->
                                    <#--&lt;#&ndash;<#else>支付成功&ndash;&gt;-->
                                    <#--&lt;#&ndash;</#if>&ndash;&gt;-->
                                    <#--${blogPage.payStatusEnum.msg}-->
                                <#--</td>-->
                                <#--href="/sell/seller/order/detail?orderId=${blogPage.orderId}"-->
                                <td><a>博客详情</a></td>
                                <td><a>状态更改</a></td>
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