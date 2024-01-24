package insert_energy;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

public class vehicle_charge {
	public static void main(String[] args) {
		String jdbcUrl = "jdbc:postgresql://localhost:5432/kwater";
        String username = "postgres";
        String password = "0917";
        // CSV 파일 경로
        String csvFile = "C:\\Users\\yuyun\\dsd.csv";
    
        try (BufferedReader br = new BufferedReader(new FileReader(csvFile));
                Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {

               String line;

               // 파일의 각 줄을 읽어옴
               while ((line = br.readLine()) != null) {
                   // 쉼표로 분리
                   String[] values = line.split(",");

                   // PreparedStatement를 사용하여 SQL 쿼리 작성
                   String sql = "INSERT INTO electric_vehicle_charging_system1 (id, thing, charger_status, accumulation_charge, charge_time, " +
                           "user_card_num, user_name, dong_ho, charge, message_type, real_time) " +
                           "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                   try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                       // 변수 설정
                	   preparedStatement.setInt(1, Integer.parseInt(values[0]));
                       preparedStatement.setString(2, values[1]);
                       preparedStatement.setString(3, values[2]);
                       preparedStatement.setDouble(4, Double.parseDouble(values[3]));
                       preparedStatement.setString(5, values[4]);
                       preparedStatement.setString(6, values[5]);
                       preparedStatement.setString(7, values[6]);
                       preparedStatement.setString(8, values[7]);
                       preparedStatement.setDouble(9, Double.parseDouble(values[8]));
                       preparedStatement.setString(10, values[9]);
                       preparedStatement.setTimestamp(11, Timestamp.valueOf(values[10]));

                       // 실행
                       preparedStatement.executeUpdate();
                   } catch (SQLException e) {
                       e.printStackTrace();
                   }
               }

           } catch (IOException | SQLException e) {
               e.printStackTrace();
           }
    }
}
