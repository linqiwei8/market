<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加员工</title>
<link rel="stylesheet" href="/layui/css/layui.css">
</head>
<body>
<div class="site-text" style="margin: 5%;" id="window" >
	<form class="layui-form layui-form-pane" id="staff"  lay-filter="formTest">

	  <div class="layui-form-item">
	    <label class="layui-form-label">员工名称</label>
	    <div class="layui-input-block">
	      <input type="text" required   id="name" name="name" lay-verify="required"  placeholder="请输入名称" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
    	<label class="layui-form-label">员工性别</label>
    	<div class="layui-input-block">
     		 <input type="radio" name="sex" value="男" title="男">
    		 <input type="radio" name="sex" value="女" title="女" checked>
   		 </div>
 	   </div>

	  <div class="layui-form-item">
	    <label class="layui-form-label">员工工资</label>
	    <div class="layui-input-block">
	      <input type="text"  id="salary" name="salary" lay-verify="number"  placeholder="请输入工资" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">员工电话</label>
	    <div class="layui-input-block">
	      <input type="text" id="phone" name="tel" lay-verify="phone"  placeholder="请输入电话" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">员工住址</label>
	    <div class="layui-input-block">
	      <input type="text" id="address" name="address" lay-verify="address"  placeholder="请输入住址" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">员工职位</label>
	    <div class="layui-input-block">
	      <input type="text" required   id="position" name="position" lay-verify="position"  placeholder="请输入员工职位" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">聘用日期</label>
	    <div class="layui-input-block">
	      <input type="date" id="begindate" name="begindate" lay-verify="begindate"  placeholder="请输入聘用日期" class="layui-input">
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
			url:'/staff/toInsertStaff',
			type:'post',
			datatype:'json',
			data:field,
			success:function(data){
				if(data>0){
					layer.alert('增加成功',{icon:1,title:'提示'},function(i){
						layer.close(i);
						window.location.href="/staff/toinsertStaffBill";
						$("#staff")[0].reset()//重置form
					})
				}else{
					layer.alert('已存在',{icon:1,title:'提示'},function(i){
						layer.close(i);
						$("#staff")[0].reset()//重置form
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