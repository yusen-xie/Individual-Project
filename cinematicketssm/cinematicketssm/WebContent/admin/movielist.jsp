<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>影片信息</title>
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
	<link rel="stylesheet" href="../css/page.css" />
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">
            <blockquote class="layui-elem-quote news_search">
		
		<div class="layui-inline">
		    <div class="layui-input-inline">
		      <form action="<%=path %>/admin/movieList.do" method="post" id="searchform" name="searchform">
		    	<input value="${key}" placeholder="请输入片名" name="key" class="layui-input search_input" type="text">
		    <!-- <input type="submit" class="layui-btn" value="查询"> -->	
		      </form>
		    </div>
		    <a class="layui-btn"  href="javascript:void(0)" onclick="searchnew()">查询</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal" href="skipMovieAdd.do?type=add">新增影片</a>
		</div>
	</blockquote>
            
		         <!-- 操作日志 -->
                <div class="layui-form news_list" >
                    <table class="layui-table" style="font-size:12px;">
					    <colgroup>
						<col width="">
						<col width="">
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
						    <th>图片</th>
							<th>影片名</th>
							<th>类别</th>
							<th>主演</th>
							<th>时长(分钟)</th>
							<th>上映时间</th>
							<th>上映状态</th>
							<th>票价</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">
					   <c:forEach items="${pageInfo.list}" var="movie">
						<tr>
							<td><img src="<%=path %>/upfile/${movie.filename}" style="width: 60px;"/></td>
							<td>${movie.name}</td>
							<td>${movie.category.name}</td>
							<td>${movie.zystr}</td>
							<td>${movie.longtime}</td>
							<td>${movie.savetime}</td>
							<td>${movie.issy}</td>
							<td>${movie.price}</td>
							<td>
							   <a class="layui-btn layui-btn-mini" href="skipMovieAdd.do?id=${movie.id}&type=edit"><i class="iconfont icon-edit"></i>编辑</a>
							   <a class="layui-btn layui-btn-danger layui-btn-mini" href="movieDel.do?id=${movie.id}" ><i class="layui-icon"></i> 删除</a>
							</td>
						</tr>
						</c:forEach>
						<tr>
							<td align="center"  colspan="13">
							<c:if test="${fn:length(pageInfo.list) gt 0}">
	                     	   <div id="pagediv" style="border:0px solid red;">
				              <ul>
				                  <li><a href="movieList.do?pageNum=${pageInfo.hasPreviousPage==false?1:pageInfo.prePage}&key=${key}">上一页</a></li>
				                  <c:forEach begin="1" end="${pageInfo.pages}" varStatus="status">
				                      <li class="pagesz ${status.count eq pageInfo.pageNum ?"acvtive":""}" ><a href="movieList.do?pageNum=${status.count}&key=${key}" >${status.count}</a></li>
				                  </c:forEach>
				                  <li><a href="movieList.do?pageNum=${pageInfo.hasNextPage==false? pageInfo.pages : pageInfo.nextPage}&key=${key}">下一页</a></li>
				              </ul>
				          </div>       
	            		</c:if> 
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

    function searchnew(){
      //${"#searchform"}.submit();
      searchform.submit()
      
    }

</script>
</body>
</html>