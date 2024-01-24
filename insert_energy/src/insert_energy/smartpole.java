package insert_energy;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

public class smartpole {
	public static void main(String[] args) {
		String jdbcUrl = "jdbc:postgresql://localhost:5432/kwater";
        String username = "postgres";
        String password = "0917";
        // CSV 파일 경로
        String csvFile = "C:\\Users\\yuyun\\smartpole.csv";
        try (BufferedReader br = new BufferedReader(new FileReader(csvFile));
                Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {

               String line;

               // 파일의 각 줄을 읽어옴
               while ((line = br.readLine()) != null) {
                   // 쉼표로 분리
                   String[] values = line.split(",");

                   // PreparedStatement를 사용하여 SQL 쿼리 작성
                   String sql = "INSERT INTO smartpole1 (id, thing, air_temperature, humidity, pm10, pm25, voc, noise, iluminance, " +
                           "thing_status, traffic_volume, calorie_consumption, revisitor, visitor, measurement_time, real_time) " +
                           "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                   try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                       // 변수 설정
                       preparedStatement.setInt(1, Integer.parseInt(values[0].trim())); // id
                       preparedStatement.setString(2, values[1].trim()); // thing
                       preparedStatement.setDouble(3, Double.parseDouble(values[2].trim())); // air_temperature
                       preparedStatement.setDouble(4, Double.parseDouble(values[3].trim())); // humidity
                       preparedStatement.setDouble(5, Double.parseDouble(values[4].trim())); // pm10
                       preparedStatement.setDouble(6, Double.parseDouble(values[5].trim())); // pm25
                       preparedStatement.setDouble(7, Double.parseDouble(values[6].trim())); // voc
                       preparedStatement.setDouble(8, Double.parseDouble(values[7].trim())); // noise
                       preparedStatement.setDouble(9, Double.parseDouble(values[8].trim())); // iluminance
                       preparedStatement.setInt(10, Integer.parseInt(values[9].trim())); // thing_status
                       preparedStatement.setDouble(11, Double.parseDouble(values[10].trim())); // traffic_volume
                       preparedStatement.setDouble(12, Double.parseDouble(values[11].trim())); // calorie_consumption
                       preparedStatement.setDouble(13, Double.parseDouble(values[12].trim())); // revisitor
                       preparedStatement.setInt(14, Integer.parseInt(values[13].trim())); // visitor
                       preparedStatement.setString(15, values[14].trim()); // measurement_time
                       preparedStatement.setTimestamp(16, Timestamp.valueOf(values[15].trim())); // real_time

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
