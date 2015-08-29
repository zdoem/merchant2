package com.ipro.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ipro.model.domain.CustomerForm;
import com.ipro.model.domain.PersonForm;

@Controller
public class PersonController {
	
	@RequestMapping("/personAddForm")
	public ModelAndView doAddFormAction() {
		System.out.println("--->Show  personAddForm.dog");				
		//mapping jsp file ,bean name,Object Form
		return new ModelAndView("personAddForm", "command", new PersonForm());
	}

}
