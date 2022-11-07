package dao;

import java.sql.SQLException;

public interface IBoardDao {

	//전체 글 갯수 조회하기
	public int countList() throws SQLException;;
	
}
