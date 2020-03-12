<!DOCTYPE html>
<html>
<#include "../common/head.ftl">
<script>
    $(function () {
        var initialPreview = [];
        if('${(blogPage.imgUrl)!""}'!=''){
            initialPreview="<img class='kv-preview-data file-preview-image'src='${(imgUrl.imgUrl)!''}'>"
        }
        $("#input-id").fileinput({
            uploadUrl:'/image/upload',
            language:'zh',
            browseClass:"btn btn-primary btn-block",
            showCaption:false,
            showRemove:false,
            showUpload:false,
            allowedFileExtensions:['jpg','jpeg','png','gif'],
            maxFileSize:1024,
            autoReplace:true,
            overwriteInitial:true,
            maxFileCount:1,
            initialPreview:initialPreview
        });
        $("#input-id").on('fileuploaded',function (event,data,previewId,index) {
            console.log(data)
            if(data.response.code!=200){
                alert(data.response.msg+"-----"+data.response.data.fileUrl);
                return;
            }
            $('#imgUrl').val(data.response.data.fileUrl);
        })
    });
</script>
<body>
<div class="toggled" id="wrapper">
    <#include "../common/nav.ftl">
    <div id="page-content-wrapper" style="margin-left: 400px">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <form role="form" method="post" action="/Admin/Blog/Save">
                        <input type="hidden" class="form-control" name="blogId" value="${(blogPage.blogId)!''}" />
                        <div class="form-group">
                            <label for="exampleInputEmail1">博客标题</label>
                            <input name="blogTitle" class="form-control" style="width:45%"value="${(blogPage.blogTitle)!''}" />
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">博客类型</label><br>
                            <input class="check-box" type="radio" name="blogType"  class="form-control" value="Java"<#if blogPage.blogType=="Java">checked="checked"</#if>/>Java
                            <input class="check-box" type="radio" name="blogType"  class="form-control" value="Vue" <#if blogPage.blogType=="Vue">checked="checked"</#if>/>Vue
                            <input class="check-box" type="radio" name="blogType"  class="form-control" value="C++" <#if blogPage.blogType=="C++">checked="checked"</#if>/>C++
                            <input class="check-box" type="radio" name="blogType"  class="form-control" value="Jquery" <#if blogPage.blogType=="Jquery">checked="checked"</#if>/>Jquery
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">博客内容</label>
                            <textarea name="blogContent" class="form-control" style="height: 100px; width:45%" >${(blogPage.blogContent)!''}</textarea>
                        </div>
                        <div class="form-group" style="width: 50%">
                            <label>图片</label>
                            <input type="hidden" name="imgUrl" id="imgUrl"  value="${(blogPage.imgUrl)!''}">
                            <input id="input-id" type="file">
                            <p class="help-block">
                                支持jpg、jpeg、png、gif格式、大小不超过1M
                            </p>
                        </div>
                        <button type="submit" class="btn btn-default">提交</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>