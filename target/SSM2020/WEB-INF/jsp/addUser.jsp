<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@include file="common/head.jsp"%>
<div style=" position:fixed; left:0;right:0;top:0;bottom:0;margin:auto;width: 300px;height: 200px; text-align: center;overflow: visible">
    <h1 style="font-size: 30px;text-align: center;">添加管理员</h1>
    <form class="layui-form layui-form-pane" id="adduser" style="text-align: left;">

        <p style="padding-top: 15px;"> </p>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" lay-verify="username" placeholder="请输入用户名" class="layui-input pass" autocomplete="off" required>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户密码</label>
            <div class="layui-input-block">
                <input type="password" id="password" name="password" lay-verify="password" placeholder="请输入用户密码" class="layui-input" autocomplete="off" required>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="password" name="password2" lay-verify="password2" placeholder="请再次确认密码" class="layui-input" autocomplete="off" required>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-danger layui-icon layui-icon-refresh">重置</button>
            </div>
        </div>
    </form>
</div>
<%@include file="common/footer.jsp"%>
<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery'], function(){
        var element = layui.element;
        var form = layui.form,
            $ = layui.jquery;
        form.verify({/*表单提交时的验证*/
            username:function(value,item){
                if(value.length == 0){
                    return "请输入用户名";
                }
            }
            ,password:[
                /^[\S]{6,16}$/
                , '密码必须6到16位，且不能出现空格'
            ]
            ,password2:function(value,item){
                var pass0=$("#password").val();
                if( pass0!=value){
                    return "两次输入不一致，请重新输入！";
                }
            }
        });
        form.on('submit(formDemo)',function(data){
            $.ajax({
                url:'/admin/addAdmin',
                type:'post',
                datatype:'json',
                data:data.field,
                success:function(data){
                    if(data>0){
                        alert("添加成功！");
                        $("#adduser")[0].reset()
                    }else{
                        alert("该用户名已存在，请重新输入！");
                    }
                }
            });
            return false;
        });
    });
</script>
