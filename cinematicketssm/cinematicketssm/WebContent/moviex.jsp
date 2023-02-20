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
<!--webfont-->
<!-- start menu -->
<link rel="stylesheet" href="<%=path %>/assets/hivideo.css" />

<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<link rel="stylesheet" href="css/font-awesome.min.css" />
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
</script>
<link rel="stylesheet" href="css/menu.css" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<!-- checkbox -->

<!-- checkbox -->
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
				});
			});
		</script>
<!---- start-smoth-scrolling---->

<style type="text/css">
input[type="range"] {
  display: none;
  width: 100%;
}
.buyticket{
list-style: none;

}
.buyticket li{
font-weight: bold;
border:0px solid red;
height: 50px;
line-height: 50px;
border-bottom: 1px dashed gray;
}
</style>
<script src="layer/jquery-2.0.3.min.js"></script>
<script src="layer/layer.js"></script>
</head>
<body>
	<!-- header-section-starts -->
		
<jsp:include page="top.jsp"></jsp:include>
		<div class="container">
		  <div class="main-content">
		  <!-- head -->
<jsp:include page="head.jsp"></jsp:include>    
<!-- AddThis Smart Layers END -->
	<div class="now-showing-list">
		<div class="col-md-4 movies-by-category movie-booking">
			<div class="movie-ticket-book">
					<div class="clearfix"></div>
					<img src="upfile/${movie.filename}" alt="" />
					<div class="bahubali-details">
					   <ul style="list-style: none;font-size:12px;">
					     <li style="margin-top: 20px;"><font style="font-weight: bold;">影片名:</font>&nbsp;&nbsp;${movie.name }</li>
					     <li style="margin-top: 10px;"><font style="font-weight: bold;">影片类别:</font>&nbsp;&nbsp;${movie.category.name}</li>
					     <li style="margin-top: 10px;"><font style="font-weight: bold;">主演:</font>&nbsp;&nbsp;${movie.zystr}</li>
					     <li style="margin-top: 10px;"><font style="font-weight: bold;">时长:</font>&nbsp;&nbsp;${movie.longtime}分钟</li>
					     <li style="margin-top: 10px;"><font style="font-weight: bold;">上映时间:</font>&nbsp;&nbsp;${movie.savetime}</li>
					     <li style="margin-top: 10px;"><font style="font-weight: bold;">票价:</font>&nbsp;&nbsp;<span style="color:red;font-weight:bolder">￥${movie.price}(会员:7折优惠)</span></li>
					   </ul>
					</div>
				</div>
			</div>
		<div class="col-md-8 movies-dates">	
		
		
		
			<div >
			<h4 style="border-bottom: 1px solid #EEEEEE;padding-bottom: 10px;">影片简介</h4>
			<p style="margin-top: 20px;">${movie.content}</p>
			
			<!-- 票务内容 -->
			<c:choose>
			  <c:when test="${fn:length(movie.cclist) gt 0}">
					  <h4 style="border-bottom: 2px solid #003B64;padding-bottom: 10px;margin-top: 30px;font-weight: bold;color:#003B64">购票选座</h4>
					<!-- 场次 -->
					<div style="border:0px solid red;margin-top: 20px;">
					  <ul class="buyticket">
					  <c:forEach items="${movie.cclist}" var="changci">
					    <li>${changci.savetime}(余票:${changci.yp}张)<span style="float: right;"><a href="seatLb.do?changciid=${changci.id}&movieid=${movie.id}">[购票]</a></span></li>
					  </c:forEach>
					  </ul>
					</div>
			  </c:when>
			  <c:otherwise>
			  <h4 style="border-bottom: 0px solid #003B64;margin-top: 30px;font-weight: bold;color:#003B64;text-align: center;">暂无购票信息</h4>
			  </c:otherwise>
			</c:choose>
			
			<!-- 场次 -->
			
			<!-- 票务内容 -->
			</div>
			<div style="border:0px solid red;float: left;width: 100%;">
			<input type="button" class="go-to-pay" onclick="tofav('${movie.id}')" style="margin-right: 2em;float: left;" value="收藏影片">
			</div>
		</div>
		<div class="clearfix"></div>
		
		
		<div class="vochers" style="border:1px solid #EEEEEE;margin-top:30px;">
		<div style="background: #003B64;height:35px;color:white;font-size:20px;font-weight: bold;line-height: 35px;padding-left: 20px;letter-spacing: 5px;margin-bottom: 50px;">评价</div>
		<div class="m-vocher-text" style="width: 100%;margin-bottom: 20px;">
		  <!-- s -->
		  
		  <div class="tab-pane" id="source">
		  <div class="response" >
		  <c:forEach items="${pllist}" var="pinlun">
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="<%=path %>/upfile/${pinlun.member.filename}" alt="" style="width: 64px;height:64px;border-radius:32px 32px;">
								</a>
								<h5 style="margin-left: 20px;"><a href="#">${pinlun.member.uname}</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>${pinlun.content}</p>
								<ul>
									<li>${pinlun.savetime}</li>
								</ul>
							</div>
							<div class="clearfix"> </div>
						</div>
			</c:forEach>			
						
						
					</div>
        </div>
      </div>	
      
      
      <div class="feed-back-form" style="margin-top: 320px;">
			<form action="pinlunAdd.do" method="post">
			<input type="hidden" name="movieid" value="${movie.id}"/>
			<span></span>
			<span style="color:red;">请在下方填写您评论</span>
			<div style="margin-top: 20px;">
			<select name="score" style="border:1px solid #EEEEEE;width:10%;height: 40px;padding-left: 5px;">
			  <option value="5">5</option>
			  <option value="4">4</option>
			  <option value="3">3</option>
			  <option value="2">2</option>
			  <option value="1">1</option>
			</select>
			<textarea name="content"  style="border:1px solid #EEEEEE" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请输入内容...';}" required></textarea>
			<input type="submit" value="提交">
			</div>
			</form>
		</div>
      
      	
	</div>
		
	</div>
		</div>
		
			<div class="clearfix"></div>
		</div>
			<div class="copy-rights text-center">
			<p> 电影院管理系统 - Collect from <a href="<%=path %>/admin/login.jsp" title="后台管理" target="_blank">后台管理</a></p>
			</div>
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
function tofav(vid){
	location.replace("favAdd.do?vid="+vid);
}

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
</script>
<script type="text/javascript" src="<%=path %>/js/hivideo.js"></script>
</html>