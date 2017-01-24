package com.atos.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atos.dao.EmployeeDao;
import com.atos.pojo.Department;
import com.atos.pojo.Employee;

@Service
@Transactional
public class EmployeeServicesImpl implements EmployeeServices
{
	@Autowired
	private EmployeeDao dao;
	@Override
	public Employee getValidateEmployee(Employee employee) 
	{
		return dao.validateEmployee(employee);
	}

	@Override
	public boolean getUpdateEmployee(Employee employee) 
	{
		return dao.updateEmployee(employee);
	}



	@Override
	public Employee getEmployeeById(int id) 
	{
		return dao.getEmployeeById(id);
	}

	

	@Override
	public Employee getValidateForgotPassword(Employee employee) {
		return dao.validateForgotPassword(employee);
	}

	@Override
	public boolean ChangePassword(Employee emp) {
		return dao.changePassword(emp);
	}

	@Override
	public Employee getEmployeeByEmail(Employee employee) {
		return dao.getEmployeeByEmail(employee);
	}

	@Override
	public void addDepartment(Department dept) {
		dao.addDepartment(dept);
	}


}