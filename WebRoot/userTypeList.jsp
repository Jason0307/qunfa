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
	   new WxService().getUserTypeList(request);
	%>
	
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/windows.js"></script>
	<script type="text/javascript">
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
			
			})
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
         
         <c:forEach items="${userTypeList}" var="type">
          <tr>
            <td>${type.name}</td>
            <td>${type.num}</td>
            <td><a onclick="DivWindowOpen(650,220,'container');" href="#">
            <img src="images/icon/edit2.png" width="16" height="16" /></a></td>
          </tr>
         </c:forEach>
          <tr class=" ">
              <td colspan="7" class="checkBox">${page.output}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>
<DIV style="DISPLAY: none" id="container" class="xbox">
	<h2>
		微信群发
	</h2>
	<a id="box_close" class="xbox-close"><b>&nbsp;</b>关闭</a>
	<div class="tishi">
		<textarea rows="8" cols="10"></textarea>
		<span>从<input type="text" value="1"></input>到<input type="text"  value="100"></input>
		<input type="text" onclick="alert('自己实现一下,参考单条发送.')" class="input_tj" value="发送"></iput>
	</div>
	<ul class="detail">
	</ul>
</div>
</body>
</html>
