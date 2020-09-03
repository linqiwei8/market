<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020.7.24.024
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>欢迎来到首页</title>
    <link rel="stylesheet" href="/layui/css/layui.css">

</head>
<body>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-md3">
        </div>
            <div class="layui-col-md6" style="margin-top: 200px;margin-left: 300px;">
                <div class="layui-card layui-bg-gray">
                    <div class="layui-card-header">
                        <h1 style="color: #0000FF">欢迎老板来到登录界面:${user.name};<a href="/logout"
                                                                              class="layui-btn layui-btn-normal">登出</a>
                        </h1>
                    </div>
                    <div class="layui-card-body">
                        <table border="1px" bgcolor="#faebd7" class="layui-table">
                            <tr>
                                <th>id</th>
                                <th>name</th>
                                <th>password</th>
                                <th colspan="2">操作</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="u">
                                <tr>
                                    <td>${u.id}</td>
                                    <td>${u.name}</td>
                                    <td>${u.password}</td>
                                    <td>
                                        <a href="/user/id?id=${u.id}" class="layui-btn layui-btn-sm">查看</a>
                                    </td>
                                    <td>
                                        <a href="/user/delete?id=${u.id}"
                                           class="layui-btn layui-btn-sm layui-btn-normal">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td>
                                    <c:if test="${pageInfo.hasPreviousPage}"><a
                                            href="/user/userList?pageNum= ${pageInfo.pageNum - 1}"
                                            class="layui-btn layui-btn-warm layui-btn-radius">上一页</a></c:if>
                                </td>
                                <td>
                                    第${pageInfo.pageNum}页,总${pageInfo.pages},页数总${pageInfo.total}条
                                </td>
                                <td>
                                    <c:if test="${pageInfo.hasNextPage}"><a
                                            href="/user/userList?pageNum= ${pageInfo.pageNum + 1}"
                                            class="layui-btn layui-btn-warm layui-btn-radius">下一页</a></c:if>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        <div class="layui-col-md3">
        </div>
    </div>
</div>
</body>
</html>
