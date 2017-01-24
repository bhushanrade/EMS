package com.atos.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.atos.pojo.Department;
import com.atos.pojo.Employee;
@Repository
public class EmployeeDaoImpl implements EmployeeDao
{
	@Autowired
	private SessionFactory sf;
	@Override
	public Employee validateEmployee(Employee employee) 
	{
		return (Employee)sf.getCurrentSession().createQuery("select b from Employee b where b.emailId= :email and b.password= :pass and b.status= :status")
		.setParameter("email", employee.getEmailId()).setParameter("pass", employee.getPassword()).setParameter("status","active").uniqueResult();
	}
	
	@Override
	public boolean updateEmployee(Employee employee) 
	{
		sf.getCurrentSession().update(employee);;
		return true;
	}

	@Override
	public Employee getEmployeeById(int id) 
	{
		return (Employee)sf.getCurrentSession().get(Employee.class, id);
	}
	
	@Override
	public Employee validateForgotPassword(Employee employee) {
		return (Employee)sf.getCurrentSession().createQuery("select b from Employee b where b.emailId= :email")
				.setParameter("email", employee.getEmailId()).uniqueResult();
	}
	@Override
	public boolean changePassword(Employee emp) {
		sf.getCurrentSession().update(emp);
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> EmployeeList() 
	{
		return sf.getCurrentSession().createQuery("select c from Employee c").list();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Department> DepartmentList() {
		return sf.getCurrentSession().createQuery("select c from Department c").list();
	}

	@Override
	public Employee getEmployeeByEmail(Employee employee) {
		System.out.println(employee.getEmailId());
		return (Employee)sf.getCurrentSession().createQuery("select b from Employee b where b.emailId= :email").setParameter("email", employee.getEmailId()).uniqueResult();
	}

	@Override
	public void addDepartment(Department dept) {
		sf.getCurrentSession().saveOrUpdate(dept);
	}

}
