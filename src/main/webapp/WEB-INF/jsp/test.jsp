<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>批量删除</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-header layui-bg-green">
            <div class="layui-row">
                <div class="layui-col-sm3">
                    <span class="text-size-middle">批量删除</span>
                </div>
            </div>

        </div>
        <div class="layui-card-body">
            <table id="table" lay-filter="table"></table>
        </div>
    </div>
</div>

<!-- toolbar -->
<script type=" text/html" id="delAllToolbar">
    <a class="layui-btn" lay-event="add" id="addAll"><i class="layui-icon layui-icon-upload"></i>批量添加</a>
    <a class="layui-btn layui-btn-danger" lay-event="del">批量删除</a>
</script>
<!-- bar -->
<script type="text/html" id="delAllbar">
    <!--<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>-->
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="/js/jquery-1.10.2.js"></script>
<script src="/layui/layui.js"></script>
<script>
    $(function () {
        layui.use(['table', 'form', 'upload'], function () {
            var $ = layui.$,
                table = layui.table,
                upload = layui.upload,
                layer = layui.layer;
            table.render({
                elem: '#table',
                url: '/user/findAllUser',
                method: 'post'
                , toolbar: '#delAllToolbar',
                height: 575,
                cols: [
                    [
                        {type: 'checkbox', fixed: 'left'}
                        , {field: 'id', title: '编号', sort: 'true'}
                        , {field: 'name', title: '用户名', edit: 'text'}
                        , {field: 'password', title: '密码'}
                        , {field: 'email', title: '邮箱', edit: "text"}
                        , {field: 'birthday', title: '生日', sort: true}
                        , {fixed: 'right', title: '操作', toolbar: '#delAllbar', width: 150}
                    ]
                ],
                text: {
                    none: '暂无相关数据'
                }
                , page: true
            });

            upload.render({
                elem: '#addAll' //绑定元素
            });
            //头工具栏事件
            table.on('toolbar(table)', function (obj) {
                var checkStatus = table.checkStatus(obj.config.id);
                switch (obj.event) {
                    case 'delAll':
                        //定义数组存放批量删除的行的id
                        var listId = [];
                        //获得所有选中行的数据
                        var datas = checkStatus.data;
                        //进行遍历所有选中行数据，拿出每一行的id存储到数组中
                        $.each(datas, function (i, data) {
                            listId.push(data.qid)
                        });
                        if (listId.length <= 0) {
                            layer.msg("请选择要删除的行", {icon: 2})
                        } else {
                            layer.confirm('真的删除所选行么', function (index) {
                                $.ajax({
                                    url: "/user/delAll",
                                    type: "post",
                                    contentType: "application/json;charset=UTF-8",
                                    dataType: 'json',
                                    data: JSON.stringify({"listId": listId}),
                                    success: function (res) {
                                        console.log(res);
                                        if (res.code != 210) {
                                            table.reload('delAll', {
                                                page: {
                                                    curr: $(".layui-laypage-em").next().html() //重新从当前页开始
                                                }
                                            });
                                        }

                                    }
                                });
                                layer.close(index);
                                //向服务端发送删除指令
                            });
                        }
                        break;
                    case 'add':
                        var uploadInst = upload.render({
                            url: '' //TODO 添加批量用户接口
                            // ,accept: 'file' //普通文件
                            ,
                            exts: 'xlsx|xls' //只允许上传Excel文件
                            ,
                            done: function (res) {
                                layui.msg(res);
                                table.reload('delAll', {
                                    page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                });
                            },
                            error: function () {
                                //请求异常回调
                                layer.msg("error")
                            }
                        });
                        break;
                }
            });

            //监听单元格编辑
            table.on('edit(table)', function (obj) { //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
                console.log(obj.value); //得到修改后的值
                console.log(obj.field); //当前编辑的字段名
                console.log(obj.data); //所在行的所有相关数据
                $.ajax({
                    url: "/user/updateUser",
                    type: "post",
                    contentType: 'application/json;charset=UTF-8',
                    dataType: 'json',
                    data: JSON.stringify(obj.data),
                    success: function (res) {
                        console.log(res)
                        if (res.code != 210) {
                            layer.msg(res.msg, {icon: 1});
                        } else {
                            layer.msg(res.msg, {icon: 2});
                        }
                    }
                });
            });

            //监听行工具条
            table.on('tool(table)', function (obj) { //注：tool 是工具条事件名，delAll 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data.qid; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

                if (layEvent === 'del') { //删除
                    layer.confirm('真的删除行么', function (index) {
                        $.ajax({
                            url: "/user/delUser",
                            type: "post",
                            data: {"qId": data},
                            success: function (res) {
                                console.log(res)
                                if (res.code != 210) {
                                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                }
                            }
                        });
                        layer.close(index);
                        //向服务端发送删除指令
                    });
                }
            });
        }); //use
    }); //全局
</script>
</body>
</html>


