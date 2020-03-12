<!DOCTYPE html>
<html>
<#include "../common/head.ftl">
<body>
<div class="toggled" id="wrapper">
    <#include "../common/nav.ftl">
    <div id="page-content-wrapper" style="margin-left: 400px">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <form role="form" method="post" action="/Admin/Blog/Save">
                        <input type="hidden" class="form-control" name="blogId"  />
                        <div class="form-group">
                            <label for="exampleInputEmail1">博客标题</label>
                            <input name="blogTitle" class="form-control" style="width:45%" />
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">博客类型</label><br>
                            <input class="check-box" type="radio" name="blogType"  class="form-control" value="Java" checked="checked"/>Java
                            <input class="check-box" type="radio" name="blogType"  class="form-control" value="Vue"/>Vue
                            <input class="check-box" type="radio" name="blogType"  class="form-control" value="C++" />C++
                            <input class="check-box" type="radio" name="blogType"  class="form-control" value="Jquery"/>Jquery
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">博客内容</label>
                            <textarea name="blogContent" class="form-control" style="height: 100px; width:45%" ></textarea>
                        </div>
                        <div class="form-group" style="width: 50%;">
                            <label for="exampleInputFile">图片</label><input type="text" id="imgUrl" name="imgUrl" hidden="hidden" />
                            <div class="file-loading">
                                <input id="input-id" type="file">
                                <p class="help-block">支持jpg、jpeg、png、gif格式,大小不超过1M</p>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-default">提交</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        var initialPreview = [];
        if('${(blogPage.imgUrl)!""}'!=''){
            initialPreview="<img class='kv-preview-data file-preview-image' src='${(blogPage.imgUrl)!""}'>"
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
            console.log(data);
            if(data.response.code!=200){
                alert(data.response.msg);
                return
            }
            $('#imgUrl').val(data.response.data.fileUrl)
        })
    });
</script>
</html>