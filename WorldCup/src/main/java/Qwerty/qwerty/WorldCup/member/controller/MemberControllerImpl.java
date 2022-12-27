package Qwerty.qwerty.WorldCup.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Qwerty.qwerty.WorldCup.member.service.MemberService;
import Qwerty.qwerty.WorldCup.member.vo.MemberVO;

@Controller("memberController")
public class MemberControllerImpl implements MemberController{
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberVO memberVO;
	
	//메인 페이지로 이동
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	//영상 페이지로 이동
	@RequestMapping(value = "/video.do", method = RequestMethod.GET)
	private ModelAndView video(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override//회원 목록 보기
	@RequestMapping(value = "/member/listMembers.do", method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override//아이디 중복 체크
	@RequestMapping(value = "/member/idCheck.do", method = RequestMethod.POST)
	public ModelAndView idCheck(String id, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		MemberVO memberVO = memberService.idCheck(id);
		ModelAndView mav = new ModelAndView(viewName);
		String idCheck = "";
		if(memberVO != null) {
			idCheck = "existence";
		}else {
			idCheck = "possible";
		}
		rAttr.addAttribute("idCheck", idCheck);
		rAttr.addAttribute("possibleID", id);
		mav.setViewName("redirect:/member/loginForm.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/member/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("memberVO") MemberVO memberVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("입력한 이메일 : " + memberVO.getId());
		int maxMemNo = memberService.maxMemerNumber();
		System.out.println("회원번호 : " + maxMemNo);
		memberVO.setMemNo(maxMemNo);
		int result = memberService.addMember(memberVO);
		String joinResult = "";
		if(result == 1) {
			joinResult = "success";
		}else {
			joinResult = "false";			
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("joinResult",joinResult);
		mav.setViewName("redirect:/member/loginForm.do");
		return mav;
	}

	@Override//회원 정보 수정창으로 이동
	@RequestMapping(value = "/member/modMember.do", method = RequestMethod.GET)
	public ModelAndView modMember(@RequestParam("id") String id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		memberVO = memberService.findMember(id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("member", memberVO);
		return mav;
	}

	@Override//회원 정보 수정
	@RequestMapping(value = "/member/updateMember.do", method = RequestMethod.POST)
	public ModelAndView updateMember(@ModelAttribute("memberVO") MemberVO memberVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id = memberVO.getId();
		System.out.println(id);
		int result = memberService.updateMember(memberVO);
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		MemberVO member = memberService.findMember(id);
		session.setAttribute("member", member);
		ModelAndView mav = new ModelAndView("redirect:/main.do");	
		return mav;
	}

	@Override//회원 삭제 및 회원 탈퇴
	@RequestMapping(value = "/member/removeMember.do", method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("id") String id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		memberService.removeMember(id);
		HttpSession session = request.getSession();
		session.removeAttribute("isLogOn");
		session.removeAttribute("member");
		session.invalidate();
		ModelAndView mav = new ModelAndView("redirect:/main.do");	
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(member);
		if(memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			String action = (String)session.getAttribute("action");
			if(action != null) {
				mav.setViewName("redirect:/" + action);				
			}else {
				mav.setViewName("redirect:/main.do");
			}
		}else {
			rAttr.addAttribute("result","loginFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}
		return mav;
	}
	
	@RequestMapping(value = "/member/loginForm.do", method = RequestMethod.GET)
	private ModelAndView loginForm(@RequestParam(value = "result", required = false) String result, 
			@RequestParam(value = "action", required = false) String action,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		System.out.println("viewName = " + viewName);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/logout.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/mypage.do", method = RequestMethod.GET)
	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		MemberVO logMem = (MemberVO)session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("member",logMem);
		mav.setViewName(viewName);
		return mav;
	}



	


}
