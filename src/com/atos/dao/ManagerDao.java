package com.atos.dao;

import java.util.List;

import com.atos.pojo.Department;
import com.atos.pojo.Employee;

public interface ManagerDao 
{

	Employee getEmployeeById(int id);
	List<Employee> employeeList();
	List<Department> DepartmentList();
}
