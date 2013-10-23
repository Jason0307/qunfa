package com.qunfa.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.protocol.Protocol;
import org.codehaus.jackson.map.ObjectMapper;

import com.qunfa.model.User;
import com.qunfa.model.UserType;
import com.qunfa.model.WxUser;

public class WxService {

	public String token;
	public String slave_user;
	public String slave_sid;
	public String sig;

	public byte[] getVerifycode(String username, HttpServletRequest request) {
		try {
			String url = "https://mp.weixin.qq.com/cgi-bin/verifycode?username="
					+ username + "&r=" + System.currentTimeMillis();
			HttpClient client = new HttpClient();
			Protocol myhttps = new Protocol("https",
					new MySSLProtocolSocketFactory(), 443);
			Protocol.registerProtocol("https", myhttps);
			GetMethod getMethod = new GetMethod(url);
			client.executeMethod(getMethod);
			Cookie[] cookies = client.getState().getCookies();
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("sig")) {
					sig = cookies[i].getValue();
					request.getSession().setAttribute("sig", sig);
				}
			}
			return getMethod.getResponseBody();
		} catch (Exception e) {
			return null;
		}
	}

	public String md5(String pwd) throws Exception {
		ScriptEngineManager m = new ScriptEngineManager();
		ScriptEngine engine = m.getEngineByName("javascript");
		InputStreamReader in = new InputStreamReader(new WxService().getClass()
				.getResourceAsStream("/com/qunfa/common/txmd5.js"));
		BufferedReader read = new BufferedReader(in);
		engine.eval(read);
		Invocable invocableEngine = (Invocable) engine;
		return invocableEngine.invokeFunction("md5", pwd).toString();
	}

	public boolean login(String username, String pwd, String yzm,
			HttpServletRequest request) {
		try {
			 HttpSession session = request.getSession();
			String url = "https://mp.weixin.qq.com/cgi-bin/login?lang=zh_CN&f=json&imgcode="
					+ yzm + "&pwd=" + md5(pwd) + "&username=" + username;
			HttpClient client = new HttpClient();
			Protocol myhttps = new Protocol("https",
					new MySSLProtocolSocketFactory(), 443);
			Protocol.registerProtocol("https", myhttps);
			PostMethod getMethod = new PostMethod(url);
			/*
			 * if (!yzm.equals("")) { getMethod.setRequestHeader("Cookie",
			 * "sig=" + session.getAttribute("sig")); }
			 */
			getMethod.setRequestHeader("Referer", "https://mp.weixin.qq.com/");
			getMethod.setRequestHeader("Host", "mp.weixin.qq.com");
			client.executeMethod(getMethod);
			Cookie[] cookies = client.getState().getCookies();
			String returnStr = getMethod.getResponseBodyAsString();
			token = returnStr.split("token=")[1].split("\"")[0];
			System.out.println("Token :" + token);
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("slave_user")) {
					slave_user = cookies[i].getValue();
					System.out.println("slave_user : " + slave_user);
				} else if (cookies[i].getName().equals("slave_sid")) {
					slave_sid = cookies[i].getValue();
					System.out.println("slave_sid : " + slave_sid);
				}
			}
			 session.setAttribute("token", token);
			 session.setAttribute("slave_user", slave_user);
			 session.setAttribute("slave_sid", slave_sid);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public ArrayList<UserType> getUserTypeList(HttpServletRequest request) {
		ArrayList<UserType> userTypeList = new ArrayList<UserType>();
		try {
			HttpSession session = request.getSession();
			token = session.getAttribute("token").toString();
			slave_user = session.getAttribute("slave_user").toString();
			slave_sid = session.getAttribute("slave_sid").toString();
			String url = "https://mp.weixin.qq.com/cgi-bin/contactmanagepage?t=wxm-friend&token="
					+ token
					+ "&lang=zh_CN&pagesize=20&pageidx=0&type=0&groupid=0";
			HttpClient client = new HttpClient();
			Protocol myhttps = new Protocol("https",
					new MySSLProtocolSocketFactory(), 443);
			Protocol.registerProtocol("https", myhttps);
			GetMethod getMethod = new GetMethod(url);
			getMethod.setRequestHeader("Cookie", "slave_user=" + slave_user
					+ ";slave_sid=" + slave_sid);
			client.executeMethod(getMethod);
			String returnStr = getMethod.getResponseBodyAsString();
			String fzxx = "{\"message\":"
					+ returnStr.split("DATA.groupList =")[1].split("];")[0]
					+ "]}";
			System.out.println(getJson(fzxx));
			JSONObject jsonob = JSONObject.fromObject(getJson(fzxx).replaceAll(
					",,", ","));
			JSONArray jsons = jsonob.getJSONArray("message");
			JSONObject tempJson;
			UserType userType = null;
			for (int i = 0; i < jsons.size(); i++) {
				userType = new UserType();
				tempJson = JSONObject.fromObject(jsons.get(i));
				userType.setId(tempJson.get("id").toString());
				userType.setName(tempJson.get("name").toString());
				userType.setNum(Integer.parseInt(tempJson.get("num").toString()
						.split("'")[0]));
				userTypeList.add(userType);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("userTypeList", userTypeList);
		return userTypeList;
	}

	// 解析成json格式
	private static String getJson(String json) {
		return Pattern.compile("defaultGroupName\\[\\d+]\\s+\\|*")
				.matcher(json).replaceAll("").replaceAll("\\*1", "");
	}

	public boolean getFanList(HttpServletRequest request) {
		ArrayList<WxUser> userList = new ArrayList<WxUser>();
		try {
			int PageIdx = 1; // 当前页码
			/*
			 * String pgn = request.getParameter("pgn");
			 * if(pgn!=null&&!"".equals(pgn)){ PageIdx = Integer.parseInt(pgn);
			 * }
			 */
			Page page = new Page();
			token = "234222709";
			// HttpSession session = request.getSession();
			// token = session.getAttribute("token").toString();
			// slave_user = session.getAttribute("slave_user").toString();
			// slave_sid = session.getAttribute("slave_sid").toString();
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
			String result = "";
			List<User> users = new ArrayList<User>();
			while (matcher.find()) {
				System.out.println("Matcher : "+matcher);
				String usersStr = matcher.group(1)+ "]";
				ObjectMapper objectMapper = new ObjectMapper();
				users = objectMapper.readValue(usersStr, List.class);
				System.out.println(users);
			}
			 request.setAttribute("userList",users);
			// request.setAttribute("page",page);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public void getMessages() throws Exception{
		String url = "https://mp.weixin.qq.com/cgi-bin/message?t=message/list&count=20&day=7&token=234222709&lang=zh_CN";
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
		System.out.println(returnStr);
		
	}
	public boolean sendMessageById(String str, String wxId,
			HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			token = session.getAttribute("token").toString();
			slave_user = session.getAttribute("slave_user").toString();
			slave_sid = session.getAttribute("slave_sid").toString();
			String url = "http://mp.weixin.qq.com/cgi-bin/singlesend?t=ajax-response&lang=zh_CN&ajax=1&content="
					+ URLEncoder.encode(str, "UTF-8")
					+ "&error=false&tofakeid="
					+ wxId
					+ "&type=1&token="
					+ token;
			HttpClient client = new HttpClient();
			PostMethod getMethod = new PostMethod(url);
			getMethod.setRequestHeader("Cookie", "slave_user=" + slave_user
					+ ";slave_sid=" + slave_sid);
			getMethod
					.setRequestHeader(
							"Referer",
							"http://mp.weixin.qq.com/cgi-bin/singlemsgpage?fromfakeid="
									+ wxId
									+ "&msgid=&source=&count=20&t=wxm-singlechat&lang=zh_CN");
			client.executeMethod(getMethod);
			String returnStr = getMethod.getResponseBodyAsString();
			System.out.println(returnStr);
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static void main(String[] args) throws Exception {
		// new WxService().login("baogee@vip.qq.com", "1990@228@zhubao", "",
		// null);
		//new WxService().getFanList(null);
		new WxService().getMessages();
	}
}
