<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改供应商信息</title>
<link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body>
<div class="site-text" style="margin: 5%;" id="window1" >	
	<form class="layui-form layui-form-pane" id="staff1"  lay-filter="formTest1">
	  
	      <input type="text" required id="id" name="id" lay-verify="required" style="display: none;"  placeholder="请输入编号" class="layui-input">
	    
	  <div class="layui-form-item">
	    <label class="layui-form-label">供应商名称</label>
	    <div class="layui-input-block">
	      <input type="text" required   id="name" name="name" lay-verify="required"  placeholder="请输入供应商名称" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">联系人</label>
	    <div class="layui-input-block">
	      <input type="text" required   id="linkman" name="linkman" lay-verify="required"  placeholder="请输入联系人姓名" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">联系电话</label>
	    <div class="layui-input-block">
	      <input type="text"  id="phone" name="phone" lay-verify="number|phone"  placeholder="请输入联系电话" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">公司地址</label>
	    <div class="layui-input-block">
	      <input type="text" id="address" name="address" lay-verify="address"  placeholder="请输入住址" class="layui-input">
	    </div>
	  </div>
		<div class="layui-form-item">
			<label class="layui-form-label">备注</label>
			<div class="layui-input-block">
				<input type="text" id="note" name="note" lay-verify="note"  placeholder="请输入备注信息" class="layui-input">
			</div>
		</div>
	  <button class="layui-btn layui-btn-small bcql-icon icon-save" id="formDemo1" lay-submit lay-filter="formDemo1" style="display: none;"></button>
	</form>
</div>
<script src="/layui/layui.all.js"></script>
<script>
	var element = layui.element;
    var form = layui.form;
    var $=layui.jquery;
    var laydate = layui.laydate;
    //初始化供应商表单信息
    form.val("formTest1",{
    	"id"  : "${supplier.id}",
		"name"  : "${supplier.name}",
		 "linkman" : "${supplier.linkman}",
		 "phone"  : "${supplier.phone}",
		 "address"  : "${supplier.address}",
		 "note": "${supplier.note}"
    });

</script>
</body>
</html>