<%--
  Created by IntelliJ IDEA.
  User: MK
  Date: 2020/5/15
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>详情信息</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md3"></div>
        <div class="layui-col-md6" style="margin-top: 200px;margin-left: 200px;">
            <form action="/user/updateUser" method="post">
                <table bgcolor="#faebd7" border="1px" class="layui-table">
                    <tr>
                        <td>id</td>
                        <td><input type="text" name="id" value="${user.id}" readonly="readonly"></td>
                    </tr>
                    <tr>
                        <td>name</td>
                        <td><input type="text" name="name" value="${user.name}"></td>
                    </tr>
                    <tr>
                        <td>password</td>
                        <td><input type="text" name="password" value="${user.password}"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="修改" align="center" class="layui-btn layui-btn-warm layui-btn-radius"></td>
                    </tr>
                    <div>
                        <a href="/user/userList" style="color: #b510bd"><b>点我返回列表</b></a>
                    </div>
                </table>
            </form>
        </div>
        <div class="layui-col-md3"></div>
    </div>
</div>
</body>
</html>
