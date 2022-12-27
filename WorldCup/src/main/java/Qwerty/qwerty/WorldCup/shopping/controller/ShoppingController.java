package Qwerty.qwerty.WorldCup.shopping.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface ShoppingController {
	
	public ModelAndView listItems(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView detail(@RequestParam("i_name") String i_name, HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public ModelAndView order(@RequestParam("i_name") String i_name,
			@RequestParam("i_option") String i_option,
			@RequestParam("amount") String amount,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public ModelAndView cart(@RequestParam("i_name") String i_name,
			@RequestParam("i_option") String i_option,
			@RequestParam("amount") String amount,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public ModelAndView cartlist(
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;

}
