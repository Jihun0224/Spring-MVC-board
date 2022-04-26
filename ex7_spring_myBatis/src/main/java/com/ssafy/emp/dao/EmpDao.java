package com.ssafy.emp.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssafy.emp.model.Emp;
import com.ssafy.util.SqlMapConfig;
@Repository
public class EmpDao {
	
	private final String NAMESPACE = "com.ssafy.emp.dao.EmpDao.";
	
	public void registerEmp(Emp emp) throws SQLException {
		try (SqlSession sqlSession = SqlMapConfig.getSqlSession()) {
			sqlSession.insert(NAMESPACE + "registerEmp", emp);
			sqlSession.commit();
		}
	}
	public List<Emp> listEmp(Map<String, Object> map) throws SQLException {
		try (SqlSession sqlSession = SqlMapConfig.getSqlSession()) {
			return sqlSession.selectList(NAMESPACE + "listEmp",map);
		}
	}
	public Emp getEmpByPhone(String phone) throws SQLException {
		try (SqlSession sqlSession = SqlMapConfig.getSqlSession()) {
			return sqlSession.selectOne(NAMESPACE + "getEmp", phone);
		}
	}
	public void updateEmp(Emp emp) throws SQLException {
		try (SqlSession sqlSession = SqlMapConfig.getSqlSession()) {
			sqlSession.update(NAMESPACE + "updateEmp", emp);
			sqlSession.commit();
		}
	}

	public void deleteEmp(int eno) throws SQLException {
		try (SqlSession sqlSession = SqlMapConfig.getSqlSession()) {
			sqlSession.delete(NAMESPACE + "deleteEmp", eno);
			sqlSession.commit();
		}
	}
	public Emp getEmp(int eno) throws SQLException {
		try (SqlSession sqlSession = SqlMapConfig.getSqlSession()) {
			return sqlSession.selectOne(NAMESPACE + "getEmp", eno);
		}
	}
	
}
