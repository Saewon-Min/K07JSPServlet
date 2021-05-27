package model2.mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.ConnectionPool;
import model1.board.BoardDTO;


public class MVCBoardDAO extends ConnectionPool{
	
	
	public MVCBoardDAO(){
		super();
	}
	
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = " SELECT COUNT(*) FROM mvcboard ";
		
		if(map.get("searchWord")!=null) {
			query += " WHERE " +map.get("searchField") + " " 
					+ " LIKE '%" +map.get("searchWord") + "%' "; 	
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1); 
		} catch (Exception e) {
			System.out.println("게시물 카운트 중 예외발생");
			e.printStackTrace();
		}
		
		return totalCount;
		
	}
	
	
	
	public List<MVCBoardDTO> selectListPage(Map<String, Object> map){
		List<MVCBoardDTO> bbs = new Vector<MVCBoardDTO>();
		
		String query = " " +
				" select * " + 
				" from (select Tb.* , rownum rNum " + 
				" 		from (select * " +
				"			 from mvcboard ";
		
		if(map.get("searchWord")!=null) {
			query += " where " + map.get("searchField") + " "
					+ " like '%" + map.get("searchWord") + "%' ";
		}
		query += " "+
				" order by idx desc)   Tb) " +  
				" where rNum between ? and ? "; 
		System.out.println("페이지 쿼리 : "+query);
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				
				bbs.add(dto);
				
			}
		} catch (Exception e) {
			System.out.println("게시물 조회중 예외발생");
			e.printStackTrace();
			
		}	
		return bbs;
	
	}
	
	
	
	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;
		try {
			String query = " INSERT INTO mvcboard( "
				 +  " idx,name, title, content, ofile,sfile,pass ) "
				 + " VALUES ( "
				 + " seq_board_num.NEXTVAL, ?, ?, ?, ?, ?, ? ) ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			
			result = psmt.executeUpdate();
		
		}catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	
}
