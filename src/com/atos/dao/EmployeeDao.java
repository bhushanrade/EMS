package com.atos.dao;

import java.util.List;

import com.atos.pojo.Department;
import com.atos.pojo.Employee;

public interface EmployeeDao 
{
	Employee validateEmployee(Employee employee);
	boolean updateEmployee(Employee employee);
	Employee getEmployeeById(int id);
	Employee validateForgotPassword(Employee employee);
	boolean changePassword(Employee emp);
	List<Employee> EmployeeList();
	List<Department> DepartmentList();
	Employee getEmployeeByEmail(Employee employee);
	void addDepartment(Department dept);
}
