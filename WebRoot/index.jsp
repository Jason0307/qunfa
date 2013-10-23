<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    
	<link href="images/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){
		//setMenuHeight
		$('.menu').height($(window).height()-51-27-26-5);
		$('.sidebar').height($(window).height()-51-27-26-5);
		$('.page').height($(window).height()-51-27-26-5);
		$('.page iframe').width($(window).width()-15-168);
		
		//menu on and off
		$('.btn').click(function(){
			$('.menu').toggle();
			
			if($(".menu").is(":hidden")){
				$('.page iframe').width($(window).width()-15+5);
				}else{
				$('.page iframe').width($(window).width()-15-168);
					}
			});
			
		//
		$('.subMenu a[href="#"]').click(function(){
			$(this).next('ul').toggle();
			 return false;
			});
	})
	</script>


</head>

<body style="overflow-y:hidden">
<div id="wrap">
	<div id="header">
    <div class="logo fleft"></div>
    <div class="nav fleft">
    	<ul style="display: none">
        	<div class="nav-left fleft"></div>
            <li class="first"><a href="#">我的面板</a></li>
        	<li><a href="#">设置</a></li>
            <li><a href="#">模块</a></li>
            <li><a href="#">内容</a></li>
            <li><a href="#">用户</a></li>
            <li><a href="#">扩展</a></li>
            <li><a href="#">应用</a></li>
            <div class="nav-right fleft"></div>
        </ul>
    </div>
    <a class="logout fright" href="login.jsp"> </a>
    <div class="clear"></div>
    <div class="subnav">
    	<div class="subnavLeft fleft"></div>
        <div class="fleft"></div>
        <div class="subnavRight fright"></div>
    </div>
    </div><!--#header -->
    <div id="content">
    <div class="space"></div>
    <div class="menu fleft">
    	<ul>
        	<li class="subMenuTitle">我的菜单</li>
            <li class="subMenu"><a href="#">群发管理</a>
            	<ul>
                	<li><a href="fanList.jsp" target="right">粉丝列表</a></li>
                	<li><a href="userTypeList.jsp" target="right">信息群发</a></li>
                </ul>
            </li>
            <!-- 
            <li class="subMenu"><a href="#">常用组件(高级)</a>
            	<ul>
                	<li><a href="table.html" target="right">表格控件</a></li>
                    <li><a href="table.html" target="right">表单控件</a></li>
                </ul>
            </li>
             -->
        </ul>
    </div>
    <div class="sidebar fleft"><div class="btn"></div></div>
    <div class="page">
    <iframe width="100%" scrolling="auto" height="100%" frameborder="false" allowtransparency="true" style="border: medium none;" src="main.html" id="rightMain" name="right"></iframe>
    </div>
    </div><!--#content -->
    <div class="clear"></div>
    <div id="footer">CopyRight &copy; 2012-2014 wx.dapangzi.net </div><!--#footer -->
</div>
</body>
</html>
