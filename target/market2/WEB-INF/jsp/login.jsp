<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020.7.24.024
  Time: 14:43
  To changethis template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body>
<div class="container">
    <div class="layui-row">
        <div class="layui-col-md6 layui-col-md-offset2" style="margin-top: 200px">
            <form action="/loginTo" method="post" class="layui-form layui-form-pane1">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" placeholder="请输入标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码框</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <p class="layui-form-item">
                    <label class="layui-form-label"></label>
                    <button class="layui-btn layui-btn-warm btn-center" type="submit">登录</button>
                </p>
            </form>
        </div>
    </div>
</div>
</body>
</html>
