package model1.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;


public class BoardDAO {


	// DAO의 기본 멤버변수
	Connection con; // DB 연결
	Statement stmt; // 정적 쿼리 전송 및 실행
	PreparedStatement psmt; // 동적 쿼리 전송 및 실행
	ResultSet rs; // select 결과 반환
	
	/*
	인자생성자 1
		: JSP에서 web.xml에 등록된 컨텍스트 초기화 파라미터를
		가져와서 생성자 호출시 파라미터로 전달하여 DB에 연결한다.
	 */
	public BoardDAO(String driver, String url){
		try {
			Class.forName(driver);

			String id ="kosmo";  // 계정이름
			String pass = "1234";  // 계정비번
			
			con = DriverManager.getConnection(url,id,pass);
			
			System.out.println("Oracle 연결성공");
			
		}catch (Exception e){
			System.out.println("Oracle 연결시 예외발생");
			e.printStackTrace();
		}
		
	}
	
	
	/*
	인자생성자 2
		: JSP에서 인수로 전달했던 초기화 파라미터를
		생성자 내에서 가져오기 위해 JSP에서는 application내장객체를
		매개변수로 전달한다. 그러면 메소드 내에서 web.xml을
		접근할 수 있다.
		
		application은 ServletContext 타입 => 내장객체 교안에서 확인가능
	 */
	public BoardDAO(ServletContext application){
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
	
	
	/*
	게시물의 개수를 카운트
	 */
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		// count() 그룹함수를 통해 쿼리문 작성
		String query = " SELECT COUNT(*) FROM board ";
		
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
	
	
	/*
	목록에 출력할 게시물을 조회하기 위한 메소드
	 */
	public List<BoardDTO> selectList(Map<String, Object> map){
		/*
		목록의 정렬순서를 보장하기 위해 List계열의 컬렉션을 사용한다.
		
		Vector 자리에 ArrayList() 나 LinkedList()를 써도 된다.
		사용 방법이 동일하다.
		*/
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		// 조회를 위한 쿼리문 작성
		String query = " SELECT * FROM board ";
		
		// 검색어가 있는 경우 where절 추가
		if(map.get("searchWord")!=null) {
			query += " WHERE " +map.get("searchField") + " " 
					+ " LIKE '%" +map.get("searchWord") + "%' "; 
			
		}
		// 목록은 항상 최근 게시물이 상단에 노출되므로 내림차순으로 정렬
		query += " ORDER by num desc " ;
		
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
		
			/*
			select한 결과를 반환하면 ResultSet객체를 통해 받는다.
			조회 결과는 몇개인지 알 수 없으므로 while문을 통해 개수만큼
			반복하여 출력한다.
			 */
			while(rs.next()) {
				//rs(ResultSet) 중 하나의 레코드를 저장히기 위해 DTO객체 생성
				BoardDTO dto = new BoardDTO();
				
				// 레코드의 각 컬럼 값을 읽어 setter를 통해 저장
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				// List컬렉션에 DTO객체 추가
				bbs.add(dto);
			}
			
			
			
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	

	public int insertWrite(BoardDTO dto) {
		int result = 0;
		try {
			String query = " INSERT INTO board( "
				 +  " num, title, content, id, visitcount) "
				 + " VALUES ( "
				 + " seq_board_num.NEXTVAL, ?, ?, ?, 0 ) ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("게시물 입력 중 에외 발생");
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	
	
	/*
	데이터 베이스 연결을 해제할 때 사용하는 메소드
	한정된 자원을 사용하므로 사용을 마쳤다면 반드시
	연결을 해제해야 한다.
	 */
	public void close() {
		try {
			
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
			
		}catch(Exception e) {
			System.out.println("Oracle 자원 반납시 예외발생");
		}
	}
	
	
	
	
}