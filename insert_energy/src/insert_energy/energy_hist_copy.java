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

public class energy_hist_copy {
	private static final String jdbcUrl = "jdbc:mysql://localhost:3306/kwater?characterEncoding=UTF-8";
	private static final String username = "root";
	private static final String password = "0917";
	public static void main(String[] args) {
		// JDBC 연결 객체
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String insertQuery="";
        try {
            // JDBC 드라이버 로드
            Class.forName("com.mysql.jdbc.Driver");

            // 데이터베이스 연결
            connection = DriverManager.getConnection(jdbcUrl, username, password);

            // 연결 성공 메시지
            System.out.println("데이터베이스에 연결되었습니다.");
            
            // TODO: 여기에서 데이터베이스 작업을 수행하십시오.
            String filePath = "C:\\Users\\yuyun\\Dump20231227\\energy_hist_copy.txt";
    
            try {
                // FileReader를 이용하여 파일을 읽기
                FileReader fileReader = new FileReader(filePath);
                

                // BufferedReader를 사용하여 효율적으로 파일 읽기
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "UTF-8"));
                

                // 읽은 내용을 저장할 StringBuilder 생성
                StringBuilder stringBuilder = new StringBuilder();
                String line;

                // 파일의 끝까지 한 줄씩 읽어서 StringBuilder에 추가
                while ((line = bufferedReader.readLine()) != null) {
                    stringBuilder.append(line);
                }
                
                // 파일 읽기 종료
                bufferedReader.close();

                // StringBuilder를 String으로 변환
                String fileContent = stringBuilder.toString();
                
                
                insertQuery=fileContent;
                
                System.out.println(fileContent.length());	                // 읽은 내용 출력
//                System.out.println("파일 내용:\n" + fileContent);
            } catch (IOException e) {
                e.printStackTrace();
            }
            Statement statement = connection.createStatement();
//            String new_insertQuery="INSERT INTO tbl_car_in_out_hist VALUES (NULL,'출구관제1_정문','2022-05-18 09:56:21','CAR_OUT','8FEEA2C9C8244632E40140FB8ECF8732','2023-09-25 16:52:06'),(5043,'출구관제1_정문','2022-06-26 17:03:03','CAR_OUT','A53654D24624C6A2E0D21CDE24B32DD0','2023-09-25 16:52:06')";
            int rowsAffected = statement.executeUpdate(insertQuery);
////            // 실행 결과 출력
            if (rowsAffected > 0) {
                System.out.println("데이터 삽입 성공!");
            } else {
                System.out.println("데이터 삽입 실패!");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}
}
