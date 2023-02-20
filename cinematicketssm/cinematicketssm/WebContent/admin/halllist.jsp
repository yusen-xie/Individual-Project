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
	<title>放映厅信息</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" notice="all">
	<link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" notice="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" notice="all">
	<link rel="stylesheet" type="text/css" href="css/personal.css" notice="all">
	<link rel="stylesheet" href="../css/page.css" />
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">
            <blockquote class="layui-elem-quote news_search">
		
		<div class="layui-inline">
		    <div class="layui-input-inline">
		      <form action="<%=path %>/admin/hallList.do" method="post" id="searchform" name="searchform">
		    	<input value="${key}" placeholder="请输入放映厅" name="key" class="layui-input search_input" type="text">
		    <!-- <input type="submit" class="layui-btn" value="查询"> -->	
		      </form>
		    </div>
		    <a class="layui-btn"  href="javascript:void(0)" onclick="searchnew()">查询</a>
		</div>
		<div class="layui-inline">
		<a class="layui-btn layui-btn-normal" href="halladd.jsp">新增放映厅</a>
		</div>
	</blockquote>
            
		         <!-- 操作日志 -->
                <div class="layui-form news_list" >
                    <table class="layui-table" style="font-size:12px;">
						<colgroup>
					    <col width="10%">
						<col width="8%">
						<col width="">
						<col width="20%">
						<col>
					    </colgroup>
					<thead>
						<tr>
							<th>放映厅</th>
							<th>座位数</th>
							<th>场次</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">
					   <c:forEach items="${pageInfo.list}" var="hall">
						<tr>
							<td>${hall.name}</td>
							<td>${hall.seatno}</td>
							<td style="font-size:12px;">
							<c:forEach items="${hall.cclist}" var="changci">
							${changci.movie.name}&nbsp;[${changci.savetime}]&nbsp;<a  href="changciDel.do?id=${changci.id}" ><i class="layui-icon" style="color:red;"> &#xe640;</i></a>&nbsp;&nbsp;
							</c:forEach>
							</td>
							<td>
							   <a class="layui-btn layui-btn-mini" href="skipchangci.do?hallid=${hall.id}">放映</a>
							   <a class="layui-btn layui-btn-mini" href="hallShow.do?id=${hall.id}"><i class="iconfont icon-edit"></i>编辑</a>
							   <a class="layui-btn layui-btn-danger layui-btn-mini" href="hallDel.do?id=${hall.id}" ><i class="layui-icon"></i> 删除</a>
							</td>
						</tr>
						</c:forEach>
						<tr>
                    		<td align="center"  colspan="13">
                    		<c:if test="${fn:length(pageInfo.list) gt 0}">
	                     	   <div id="pagediv" style="border:0px solid red;">
				              <ul>
				                  <li><a href="hallList.do?pageNum=${pageInfo.hasPreviousPage==false?1:pageInfo.prePage}&key=${key}">上一页</a></li>
				                  <c:forEach begin="1" end="${pageInfo.pages}" varStatus="status">
				                      <li class="pagesz ${status.count eq pageInfo.pageNum ?"acvtive":""}" ><a href="hallList.do?pageNum=${status.count}&key=${key}" >${status.count}</a></li>
				                  </c:forEach>
				                  <li><a href="hallList.do?pageNum=${pageInfo.hasNextPage==false? pageInfo.pages : pageInfo.nextPage}&key=${key}">下一页</a></li>
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