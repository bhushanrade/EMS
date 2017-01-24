package com.atos.pojo;

import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the DEPARTMENT database table.
 * 
 */
@Entity
@NamedQuery(name="Department.findAll", query="SELECT d FROM Department d")
public class Department  {
	@Id
	@Column(name="DEPT_ID")
	private Integer deptId;
	
	@Column(name="DEPT_MANAGER")
	private String deptManager;

	@Column(name="DEPT_NAME")
	private String deptName;

	//bi-directional many-to-one association to Employee
	@OneToMany(mappedBy="department")
	private List<Employee> employees;

	public Department() {
	}

	public Integer getDeptId() {
		return this.deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getDeptManager() {
		return this.deptManager;
	}

	public void setDeptManager(String deptManager) {
		this.deptManager = deptManager;
	}

	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public List<Employee> getEmployees() {
		return this.employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public Employee addEmployee(Employee employee) {
		getEmployees().add(employee);
		employee.setDepartment(this);

		return employee;
	}

	public Employee removeEmployee(Employee employee) {
		getEmployees().remove(employee);
		employee.setDepartment(null);

		return employee;
	}

}