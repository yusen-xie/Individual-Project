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
         .cmdiv{
         border:0px solid #EEEEEE;
         }
        .input_radio li {
            display: inline-block;
            position: relative;
            list-style: none;
            margin-top: 10px;
        }
        .input_radio input[type="radio"] {
            display: none;
        }
        .input_radio span {
            padding: 0 12px;
            display: inline-block;
            background: #EEEEEE;
            border: 1px solid #EEEEEE;
            border-radius: 4px;
            line-height: 28px;
            text-align: center;
            color: #2D333B;
            cursor: pointer;
            font-weight: 600;
            width: 80px;
        }
        .input_radio input:checked+span {
            background: #003B64;
            border-color: #003B64;
            color: white;
            
        }
    </style>
<style type="text/css">

.input_radio{
list-style: none;

}
.input_radio li{
border:0px solid red;
margin-right: 10px;
display:inline-block;

}

</style>
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
					   <ul  style="list-style: none;font-size:12px;">
					     <li style="margin-top: 20px;"><font style="font-weight: bold;">影片名:</font>&nbsp;&nbsp;${movie.name }</li>
					     <li style="margin-top: 10px;"><font style="font-weight: bold;">影片类别:</font>&nbsp;&nbsp;${movie.category.name}</li>
					     <li style="margin-top: 10px;"><font style="font-weight: bold;">主演:</font>&nbsp;&nbsp;${movie.zystr}</li>
					     <li style="margin-top: 10px;"><font style="font-weight: bold;">上映时间:</font>&nbsp;&nbsp;${movie.savetime}</li>
					     <li style="margin-top: 10px;"><font style="font-weight: bold;">票价:</font>&nbsp;&nbsp;<span style="color:red;font-weight:bolder">￥${movie.price}(会员:7折优惠)</span></li>
					   </ul>
					</div>
				</div>
			</div>
		<div class="col-md-8 movies-dates">	
		
		
			<div >
			
			<h4 style="border-bottom: 2px solid #003B64;padding-bottom: 10px;margin-top: 30px;font-weight: bold;color:#003B64;text-align: center">大屏幕</h4>
			<!-- 场次 -->
			<div id="cmdiv" style="border:0px solid red;margin-top: 20px;">
			  <ul class="input_radio" style="border:0px solid red;padding-left: 45px;">
			  <c:forEach items="${seatlist}" var="seat" varStatus="status">
			    <li>
			    <label for="optionLable0${status.index}"> 
			    <input type="checkbox" id="optionLable0${status.index}" style="display: none;" name="seatno" ${seat.iszy eq 'yes'?'checked':''} ${seat.iszy eq 'yes'?'disabled':''}  value="${seat.id}"/>
			    <!-- 是否变色 -->
			    <span class="option-label"
			    
			    <c:forEach items="${stlist}" var="yxseat">
			    <c:if test="${seat.id eq yxseat}">
			    style="background: green;border: 1px solid green;"
			    </c:if>
			    </c:forEach>
			    
			    <c:forEach items="${ttlist}" var="qtyxseat">
			    <c:if test="${seat.id eq qtyxseat}">
			    style="background: red;border: 1px solid red;"
			    </c:if>
			    </c:forEach>
			    
			    >${seat.seatno}</span>
			    <!-- 是否变色 -->
			    </label>
			    </li>
			    
			  </c:forEach>
			  </ul>
			</div>
			<!-- 场次 -->
			</div>
			
		    <!-- 便利店 -->
		    <h4 style="border-bottom: 2px solid #003B64;padding-bottom: 10px;margin-top: 30px;font-weight: bold;color:#003B64">便利店</h4>
			<div style="border:0px solid red;margin-top: 20px;">
			  <ul class="buyticket" style="list-style: none;">
			    <li>
			      <div style="display:flex;align-items : flex-end;border:0px solid red;width: 100% ">
			      <div style="width: 33%;font-weight: 600">商品名称</div>
			      <div style="width: 33%;font-weight: 600">价格</div>
			      <div style="width: 33%;text-align: right;font-weight: 600">数量</div>
			     </div>
			    </li>
			  <c:forEach items="${ptlist}" var="product">
			    <li style="padding: 5px;">
			      <div style="display:flex;align-items : flex-end;border:0px solid red;width: 100% ">
			      <div style="width: 33%">${product.name}</div>
			      <div style="width: 33%;font-weight: bold;color:red;">￥${product.price }</div>
			      <div style="width: 33%;text-align: right;font-size:12px;"><input type="text" name="num" id="${product.id}" value="0" style="width: 20px;font-size:12px;height: 20px;"/></div>
			     </div>
			    </li>
			  </c:forEach>
			  </ul>
			</div>
			<!-- 便利店 -->
			
			
			<div style="border:0px solid red;float: left;width: 100%;">
			<input type="submit" class="go-to-pay" onclick="tobuy('${movieid}','${changciid}')" style="margin-left: 4em;float: left;width: 100px;" value="提交">
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
<script src="layer/jquery-2.0.3.min.js"></script>
<script src="layer/layer.js"></script>
<script type="text/javascript">
function tobuy(movieid,changciid){
	var seatstr =[];//定义一个数组   
	$("input[type=checkbox]:checked").each(function(){
		//alert($(this).attr("disabled"));
		if($(this).attr("disabled")!="disabled"){
		seatstr.push($(this).val());
		}
	})
	
	var productmsg = [];
	$("input[name=num]").each(function(index){
		if($(this).val()!=0){
			var productid = $(this).attr("id");
			var productxx = productid+"-"+$(this).val();
			productmsg.push(productxx);
		}
	})
	
	
	
	if(seatstr!=''){
	location.replace("createDD.do?seatstr="+seatstr+"&movieid="+movieid+"&changciid="+changciid+"&productmsg="+productmsg);
	}else{
    layer.msg("请选择座位");
	}
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