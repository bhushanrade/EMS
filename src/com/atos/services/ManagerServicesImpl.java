package com.atos.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atos.dao.EmployeeDao;
import com.atos.dao.HrDao;
import com.atos.pojo.Employee;

@Service
@Transactional
public class ManagerServicesImpl implements ManagerServices
{
	@Autowired
	private EmployeeDao dao;
	@Autowired
	private HrDao hrDao;
	
	

	@Override
	public List<Employee> employeeList() 
	{
		return hrDao.employeeList();
	}
}