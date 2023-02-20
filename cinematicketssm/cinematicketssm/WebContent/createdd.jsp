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
<script src="layer/jquery-2.0.3.min.js"></script>
<script src="layer/layer.js"></script>
</head>
<body>
	<!-- header-section-starts -->
		
		<jsp:include page="top.jsp"></jsp:include>
		<div class="container">
		  <div class="main-content">
			<jsp:include page="head.jsp"></jsp:include>
			<!-- end container -->
    
<!-- AddThis Smart Layers END -->
			 
		<div class="e-payment-section">
			<div class="col-md-8 payment-left">
				<div class="payment-options">
					<h3>付款方式</h3>
					
					<div class="tabs-box">
					<form action="dingdanAdd.do" mothod="post">
						<div id="tab1" class="tab-grid">
						<input type="hidden" name="price" value="${total}"/>
						<input type="hidden" name="movieid" value="${movie.id}"/>
						<input type="hidden" name="changciid" value="${changci.id}"/>
						<input type="hidden" name="seatstr" value="${seatstrid}"/>
						<input type="hidden" name="productmsg" value="${productmsg}"/>
						<input type="hidden" name="productinfo" value="${productinfo}"/>
						<input type="hidden" name="num" value="${num}"/>
							<input type="text" class="payment" value="支付帐号" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '支付帐号';}">
							<input type="text" class="payment" value="支付密码" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '支付密码';}">
							<input type="submit" class="go-to-pay" value="付款" style="float: left;">
						</div>
						</form>
					<div class="clearfix"> </div>
				</div>
	<!--start-carrer-->
	<!----- Comman-js-files ----->
		<script>
			$(document).ready(function() {
				$("#tab2").hide();
				$("#tab3").hide();
				$("#tab4").hide();
				$(".tabs-menu a").click(function(event){
					event.preventDefault();
					var tab=$(this).attr("href");
					$(".tab-grid").not(tab).css("display","none");
					$(tab).fadeIn("slow");
				});
			});
		</script>

				</div>
			</div>
			<div class="col-md-4">
			<div class="payment-right" style="height: auto;">
				<h3>票务摘要</h3>
				<h6><span>影片:</span>${movie.name}</h6>
				<p><span>票价:</span> ￥${movie.price} </p>
				<p><span>场次:</span> ${changci.savetime} </p>
				<p><span>放映厅:</span> ${changci.hall.name}</p>
				<p><span>购票数:</span> ${num}张</p>
				<p><span>座位数:</span> ${seatstr}</p>
				<p><span>商品信息:</span> ${productinfo}</p>
				<h5>总计 :￥${total}</h5>
			</div>
			<div class="ticket-note">
				<h3>注意：</h3>
				<ol>
					<li><p>预订后的注册/门票无法交换，取消或退款。</p></li>
					<li><p>如果预订了信用卡/借记卡，则在收票时必须在售票柜台出示信用卡/借记卡和持卡人。</p></li>
				</ol>
			</div>
			</div>
			<div class="clearfix"></div>
		</div>
		</div>
		
			<div class="clearfix"></div>
		</div>
			<div class="copy-rights text-center">
				<p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
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
<%
String error = (String)request.getAttribute("error");
if(error!=null){
%>
layer.msg('<%=error%>');
<%}%>
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
</script>
</html>