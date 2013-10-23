package com.qunfa.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.protocol.Protocol;
import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.qunfa.model.Message;
import com.qunfa.model.User;

public class FuckWeixin {

	private String loginUrl = "https://mp.weixin.qq.com/cgi-bin/login?lang=zh_CN";

	private String sendUrl = "https://mp.weixin.qq.com/cgi-bin/singlesend?t=ajax-response&lang=zh_CN";

	private String account = "baogee@vip.qq.com";// 公众平台用户

	private String password = "1990@228@zhubao"; // 公众平台密码

	private boolean isLogin = false;

	private String cookiestr;

	private String token = null;

	
	private HttpClient httpClient = new HttpClient();

	public String getLoginUrl() {
		return loginUrl;
	}

	public void setLoginUrl(String loginUrl) {
		this.loginUrl = loginUrl;
	}

	public String getSendUrl() {
		return sendUrl;
	}

	public void setSendUrl(String sendUrl) {
		this.sendUrl = sendUrl;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void login() {
		PostMethod post = new PostMethod(loginUrl);
		post.addParameter(new NameValuePair("username", account));
		post.addParameter(new NameValuePair("pwd", DigestUtils.md5Hex(password)));
		post.addParameter(new NameValuePair("imgcode", ""));
		post.addParameter(new NameValuePair("f", "json"));
		// 针对最新的改版
		post.setRequestHeader("Host", "mp.weixin.qq.com");
		post.setRequestHeader("Referer", "https://mp.weixin.qq.com/");
		// 结束
		try {
			int code = httpClient.executeMethod(post);
			if (HttpStatus.SC_OK == code) {
				String res = post.getResponseBodyAsString();
				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(res);
				// Long verifyCode = (Long) obj.get("ShowVerifyCode");
				String msg = (String) obj.get("ErrMsg");
				Long errCode = (Long) obj.get("ErrCode");
				// Long ret = (Long) obj.get("Ret");
				if (0 == errCode) {
					isLogin = true;
					token = StringUtils.substringAfter(msg, "token=");
					if (null == token) {
						token = StringUtils
								.substringBetween(msg, "token=", "&");
					}
					StringBuffer cookie = new StringBuffer();
					for (Cookie c : httpClient.getState().getCookies()) {
						cookie.append(c.getName()).append("=")
								.append(c.getValue()).append(";");
					}
					this.cookiestr = cookie.toString();
				}
			}
		} catch (Exception e) {
		}
	}

	public boolean sendMessage(String fakeid, String content) {
		if (isLogin) {
			PostMethod post = new PostMethod(sendUrl);
			post.setRequestHeader("Cookie", this.cookiestr);
			post.setRequestHeader("Host", "mp.weixin.qq.com");
			post.setRequestHeader(
					"Referer",
					"https://mp.weixin.qq.com/cgi-bin/singlemsgpage?token="
							+ token
							+ "&fromfakeid="
							+ fakeid
							+ "&msgid=&source=&count=20&t=wxm-singlechat&lang=zh_CN");
			post.setRequestHeader("Content-Type", "text/html;charset=UTF-8");
			post.addParameter(new NameValuePair("type", "1"));
			post.addParameter(new NameValuePair("content", content));
			post.addParameter(new NameValuePair("error", "false"));
			post.addParameter(new NameValuePair("imgcode", ""));
			post.addParameter(new NameValuePair("tofakeid", fakeid));
			post.addParameter(new NameValuePair("token", token));
			post.addParameter(new NameValuePair("ajax", "1"));
			try {
				int code = httpClient.executeMethod(post);
				if (HttpStatus.SC_OK == code) {
					System.out.println(post.getResponseBodyAsString());
				}
			} catch (Exception e) {
			}
		} else {
			login();
			sendMessage(fakeid, content);
		}
		return false;
	}

	public String getFakeid(String openid)throws Exception {
		if (isLogin) {
			String url = "https://mp.weixin.qq.com/cgi-bin/contactmanage?t=user/index&token="
					+ token
					+ "&lang=zh_CN&pagesize=10&pageidx="
					+ 0
					+ "&type=0&groupid=0";
			HttpClient client = new HttpClient();
			Protocol myhttps = new Protocol("https",
					new MySSLProtocolSocketFactory(), 443);
			Protocol.registerProtocol("https", myhttps);
			GetMethod getMethod = new GetMethod(url);
			getMethod
					.setRequestHeader(
							"Cookie",
							"slave_user="
									+ "gh_f7f3755f6c19"
									+ ";slave_sid="
									+ "RENkMFZVektyVkFyVTNWRjhLVHVHSkRoZFVLZklsU2pWNGpQV1J5bUw3T0U4R2dncThJM1BsazJlMWhWbjZkaGF3NDZrQ3M0SWRHT1VWMmgyS2tRNENRaEQ0Yllhb2RpU2hvY1JQZ3dfVmtSUG03UGZXUHkwbnhocDFCb3QrZFc=");
			client.executeMethod(getMethod);
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					getMethod.getResponseBodyAsStream()));
			StringBuffer stringBuffer = new StringBuffer();
			String str = "";
			while ((str = reader.readLine()) != null) {
				stringBuffer.append(str);
			}
			String returnStr = stringBuffer.toString();

			String patternStr = "\"contacts\":(.+?)]";
			java.util.regex.Pattern pattern = Pattern.compile(patternStr);
			Matcher matcher = pattern.matcher(returnStr);
			User[] users = new User[]{};
			while (matcher.find()) {
				System.out.println("Matcher : "+matcher);
				String usersStr = matcher.group(1)+ "]";
				ObjectMapper objectMapper = new ObjectMapper();
				users = objectMapper.readValue(usersStr, User[].class);
				System.out.println(users.getClass());
			}
			
			for(User user : users){
				String fakeid = user.getId()+"";
				if (compareFakeid(fakeid, openid)) {
					return fakeid;
				}
			}
		} else {
			login();
			return getFakeid(openid);
		}
		return null;
	}

	private boolean compareFakeid(String fakeid, String openid) {
		PostMethod post = new PostMethod(
				"https://mp.weixin.qq.com/cgi-bin/singlemsgpage?token=" + token
						+ "&fromfakeid=" + fakeid
						+ "&msgid=&source=&count=5&t=wxm-singlechat&lang=zh_CN");
		post.setRequestHeader("Cookie", this.cookiestr);
		post.setRequestHeader("Host", "mp.weixin.qq.com");
		post.setRequestHeader("Referer",
				"https://mp.weixin.qq.com/cgi-bin/contactmanage?t=user/index&token="
						+ token + "&lang=zh_CN&pagesize=10&pageidx=0&type=0");
		post.setRequestHeader("Content-Type", "text/html;charset=UTF-8");
		post.addParameter(new NameValuePair("token", token));
		post.addParameter(new NameValuePair("ajax", "1"));
		try {
			int code = httpClient.executeMethod(post);
			if (HttpStatus.SC_OK == code) {
				String str = post.getResponseBodyAsString();
				String patternStr = "\"msg_item\":(.+?)]";
				java.util.regex.Pattern pattern = Pattern.compile(patternStr);
				Matcher matcher = pattern.matcher(str);
				List<Message> messages = new ArrayList<Message>();
				while (matcher.find()) {
					System.out.println("Matcher : "+matcher);
					String usersStr = matcher.group(1)+ "]";
					ObjectMapper objectMapper = new ObjectMapper();
					messages = objectMapper.readValue(usersStr, List.class);
					System.out.println(messages);
				}
				
				for(Message message : messages){
					String content = message.getContent();
					if (compareFakeid(fakeid, openid)) {
						if (content.contains(openid)) {
							return true;
						}
					}
				}
			}
		} catch (Exception e) {
		}
		return false;
	}

	public static void main(String[] args) throws Exception{
		FuckWeixin util = new FuckWeixin();
		util.login();
		System.out.println(util.getFakeid("2186257602"));
		util.sendMessage("2186257602", "测试微信消息");
	}
}