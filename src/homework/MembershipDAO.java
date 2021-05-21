package homework;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

;

public class MembershipDAO {

	
	Connection con;
	Statement stmt;
	PreparedStatement psmt;
	ResultSet rs;
	
	
	public MembershipDAO(ServletContext application){
		try {
			
			String drv = application.getInitParameter("JDBCDriver");
			String url = application.getInitParameter("ConnectionURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			
			Class.forName(drv);
			
			con = DriverManager.getConnection(url,id,pwd);
			
			System.out.println("JDBC 연결성공");
			
		}catch (Exception e){
			System.out.println("JDBC 연결시 예외발생");
			e.printStackTrace();
		}
		
	}
	
	
	public int memberRegist(MembershipDTO dto) {
		int result = 0;
		try {
			// 인파라미터가 있는 insert 쿼리문 작성
			String query = " insert into membership "
				    + " values(?,?,?,?,?,?, "
				    + " ?,?,?,?) ";
			
			// prepare객체 생성 후 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getGender());			
			psmt.setString(5, dto.getBirth());
			psmt.setString(6, dto.getAddress());
			psmt.setString(7, dto.getEmail());
			psmt.setString(8, dto.getPhone());
			psmt.setString(9, dto.getHomephone());
			psmt.setDate(10, dto.getRegidate());
			
			// 쿼리문 실행
			result = psmt.executeUpdate();
		
		}catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	public void memberList() {
		
		
		
		
	}
	
	// 게시물 조회하기(내용보기, 상세보기)
	public MembershipDTO memberView(String id) {
		
		// 조회한 하나의 레코드를 저장할 DTO객체 생성
		MembershipDTO dto = new MembershipDTO();
		
		/* 
		회원의 이름을 가져오기 위해
		회원테이블과 게시판 테이블을 조인하여 조회함
		*/
		String query = " SELECT * "
				+ " FROM membership "
				+ " WHERE id=? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			/*
			매개변수로 전달된 일련번호를 통해 조회하므로
			결과는 무조건 1개만 나오게 된다. 따라서 if문으로
			반환된 결과가 있는지만 확인하면 된다.
			 */

			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setBirth(rs.getString("birth"));
				dto.setAddress(rs.getString("address"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				if(rs.getString("homephone")==null) {
					dto.setHomephone("전화번호 없음");
				}else {
					dto.setHomephone(rs.getString("homephone"));					
				}
				dto.setRegidate(rs.getDate("regidate"));
				
			}
			
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외발생");
			e.printStackTrace();
		}
		return dto;
		
	}
	
	
	public void close() {
		try {
			
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(stmt!=null) stmt.close();
			if(con!=null) con.close();
			
		}catch(Exception e) {
			System.out.println("Oracle 자원 반납시 예외발생");
		}
	}
	
}
