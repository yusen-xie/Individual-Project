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


		<div class="footer-top-grid" style="border:0px solid red;width: 100%">
		<div class="list-of-movies col-md-8" style="border:0px solid red;width: 98%">
				<div class="clearfix"></div>
				<div class="featured">
					<h4>影片列表</h4>
					<ul>
					<c:forEach items="${pageInfo.list}" var="movie">
						<li style="width: 24%">
							<div class="f-movie">
								<div class="f-movie-img">
								<div class="score">${movie.score}</div>
									<a href="movieDetails.do?id=${movie.id}"><img src="upfile/${movie.filename}" alt=""></a>
								</div>
									<div class="f-movie-name">
										<a href="movieDetails.do?id=${movie.id}">${movie.name}</a>
									</div>								 
								<div class="f-buy-tickets">
									<a href="movieDetails.do?id=${movie.id}">购票</a>
								</div>
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
			</div>
			<div class="clearfix"></div>		
			<div class="blog-pagimation">
			<c:if test="${fn:length(pageInfo.list) gt 0}">
               <div id="pagediv" style="border:0px solid red;">
	              <ul>
	                  <li><a href="movieMsg.do?pageNum=${pageInfo.hasPreviousPage==false?1:pageInfo.prePage}&key=${key}&categoryid=${categoryid}">上一页</a></li>
	                  <c:forEach begin="1" end="${pageInfo.pages}" varStatus="status">
	                      <li class="pagesz ${status.count eq pageInfo.pageNum ?"acvtive":""}" ><a href="movieMsg.do?pageNum=${status.count}&key=${key}&categoryid=${categoryid}" >${status.count}</a></li>
	                  </c:forEach>
	                  <li><a href="movieMsg.do?pageNum=${pageInfo.hasNextPage==false? pageInfo.pages : pageInfo.nextPage}&key=${key}&categoryid=${categoryid}">下一页</a></li>
	              </ul>
	          </div>       
        	</c:if> 
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
$(document).ready(function(){
		$("#defaultmenu").find("ul").find("li").each(function(){
			if($(this).find("a")[0].href==window.location){
				$(this).addClass("active");
			}else{
				$(this).removeClass("active");
			}
				
		})
}); 
</script>
</html>