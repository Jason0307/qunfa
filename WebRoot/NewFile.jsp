<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>微信公众平台</title>
<link href="https://res.wx.qq.com/mpres/htmledition/images/favicon.ico"
	rel="Shortcut Icon">
<link rel="stylesheet" type="text/css"
	href="https://res.wx.qq.com/mpres/htmledition/style/xss/base17f64d.css" />
<link rel="stylesheet" type="text/css"
	href="https://res.wx.qq.com/mpres/htmledition/style/xss/lib17e4f5.css" />
<link rel="stylesheet"
	href="https://res.wx.qq.com/mpres/htmledition/style/xss/page/page_user17e4f5.css">
<link rel="stylesheet"
	href="https://res.wx.qq.com/mpres/htmledition/style/xss/tmp/tmp_lib17e4f5.css">
</head>
<body class="zh_CN">
	<div class="head" id="header">
		<div class="head_box">
			<div class="inner wrp">
				<h1 class="logo">
					<a href="/" title="微信公众平台">微信公众平台</a>
				</h1>
				<div id="accountArea" class="account">
					<a
						href="/cgi-bin/userinfopage?t=wxm-setting&lang=zh_CN&token=234222709"
						class="account_meta_link">时光机</a><a
						href="/cgi-bin/indexpage?t=wxm-notification-center&lang=zh_CN&token=234222709"
						class="account_meta_link">通知</a>&nbsp;|&nbsp;<a id="logout"
						href="/cgi-bin/logout?t=wxm-logout&lang=zh_CN&token=234222709"
						class="account_meta_link">退出</a>
				</div>
			</div>
		</div>
		<div class="nav_box">
			<ul class="nav" id="navigatorBar"></ul>
		</div>
		<script type="text/javascript">(function(){var URL = {index : '/cgi-bin/home?t=home/index',message : '/cgi-bin/message?t=message/list&count=20&day=7',user : '/cgi-bin/contactmanage?t=user/index&pagesize=10&pageidx=0&type=0&groupid=0',masssend : '/cgi-bin/masssendpage?t=wxm-send',masssendStatement : '/cgi-bin/indexpage?t=wxm-statement',statistics : '/cgi-bin/pluginlogin?t=wxm-mta&op=cftreg&pluginid=luopan',materialText : '/cgi-bin/operate_appmsg?sub=list&type=10&subtype=3&t=wxm-appmsgs-list-new&pagesize=10&pageidx=0',materialGoods : '/cgi-bin/operate_appmsg?sub=list&type=11&subtype=3&t=wxm-bizmsgs-list-new&pagesize=10&pageidx=0',setting : '/cgi-bin/userinfopage?t=wxm-setting',advanced : '/cgi-bin/advanced?action=index&t=advanced/index',business : '/cgi-bin/business?t=business/index&action=index',businessVerify : '/cgi-bin/business?t=business/overview&action=overview'}var navJson=[];navJson.push({nav_id:"home",nav_flag:"1",is_selected:""=="1"?" selected":""});navJson.push({nav_id:"messages",nav_flag:"1",is_selected:""=="1"?" selected":""});navJson.push({nav_id:"contact",nav_flag:"1",is_selected:"1"=="1"?" selected":""});navJson.push({nav_id:"masssend",nav_flag:"1",is_selected:""=="1"?" selected":""});navJson.push({nav_id:"statistics",nav_flag:"1",is_selected:""=="1"?" selected":""});navJson.push({nav_id:"materials",nav_flag:"1",is_selected:""=="1"?" selected":""});navJson.push({nav_id:"settings",nav_flag:"1",is_selected:""=="1"?" selected":""});navJson.push({nav_id:"advanced",nav_flag:"1",is_selected:""=="1"?" selected":""});navJson.push({nav_id:"merchant",nav_flag:"0",is_selected:""=="1"?" selected":""});  var navData={"home":['首页', URL.index],"messages":['实时消息', URL.message],"contact":['用户管理', URL.user],"masssend":['群发消息', [URL.masssend, URL.masssendStatement]],"statistics":['数据统计', URL.statistics, function(i, index,is_selected){return '<li data-index="' + i + '" class="nav_item js_statistics'+is_selected+'"><a href="'+[].concat(this[1])[index-1]+'&token=234222709&lang=zh_CN">'+this[0]+'<i class="icon18_adorn new"></i></a></li>'}],"materials":['素材管理', [URL.materialText, URL.materialGoods]],"settings":['设置', URL.setting],"advanced":['高级功能', URL.advanced, function(i, index,is_selected){return '<li data-index="' + i + '" class="nav_item js_advanced'+is_selected+'"><a href="'+[].concat(this[1])[index-1]+'&token=234222709&lang=zh_CN">'+this[0]+'<i class="icon18_adorn new"></i></a></li>'}],"merchant":['商户模块',[URL.businessVerify, URL.business]]};var html='';for(var i in navJson){if(navJson[i].nav_flag>0){var id=navJson[i].nav_id;if(navData[id]&&navData[id][2]&&typeof navData[id][2]=="function"){html += navData[id][2].call(navData[id], i, navJson[i].nav_flag, navJson[i].is_selected);}else if(navData[id]&&navData[id].length>0){html +='<li data-index="' + i + '" class="nav_item js_'+id+navJson[i].is_selected+'" ><a href="'+[].concat(navData[id][1])[navJson[i].nav_flag-1]+'&token=234222709&lang=zh_CN">'+navData[id][0]+'</a></li>';}            navJson[i].is_selected !="";}};    document.getElementById('navigatorBar').innerHTML = html;})();</script>
	</div>
	<div id="body" class="body ">
		<div class="container_box">
			<div class="container_hd">
				<!-- 页面标题 或者 面包屑 开始 -->
				<h2>用户管理</h2>
				<!-- 页面标题 或者 面包屑 结束 -->
			</div>
			<div class="container_bd">
				<div class="col_side l">
					<div class="catalogList" id="groupsList">
						<ul>
							<li id="groupAdd" class="group groupAdd"><a
								class="icon18C iconAdd" href="javascript:;">新建分组</a></li>
							<li id="friendSearch" class="selected  none"><span>搜索结果</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="col_main user friendPage meetingFriendPage">
					<div class="cLine sender_line">
						<div class="clr"></div>
					</div>
					<!--TODO这里还要加判断1=15-->
					<div class="cLine sender_line">
						<div class="left">
							批量分组
							<div id="allGroup" class="selectArea b-dib"></div>
							<a id="putIntoGroupAll" class="btnGrayS b-dib" data-gid="">放入</a>
							<div class="clr"></div>
						</div>
						<div class="right js_pageNavigator"></div>
						<div class="clr"></div>
					</div>
					<div class="listTitle">
						<div class="left title msg">
							<input type="checkbox" id="selectAll" />全选
						</div>
						<div class="right title opt"></div>
					</div>
					<div id="userGroups"></div>
					<div class="cLine sender_line">
						<div class="right js_pageNavigator"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="foot" id="footer">
		<ul class="links">
			<li class="links_item no_extra"><a
				href="http://www.tencent.com/zh-cn/index.shtml" target="_blank">关于腾讯</a></li>
			<li class="links_item"><a
				href="/cgi-bin/readtemplate?t=wxm-agreement&type=info&lang=zh_CN&token=234222709"
				target="_blank">服务协议</a></li>
			<li class="links_item"><a
				href="http://kf.qq.com/product/weixinmp.html" target="_blank">客服中心</a></li>
			<li class="links_item"><a href="mailto:weixinmp@qq.com"
				target="_blank">联系邮箱</a></li>
			<li class="links_item"><a
				href="/cgi-bin/readtemplate?t=tmpl/infringement&lang=zh_CN"
				target="_blank">侵权投诉</a></li>
		</ul>
		<p class="copyright">Copyright &copy; 2012-2013 Tencent. All
			Rights Reserved.</p>
	</div>
	<script type='text/javascript'>var MODULES = {'common/wx/Tips.js' : 'mpres/zh_CN/htmledition/js/common/wx/Tips17e4f5.js','common/wx/Cgi.js' : 'mpres/zh_CN/htmledition/js/common/wx/Cgi17e4f5.js','message/message_cgi.js' : 'mpres/zh_CN/htmledition/js/message/message_cgi17e4f5.js','xss/ui/pagination.css' : 'mpres/htmledition/style/xss/ui/pagination17e4f5.css','common/wx/menu.js' : 'mpres/zh_CN/htmledition/js/common/wx/menu17e4f5.js','common/qq/mask.js' : 'mpres/zh_CN/htmledition/js/common/qq/mask17e4f5.js','common/wx/pagebar.js' : 'mpres/zh_CN/htmledition/js/common/wx/pagebar17e4f5.js','message/renderList.js' : 'mpres/zh_CN/htmledition/js/message/renderList17e4f5.js','message/list.js' : 'mpres/zh_CN/htmledition/js/message/list17e4f5.js','common/qq/emoji.js' : 'mpres/zh_CN/htmledition/js/common/qq/emoji17e4f5.js','common/qq/Class.js' : 'mpres/zh_CN/htmledition/js/common/qq/Class17e4f5.js','common/wx/media/audio.js' : 'mpres/zh_CN/htmledition/js/common/wx/media/audio17e4f5.js','common/wx/media/video.js' : 'mpres/zh_CN/htmledition/js/common/wx/media/video17e4f5.js','common/wx/media/idCard.js' : 'mpres/zh_CN/htmledition/js/common/wx/media/idCard17e4f5.js','tpl/msgListItem.html.js' : 'mpres/zh_CN/htmledition/js/tpl/msgListItem.html17e4f5.js','common/wx/RichBuddy.js' : 'mpres/zh_CN/htmledition/js/common/wx/RichBuddy17e4f5.js','common/wx/remark.js' : 'mpres/zh_CN/htmledition/js/common/wx/remark17e4f5.js','common/wx/media/simpleAppmsg.js' : 'mpres/zh_CN/htmledition/js/common/wx/media/simpleAppmsg17e4f5.js','common/qq/events.js' : 'mpres/zh_CN/htmledition/js/common/qq/events17e4f5.js','tpl/simple_popup.html.js' : 'mpres/zh_CN/htmledition/js/tpl/simple_popup.html17e4f5.js','common/wx/richEditor/emotionEditor.js' : 'mpres/zh_CN/htmledition/js/common/wx/richEditor/emotionEditor17e4f5.js','common/wx/verifycode.js' : 'mpres/zh_CN/htmledition/js/common/wx/verifycode17e4f5.js','common/lib/highcharts.js' : 'mpres/zh_CN/htmledition/js/common/lib/highcharts17fb7c.js','tpl/notice/index.html.js' : 'mpres/zh_CN/htmledition/js/tpl/notice/index.html1892b4.js','common/wx/popup.js' : 'mpres/zh_CN/htmledition/js/common/wx/popup17e4f5.js','home/index.js' : 'mpres/zh_CN/htmledition/js/home/index17f64d.js','common/wx/dateSelect.js' : 'mpres/zh_CN/htmledition/js/common/wx/dateSelect17e4f5.js','common/lib/moment.js' : 'mpres/zh_CN/htmledition/js/common/lib/moment17e4f5.js','common/lib/underscore.js' : 'mpres/zh_CN/htmledition/js/common/lib/underscore17e4f5.js','business/overview.js' : 'mpres/zh_CN/htmledition/js/business/overview17e4f5.js','business/index.js' : 'mpres/zh_CN/htmledition/js/business/index17e4f5.js','business/info.js' : 'mpres/zh_CN/htmledition/js/business/info17e4f5.js','business/order.js' : 'mpres/zh_CN/htmledition/js/business/order17e4f5.js','business/rank.js' : 'mpres/zh_CN/htmledition/js/business/rank17e4f5.js','business/setting.js' : 'mpres/zh_CN/htmledition/js/business/setting17e4f5.js','business/course.js' : 'mpres/zh_CN/htmledition/js/business/course17e4f5.js','business/source.js' : 'mpres/zh_CN/htmledition/js/business/source17e4f5.js','common/lib/jquery.md5.js' : 'mpres/zh_CN/htmledition/js/common/lib/jquery.md517e4f5.js','common/wx/iframe.js' : 'mpres/zh_CN/htmledition/js/common/wx/iframe1853d6.js','business/pay-reg.js' : 'mpres/zh_CN/htmledition/js/business/pay-reg1853d6.js','common.css' : 'mpres/htmledition/style/common17e4f5.css','tpl/Dialog.html.js' : 'mpres/zh_CN/htmledition/js/tpl/Dialog.html.js','combo/index.js' : 'mpres/zh_CN/htmledition/js/combo/index17e4f5.js','util/storage.js' : 'mpres/zh_CN/htmledition/js/util/storage17e4f5.js','util/swfobject.js' : 'mpres/zh_CN/htmledition/js/util/swfobject17e4f5.js','util/str.js' : 'mpres/zh_CN/htmledition/js/util/str17e4f5.js','util/url.js' : 'mpres/zh_CN/htmledition/js/util/url17e4f5.js','common/wx/richEditor/msgSender.js' : 'mpres/zh_CN/htmledition/js/common/wx/richEditor/msgSender17e4f5.js','common/wx/noticeBox.js' : 'mpres/zh_CN/htmledition/js/common/wx/noticeBox17e4f5.js','common/wx/dropdown.js' : 'mpres/zh_CN/htmledition/js/common/wx/dropdown17e4f5.js','ui-test/index.js' : 'mpres/zh_CN/htmledition/js/ui-test/index17e4f5.js','tpl/media/simple_appmsg.html.js' : 'mpres/zh_CN/htmledition/js/tpl/media/simple_appmsg.html17e4f5.js','tpl/media/audio.html.js' : 'mpres/zh_CN/htmledition/js/tpl/media/audio.html17e4f5.js','tpl/media/id_card.html.js' : 'mpres/zh_CN/htmledition/js/tpl/media/id_card.html17e4f5.js','tpl/media/video.html.js' : 'mpres/zh_CN/htmledition/js/tpl/media/video.html17e4f5.js','tpl/richEditor/emotionEditor.html.js' : 'mpres/zh_CN/htmledition/js/tpl/richEditor/emotionEditor.html17e4f5.js','tpl/richEditor/emotion.html.js' : 'mpres/zh_CN/htmledition/js/tpl/richEditor/emotion.html17e4f5.js','tpl/setting/more_size.html.js' : 'mpres/zh_CN/htmledition/js/tpl/setting/more_size.html17e4f5.js','tpl/RichBuddy/RichBuddyContent.html.js' : 'mpres/zh_CN/htmledition/js/tpl/RichBuddy/RichBuddyContent.html17e4f5.js','tpl/RichBuddy/RichBuddyLayout.html.js' : 'mpres/zh_CN/htmledition/js/tpl/RichBuddy/RichBuddyLayout.html17e4f5.js','tpl/user/verifylist.html.js' : 'mpres/zh_CN/htmledition/js/tpl/user/verifylist.html17e4f5.js','tpl/user/grouplist.html.js' : 'mpres/zh_CN/htmledition/js/tpl/user/grouplist.html17e4f5.js','tpl/user/userlist.html.js' : 'mpres/zh_CN/htmledition/js/tpl/user/userlist.html17e4f5.js','tpl/dateSelect.html.js' : 'mpres/zh_CN/htmledition/js/tpl/dateSelect.html17e4f5.js','tpl/remark.html.js' : 'mpres/zh_CN/htmledition/js/tpl/remark.html17e4f5.js','tpl/noticeBox.html.js' : 'mpres/zh_CN/htmledition/js/tpl/noticeBox.html17e4f5.js','tpl/dropdown.html.js' : 'mpres/zh_CN/htmledition/js/tpl/dropdown.html17e4f5.js','tpl/verifycode.html.js' : 'mpres/zh_CN/htmledition/js/tpl/verifycode.html17e4f5.js','tpl/dialog.html.js' : 'mpres/zh_CN/htmledition/js/tpl/dialog.html17e4f5.js','tpl/pagebar.html.js' : 'mpres/zh_CN/htmledition/js/tpl/pagebar.html17e4f5.js','tpl/popup.html.js' : 'mpres/zh_CN/htmledition/js/tpl/popup.html17e4f5.js','tpl/menu.html.js' : 'mpres/zh_CN/htmledition/js/tpl/menu.html17e4f5.js','tpl/tab.html.js' : 'mpres/zh_CN/htmledition/js/tpl/tab.html17e4f5.js','setting/bind-account.js' : 'mpres/zh_CN/htmledition/js/setting/bind-account17e4f5.js','common/lib/jquery.Jcrop.js' : 'mpres/zh_CN/htmledition/js/common/lib/jquery.Jcrop17e4f5.js','common/wx/dialog.js' : 'mpres/zh_CN/htmledition/js/common/wx/dialog17e4f5.js','common/wx/region.js' : 'mpres/zh_CN/htmledition/js/common/wx/region17e4f5.js','setting/index.js' : 'mpres/zh_CN/htmledition/js/setting/index17e4f5.js','setting/location.js' : 'mpres/zh_CN/htmledition/js/setting/location17e4f5.js','setting/bind-email.js' : 'mpres/zh_CN/htmledition/js/setting/bind-email184967.js','setting/bind-email-status.js' : 'mpres/zh_CN/htmledition/js/setting/bind-email-status184967.js','setting/meeting-account.js' : 'mpres/zh_CN/htmledition/js/setting/meeting-account17e4f5.js','xss/ui/tab.css' : 'mpres/htmledition/style/xss/ui/tab17e4f5.css','common/qq/jquery.plugin/tab.js' : 'mpres/zh_CN/htmledition/js/common/qq/jquery.plugin/tab17e4f5.js','common/qq/Cookie.js' : 'mpres/zh_CN/htmledition/js/common/qq/Cookie17e4f5.js','common/qq/Url.js' : 'mpres/zh_CN/htmledition/js/common/qq/Url17e4f5.js','xss/ui/emoji.css' : 'mpres/htmledition/style/xss/ui/emoji17e4f5.css','common/lib/video.js' : 'mpres/zh_CN/htmledition/js/common/lib/video17e4f5.js','common/lib/json.js' : 'mpres/zh_CN/htmledition/js/common/lib/json17e4f5.js','xss/ui/datepicker.css' : 'mpres/htmledition/style/xss/ui/datepicker17e4f5.css','common/lib/datepicker.js' : 'mpres/zh_CN/htmledition/js/common/lib/datepicker17e4f5.js','common/lib/template.js' : 'mpres/zh_CN/htmledition/js/common/lib/template17e4f5.js','common/lib/jquery.js' : 'mpres/zh_CN/htmledition/js/common/lib/jquery17e4f5.js','common/lib/swfobject.js' : 'mpres/zh_CN/htmledition/js/common/lib/swfobject17e4f5.js','common/lib/MockJax.js' : 'mpres/zh_CN/htmledition/js/common/lib/MockJax17e4f5.js','common/lib/store.js' : 'mpres/zh_CN/htmledition/js/common/lib/store17e4f5.js','common/lib/audiojs.js' : 'mpres/zh_CN/htmledition/js/common/lib/audiojs17e4f5.js','common/lib/chart.js' : 'mpres/zh_CN/htmledition/js/common/lib/chart17e4f5.js','xss/ui/media.css' : 'mpres/htmledition/style/xss/ui/media17e4f5.css','common/wx/media/img.js' : 'mpres/zh_CN/htmledition/js/common/wx/media/img17e4f5.js','common/wx/richEditor/emotion.js' : 'mpres/zh_CN/htmledition/js/common/wx/richEditor/emotion17e4f5.js','xss/ui/emotion_editor.css' : 'mpres/htmledition/style/xss/ui/emotion_editor17e4f5.css','common/wx/richEditor/wysiwyg.js' : 'mpres/zh_CN/htmledition/js/common/wx/richEditor/wysiwyg17e4f5.js','common/wx/richEditor/editorRange.js' : 'mpres/zh_CN/htmledition/js/common/wx/richEditor/editorRange17e4f5.js','xss/ui/rich_buddy.css' : 'mpres/htmledition/style/xss/ui/rich_buddy17e4f5.css','user/user_cgi.js' : 'mpres/zh_CN/htmledition/js/user/user_cgi17e4f5.js','xss/ui/date_select.css' : 'mpres/htmledition/style/xss/ui/date_select17e4f5.css','xss/boxes/boxes_mp_notice.css' : 'mpres/htmledition/style/xss/boxes/boxes_mp_notice17e4f5.css','xss/ui/dropdown_menu.css' : 'mpres/htmledition/style/xss/ui/dropdown_menu17e4f5.css','xss/ui/verifycode.css' : 'mpres/htmledition/style/xss/ui/verifycode17e4f5.css','advanced/iframe-crossdomain.js' : 'mpres/zh_CN/htmledition/js/advanced/iframe-crossdomain17e4f5.js','advanced/verify.js' : 'mpres/zh_CN/htmledition/js/advanced/verify17e4f5.js','advanced/edit.js' : 'mpres/zh_CN/htmledition/js/advanced/edit17e4f5.js','advanced/index.js' : 'mpres/zh_CN/htmledition/js/advanced/index17e4f5.js','advanced/menuApply.js' : 'mpres/zh_CN/htmledition/js/advanced/menuApply17e4f5.js','advanced/dev.js' : 'mpres/zh_CN/htmledition/js/advanced/dev17e4f5.js','advanced/interface.js' : 'mpres/zh_CN/htmledition/js/advanced/interface181b8c.js','ui/charts.js' : 'mpres/zh_CN/htmledition/js/ui/charts17e4f5.js','ui/friendGroup.js' : 'mpres/zh_CN/htmledition/js/ui/friendGroup17e4f5.js','ui/dialog.js' : 'mpres/zh_CN/htmledition/js/ui/dialog17e4f5.js','ui/tools.js' : 'mpres/zh_CN/htmledition/js/ui/tools17e4f5.js','ui/message.js' : 'mpres/zh_CN/htmledition/js/ui/message17e4f5.js','ui/friend.js' : 'mpres/zh_CN/htmledition/js/ui/friend17e4f5.js','ui/buddy.js' : 'mpres/zh_CN/htmledition/js/ui/buddy17e4f5.js','ui/media.js' : 'mpres/zh_CN/htmledition/js/ui/media17e4f5.js','user/group_cgi.js' : 'mpres/zh_CN/htmledition/js/user/group_cgi17e4f5.js','user/index.js' : 'mpres/zh_CN/htmledition/js/user/index17e4f5.js','frame/news.js' : 'mpres/zh_CN/htmledition/js/frame/news17e4f5.js','jquery-1.8.3.min.js' : 'mpres/zh_CN/htmledition/js/jquery-1.8.3.min17e4f4.js','jquery-1.7.2.min.js.php.js' : 'mpres/zh_CN/htmledition/js/jquery-1.7.2.min.js.php.js'};</script>
	<script type="text/javascript"
		src="https://res.wx.qq.com/mpres/zh_CN/htmledition/js/sea17e4f5.js"></script>
	<script type="text/javascript"
		src="https://res.wx.qq.com/mpres/zh_CN/htmledition/js/common/lib17e4f5.js"></script>
	<script type="text/javascript">    document.domain = "qq.com";    window.wx ={        version:"1.0.0",        data:{            t:"234222709",            lang:'zh_CN',            param:["&token=234222709",'&lang=zh_CN'].join(""),            uin:"3077066919",            time:"1382512211"||new Date().getTime()/1000        },        path:{            video : "https://res.wx.qq.com/mpres/zh_CN/htmledition/plprecorder/video-js.swf",                audio : "https://res.wx.qq.com/mpres/zh_CN/htmledition/plprecorder/audiojs.swf",            rimgcrop : "https://res.wx.qq.com/mpres/htmledition/images/cut-round.gif"        },        events:{}    };</script>
	<script type="text/javascript"
		src="https://res.wx.qq.com/mpres/zh_CN/htmledition/js/common/wx17e4f5.js"></script>
	<script type="text/javascript">
	cgiData={pageIdx : 0,pageCount : 1,pageSize : 10,groupsList : ({"groups":[{"id":0,"name":"未分组","cnt":2},{"id":1,"name":"黑名单","cnt":0},{"id":2,"name":"星标组","cnt":0}]}).groups,        friendsList : ({"contacts":[{"id":2990906200,"nick_name":"kaka","remark_name":"","group_id":0},{"id":2186257602,"nick_name":"时光机","remark_name":"","group_id":0}]}).contacts,            currentGroupId : "0"*1,        type : "0"*1,    userRole : '1' * 1,    verifyMsgCount : '' * 1};seajs.use("user/index");</script>
	<script>            function getico(i){                var _img = new Image(1, 1);                _img.src = wx.url(location.protocol + "//" + location.host + "/cgi-bin/getico" + "?location=" + (i||-1) + "&rand=" + Math.random());            };            getico('0');        </script>
</body>
</html>