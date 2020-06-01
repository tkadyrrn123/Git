package com.kh.www.Apart.model.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

/*import org.json.simple.JSONArray;
import org.json.simple.JSONObject;*/
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.Apart.model.dao.ApartDAO;
import com.kh.www.Apart.model.vo.Apart;

import org.json.JSONArray;
import org.json.JSONObject;

@Service
public class ApartServiceImpl implements ApartService{
	
	@Autowired
	private ApartDAO aptDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int aptInsert(Apart apt) {
		return aptDAO.aptInsert(sqlSession, apt);
	}

	@Override
	public ArrayList<Apart> searchApt(String text) {
		return aptDAO.searchApt(sqlSession, text);
	}

	@Override
	public String donglist(String name) {
		return aptDAO.donglist(sqlSession, name);
	}

	@Override
	public int aptDupName(String name) {
		return aptDAO.aptDupName(sqlSession, name);
	}
	
	
	
	
//	카카오 지도 
	@Override
	public String address(String loc) {
		String [] ar = loc.split("-");
		String addr = 
			"https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?";
		addr = addr + "x=" + ar[1] + "&y=" + ar[0];
		
		try {
			//위의 주소를 가지고 URL 객체를 생성
			URL url = new URL(addr);
			//URL객체를 가지고 HttpURLConnection 객체 만들기
			HttpURLConnection con = (
				HttpURLConnection)url.openConnection();
			//인증받기
			con.setRequestProperty("Authorization", "KakaoAK b84e06d19b1a33aab7847008f9f1ccbe");
			//옵션을 설정
			con.setConnectTimeout(20000);
			con.setUseCaches(false);
			//줄 단위 데이터 읽기
			BufferedReader br = 
				new BufferedReader(
					new InputStreamReader(
						con.getInputStream()));
			//문자열을 임시로 저장할 객체 만들기
			StringBuilder sb = new StringBuilder();
			while(true) {
				//한 줄의 데이터 읽기
				String line = br.readLine();
				//읽은 데이터가 없으면 반복문 종료
				if(line == null) {
					break;
				}
				//읽은 데이터가 있으면 sb에 추가
				sb.append(line);
			}
			//연결 해제
			br.close();
			con.disconnect();
			//데이터 출력
			//System.out.println(sb);
			//JSONObject를 생성
			JSONObject obj = new JSONObject(sb.toString());
			//System.out.println(obj);
			JSONArray imsi = obj.getJSONArray("documents");
			//System.out.println(imsi);
			JSONObject o = imsi.getJSONObject(0);
			String address = o.getString("address_name");
			System.out.println(address);
			return address;
			
			
		}catch(Exception e) {
			System.out.println("주소 가져오기 실패:" + e.getMessage());
		}
		return null;
		
	}
	
}
