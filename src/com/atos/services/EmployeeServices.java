package com.atos.services;

import com.atos.pojo.Department;
import com.atos.pojo.Employee;


public interface EmployeeServices 
{
	Employee getValidateEmployee(Employee employee);
	boolean getUpdateEmployee(Employee employee);
	Employee getEmployeeById(int id);
	Employee getEmployeeByEmail(Employee employee);
	Employee getValidateForgotPassword(Employee employee);
	boolean ChangePassword(Employee emp);
	void addDepartment(Department dept);

}