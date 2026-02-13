package com.springboot.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.demo.dto.Employee;

@Controller
public class EmployeeController {
	
	@RequestMapping("/employeeform")
	public String showform(Model m) {
		System.out.println("Wel Come");
		m.addAttribute("command", new Employee());
		return "employeeform";
	}

}
