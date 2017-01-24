package com.atos.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.atos.pojo.Department;
import com.atos.pojo.Employee;
@Repository
public class ManagerDaoImpl implements ManagerDao
{
	@Autowired
	private SessionFactory sf;


	@Override
	public Employee getEmployeeById(int id) 
	{
		return (Employee)sf.getCurrentSession().get(Employee.class, id);
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Department> DepartmentList() {
		return sf.getCurrentSession().createQuery("select c from Department c").list();
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> employeeList() 
	{
		return sf.getCurrentSession().createQuery("select c from Employee c where c.status= :status").setParameter("status","active").list();
	}
}
