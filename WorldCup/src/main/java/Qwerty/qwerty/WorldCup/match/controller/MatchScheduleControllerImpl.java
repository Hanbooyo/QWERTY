package Qwerty.qwerty.WorldCup.match.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Qwerty.qwerty.WorldCup.match.service.MatchScheduleService;
import Qwerty.qwerty.WorldCup.match.vo.CountryVO;

@Controller("scheduleController")
public class MatchScheduleControllerImpl implements MatchScheduleController {
	@Autowired
	private MatchScheduleService matchService;
	
//	@Autowired
//	private MatchDetailVO detailVO;
//	
//	@Autowired 
//	private MatchScheduleVO matchScheduleVO;
//	
	@Autowired
	private CountryVO countryVO;
	
	@Override
	@RequestMapping(value = "/match/matchSchedule.do", method = RequestMethod.GET)
	public ModelAndView listSchedules(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List scheduleList = matchService.listSchedules();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("scheduleList", scheduleList);
		int matchday = 1;
		List matchList = matchService.dayList(matchday);
		mav.addObject("matchList", matchList);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/match/matchday.do", method = RequestMethod.GET)
	public ModelAndView matchDay(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Integer matchday = Integer.parseInt(request.getParameter("matchday"));
		List matchList = matchService.dayList(matchday);
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter res = response.getWriter();
		res.write("{ \"matchList\" : " + matchList.toString() + "}");
		return null;
	}

	@Override
	@RequestMapping(value = "/match/matchInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView matchDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		Integer matchnum = Integer.parseInt(request.getParameter("matchnum"));
		String home = matchService.matchInfoHome(matchnum);
		String away = matchService.matchInfoAway(matchnum);
		Integer matchday = matchService.today(matchnum);
		System.out.println(home + "홈 " + away + " 어웨이 " + matchday + " 매치데이");
		List homeList = matchService.matchPlayers(home);
		List awayList = matchService.matchPlayers(away);
		List todayList = matchService.todayList(matchday);
		CountryVO homeInfo = matchService.countryInfo(home);
		CountryVO awayInfo = matchService.countryInfo(away);
		mav.addObject("todayList", todayList);
		mav.addObject("homeList", homeList);
		mav.addObject("homeInfo", homeInfo);
		mav.addObject("home", home);
		mav.addObject("awayList", awayList);
		mav.addObject("awayInfo", awayInfo);
		mav.addObject("away", away);
		mav.setViewName(viewName);
		return mav;
	}
}
