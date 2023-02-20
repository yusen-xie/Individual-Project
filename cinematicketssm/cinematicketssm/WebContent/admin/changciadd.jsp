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
	<title>新增场次</title>
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
			<span>新增场次</span>
		</header><!-- /header -->
		<div class="larry-personal-body clearfix changepwd">
			<form class="layui-form col-lg-4" id="supplierform" method="post" action="<%=path %>/admin/changciAdd.do" onsubmit="return supplieradd()">
			    
			    <input type="hidden" name="hallid" value="${hallid}"/>
				
				<div class="layui-form-item">
					<label class="layui-form-label">影片</label>
				      <div class="layui-input-inline">
				        <select name="movieid" lay-verify="required" style="width: 300px;" lay-search>
				          <option value="">请选择</option>
				          <c:forEach items="${list}" var="movie">
				          <option value="${movie.id}">${movie.name}</option>
				          </c:forEach>
				        </select>
				      </div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">放映时间</label>
					<div class="layui-input-block">
						<input type="date" name="datetime" id="datetime"  lay-verify="required"  style="width: 150px;display:flex;float: left;"   autocomplete="off"  class="layui-input" >  
					  	<input type="time" name="mintime" id="mintime"  lay-verify="required"  style="width: 150px;display:flex;float: left;"    autocomplete="off"  class="layui-input" >
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

	<%
	String error = (String)request.getAttribute("error");
	if(error!=null){
	%>
	layer.msg('<%=error%>');
	<%}%>
</script>
</body>
</html>