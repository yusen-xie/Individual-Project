<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>电影院管理系统</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="My Show Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/menu.css" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<link rel="stylesheet" href="css/page.css" />
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
				});
			});
		</script>
<!---- start-smoth-scrolling---->
<script src="layer/jquery-2.0.3.min.js"></script>
<script src="layer/layer.js"></script>
<link rel="stylesheet" type="text/css" href="/cinematicketssm/admin/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="/cinematicketssm/admin/common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="/cinematicketssm/admin/common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="/cinematicketssm/admin/css/personal.css" media="all">
</head>
<body>
	<!-- header-section-starts -->
		
<jsp:include page="top.jsp"></jsp:include>
		<div class="container">
		  <div class="main-content">
		  <!-- head -->
		  <jsp:include page="head.jsp"></jsp:include>
		<!-- head -->
		<!-- end container -->
    
<!-- AddThis Smart Layers END -->

	<ol class="breadcrumb">
			  <li><a href="index.do">首页</a></li>
			  <li>购买记录</li>
			</ol>
	<!----->
	<div class="contact">
	<h3>购买记录</h3>
	<div class="contact-form">
					<div class="col-md-6 contact-grid" style="border:0px solid red;width: 100%">
					
					  <div class="layui-form news_list" >
                    <table class="layui-table" style="font-size:12px;">
					<thead>
						<tr>
						    <th>订单号</th>
							<th>影片</th>
							<th>场次</th>
							<th>放映厅</th>
							<th>票数</th>
							<th>座号</th>
							<th>商品</th>
							<th>金额</th>
							<th>付款状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">
					   <c:forEach items="${pageInfo.list}" var="dingdan">
						<tr>
							<td>${dingdan.ddno}</td>
							<td>${dingdan.movie.name}</td>
							<td>${dingdan.changci.savetime}</td>
							<td>${dingdan.changci.hall.name}</td>
							<td>${dingdan.num}</td>
							<td>${dingdan.seatstr}</td>
							<td>${dingdan.productinfo}</td>
							<td>${dingdan.price}</td>
							<td>${dingdan.fkstatus}</td>
							<td>
							   <c:if test="${dingdan.fkstatus eq '已付款' }">
							   <a class="layui-btn layui-btn-mini" href="javascript:alert('${dingdan.ma }');">取票码</a>
							   </c:if>
							   <a class="layui-btn layui-btn-mini" href="dingdanSc.do?id=${dingdan.id}">删除</a>
							</td>
						</tr>
						</c:forEach>
						<tr>
                    <td align="center"  colspan="13">
                    <c:if test="${fn:length(pageInfo.list) gt 0}">
		               <div id="pagediv" style="border:0px solid red;">
			              <ul>
			                  <li><a href="dingdanLb.do?pageNum=${pageInfo.hasPreviousPage==false?1:pageInfo.prePage}">上一页</a></li>
			                  <c:forEach begin="1" end="${pageInfo.pages}" varStatus="status">
			                      <li class="pagesz ${status.count eq pageInfo.pageNum ?"acvtive":""}" ><a href="dingdanLb.do?pageNum=${status.count}" >${status.count}</a></li>
			                  </c:forEach>
			                  <li><a href="dingdanLb.do?pageNum=${pageInfo.hasNextPage==false? pageInfo.pages : pageInfo.nextPage}">下一页</a></li>
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
					
				    </div>
				<div class="clearfix"> </div>
			   </div>
	</div>
	</div>
		
			<div class="clearfix"></div>
		</div>
			<div class="copy-rights text-center">
			<p> 电影院管理系统 - Collect from <a href="<%=path %>/admin/login.jsp" title="后台管理" target="_blank">后台管理</a></p>
			</div>
	</div>
 <script src="js/responsive-tabs.js"></script>
    <script type="text/javascript">
      $( '#myTab a' ).click( function ( e ) {
        e.preventDefault();
        $( this ).tab( 'show' );
      } );

      $( '#moreTabs a' ).click( function ( e ) {
        e.preventDefault();
        $( this ).tab( 'show' );
      } );

      ( function( $ ) {
          // Test for making sure event are maintained
          $( '.js-alert-test' ).click( function () {
            alert( 'Button Clicked: Event was maintained' );
          } );
          fakewaffle.responsiveTabs( [ 'xs', 'sm' ] );
      } )( jQuery );

    </script>
 <script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
				<a href="#home" class="scroll" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
<script type="text/javascript">
function checkUname(){
	var uname = $("#memberuname").val();
	$.ajax({
		type:"post",
		url:"checkUname.do?uname="+uname,
		date:'',
		success:function(msg){
			if(msg==1){
				layer.msg("已存在的用户名");
				$("#memberuname").val("");
			}
		}
	})
}

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>


function up(tt)
{
		    layer.open({
		      type: 2,
		      title: '上传文件',
		      shadeClose: true,
		      shade: false,
		      maxmin: true, //开启最大化最小化按钮
		      area: ['450px', '200px'],
		      content: 'upload.jsp?Result='+tt
		    });
}
</script>
</html>