package com.atos.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atos.dao.HrDao;
import com.atos.pojo.Department;
import com.atos.pojo.Employee;

@Service
@Transactional
public class HrServicesImpl implements HrServices
{
	@Autowired
	private HrDao dao;

	@Override
	public boolean getRegisterEmployee(Employee employee) 
	{
		return dao.addNewEmployee(employee);
	}
	

	@Override
	public List<Employee> employeeList() 
	{
		return dao.employeeList();
	}
	
	

	@Override
	public List<Department> DepartmentList() {
		return dao.DepartmentList();
	}

	@Override
	public String removeEmployee(Employee employee) {
		employee.setStatus("inactive");
		if(dao.ramoveEmployee(employee))
		return "employee deleted sucessfully";
			return "employee not deleted sucessfully";
	}


	@Override
	public Department getDepartmentById(int id) {
		return dao.getDepartmentById(id);
	}


	@Override
	public List<Employee> employeeInactiveList() {
		return dao.employeeInactiveList();
	}


	@Override
	public String activateEmployee(Employee employee) {
		employee.setStatus("active");
		if(dao.activateEmployee(employee))
		return "employee activated sucessfully";
			return "employee not activated sucessfully";
	}

}