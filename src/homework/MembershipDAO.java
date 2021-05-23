package homework;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import model1.board.BoardDTO;

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
				    + " ?,?,?,?,sysdate) ";
			
			// prepare객체 생성 후 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getGender());			
			psmt.setString(5, dto.getBirth());
			psmt.setString(6, dto.getZipcode());
			psmt.setString(7, dto.getAddress());
			psmt.setString(8, dto.getEmail());
			psmt.setString(9, dto.getPhone());
			psmt.setString(10, dto.getHomephone());
			
			
			// 쿼리문 실행
			result = psmt.executeUpdate();
		
		}catch (SQLIntegrityConstraintViolationException e) {
			System.out.println("중복된 아이디가 존재합니다");
			return result=-1;
		}catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	// 게시판 목록 출력시 페이지 처리
		public List<MembershipDTO> memberList(Map<String, Object> map){
			List<MembershipDTO> bbs = new Vector<MembershipDTO>();
			/*
			목록의 페이지 처리를 위해 레코드의 구간을 between으로 정해 조회함
			
			1번 : board테이블의 게시물을 일련번호의 내림차순으로 정렬
			2번 : 1번의 결과에 rownum(순차적인 가상번호)를 부여함
			3번 : 2번의 결과를 between으로 구간을 정해 조회함
			
			※ 만약 게시판이 아닌 다른 테이블을 조회하고 싶다면 1번 쿼리문에서
				테이블명만 변경하면 된다.
			 */
			String query = " " +
					" select * " + 
					" from (select Tb.* , rownum rNum " + 
					" 		from (select * " +
					"			 from membership ";
			
			if(map.get("searchWord")!=null) {
				query += " where " + map.get("searchField") + " "
						+ " like '%" + map.get("searchWord") + "%' ";
			}
			query += " "+
					" order by regidate desc)   Tb) " +  
					" where rNum between ? and ? "; 
			System.out.println("페이지 쿼리 : "+query);
			try {
				
				psmt = con.prepareStatement(query);
				// between절의 start와 end값을 인파라미터 설정
				psmt.setString(1, map.get("start").toString());
				psmt.setString(2, map.get("end").toString());
				rs = psmt.executeQuery();
				while(rs.next()) {
					MembershipDTO dto = new MembershipDTO();
					
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setPhone(rs.getString("phone"));
					dto.setEmail(rs.getString("email"));
					dto.setRegidate(rs.getDate("regidate"));
					
					
					bbs.add(dto);
					
				}
			} catch (Exception e) {
				System.out.println("게시물 조회중 예외발생");
				e.printStackTrace();
				
			}	
			return bbs;
		
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
				dto.setBirth(rs.getString("birthday"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress(rs.getString("address"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				if(rs.getString("homephone")=="") {
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
	
	
	/*
	게시물의 개수를 카운트
	 */
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		// count() 그룹함수를 통해 쿼리문 작성
		String query = " SELECT COUNT(*) FROM membership ";
		
		// 검색 파라미터가 있는 경우라면 where절을 추가한다.
		if(map.get("searchWord")!=null) {
			query += " WHERE " +map.get("searchField") + " " 
					+ " LIKE '%" +map.get("searchWord") + "%' "; 	
		}
		
		try {
			// Statement 객체를 생성함(쿼리문에서 ?를 쓰지않았기때문에)
			stmt = con.createStatement();
			// 쿼리문 실행 및 결과 반환
			rs = stmt.executeQuery(query);
			// 결과를 읽기위해 커서 이동
			rs.next();
			// count(*)을 통한 쿼리의 결과는 무조건 정수이므로 getInt()로 읽어옴
			totalCount = rs.getInt(1); // 결과의 개수는 무조건 1개이므로 while문 없이 한번만 출력한다.
		} catch (Exception e) {
			System.out.println("게시물 카운트 중 예외발생");
			e.printStackTrace();
		}
		
		return totalCount;
		
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
