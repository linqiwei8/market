<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@include file="common/head.jsp"%>
<div style=" position:fixed; left:0;right:0;top:0;bottom:0;margin:auto;width: 300px;height: 200px; text-align: center;overflow: visible">
    <h1 style="font-size: 30px;text-align: center;">密码修改</h1>
    <form class="layui-form layui-form-pane" style="text-align: left;">

        <p style="padding-top: 15px;"> </p>
        <div class="layui-form-item">
            <label class="layui-form-label">原密码</label>
            <div class="layui-input-block">
                <input type="password" name="pass" lay-verify="pass" placeholder="请输入原密码" class="layui-input pass" autocomplete="off" required>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-block">
                <input type="password" id="pass1" name="pass1" lay-verify="pass1" placeholder="请输入新密码" class="layui-input" autocomplete="off" required>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="password" name="pass2" lay-verify="pass2" placeholder="请输入新密码" class="layui-input" autocomplete="off" required>
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
        var form = layui.form,$ = layui.jquery;
        form.verify({/*表单提交时的验证*/
            pass:function(value,item){
                if(value.length == 0){
                    return "请输入原密码";
                }
            }
            ,pass1:[
                /^[\S]{6,16}$/
                , '密码必须6到16位，且不能出现空格'
            ]
            ,pass2:function(value,item){
                var pass0=$("#pass1").val();
                if( pass0!=value){
                    return "两次输入不一致，请重新输入！";
                }
            }
        });
        form.on('submit(formDemo)',function(data){
            $.ajax({
                url:'/admin/updatePassword',
                type:'post',
                datatype:'json',
                data:data.field,
                success:function(data){
                    if(data=="true"){
                        alert("修改成功,请重新登录！！！");
                        top.location.href="/admin/login";
                    }else{
                        alert("原密码错误，请重新输入！！！");
                    }
                }
            });
            return false;
        });
    });
</script>
