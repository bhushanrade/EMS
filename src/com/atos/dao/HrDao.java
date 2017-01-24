package com.atos.dao;

import java.util.List;

import com.atos.pojo.Department;
import com.atos.pojo.Employee;

public interface HrDao 
{
	boolean addNewEmployee(Employee employee);
	Employee getEmployeeById(int id);
	List<Employee> employeeList();
	List<Employee> removedEmployeeList();
	List<Department> DepartmentList();
	boolean ramoveEmployee(Employee employee);
	Department getDepartmentById(int id);
	List<Employee> employeeInactiveList();
	boolean activateEmployee(Employee employee);
}
