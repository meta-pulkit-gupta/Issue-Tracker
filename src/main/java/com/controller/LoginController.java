package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.facade.UserDetailFascade;
import com.model.UserToken;

@Controller
public class LoginController {

	@Autowired
	UserDetailFascade userDetailFascade;

	@RequestMapping("/")
	public String showPage() {
		return "index.html";
	}
	
	@RequestMapping(value="/createIssue",method = RequestMethod.POST, consumes = { "application/json" })
	public String createIssue() {
		System.out.println("kugsafukjhfjsah");
		return "createIssue";
	}
	
	

	@RequestMapping(value = "/signin", method = RequestMethod.POST, consumes = { "application/json" })
	public String savePerson(@RequestBody UserToken tokenResponse) {
		userDetailFascade.userSignInSignUp(tokenResponse);
		System.out.println("Save Person");
		return "second";
	}
}