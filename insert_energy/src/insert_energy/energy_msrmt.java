package insert_energy;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class energy_msrmt {
	private static final String jdbcUrl = "jdbc:mysql://localhost:3306/kwater?characterEncoding=UTF-8";
	private static final String username = "root";
	private static final String password = "0917";
	public static void main(String[] args) {
		// JDBC 연결 객체
        Connection connection = null;
        ResultSet resultSet = null;
        String insertQuery="";
        try {
            // JDBC 드라이버 로드
            Class.forName("com.mysql.jdbc.Driver");

            // 데이터베이스 연결
            connection = DriverManager.getConnection(jdbcUrl, username, password);
	         String filePath = "C:\\Users\\yuyun\\Dump20231227\\0108_1.txt";
	         PreparedStatement checkStatement = null;
	         try {
	                // FileReader를 이용하여 파일을 읽기
	                FileReader fileReader = new FileReader(filePath);
	                

	                // BufferedReader를 사용하여 효율적으로 파일 읽기
	                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "UTF-8"));
	                String line;

	                // 파일의 끝까지 한 줄씩 읽어서 StringBuilder에 추가
	                
	                while ((line = bufferedReader.readLine()) != null) {
	                	String[] values = line.split(",");
	                	String cur_id=values[0];
	                	
	                	if(!values[4].equals("101")){
	                		
	                		continue;
	                	} 
	                	
	                	String checkQuery = "SELECT id FROM household_energy_msrmt_system1_copy WHERE id = ?";
	                    checkStatement = connection.prepareStatement(checkQuery);
	                    checkStatement.setInt(1, Integer.parseInt(cur_id));
	                    resultSet = checkStatement.executeQuery();
	                    
	                    if(resultSet.next()) {
//	                    	System.out.println("ID " + cur_id + " already exists. Choose a different ID.");
	                    	continue;
	                    }
	                	String query = "INSERT INTO household_energy_msrmt_system1_copy (id, power_measurement_time, usage_power, production_power, dongho, coolingwater_msrmt_time, coolingwater_reflux_temp_out, coolingwater_feeding_temp_in, coolingwater_energy_usage, coolingwater_usage_flow, coolingwater_usage_total_volume, coolingwater_usage_dongho, heatingwater_msrmt_time, heatingwater_reflux_temp_out, heatingwater_feeding_temp_in, heatingwater_energy_usage, heatingwater_usage_flow, heatingwater_usage_total_volume, heatingwater_usage_dongho, hotwater_msrmt_time, hotwater_usage_flow, hotwater_usage_total_volume, hotwater_usage_dongho, sunlight_msrmt_time, sunlight_power_usage, sunlight_power_generation, sunlight_dongho, water_usage_msrmt_time, water_usage_flow, water_usage_total_volume, water_usage_dongho, real_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	                	System.out.println("s");
	                	PreparedStatement preparedStatement = connection.prepareStatement(query);
		       	        
		       	         // PreparedStatement에 데이터 설정
	                	
//	                	System.out.println(values[0]);
//		       	        break;
		       	        for (int i = 0; i < values.length; i++) {
		       	            preparedStatement.setString(i + 1, values[i]);
		       	        }
		                  preparedStatement.executeUpdate();
		                	 
	                	

	                }
	                
	                // 파일 읽기 종료
	                bufferedReader.close();

	                // StringBuilder를 String으로 변환
	                
	                
	                System.out.println("데이터 삽입 성공");	                // 읽은 내용 출력
//	                System.out.println("파일 내용:\n" + fileContent);
	            } catch (IOException e) {
	                e.printStackTrace();
	            }

        }catch (Exception e) {
            e.printStackTrace();
        }
	}
}
