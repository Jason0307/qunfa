<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>微信公众平台模拟登陆</title>
		<%
			response.setHeader("Cache-Control","no-store");
			response.setHeader("Pragrma","no-cache");
			response.setDateHeader("Expires",0);
		%>
		<link href="images/login.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$('.captcha').focus(function(){
					  $('.yzm-box').attr("src","LoginServlet?username="+$('#username').val()+"&t="+new Date().getTime());
					  $('.yzm-box').show();
					}
				);
					
				$('.captcha').focusout(function(){
					$('.yzm-box').hide();
					$('.yzm-box').attr("src","");
					});
				})
			
			function sub(){
				var username = $('#username').val();
				var password = $('#password').val();
				var yzm = $('#yzm').val();
				if(username!="" && password!="" && yzm!=""){
					jQuery.ajax({
			           type: "POST", //第一次抓文件建立本地缓存返回200,再次访问时如果本地缓存有效时则返回304
			           url : "LoginServlet",
			           data:({"username":username,"password":password,"yzm":yzm}),
			           dataType: "text",
			           cache : true,
			           contentType:"application/x-www-form-urlencoded;charset=gb2312", //重要是这个定义字符编码
			           async : false,
			           success: function(result) {
			                if (result=="true") {
			                	window.location.href="index.jsp";
			                } else {
					           $('#message-box').html("用户名与密码组合错误!");
					           $('#message-box').show();
			                }
			            }
			        });
				}else{
					$('#message-box').html("请填写完整信息!");
					$('#message-box').show();
				}
			}	
		</script>
</head>

<body>
<div id="message-box"> 用户名或密码错误！ </div>
<div id="wrap">
	<div id="header"> </div>
    <div id="content-wrap">
    	<div class="space"> </div>
   	  <form id="loginForm" action="#" method="post"><div class="content">
        <div class="field"><label>账　户：</label><input class="username" id="username" name="username" value="" type="text" /></div>
		<div class="field"><label>密　码：</label><input class="password" id="password" name="password" value="" type="password" /><br /></div>
        <div class="field"><label>验证码：</label><input class="captcha" maxlength="6" name="yzm" id="yzm" type="text" /><br />
        <img class="yzm-box"/>
        </div>
        <div class="btn"><input type="button" class="login-btn" onclick="sub()" value="" /></div>
      </div></form>
    </div>
    <div id="footer"> </div>
</div>
</body>
</html>
