package com.atos.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.atos.pojo.Employee;
import com.atos.services.EmployeeServices;
import com.atos.services.HrServices;

@Controller
@RequestMapping("action")
public class HrController {

	private static final Logger logger = Logger.getLogger(EmployeeController.class);
	@Autowired
	private HrServices hrService;
	@Autowired
	private EmployeeServices empService;
	
	public HrController() {
		logger.info("\n");
		logger.info("Into the hr controller\n");
	}
	
	
	// show home page of hr
	@RequestMapping("/hr")
	public String showHrPage(Model model)
	{
		
		model.addAttribute("empActiveList",hrService.employeeList());
		model.addAttribute("empInactiveList",hrService.employeeInactiveList());
		return "hr";
	}
	
	// Search employee by manager
		@RequestMapping("/searchEmployeeByEmail")
		public String processSearchFormByManager(@RequestParam("emailId") String emailId,HttpSession hs,Model model)
		{
			logger.info("In search employee");
			logger.info(emailId);
			Employee emp = new Employee();
			emp.setEmailId(emailId);
			//logger.info(empService.getEmployeeByEmail(emp).getEmpId());
			model.addAttribute("empActiveList",hrService.employeeList());
			model.addAttribute("empInactiveList",hrService.employeeInactiveList());
			emp=empService.getEmployeeByEmail(emp);
			if(emp==null)
			{
				model.addAttribute("email", emailId);
				model.addAttribute("msg","is an invalid  email id");
				return "hr";
			}
			model.addAttribute("searchEmployee", emp);
			
			return "hr";  // if employee is trainee
		}
		
	
	
	// show register new employee form for hr
	@RequestMapping("/register")
	public String showRegistrationForm(Model model)
	{
		model.addAttribute("selectDeptModel",hrService.DepartmentList());
		model.addAttribute("registerModel",new Employee());
		return "register";
	}
	
	
	// processing  add new employee for hr
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String processRegistrationForm(@Valid @ModelAttribute("registerModel") Employee employee,BindingResult res,Model model)
	{
		System.out.println("=================="+"In register");
		//Department dept=hrService.getDepartmentById(deptId);		
		System.out.println("=================="+employee.toString());
		employee.setStatus("active");
		//employee.setDepartment(dept);
		@SuppressWarnings("unused")
		boolean stat=hrService.getRegisterEmployee(employee);
		return "redirect:/action/hr";
	}
	
	// show update form by hr
		@RequestMapping("/updateEmployeeByHr/{empId}")
		public String showUpdateForm(@PathVariable("empId") int id,Model model,HttpSession hs)
		{
			logger.info("In update by hr");
			model.addAttribute("updateModelHr",empService.getEmployeeById(id));
			logger.info(empService.getEmployeeById(id).getEmailId());
			model.addAttribute("selectDeptModel",hrService.DepartmentList());
			return "updateemployeebyhr";
		}
		
		// process update form by hr
		@RequestMapping(value="/updateEmployeeByHr/{empId}",method=RequestMethod.POST)
		public String processUpdateForm(@PathVariable("empId") int id, @ModelAttribute("updateModelHr") Employee employee,BindingResult res,Model model,HttpSession hs)
		{
			
			logger.info("=================="+employee.toString());
			@SuppressWarnings("unused")
			boolean stat=empService.getUpdateEmployee(employee);
			return "redirect:/action/hr";
		}
		
		// show update form for hr
			@RequestMapping("/update")
			public String showUpdateForForm(Model model,HttpSession hs)
			{
				Employee emp=(Employee) hs.getAttribute("employee");
				model.addAttribute("updateinfoModel",emp);
				model.addAttribute("selectDeptModel",hrService.DepartmentList());
				return "updateinfo";
			}
			
			// process update form for hr
			@RequestMapping(value="/update",method=RequestMethod.POST)
			public String processUpdateForForm( @ModelAttribute("updateinfoModel") Employee employee,BindingResult res,Model model,HttpSession hs)
			{
				
				logger.info("=================="+employee.toString());
				Employee emp=(Employee) hs.getAttribute("employee");
				employee.setDepartment(emp.getDepartment());
				employee.setStatus(emp.getStatus());
				@SuppressWarnings("unused")
				boolean stat=empService.getUpdateEmployee(employee);
				return "redirect:/action/hr";
			}
			
		
		// show change department form by hr
		@RequestMapping("/changeDepartmentByHr/{empId}")
		public String showChangeDepartmentForm(@PathVariable("empId") int id,Model model,HttpSession hs)
		{
			Employee emp=empService.getEmployeeById(id);
			hs.setAttribute("changeDeptEmp",emp);
			model.addAttribute("changeDeptByhr",emp);
			model.addAttribute("selectDeptModel",hrService.DepartmentList());
			return "changedeptbyhr";
		}
		
		
		// process change department by hr
		@RequestMapping(value="/changeDepartmentByHr/{empId}",method=RequestMethod.POST)
		public String processChangeDepartmentForm(@PathVariable("empId") int id, @ModelAttribute("changeDeptByhr") Employee employee,BindingResult res,Model model,HttpSession hs)
		{
			logger.info("=================="+employee.toString());
			Employee empDept=(Employee) hs.getAttribute("changeDeptEmp");
			empDept.setDepartment(employee.getDepartment());
			@SuppressWarnings("unused")
			boolean stat=empService.getUpdateEmployee(empDept);
			return "redirect:/action/hr";
		}
		
	
	
	// delete employee from organization by hr
	@RequestMapping("/deleteEmployee/{empId}")
	public String processDeleteEmployee(@PathVariable("empId") int id,Model model)
	{
		Employee employee= empService.getEmployeeById(id);
		hrService.removeEmployee(employee);
		model.addAttribute("empActiveList",hrService.employeeList());
		model.addAttribute("empInactiveList",hrService.employeeInactiveList());
		return "redirect:/action/hr";
	}
	
	
	// activate employee from organization by hr
		@RequestMapping("/activateEmployee/{empId}")
		public String processActivateEmployee(@PathVariable("empId") int id,Model model)
		{
			Employee employee= empService.getEmployeeById(id);
			hrService.activateEmployee(employee);
			model.addAttribute("empActiveList",hrService.employeeList());
			model.addAttribute("empInactiveList",hrService.employeeInactiveList());
			return "redirect:/action/hr";
		}
	// logout for hr
	@RequestMapping(value = "/logout")
	public String logout(HttpSession hs, Model map, HttpServletRequest rq, HttpServletResponse rs) 
	{
		
		logger.info("in logout");
		map.addAttribute("valid_employee", hs.getAttribute("employee"));
		hs.invalidate();
		String path = rq.getContextPath();
		rs.setHeader("refresh", "3;" + path);
		return "logout";
	}
	
}
	
	

