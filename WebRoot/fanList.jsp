<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.qunfa.model.UserType"%>
<%@page import="com.qunfa.common.Page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.qunfa.common.WxService"%>
<%@page import="com.qunfa.model.WxUser"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link href="images/style.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		body {
			background:#FFF
		}
	</style>
	<%
	   boolean flag = new WxService().getFanList(request);
	%>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/windows.js"></script>
	<script type="text/javascript">
	    <%
	      if(!flag){
	    %>
	       window.parent.location.href="login.jsp";
	    <%
	      }
	    %>
		$(function(){
			$('tbody tr:odd').addClass("trLight");
			$(".select-all").click(function(){
				if($(this).attr("checked")){
					$(".checkBox input[type=checkbox]").each(function(){
						$(this).attr("checked", true);  
						});
					}else{
						$(".checkBox input[type=checkbox]").each(function(){
						$(this).attr("checked", false);  
						});
					}
				});
			
		});
			
		function openDiv(fackId){
		   $('#fackId').val(fackId);
		   DivWindowOpen(650,220,'container');
		}
			
		function sub(){
				var fackId = $('#fackId').val();
				var content = $('#content').val();
				if(fackId!="" && content!=""){
					jQuery.ajax({
			           type: "POST", //第一次抓文件建立本地缓存返回200,再次访问时如果本地缓存有效时则返回304
			           url : "SendMessageServlet",
			           data:({"fackId":fackId,"content":content}),
			           dataType: "text",
			           cache : true,
			           contentType:"application/x-www-form-urlencoded;charset=gb2312", //重要是这个定义字符编码
			           async : false,
			           success: function(result) {
			              $('#content').val("");
					      if(result==1){
					         alert('发送成功!');
					      }else{
					         alert('发送失败!');
					      }
			           }
			        });
				}else{
					alert('请填写内容');
				}
			 }	
	</script>
</head>
<body>
<div id="contentWrap">
  <div id="widget table-widget">
    <div class="pageTitle">消息群发-粉丝列表</div>
    <div class="pageColumn">
      <div class="pageButton"></div>
      <table>
        <thead>
          <th width="40%">微信ID</th>
          <th width="40%">微信昵称</th>
          <th width="20%">操作</th>
        </thead>
        <tbody>
         
         <c:forEach items="${userList}" var="user">
          <tr>
            <td>${user.id}</td>
            <td>${user.nick_name}</td>
            <td>
                <a onclick="openDiv('${user.id}');" href="#"><img src="images/icon/edit2.png" width="16" height="16" /></a>　
            </td>
          </tr>
         </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>
<DIV style="DISPLAY: none" id="container" class="xbox">
	<h2>
		单条发送(发送消息如有要验证码,自己想办法解决)
	</h2>
	<a id="box_close" class="xbox-close"><b>&nbsp;</b>关闭</a>
	<div class="tishi">
		<textarea rows="8" cols="10" id="content"></textarea>
		<input type="hidden" id="fackId"/>
		<input type="button" class="input_tj" value="发送" onclick="sub()" />
	</div>
	<ul class="detail">
	</ul>
</div>
</body>
</html>
