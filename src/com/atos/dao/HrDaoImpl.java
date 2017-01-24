package com.atos.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.atos.pojo.Department;
import com.atos.pojo.Employee;
@Repository
public class HrDaoImpl implements HrDao
{
	@Autowired
	private SessionFactory sf;
	
	
	@Override
	public boolean addNewEmployee(Employee employee) 
	{
		sf.getCurrentSession().saveOrUpdate(employee);
		return true;
	}

	@Override
	public Employee getEmployeeById(int id) 
	{
		return (Employee)sf.getCurrentSession().get(Employee.class, id);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> employeeList() 
	{
		return sf.getCurrentSession().createQuery("select c from Employee c where c.status= :status").setParameter("status","active").list();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Department> DepartmentList() {
		return sf.getCurrentSession().createQuery("select c from Department c").list();
	}

	@Override
	public boolean ramoveEmployee(Employee employee) {
		sf.getCurrentSession().update(employee);
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> removedEmployeeList() {
		return sf.getCurrentSession().createQuery("select c from Employee c where c.status= :status").setParameter("status","inactive").list();
	}

	@Override
	public Department getDepartmentById(int id) {
		return (Department) sf.getCurrentSession().createQuery("select c from Department c where c.deptId= :deptId").setParameter("deptId","id").uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> employeeInactiveList() {
		return sf.getCurrentSession().createQuery("select c from Employee c where c.status= :status").setParameter("status","inactive").list();
	}

	@Override
	public boolean activateEmployee(Employee employee) {
		sf.getCurrentSession().update(employee);
		return true;
	}

}
