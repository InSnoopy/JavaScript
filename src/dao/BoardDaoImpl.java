package dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import res.config.BuildedSqlMapClient;

public class BoardDaoImpl implements IBoardDao{

	// 싱글톤패턴 적용
	// 특징1. private contructor
	// 특징2. static method
	private SqlMapClient smc;
	private BoardDaoImpl() {
		smc =BuildedSqlMapClient.getSqlMapClient();
	}
	
	
	
	
	@Override
	public int countList() throws SQLException {
		int count = (int)smc.queryForObject("namespace.id");
		return count;
	}

	
	
}
