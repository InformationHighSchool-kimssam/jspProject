package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO {
   private static BoardDAO instance;
   private BoardDAO() {}
   
   public static BoardDAO getInstance() {
	   if(instance == null) instance = new BoardDAO();
	   return instance;
   }
   
   //게시판 하단의 페이징과 검색기능이 구현되면서 db에서 원하는 조건에 맞는 레코드 개수를 얻어오는 함수
   public int getListCount(String items, String text) {
	   //items : 컬럼명, text:검색 문자열
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   
	   int x = 0; //선택된 총 게시글의 갯수
	   
	   String sql;
	   
	   if(items == null && text == null) //검색을 안했을 때
		   sql = "select count(*) from wm_board";
	   else
		   sql = "select count(*) from wm_board where "+items+" like '%"+text+"%'";
	   
	   try {
		   conn = DBConnection.getConnection();
		   pstmt = conn.prepareStatement(sql);
		   rs = pstmt.executeQuery();
		   
		   if(rs.next()) x = rs.getInt(1);
		   System.out.println("X:"+x);
	   }catch(Exception e) {
		   System.out.println("getListCount() 에러:"+e);
	   }finally {
			try {
				 if(rs !=null) rs.close();
				 if(pstmt !=null) pstmt.close();
				 if(conn !=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	   }
	return x; //선택된 총 게시글의 갯수 리턴
   }
   
   //테이블의 목록을 가져오는 함수 생성
   public ArrayList<BoardDTO> getBoardList(int page){
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   
	   String sql="select * from wm_board order by wm_seq_num desc";
	   
	   ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
	   
       try {
        	 conn = DBConnection.getConnection();
  		     pstmt = conn.prepareStatement(sql);
  		     rs = pstmt.executeQuery();
  		     while(rs.next()) {
  		    	BoardDTO board = new BoardDTO();
  		    	board.setNum(rs.getInt("wm_seq_num"));
  		    	board.setId(rs.getString("id"));
  		    	board.setName(rs.getString("name"));
  		    	board.setSubject(rs.getString("subject"));
  		    	board.setContent(rs.getString("content"));
  		    	board.setRegist_day(rs.getString("regist_day"));
  		    	board.setHit(rs.getInt("hit"));
  		    	board.setIp(rs.getString("ip"));
  		    	board.setUpdate_day(rs.getString("update_day"));
  		    	
  		    	list.add(board);
  		     }
  		   return list;
       }catch(Exception e) {
          System.out.println("getBoardList() 에러 : "+e);
       }finally {
    	   try {
				 if(rs !=null) rs.close();
				 if(pstmt !=null) pstmt.close();
				 if(conn !=null) conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
       }
       return null;
   }
   
}















