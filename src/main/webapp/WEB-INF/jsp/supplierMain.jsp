<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="common/head.jsp"%>
<!-- 供应商数据表格 -->
<div class="layui-body" type="left:0px;">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <div class="demoTable">
           <label>名称：</label>
            <div class="layui-inline">
                <input class="layui-input" name="id" id="demoReload" autocomplete="off" placeholder="请输入供应商名称">
            </div>
            <button class="layui-btn layui-icon layui-icon-search" id="reload" data-type="reload">搜索</button>
            <button id="add" class="layui-btn layui-icon layui-icon-add-1" lay-submit="" lay-filter="pageSubmit">新增</button>
        </div>
        <table id="demo"  lay-filter="test">
        </table>
        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-xs layui-btn-mini layui-icon layui-icon-edit" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger layui-btn-mini layui-icon layui-icon-delete" lay-event="del">删除</a>
        </script>

    </div>
</div>

<%@ include file="common/footer.jsp"%>

<script src="/layui/layui.all.js"></script>
<script>
    //JavaScript代码区域
    var element = layui.element;
    var form = layui.form;
    var table=layui.table;
    var layer=layui.layer;
    var $=layui.jquery;
    //执行一个 table 实例
    table.render({
        //绑定body里面的table标签，通过id
        elem: '#demo',
        //table表格的高度
        height: 523,
        //请求后台的地址
        url: '/supplier/toSelectAllSupplier' //数据接口
        ,
        //表格的名称
        title: '供应商表',
        //开启分页
        page: true
        ,
        //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
        toolbar: 'true'
        ,
        response: {
            statusName: 'code' //规定数据状态的字段名称，默认：code
            ,statusCode: 0 //规定成功的状态码，默认：0
            ,msgName: 'msg' //规定状态信息的字段名称，默认：msg
            ,countName: 'count' //规定数据总数的字段名称，默认：count
            ,dataName: 'data' //规定数据列表的字段名称，默认：data
        }
        ,
        parseData: function(res){ //res 即为原始返回的数据
            return {
                "code": res.code, //解析接口状态，0显示数据，其他 显示提示文本
                "msg": res.msg, //解析提示文本,如数据没有时
                "count": res.count, //解析数据长度
                "data": res.data //解析数据列表
            };
        },

        //解析后台的数据
        cols: [[
            {field:'id', title: '供应商编号'},
            {field:'name', title: '供应商姓名'},
            {field:'linkman', title: '联系人'},
            {field:'phone', title: '联系电话'},
            {field:'address', title: '公司地址'},
            {field:'note', title: '备注'},
            {fixed: 'right', title: '操作', width:150,toolbar:"#barDemo"}
        ]
        ],
        id: 'testReload'
    });
    /* 搜索 */
    var active = {
        reload: function(){
            var demoReload = $('#demoReload').val();
            //执行重载
            table.reload('testReload', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    name: demoReload
                }
            });
        }
    };
    $('.demoTable .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
    /* 新增 */
    $("#add").click(function(){
        layer.open({
            type: 2,
            title:["添加供应商信息","font-size:18px;text-align:center;"],
            area:['600px','90%'],
            /*btn: ['确定添加', '取消'],*/
            shadeClose: true, //开启遮罩关闭
            content:  '/supplier/toinsertSupplierBill' ,
        });
    })

    //监听行工具事件  编辑和删除
    table.on('tool(test)', function(obj){
        var data = obj.data //获得当前行数据
            ,layEvent = obj.event; //获得 lay-event 对应的值
        if(layEvent === 'del'){
            layer.confirm('是否确认删除该行数据', function(index){
                layer.close(index);
                //向服务端发送删除指令
                var id=data.id;
                $.ajax({
                    url:'/supplier/toDelSupplier',
                    type:'post',
                    datatype:'json',
                    data:{
                        id:id
                    },
                    success:function(data){
                        if(data>0){
                            obj.del(); //删除对应行（tr）的DOM结构
                            layer.msg("删除成功！！！");
                        }else
                            layer.msg("删除失败！！！");
                    }
                });
            });
        } else if(layEvent === 'edit'){
            layer.open({
                type: 2,
                title:["修改供应商信息","font-size:18px;text-align:center;"],
                area:['600px','80%'],
                btn: ['确定修改', '取消'],
                shadeClose: true, //开启遮罩关闭
                content:  '/supplier/toupdateSupplierBill?id='+data.id,
                success:function(layero,index){
                    layero.find('.layui-layer-btn0').attr({
                        'lay-filter': '*1',
                        'lay-submit':'',
                        'for':'staff1'
                    });
                    form.render();
                },
                yes:function(index,layero){

                    var iframeWindow = window['layui-layer-iframe'+ index]
                        ,submitID = 'formDemo1'
                        ,submit = layero.find('iframe').contents().find('#'+ submitID);

                    //监听提交
                    iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
                        var field = data.field; //获取提交的字段
                        //提交 Ajax 成功后，静态更新表格中的数据
                        $.ajax({
                            url:'/supplier/toEditSupplier',
                            type:'post',
                            datatype:'json',
                            data:field,
                            success:function(data){
                                if(data>0){
                                    layer.alert('修改成功',{icon:1,title:'提示'},function(i){
                                        layer.close(i);
                                        layer.close(index);//关闭弹出层
                                        $("#staff1")[0].reset()//重置form
                                    })
                                    $(".layui-laypage-btn").click();
                                }else{
                                    layer.alert('修改失败',{icon:1,title:'提示'},function(i){
                                        layer.close(i);
                                        layer.close(index);//关闭弹出层
                                        $("#staff1")[0].reset()//重置form
                                    })
                                }
                            }
                        });

                    });
                    submit.trigger('click');
                }
            });
        }
    });
</script>
