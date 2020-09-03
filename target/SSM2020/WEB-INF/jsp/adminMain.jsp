<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="common/head.jsp"%>

    <div class="layui-body">

        <div style="padding: 15px;">欢迎  ${user.username}  登录系统！</div>
    </div>

   <%@ include file="common/footer.jsp"%>
<script src="/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
