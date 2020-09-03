<%--
  Created by IntelliJ IDEA.
  User: MK
  Date: 2020/5/8
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加成员</title>
</head>
<body>
    <form action="/addUser" method="post">
        <p>
            usrname:<input type="text" name="name" placeholder="请输入用户名"/>
        </p>
        <p>
            password:<input type="password" name="password" placeholder="请输入密码"/>
        </p>
        <p>
            <input type="submit" value="增加">
        </p>
    </form>
</body>
</html>
