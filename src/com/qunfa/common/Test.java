package com.qunfa.common;

import java.io.InputStream;
import java.net.URL;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;

public class Test {

	public static void main(String[] args) throws Exception {
		
		 URL newsurl = new URL("http://news.baidu.com/ns?word=title%3A%B2%FA%BF%C6%CA%C2%B9%CA&tn=newsrss&sr=0&cl=2&rn=20&ct=0");  
         System.out.println("Work 1");
		    InputStream news=newsurl.openStream();  
		    System.out.println("Work 2");
         SAXReader newsReader = new SAXReader();  
         Document newsdocument = null;
			try {
				newsdocument = newsReader.read(news);
				   System.out.println("Work 3");
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
			   System.out.println("Work 4" + newsdocument.getText());
			  String  content = newsdocument.selectSingleNode("/rss/channel/item[3]/description").getStringValue();
               System.out.println("Work 5"+content);
               
	}
}
