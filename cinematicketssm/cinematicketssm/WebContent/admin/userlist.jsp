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
	<title>管理员信息</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">
            <blockquote class="layui-elem-quote news_search">
		
		<div class="layui-inline">
		    <div class="layui-input-inline">
		      <form action="<%=path %>/admin/userList.do" method="post" id="searchform" name="searchform">
		    	<input value="${key}" placeholder="请输入用户名或姓名" name="key" class="layui-input search_input" type="text">
		    <!-- <input type="submit" class="layui-btn" value="查询"> -->	
		      </form>
		    </div>
		    <a class="layui-btn"  href="javascript:void(0)" onclick="searchnew()">查询</a>
		</div><div class="layui-inline">
		<a class="layui-btn layui-btn-normal" href="useradd.jsp">添加管理员</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger" href="javascript:void(0)" onclick="deleteAll()">批量删除</a>
		</div>
	</blockquote>
            
		         <!-- 操作日志 -->
                <div class="layui-form news_list" >
                    <table class="layui-table" style="font-size:12px;">
					    <colgroup>
					    <col width="10%">
						<col width="">
						<col width="">
						<col width="">
						<col width="">
						<col width="">
						<col width="">
						<col>
					    </colgroup>
					<thead>
						<tr>
						    <th>
						    <input name="" lay-skin="primary" lay-filter="allChoose" id="allChoose" type="checkbox">
						    <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i class="layui-icon"></i></div>
						    </th>
							<th>用户名</th>
							<th>姓名</th>
							<th>性别</th>
							<th>电话</th>
							<th>邮箱</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">
					   <c:forEach items="${list}" var="user">
						<tr>
						    <td>
						    <c:if test="${user.usertype ne '管理员'}">
						    <input name="checked" lay-skin="primary" lay-filter="choose" type="checkbox" value="${user.id}">
						    <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i class="layui-icon"></i></div>
						    </c:if>
						    </td>
							<td>${user.username}</td>
							<td>${user.realname}</td>
							<td>${user.sex}</td>
							<td>${user.tel}</td>
							<td>${user.email}</td>
							<td>
							   <a class="layui-btn layui-btn-mini" href="userShow.do?id=${user.id}">编辑</a>
							</td>
						</tr>
						</c:forEach>
						<tr>
                    <td align="center" style="font-weight: bold;font-family:楷体;font-weight: bold; color:blue" colspan="8">
                                                                 共${total}条记录&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="userList.do?index=1&key=${key}">首页</a>&nbsp;&nbsp;
                        
                        <c:choose>
                        <c:when test="${index >1}">
                        <a href="userList.do?index=${index-1}&key=${key}">上一页</a>
                        </c:when>
                        <c:otherwise>
                        <a href="javascrip:void(0)">上一页</a>
                        </c:otherwise>
                        </c:choose>
                        &nbsp;&nbsp;
                        <c:choose>
                        <c:when test="${pages>index}">
                        <a href="userList.do?index=${index+1}&key=${key}">下一页</a>
                        </c:when>
                        <c:otherwise>
                        <a href="javascrip:void(0)">下一页</a>
                        </c:otherwise>
                        </c:choose>
                        &nbsp;&nbsp;
                        <a href="userList.do?index=${pages}&key=${key}">末页</a>
                    </td>
                  </tr>
					</tbody>
					</table>
                     <div class="larry-table-page clearfix">
			         </div>
			    </div>
			     <!-- 登录日志 -->
		    </div>
		</div>
	
</section>
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript" src="js/newslist.js"></script>
<script type="text/javascript">
	layui.use(['jquery','layer','element','laypage'],function(){
	      window.jQuery = window.$ = layui.jquery;
	      window.layer = layui.layer;
          var element = layui.element(),
              laypage = layui.laypage;

            
          laypage({
					cont: 'page',
					pages: 10 //总页数
						,
					groups: 5 //连续显示分页数
						,
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						var curr = obj.curr;
						if(!first) {
							//layer.msg('第 '+ obj.curr +' 页');
						}
					}
				});

          laypage({
					cont: 'page2',
					pages: 10 //总页数
						,
					groups: 5 //连续显示分页数
						,
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						var curr = obj.curr;
						if(!first) {
							//layer.msg('第 '+ obj.curr +' 页');
						}
					}
				});
    });


	function deleteAll(){

    	layer.confirm('是否确认删除？', {
      	  btn: ['是','否'] //按钮
      	}, function(){

      	  var len = $("input[name='checked']:checked").length;	
      	  if(len!=0){
      	  var checkedbox = $("input[name='checked']:checked");
      	  var arr = new Array();
            $(checkedbox).each(function(i){
                arr[i] = $(this).val();
            });
            var vals = arr.join(",");
            $.ajax({
      		type:"post",
      		url:"userDelAll.do?vals="+vals,
      		date:"",
      		success:function(msg){
      			location.replace("userList.do");
      		  }
            })
      	  }else{
				layer.msg("请选择要删除的项");
          	  }
            
            
      	}, function(){
      	});
	  //var $checkbox = $("input[name='checked']");
	  //var len = $("input[name='checked']:checked").length;
      
    }

    function searchnew(){
      //${"#searchform"}.submit();
      searchform.submit()
      
    }
</script>
</body>
</html>