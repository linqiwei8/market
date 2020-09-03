<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加供应商</title>
<link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body>
<div class="site-text" style="margin: 5%;" id="window" >
	<form class="layui-form layui-form-pane" id="supplier"  lay-filter="formTest">
	  <div class="layui-form-item">
	    <label class="layui-form-label">供应商名称</label>
	    <div class="layui-input-block">
	      <input type="text" required   id="name" name="name" lay-verify="required"  placeholder="请输入供应商名称" class="layui-input">
	    </div>
	  </div>

	  <div class="layui-form-item">
	    <label class="layui-form-label">联系人</label>
	    <div class="layui-input-block">
	      <input type="text"  id="linkman" name="linkman" lay-verify="required"  placeholder="请输入供应商联系人" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">联系电话</label>
	    <div class="layui-input-block">
	      <input type="text" id="phone" name="phone" lay-verify="phone"  placeholder="请输入联系电话" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">公司住址</label>
	    <div class="layui-input-block">
	      <input type="text" id="address" name="address" lay-verify="address"  placeholder="请输入公司地址" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">备注</label>
	    <div class="layui-input-block">
	      <input type="text" required   id="note" name="note" lay-verify="note"  placeholder="请输入备注信息" class="layui-input">
	    </div>
	  </div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn layui-icon layui-icon-release" id="formDemo" lay-submit lay-filter="formDemo">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary layui-icon layui-icon-refresh-3">重置</button>
			</div>
		</div>
	</form>
</div>
<script src="/layui/layui.js"></script>
<script>
layui.use(['element','form','table','jquery'], function(){
	var element = layui.element;
    var form = layui.form;
    var $=layui.jquery;


	form.on('submit(formDemo)', function(data){
		var field = data.field; //获取提交的字段
		$.ajax({
			url:'/supplier/toInsertSupplier',
			type:'post',
			datatype:'json',
			data:field,
			success:function(data){
				if(data>0){
					layer.alert('增加成功',{icon:1,title:'提示'},function(i){
						layer.close(i);
						window.location.href="/supplier/toinsertSupplierBill";
						$("#supplier")[0].reset()//重置form
					})
				}else{
					layer.alert('已存在',{icon:1,title:'提示'},function(i){
						layer.close(i);
						$("#supplier")[0].reset()//重置form
					})
				}
			}
		});
		return false;
	});
});


</script>
</body>
</html>