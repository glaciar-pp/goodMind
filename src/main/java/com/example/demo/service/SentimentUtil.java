package com.example.demo.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class SentimentUtil {
	@Value("${naver.sentiment.accessId}") private String accessId;
	@Value("${naver.sentiment.secretKey}") private String secretKey;
	@Value("${spring.servlet.multipart.location}") private String uploadDir;
	
	public String getSentimentResult(String content) throws Exception {
        String apiURL = "https://naveropenapi.apigw.ntruss.com/sentiment-analysis/v1/analyze";
        URL url = new URL(apiURL);
        HttpURLConnection conn = (HttpURLConnection)url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", accessId);
        conn.setRequestProperty("X-NCP-APIGW-API-KEY", secretKey);
        conn.setRequestProperty("Content-Type", "application/json");
	
        		
        // post request
        conn.setDoOutput(true);
        // JSON 형식으로 전송
        String postParams = "{\"content\": \"" + content + "\"}";
        OutputStream os = conn.getOutputStream();
        byte[] buffer = postParams.getBytes();
        os.write(buffer);
        os.flush(); os.close();
	
        int responseCode = conn.getResponseCode();
        BufferedReader br;
        if(responseCode==200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {  // 오류 발생
            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        String inputLine;
        StringBuffer sb = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            sb.append(inputLine);
        }
        br.close();
        if (responseCode!=200)
        	return sb.toString();
    	
    	JSONParser parser = new JSONParser();
		JSONObject object = (JSONObject) parser.parse(sb.toString());
		JSONObject document = (JSONObject) object.get("document");
		String sentiment = (String) document.get("sentiment");
		JSONObject confidence = (JSONObject) document.get("confidence");
		double proba = (Double) confidence.get(sentiment);
		sentiment += String.format(" (%.2f%%)", proba);
		
		return sentiment;
	}
// 이파일은 삭제하면 안됩니다. 
}
