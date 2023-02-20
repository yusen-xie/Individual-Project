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
	<title>会员信息</title>
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
		      <form action="<%=path %>/admin/memberList.do" method="post" id="searchform" name="searchform">
		    	<input value="${key}" placeholder="请输入会员或姓名" name="key" class="layui-input search_input" type="text">
		    <!-- <input type="submit" class="layui-btn" value="查询"> -->	
		      </form>
		    </div>
		    <a class="layui-btn"  href="javascript:void(0)" onclick="searchnew()">查询</a>
		</div><div class="layui-inline">
		<!-- 	<a class="layui-btn layui-btn-normal" href="newsadd.jsp">添加新闻</a> -->
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
							<th>会员名</th>
							<th>姓名</th>
							<th>性别</th>
							<th>电话</th>
							<th>邮箱</th>
							<th>类型</th>
							<th>帐户状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">
					   <c:forEach items="${pageInfo.list}" var="member">
						<tr>
						    <td>
						    <input name="checked" lay-skin="primary" lay-filter="choose" type="checkbox" value="${member.id}">
						    <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i class="layui-icon"></i></div>
						    </td>
							<td>${member.uname}</td>
							<td>${member.tname}</td>
							<td>${member.sex}</td>
							<td>${member.tel}</td>
							<td>${member.email}</td>
							<td>${member.utype}</td>
							<td>${member.shstatus}</td>
							<td>
							   <a class="layui-btn layui-btn-mini" href="updateUtype.do?id=${member.id}&status=tg">更改会员类型</a>
							   <c:choose>
							   <c:when test="${member.shstatus eq '正在使用'}">
							   <a class="layui-btn layui-btn-mini" href="gxStatus.do?id=${member.id}">锁定帐户</a>
							   </c:when>
							   <c:otherwise>
							   <a class="layui-btn layui-btn-mini" href="gxStatus.do?id=${member.id}">解锁帐户</a>
							   </c:otherwise>
							   </c:choose>
							</td>
						</tr>
						</c:forEach>
						<tr>
                    <td align="center"  colspan="9">
                           <c:if test="${fn:length(pageInfo.list) gt 0}">
	                     	   <div id="pagediv" style="border:0px solid red;">
				              <ul>
				                  <li><a href="memberList.do?pageNum=${pageInfo.hasPreviousPage==false?1:pageInfo.prePage}&key=${key}">上一页</a></li>
				                  <c:forEach begin="1" end="${pageInfo.pages}" varStatus="status">
				                      <li class="pagesz ${status.count eq pageInfo.pageNum ?"acvtive":""}" ><a href="memberList.do?pageNum=${status.count}&key=${key}" >${status.count}</a></li>
				                  </c:forEach>
				                  <li><a href="memberList.do?pageNum=${pageInfo.hasNextPage==false? pageInfo.pages : pageInfo.nextPage}&key=${key}">下一页</a></li>
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
      		url:"memberDelAll.do?vals="+vals,
      		date:"",
      		success:function(msg){
      			location.replace("memberList.do");
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