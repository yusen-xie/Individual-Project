<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>电影院管理系统</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link rel="stylesheet" href="css/menu.css" />
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
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
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
.score{
position:absolute;
border:0px solid red;
text-align:left;
color:white;
background: red;
left:5px;
top:5px;
width:40px;
height:40px;
border-radius:20px 20px;
text-align: center;
padding-top: 10px;
}
</style>

</head>
<body>
	<!-- header-section-starts -->
		<jsp:include page="top.jsp"></jsp:include>
		
		<div class="container">
		  <div class="main-content">
			<jsp:include page="head.jsp"></jsp:include>
			<!-- end container -->
    

<!-- AddThis Smart Layers END -->


	<div class="main-banner" style="border:0px solid red;padding: 0px;">
		 <div class="banner col-md-8" style="border:0px solid red;width: 100%;height: 360px;padding: 0px;">
			<section class="slider" >
				<div class="flexslider">
						<ul class="slides">
						<c:forEach items="${imglist}" var="imgadv">
						<li>
							<img src="upfile/${imgadv.filename}"  style="border:0px solid red;width: 100%;height: 360px;" class="img-responsive" alt="" />
						</li>
				  		</c:forEach>
				  </ul>
				</div>
					</section>
				 <!-- FlexSlider -->
				 <script defer src="js/jquery.flexslider.js"></script>
				 <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
					<script type="text/javascript">
				$(function(){
				 SyntaxHighlighter.all();
				});
				$(window).load(function(){
				  $('.flexslider').flexslider({
					animation: "slide",
					start: function(slider){
					  $('body').removeClass('loading');
					}
				 });
				});
			 </script>
         </div>
		 <div class="clearfix"></div>
	</div>
<div class="review-slider" style="border:0px solid red;">
<div style="width: 100%;border:0px solid red;padding-left:20px; text-align: left;margin-top: 20px;font-size: 24px;font-weight: bolder;color:#003B64">即将上映</div>
			 <ul id="flexiselDemo1">
			 <c:forEach items="${laterlist}" var="latermovie">
			<li>
			    <div class="score">${latermovie.score}</div>
				<a href="movieDetails.do?id=${latermovie.id}"><img src="upfile/${latermovie.filename}" alt=""/></a>
				<div class="slide-title" style="border:0px solid red;"><h4>${latermovie.name}</h4></div>
				<div class="date-city">
					<div class="buy-tickets" style="margin: 0px;padding: 0px;">
						<a href="movieDetails.do?id=${latermovie.id}">敬请期待</a>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
			<script type="text/javascript">
		$(window).load(function() {
			
		  $("#flexiselDemo1").flexisel({
				visibleItems: 5,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
				pauseOnHover: false,
				enableResponsiveBreakpoints: true,
				responsiveBreakpoints: { 
					portrait: { 
						changePoint:480,
						visibleItems: 2
					}, 
					landscape: { 
						changePoint:640,
						visibleItems: 3
					},
					tablet: { 
						changePoint:800,
						visibleItems: 4
					}
				}
			});
			});
		</script>
		<script type="text/javascript" src="js/jquery.flexisel.js"></script>	
		</div>
		<div class="footer-top-grid" style="border:0px solid red;width: 100%">
		<div class="list-of-movies col-md-8" style="border:0px solid red;width: 98%">
				<div class="clearfix"></div>
				<div class="featured">
					<h4>正在热映</h4>
					<ul>
					<c:forEach items="${hotlist}" var="hotmovie">
						<li style="width: 24%">
							<div class="f-movie">
							
								<div class="f-movie-img">
								<div class="score">${hotmovie.score}</div>
									<a href="movieDetails.do?id=${hotmovie.id}"><img src="upfile/${hotmovie.filename}" alt=""></a>
								</div>
									<div class="f-movie-name">
										<a href="movieDetails.do?id=${hotmovie.id}">${hotmovie.name}</a>
									</div>								 
								<div class="f-buy-tickets">
									<a href="movieDetails.do?id=${hotmovie.id}">购票</a>
								</div>
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
			</div>
			<div class="clearfix"></div>			
			</div>
		</div>
			<div class="clearfix"></div>
		</div>
			<div class="copy-rights text-center">
			<p> 电影院管理系统 - Collect from <a href="<%=path %>/admin/login.jsp" title="后台管理" target="_blank">后台管理</a></p>
			</div>
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
</html>