package com.atos.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import com.atos.services.ManagerServices;

/**
 * @author a632972
 *
 */
@Controller
@RequestMapping("mgraction")
public class ManagerController {
	
	private static final Logger logger = Logger.getLogger(EmployeeController.class);
	@Autowired
	private EmployeeServices empService;
	@Autowired
	private HrServices hrService;
	@Autowired
	private ManagerServices mgrService;
	
	public ManagerController() {
		logger.info("\n");
		logger.info("Into the manager controller\n");
	}

	//	Show Manager home Page
	@RequestMapping("/manager")
	public String showHrPage(Model model)
	{	
		model.addAttribute("empList",mgrService.employeeList());
		
		return "manager";
	}
	
	// Search employee by manager
	@RequestMapping("/searchEmployeeByEmail")
	public String processSearchFormByManager(@RequestParam("emailId") String emailId,HttpSession hs,Model model)
	{
		logger.info("In search employee");
		logger.info(emailId);
		Employee emp = new Employee();
		emp.setEmailId(emailId);
		model.addAttribute("empList",mgrService.employeeList());
		emp=empService.getEmployeeByEmail(emp);
		if(emp==null)
		{
			
			model.addAttribute("email", emailId);
			model.addAttribute("msg","is an invalid  email id");
			return "manager";
		}
		model.addAttribute("searchEmployee", emp);
		return "manager";  // if employee is trainee
	}
	
	
	// show update form by manager
	@RequestMapping("/updateEmployee/{empId}")
	public String showUpdateForm(@PathVariable("empId") int id,Model model,HttpSession hs)
	{
		logger.info("In update by manager");
		model.addAttribute("updateModel",empService.getEmployeeById(id));
		logger.info(empService.getEmployeeById(id).getEmailId());
		model.addAttribute("selectDeptModel",hrService.DepartmentList());
		return "updateemployeebymgr";
	}
	
	// process update form by manager
	@RequestMapping(value="/updateEmployee/{empId}",method=RequestMethod.POST)
	public String processUpdateForm(@PathVariable("empId") int id, @ModelAttribute("updateModel") Employee employee,BindingResult res,Model model,HttpSession hs)
	{
		
		logger.info("=================="+employee.toString());
		employee.setStatus("active");
		@SuppressWarnings("unused")
		boolean stat=empService.getUpdateEmployee(employee);
		return "redirect:/mgraction/manager";
	}
	
	// show update form for manager
		@RequestMapping("/update")
		public String showUpdateForForm(Model model,HttpSession hs)
		{
			Employee emp=(Employee) hs.getAttribute("employee");
			model.addAttribute("updateinfoModel",emp);
			model.addAttribute("selectDeptModel",hrService.DepartmentList());
			return "updateinfo";
		}
		
		// process update form for manager
		@RequestMapping(value="/update",method=RequestMethod.POST)
		public String processUpdateForForm( @ModelAttribute("updateinfoModel") Employee employee,BindingResult res,Model model,HttpSession hs)
		{
			
			logger.info("=================="+employee.toString());
			Employee emp=(Employee) hs.getAttribute("employee");
			employee.setDepartment(emp.getDepartment());
			employee.setStatus(emp.getStatus());
			@SuppressWarnings("unused")
			boolean stat=empService.getUpdateEmployee(employee);
			return "redirect:/mgraction/manager";
		}
		
	
	// show change department form by manager
	@RequestMapping("/changeDepartmentByMgr/{empId}")
	public String showChangeDepartmentForm(@PathVariable("empId") int id,Model model,HttpSession hs)
	{
		Employee emp=empService.getEmployeeById(id);
		hs.setAttribute("changeDeptEmp",emp);
		model.addAttribute("changeDeptByMgr",emp);
		model.addAttribute("selectDeptModel",hrService.DepartmentList());
		return "changedeptbymgr";
	}
	
	
	// process change department by manager
	@RequestMapping(value="/changeDepartmentByMgr/{empId}",method=RequestMethod.POST)
	public String processChangeDepartmentForm(@PathVariable("empId") int id, @ModelAttribute("changeDeptByMgr") Employee employee,BindingResult res,Model model,HttpSession hs)
	{
		logger.info("=================="+employee.toString());
		Employee empDept=(Employee) hs.getAttribute("changeDeptEmp");
		empDept.setDepartment(employee.getDepartment());
		@SuppressWarnings("unused")
		boolean stat=empService.getUpdateEmployee(empDept);
		return "redirect:/mgraction/manager";
	}
	
	// logout for manager
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
