package Qwerty.qwerty.WorldCup.match.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import Qwerty.qwerty.WorldCup.match.dao.MatchScheduleDAO;
import Qwerty.qwerty.WorldCup.match.vo.CountryVO;

@Service("matchService")
public class MatchScheduleServiceImpl implements MatchScheduleService{
	@Autowired
	private MatchScheduleDAO matchScheduleDAO;
	
	@Autowired
	private CountryVO countryVO;
	
	@Override
	public List listSchedules() throws DataAccessException {
		List scheduleList = null;
		scheduleList = matchScheduleDAO.selectAllMatchList();
		return scheduleList;
	}
	
	@Override
	public List dayList(int matchday) throws DataAccessException {
		List dayList = null;
		dayList = matchScheduleDAO.dayList(matchday);
		return dayList;
	}

	@Override
	public List matchPlayers(String team) throws DataAccessException {
		List matchPlayers =null;
		matchPlayers = matchScheduleDAO.matchPlayers(team);
		return matchPlayers;
	}

	@Override
	public int today(int matchnum) throws DataAccessException {
		int today = 0;
		today = matchScheduleDAO.today(matchnum);
		return today;
	}

	@Override
	public CountryVO countryInfo(String team) throws DataAccessException {
		CountryVO countryInfo = null;
		countryInfo = matchScheduleDAO.countryInfo(team);
		return countryInfo;
	}

	@Override
	public List todayList(int matchnum) throws DataAccessException {
		List todayList = null;
		todayList = matchScheduleDAO.todayList(matchnum);
		return todayList;
	}

	@Override
	public String matchInfoHome(int matchnum) throws DataAccessException {
		String home;
		home = matchScheduleDAO.matchInfoHome(matchnum);
		return home;
	}

	@Override
	public String matchInfoAway(int matchnum) throws DataAccessException {
		String away;
		away = matchScheduleDAO.matchInfoAway(matchnum);
		return away;
	}
}
