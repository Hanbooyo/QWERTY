package Qwerty.qwerty.WorldCup.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Qwerty.qwerty.WorldCup.member.vo.MemberVO;

public interface MemberController {
	public ModelAndView listMembers(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView addMember(@ModelAttribute("memberVO") MemberVO memberVO, 
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public ModelAndView modMember(@RequestParam("id") String id,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public ModelAndView updateMember(@ModelAttribute("memberVO") MemberVO memberVO,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public ModelAndView removeMember(@RequestParam("id") String id,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public ModelAndView login(@ModelAttribute("memberVO") MemberVO memberVO,
			RedirectAttributes rAttr, //redirect를 이용할 인스턴스 객체 선언
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView idCheck(@RequestParam("id") String id,
			RedirectAttributes rAttr,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
