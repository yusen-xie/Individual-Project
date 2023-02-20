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
		  <!-- head -->
		  <jsp:include page="head.jsp"></jsp:include>
		<!-- head -->
		<!-- end container -->
    
<!-- AddThis Smart Layers END -->

	<ol class="breadcrumb">
			  <li><a href="index.do">首页</a></li>
			  <li class="active">个人信息</li>
			</ol>
	<!----->
	<div class="contact">
	<h3>个人信息</h3>
	<p class="love">请填写完整信息</p>
	<div class="contact-form">
					<div class="col-md-6 contact-grid">
					<form action="memberxg.do" method="post" name="regForm">
					<input type="hidden" name="id" value="${member.id}">
						
						<img alt="" src="/cinematicketssm/upfile/${member.filename}" id="imgfilename" style="width: 120px;height: 120px;margin-left: 7px;" ><br/>
						<input name='filename' type='hidden' value="${member.filename}" class="form-control" placeholder="点击按钮上传图片"  required    id='url'  size='50'  />&nbsp;<input type='button' value='上传'  class="layui-input" onClick="up('url')" style="width: 120px;height: 23px;border:1px solid #cccccc;background: white;border-radius:20px 20px;outline:none;font-size:8px;letter-spacing: 2px;"/>
						
						<p class="your-para">用户名:</p>
						<input type="text" id="memberuname"  name="uname" value="${member.uname}" readonly="readonly" required oninvalid="setCustomValidity('用户名不能为空')" oninput="setCustomValidity('');">
						
						
						<p class="your-para">密码:</p>
						<input type="password"  name="upass" value="${member.upass}" style="width: 540px;height: 40px;border:1px solid #DADADA" required oninvalid="setCustomValidity('密码不能为空')" oninput="setCustomValidity('');">
						
						<p class="your-para">姓名:</p>
						<input type="text" id="tname"  name="tname" value="${member.tname}"  required oninvalid="setCustomValidity('姓名不能为空')" oninput="setCustomValidity('');">
						
						
						<p class="your-para">性别:</p>
						<select name="sex" style="width: 540px;height: 40px;">
						  <option value="男" ${member.sex eq '男'?'selected':''}>男</option>
						  <option value="女" ${member.sex eq '女'?'selected':''}>女</option>
						</select>
						
						<p class="your-para"></p>
						<p class="your-para">手机号:</p>
						<input type="text"  name="tel"  value="${member.tel}" required oninvalid="setCustomValidity('请输入11位数字或非法输入')" oninput="setCustomValidity('');" pattern="[1][3,4,5,7,8][0-9]{9}">
						
						<p class="your-para">邮箱:</p>
						<input type="email"  name="email" value="${member.email}"  style="width: 540px;height: 40px;border:1px solid #DADADA" required oninvalid="setCustomValidity('请输入正确的邮箱')" oninput="setCustomValidity('');">
						
						<div class="send">
							<input type="submit" value="提交" >
						</div>
					</form>
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