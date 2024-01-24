package insert_energy;
import org.json.JSONObject;
import java.nio.file.Files;
import java.nio.file.Paths;
import org.json.JSONArray;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class energy_house {
	private static final String jdbcUrl = "jdbc:mysql://localhost:3306/kwater?characterEncoding=UTF-8";
	private static final String username = "root";
	private static final String password = "0917";
	public static void main(String[] args) {
		try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return;
        }
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
                    String parameter3 = "2024-01-01T00:00";
                    String parameter4 = "2024-01-12T00:00";
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
                    String heatVolume="";
                    String waterVolume="";
                    String gasVolume="";
                    String coolVolume="";
                    String coolEnergy="";
                    String energyExport="";
                    String heatEnergy="";
                    String hotWaterVolume="";
                    String energy="";
                    
                    for(int j=0;j<jsonArray.length();++j) {
                    	JSONObject jsonObject = jsonArray.getJSONObject(j);
//                    	System.out.println("JSON" + jsonObject.toString());
                    	Query="INSERT INTO household_energy_msrmt_system1_copy VALUES";
                    	ttime="0";
                    	heatVolume="0";
                    	waterVolume="0";
                    	gasVolume="0";
                    	coolVolume="0";
                    	coolEnergy="0";
                    	energyExport="0";
                    	heatEnergy="0";
                    	hotWaterVolume="0";
                    	energy="0";
                    	
                    	if(jsonObject.has("ttime")) {
                    		ttime=jsonObject.get("ttime").toString();
//                    		System.out.println(jsonObject.get("ttime"));
                    	}
                    	System.out.println(ttime);
                    	if(jsonObject.has("heatVolume")) {
                    		heatVolume=jsonObject.get("heatVolume").toString();
//                    		System.out.println(jsonObject.get("heatVolume"));
                    	}
                    	if(jsonObject.has("waterVolume")) {
                    		waterVolume=jsonObject.get("waterVolume").toString();
//                    		System.out.println(jsonObject.get("waterVolume"));
                    	}
                    	if(jsonObject.has("gasVolume")) {
                    		gasVolume=jsonObject.get("gasVolume").toString();
//                    		System.out.println(jsonObject.get("gasVolume"));
                    	}
                    	if(jsonObject.has("coolVolume")) {
                    		coolVolume=jsonObject.get("coolVolume").toString();
//                    		System.out.println(jsonObject.get("coolVolume"));
                    	}
                    	if(jsonObject.has("coolEnergy")) {
                    		coolEnergy=jsonObject.get("coolEnergy").toString();
//                    		System.out.println(jsonObject.get("coolEnergy"));
                    	}
                    	if(jsonObject.has("energyExport")) {
                    		energyExport=jsonObject.get("energyExport").toString();
//                    		System.out.println(jsonObject.get("energyExport"));
                    	}
                    	if(jsonObject.has("heatEnergy")) {
                    		heatEnergy=jsonObject.get("heatEnergy").toString();
//                    		System.out.println(jsonObject.get("heatEnergy"));
                    	}
                    	if(jsonObject.has("hotWaterVolume")) {
                    		hotWaterVolume=jsonObject.get("hotWaterVolume").toString();
//                    		System.out.println(jsonObject.get("hotWaterVolume"));
                    	}
                    	if(jsonObject.has("energy")) {
                    		energy=jsonObject.get("energy").toString();
//                    		System.out.println(jsonObject.get("energy"));
                    	}
                    	int cnt=1;
                    	try (Connection dbconnection = DriverManager.getConnection(jdbcUrl, username, password)) {
                            // 예시 테이블 이름에 맞게 수정하세요
                            String sql = "INSERT INTO household_energy_msrmt_system1_copy " +
                                    "(ttime, heatVolume, waterVolume, gasVolume, coolVolume, " +
                                    "coolEnergy, energyExport, heatEnergy, hotWaterVolume, energy, dongho) " +
                                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                            try (PreparedStatement preparedStatement = dbconnection.prepareStatement(sql)) {
                                // 값 설정 (예시: null인 경우)
                                preparedStatement.setString(cnt++, ttime);
                                preparedStatement.setString(cnt++, heatVolume);
                                preparedStatement.setString(cnt++, waterVolume);
                                preparedStatement.setString(cnt++, gasVolume);
                                preparedStatement.setString(cnt++, coolVolume);
                                preparedStatement.setString(cnt++, coolEnergy);
                                preparedStatement.setString(cnt++, energyExport);
                                preparedStatement.setString(cnt++, heatEnergy);
                                preparedStatement.setString(cnt++, hotWaterVolume);
                                preparedStatement.setString(cnt++, energy);
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
