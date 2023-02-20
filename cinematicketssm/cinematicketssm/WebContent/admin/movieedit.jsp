<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>编辑影片</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="<%=path %>/admin/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="<%=path %>/admin/common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="<%=path %>/admin/common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="<%=path %>/admin/css/personal.css" media="all">
	<script type="text/javascript" src="<%=path %>/layer/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/layer/layer.js"></script>
	<script type="text/javascript" src="<%=path %>/admin/js/popup.js"></script>
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>编辑影片</span>
		</header><!-- /header -->
		<div class="larry-personal-body clearfix changepwd">
			<form class="layui-form col-lg-4" id="supplierform" method="post" action="<%=path %>/admin/movieEdit.do" onsubmit="return supplieradd()">
			    <input type="hidden" name="id" value="${movie.id}"/>
				
				<div class="layui-form-item">
					<label class="layui-form-label">影片名</label>
					<div class="layui-input-inline">  
					  	<input type="text" name="name" id="name" value="${movie.name}" lay-verify="required"   style="width: 300px;"  autocomplete="off"  class="layui-input" >
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">图片</label>
					<div class="layui-input-block">  
					  	<input name='filename' type='text' value="${movie.filename}" class="layui-input" lay-verify="required"  style="width: 300px;" id='url' required size='50' value='' />&nbsp;<input type='button' value='上传'  class="layui-input" onClick="up('url')" style="width: 60px;height: 37px;"/>
					</div>
				</div>
				
				
				<div class="layui-form-item">
					<label class="layui-form-label">影片分类</label>
				      <div class="layui-input-inline">
				        <select name="categoryid" lay-verify="required" lay-search>
				          <c:forEach items="${list}" var="category">
				          <option value="${category.id}" ${category.id eq movie.categoryid?'selected':''} >${category.name}</option>
				          </c:forEach>
				        </select>
				      </div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">上映</label>
				      <div class="layui-input-inline">
				        <select name="issy" lay-verify="required" lay-search>
				          <option value="即将上映" ${movie.issy eq '即将上映'?'selected':''}>即将上映</option>
				          <option value="正在热映" ${movie.issy eq '正在热映'?'selected':''}>正在热映</option>
				        </select>
				      </div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">上映时间</label>
					<div class="layui-input-inline">  
					  	<input type="date" name="savetime" id="savetime" value="${movie.savetime}"  lay-verify="required"   style="width: 300px;"  autocomplete="off"  class="layui-input" >
					</div>
				</div>
				
				
				
				<div class="layui-form-item">
					<label class="layui-form-label">主演</label>
					<div class="layui-input-block">  
					  	<input type="text" name="zystr" id="zystr" value="${movie.zystr}" lay-verify="required" style="width: 600px;"  autocomplete="off"  class="layui-input" >
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">时长(分钟)</label>
					<div class="layui-input-block">  
					  	<input type="text" name="longtime" id="longtime" pattern="[1-9]\d*" value="${movie.longtime}" lay-verify="required" style="width: 600px;"  autocomplete="off"  class="layui-input" >
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">票价</label>
					<div class="layui-input-inline">  
					  	<input type="text" name="price" id="price" value="${movie.price}" lay-verify="required" pattern="(0|[1-9][0-9]{0,9})(\.[0-9]{1,2})?"  style="width: 300px;"  autocomplete="off"  class="layui-input" >
					</div>
				</div>
				
				
				<div class="layui-form-item">
					<label class="layui-form-label">影片简介</label>
					<div class="layui-input-block">  
					    <textarea name="content" style="width: 600px;height: 100px;"   class="layui-textarea" oninvalid="setCustomValidity('视频描述不能为空')" oninput="setCustomValidity('');" >${movie.content}</textarea>
					</div>
				</div>
				
				
				
				
				<div class="layui-form-item change-submit">
					<div class="layui-input-block">
					    
						<button class="layui-btn" lay-submit="" id="supplierbutton" lay-filter="demo1" >立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="<%=path %>/admin/common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['form','upload'],function(){
         var form = layui.form();
	});

	function up(tt)
	{
			    layer.open({
			      type: 2,
			      title: '上传文件',
			      shadeClose: true,
			      shade: false,
			      maxmin: true, //开启最大化最小化按钮
			      area: ['450px', '200px'],
			      content: '/cinematicketssm/upload.jsp?Result='+tt
			    });
	}	


</script>
</body>
</html>