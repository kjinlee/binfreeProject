package com.binfree.web.main.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Scanner;

import org.json.simple.JSONObject;

public class URLConn {
	URLConnection conn;
	
	
	public URLConn(String urlpath, int port) {
		try {
			URL url = new URL(urlpath+":"+port);
			conn = url.openConnection();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public void urlPost(JSONObject jsonObject) {
		conn.setDoOutput(true);
		conn.setUseCaches(false);
		conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
		
		try {
			OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
			wr.write(jsonObject.toString());
			wr.flush();
			
			InputStream is = conn.getInputStream();
			Scanner sc = new Scanner(is);
			int line = 1;
			while(sc.hasNext()) {
				// 노드에서 보낸 결과값
				String str = sc.nextLine();
				System.out.println((line++) + ":" + str +" node에서 온 결과");
				
			}
			sc.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

}
