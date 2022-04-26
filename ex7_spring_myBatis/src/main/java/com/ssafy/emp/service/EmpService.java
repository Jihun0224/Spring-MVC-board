package com.ssafy.emp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.emp.dao.EmpDao;
import com.ssafy.emp.model.Emp;


@Service
public class EmpService {
	@Autowired
	private EmpDao empDao;

	public void registerEmp(Emp emp) throws Exception {
		empDao.registerEmp(emp);
	}
	public List<Emp> listEmp(Map<String, Object> map) throws Exception {
		return empDao.listEmp(map);
	}
	public Emp getEmpByPhone(String phone) throws Exception {
		return empDao.getEmpByPhone(phone);
	}
	public Emp getEmp(int eno) throws Exception {
		return empDao.getEmp(eno);
	}
	public void updateEmp(Emp emp) throws Exception {
		empDao.updateEmp(emp);
	}
	public void deleteEmp(int dept) throws Exception {
		empDao.deleteEmp(dept);
	}
}
