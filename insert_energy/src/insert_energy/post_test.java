package insert_energy;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.json.JSONArray;
import org.json.JSONObject;

public class post_test {
	public static void main(String[] args) {
        // JDBC 연결 정보
        String jdbcUrl = "jdbc:postgresql://localhost:5432/kwater";
        String username = "postgres";
        String password = "0917";
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return;
        }
        // JDBC 연결
//        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {
//            System.out.println("Connected to PostgreSQL database!");
//            
//            // 여기에 데이터베이스 작업을 수행하는 코드 추가
//        } catch (SQLException e) {
//            System.err.println("Error connecting to PostgreSQL database");
//            e.printStackTrace();
//        }
        try {
			String filePath= "C:\\Users\\yuyun\\houses.json";
			String content = new String(Files.readAllBytes(Paths.get(filePath)));
            // JSON 문자열 생성 (예시)

            // JSON 문자열을 파싱하여 최상위 JSONObject 생성
            JSONObject topLevelJsonObject = new JSONObject(content);

            // "houses" 키의 값인 JSONObject를 가져옴
            JSONObject housesJsonObject = topLevelJsonObject.getJSONObject("houses");

            JSONArray houseKeys = housesJsonObject.names();
            for (int i = 0; i < houseKeys.length(); i++) {
                String houseKey = houseKeys.getString(i);
                JSONObject houseObject = housesJsonObject.getJSONObject(houseKey);
                
                // "gwid" 키의 값 추출
                int cur_gwid = houseObject.getInt("gwid");
                // "url" 키의 값 추출
                String cur_url = houseObject.getString("net");
                try {
                    // API 엔드포인트 URL 및 파라미터 설정
                    String apiUrl = "http://147.47.122.13:5577/api/v1/history/energy/table";
                    String bearerToken="eyJyZWdEYXRlIjoxNzA0ODQ0MzI4NDQzLCJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlzcyI6ImVicmFpbiIsImlhdCI6MTcwNDg0NDMyOCwiYXV0aCI6IlNVUEVSIiwiZXhwIjoxNzA1NzA4MzI4fQ.K4tMUEGJyR3uVy9yp78GjjbM1WC8YNE3pnPoRpjTb2mSebnQo9NW6jSiTmDB6S76xJ97NvDgexNBwWN78-Bdqw";
                    int parameter1 = cur_gwid;
                    String parameter2 = cur_url;
                    String parameter3 = "2022-01-01T00:00";
                    String parameter4 = "2022-12-31T00:00";
                    String parameter5 = "month";
                    // URL 및 파라미터 조합
                    String fullUrl = apiUrl + "?gwid=" + parameter1 + "&url=" + parameter2 + "&starttime=" + parameter3 + "&endtime=" + parameter4+ "&group=" + parameter5;
                    System.out.println(fullUrl);
                    // URL 객체 생성
                    URL url = new URL(fullUrl);

                    // HttpURLConnection 객체 생성
                    HttpURLConnection connection = (HttpURLConnection) url.openConnection();

                    // Authorization 헤더 추가
                    connection.setRequestProperty("Authorization", "Bearer "+bearerToken);

                    // 요청 메서드 설정 (GET, POST 등)
                    connection.setRequestMethod("GET");

                    // 응답 코드 확인
                    int responseCode = connection.getResponseCode();
                    System.out.println("Response Code: " + responseCode);
                    
                    // 응답 데이터 읽기
                    BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                    StringBuilder response = new StringBuilder();
                    String line;
                    
                    while ((line = reader.readLine()) != null) {
                        response.append(line);
//                        System.out.println(reader.readLine());
                    }
                    JSONArray jsonArray = new JSONArray(response.toString());
//                    System.out.println(jsonArray.length());
                    System.out.println(houseKey);
                    String Query="INSERT INTO household_energy_msrmt_system1_copy VALUES";
                    
                    
                    String ttime="";
                    Double heatVolume=0.0;
                    Double waterVolume=0.0;
                    
                    
                    Double coolEnergy=0.0;
                    Double energyExport=0.0;
                    Double heatEnergy=0.0;
                    Double hotWaterVolume=0.0;
                    Double energy=0.0;
                    
                    for(int j=0;j<jsonArray.length();++j) {
                    	JSONObject jsonObject = jsonArray.getJSONObject(j);
//                    	System.out.println("JSON" + jsonObject.toString());
                    	Query="INSERT INTO household_energy_msrmt_system1_copy VALUES";
                    	ttime="0";
                    	heatVolume=0.0;
                    	waterVolume=0.0;
                    	
                    	coolEnergy=0.0;
                    	energyExport=0.0;
                    	heatEnergy=0.0;
                    	hotWaterVolume=0.0;
                    	energy=0.0;
                    	
                    	if(jsonObject.has("ttime")) {
                    		ttime=jsonObject.get("ttime").toString();
//                    		System.out.println(jsonObject.get("ttime"));
                    	}
//                    	System.out.println(ttime);
                    	if(jsonObject.has("heatVolume")) {
                    		heatVolume=Double.parseDouble(jsonObject.get("heatVolume").toString());
//                    		System.out.println(jsonObject.get("heatVolume"));
                    	}
                    	if(jsonObject.has("waterVolume")) {
                    		waterVolume=Double.parseDouble(jsonObject.get("waterVolume").toString());
//                    		System.out.println(jsonObject.get("waterVolume"));
                    	}
                    	
                    	if(jsonObject.has("coolEnergy")) {
                    		coolEnergy=Double.parseDouble(jsonObject.get("coolEnergy").toString());
//                    		System.out.println(jsonObject.get("coolEnergy"));
                    	}
                    	if(jsonObject.has("energyExport")) {
                    		energyExport=Double.parseDouble(jsonObject.get("energyExport").toString());
//                    		System.out.println(jsonObject.get("energyExport"));
                    	}
                    	if(jsonObject.has("heatEnergy")) {
                    		heatEnergy=Double.parseDouble(jsonObject.get("heatEnergy").toString());
//                    		System.out.println(jsonObject.get("heatEnergy"));
                    	}
                    	if(jsonObject.has("heatVolume")) {
                    		hotWaterVolume=Double.parseDouble(jsonObject.get("heatVolume").toString());
//                    		System.out.println(jsonObject.get("hotWaterVolume"));
                    	}
                    	if(jsonObject.has("energy")) {
                    		energy=Double.parseDouble(jsonObject.get("energy").toString());
//                    		System.out.println(jsonObject.get("energy"));
                    	}
                    	int cnt=1;
                    	try (Connection dbconnection = DriverManager.getConnection(jdbcUrl, username, password)) {
                            // 예시 테이블 이름에 맞게 수정하세요
                            String sql = "INSERT INTO household_energy_msrmt_system1_copy " +
                                    "(reg_date, water_usage_month, " +
                                    "cooling_usage_month, power_transmission_month, heating_usage_month, hotwater_usage_month, power_receive_month, dongho) " +
                                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                            try (PreparedStatement preparedStatement = dbconnection.prepareStatement(sql)) {
                                // 값 설정 (예시: null인 경우)
                                preparedStatement.setString(cnt++, ttime);
                                
                                preparedStatement.setDouble(cnt++, waterVolume);
                            
                                
                                preparedStatement.setDouble(cnt++, coolEnergy);
                                preparedStatement.setDouble(cnt++, energyExport);
                                preparedStatement.setDouble(cnt++, heatEnergy);
                                preparedStatement.setDouble(cnt++, hotWaterVolume);
                                preparedStatement.setDouble(cnt++, energy);
                                preparedStatement.setString(cnt++, houseKey);

                                // 쿼리 실행
                                preparedStatement.executeUpdate();
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    	
                    	
                    	
                    	
                    }
                    
                    
//                    System.out.println(Val);
                    connection.disconnect();
                } catch (Exception e) {
                    e.printStackTrace();
                }
              
            }
            
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("데이터 삽입 완료");
    }
}
