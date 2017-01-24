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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.atos.pojo.Department;
import com.atos.pojo.Employee;
import com.atos.services.EmployeeServices;
import com.atos.services.HrServices;



@Controller
@RequestMapping("/employee")
public class EmployeeController {
	private static final Logger logger = Logger.getLogger(EmployeeController.class);
	@Autowired
	private EmployeeServices empService;
	
	@Autowired
	private HrServices hrService;
	
	public EmployeeController() {
		
		logger.info("\n");
		logger.info("Into the employee controller\n");
	}
	
	//aboutus page display
	@RequestMapping("/aboutus")
	public String showAboutUsForm()
	{
		return "aboutus";
	}
	
	//contact page display
	@RequestMapping("/contact")
	
	public String showContactUs()
	{
		return "contactus";
	}
		
	
	// process search employee by trainee
	@RequestMapping("/searchEmployeeByEmail")
	public String processSearchFormByManager(@RequestParam("emailId") String emailId,HttpSession hs,Model model)
	{
		logger.info("In search employee");
		logger.info(emailId);
		Employee emp = new Employee();
		emp.setEmailId(emailId);
		emp=empService.getEmployeeByEmail(emp);
		if(emp==null)
		{
			model.addAttribute("email", emailId);
			model.addAttribute("msg","is an invalid  email id");
			return "welcome";
		}
		model.addAttribute("searchEmployee", emp);
		logger.info(empService.getEmployeeByEmail(emp).getEmpId());
		return "welcome";  // if employee is trainee
	}
	
	 
	//login page display
	@RequestMapping("/login")
	public String showLoginForm(Model model)
	{
		Department dept=new Department();dept.setDeptId(1);dept.setDeptManager("Rakesh Sinha");dept.setDeptName("Java");
		empService.addDepartment(dept);dept.setDeptId(2);dept.setDeptManager("Jyoti Shrimbhekar");dept.setDeptName("COE");
		empService.addDepartment(dept);dept.setDeptId(3);dept.setDeptManager("Saurabh Singh");dept.setDeptName("Dot Net");
		empService.addDepartment(dept);
		model.addAttribute("loginmodel",new Employee());
		return "login";
	}

	//login page querry submit
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String processLoginForm(@ModelAttribute("loginmodel") Employee employee,Model model,HttpSession hs)
	{
		logger.info(employee.getEmailId() +" "+employee.getPassword());
	
		Employee sample=empService.getValidateEmployee(employee);
		if(sample==null)
		{
			model.addAttribute("invalid_employee", employee);
			return "invalid";
		}
		else
		{
		hs.setAttribute("employee", sample);    // setting the valid employee object in session
		if(sample.getRole().equalsIgnoreCase("hr"))
			return "redirect:/action/hr";  // if employee is hr
		else if(sample.getRole().equalsIgnoreCase("manager"))
			return "redirect:/mgraction/manager";   // if employee is manager
		else
			return "welcome";  // if employee is trainee
		}
	}
	
	
	// show update form for self
		@RequestMapping("/update")
		public String showUpdateForForm(Model model,HttpSession hs)
		{
			Employee emp=(Employee) hs.getAttribute("employee");
			model.addAttribute("updateSelfInfo",emp);
			model.addAttribute("selectDeptModel",hrService.DepartmentList());
			return "update";
		}
		
		// process update form for self
		@RequestMapping(value="/update",method=RequestMethod.POST)
		public String processUpdateForForm( @ModelAttribute("updateSelfInfo") Employee employee,BindingResult res,Model model,HttpSession hs)
		{
			
			logger.info("=================="+employee.toString());
			Employee emp=(Employee) hs.getAttribute("employee");
			employee.setDepartment(emp.getDepartment());
			employee.setStatus(emp.getStatus());
			@SuppressWarnings("unused")
			boolean stat=empService.getUpdateEmployee(employee);
			return "welcome";
		}

		@RequestMapping("/forgot")
		public String showForgotPasswordForm(Model model)
		{
			model.addAttribute("forgotmodel",new Employee());
			return "forgot";
		}
		@SuppressWarnings("unused")
		@RequestMapping(value="/forgot",method=RequestMethod.POST)
		public String processForgotForm(@ModelAttribute("forgotmodel") Employee employee,Model model,BindingResult res,HttpSession hs)
		{
			logger.info(employee.getEmailId());
			logger.info("In forgotModel");
			Employee emp=empService.getValidateForgotPassword(employee);
			logger.info(emp.getSecurityAnswer());
			Employee dummy=new Employee();
			String ques=emp.getSecurityQuestion();
			dummy.setSecurityQuestion(ques);
			hs.setAttribute("dummy", dummy);
			model.addAttribute("resetModel", dummy);
			logger.info(dummy.getSecurityQuestion());
			hs.setAttribute("forgotUser", emp);
			if(emp==null)
				return "invalid";
			return "redirect:/employee/reset";
		}
		@RequestMapping("/reset")
		public String showResetPasswordForm(Model model,HttpSession hs)
		{
			Employee emp=(Employee)hs.getAttribute("dummy");
			logger.info("into reset password model");
			logger.info(emp.getSecurityQuestion());
			model.addAttribute("resetModel",emp);
			return "reset";
		}
		@RequestMapping(value="/reset",method=RequestMethod.POST)
		public String processResetPasswordForm(@ModelAttribute("resetModel")Employee employee,Model model,BindingResult res,HttpSession hs)
		{
			logger.info("In resetModel");
			Employee emp=(Employee)hs.getAttribute("forgotUser");
			logger.info("Answer "+emp.getSecurityAnswer());
			if(emp.getSecurityAnswer().equalsIgnoreCase(emp.getSecurityAnswer()))
			{
				model.addAttribute("validUser", emp);
				return "redirect:/employee/resetpassword";
			}
			return "invalid";		
		}
		@RequestMapping("/resetpassword")
		public String showConfirmPasswordForm(Model model,HttpSession hs)
		{
			Employee emp=(Employee)hs.getAttribute("dummy");
			logger.info("In to reset the password model");
			logger.info(emp.getEmailId());
			model.addAttribute("validUser",emp);
			return "resetpassword";
		}
		@RequestMapping(value="/resetpassword",method=RequestMethod.POST)
		public String processConfirmPasswordForm(@ModelAttribute("validUser")Employee employee,Model model,BindingResult res,HttpSession hs)
		{
			logger.info("In validUser");
			Employee emp=(Employee)hs.getAttribute("forgotUser");
			emp.setPassword(employee.getPassword());
			empService.ChangePassword(emp);
			hs.removeAttribute("forgotUser");
			hs.removeAttribute("dummy");
			return "redirect:/employee/login";
		}
	
	// logout page for trainee
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
