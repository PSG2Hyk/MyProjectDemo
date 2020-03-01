<!DOCTYPE html>
<html lang="demo">
<#include "../common/head.ftl">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div class="container" style="background: cornflowerblue; padding: 30px; border-radius: 15px; width: 45%">
    <div class="row clearfix" style="width: 70%; margin:0 auto;">
        <div class="col-md-12 column">
            <form role="form" action="/Admin/Login" method="get">
                <div class="form-group" >
                    <label>账户</label><input type="text" class="form-control"  name="adminName" />
                </div>
                <div class="form-group">
                    <label>密码</label><input type="password" class="form-control"  name="adminPassword" />
                </div>
                <button type="submit" class="btn btn-default">登录</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>