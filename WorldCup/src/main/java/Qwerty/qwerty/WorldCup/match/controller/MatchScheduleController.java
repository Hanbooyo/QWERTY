package Qwerty.qwerty.WorldCup.match.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface MatchScheduleController  {
	public ModelAndView listSchedules(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView matchDay(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView matchDetail(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
