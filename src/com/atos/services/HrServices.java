package com.atos.services;

import java.util.List;

import com.atos.pojo.Department;
import com.atos.pojo.Employee;


public interface HrServices 
{
	boolean getRegisterEmployee(Employee employee);
	List<Employee> employeeList();
	List<Employee> employeeInactiveList();
	List<Department> DepartmentList();
	String removeEmployee(Employee employee);
	Department getDepartmentById(int id);
	String activateEmployee(Employee employee);

}