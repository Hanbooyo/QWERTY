package Qwerty.qwerty.WorldCup.match.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import Qwerty.qwerty.WorldCup.match.vo.CountryVO;
import Qwerty.qwerty.WorldCup.match.vo.MatchDetailVO;
import Qwerty.qwerty.WorldCup.match.vo.MatchScheduleVO;

@Repository("matchScheduleDAO")
public class MatchScheduleDAOImpl implements MatchScheduleDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private CountryVO countryVO;
	
	
	@Override
	public List selectAllMatchList() throws DataAccessException {
		List<MatchScheduleVO> scheduleList = null;
		scheduleList = sqlSession.selectList("mapper.schedule.selectAllMatchList");
		return scheduleList;
	}
	
	@Override
	public List dayList(int matchday) throws DataAccessException {
		List<MatchScheduleVO> listday = null;
		listday = sqlSession.selectList("mapper.schedule.selectDayList", matchday);
		return listday;
	}

	@Override
	public List matchPlayers(String team) throws DataAccessException {
		List<MatchDetailVO> matchPlayers = null;
		matchPlayers = sqlSession.selectList("mapper.schedule.matchPlayers", team);
		return matchPlayers;
	}

	@Override
	public int today(int matchnum) throws DataAccessException {
		int today = 0;
		today = sqlSession.selectOne("mapper.schedule.today", matchnum);
		return today;
	}

	@Override
	public CountryVO countryInfo(String team) throws DataAccessException {
		CountryVO countryInfo = null;
		countryInfo = sqlSession.selectOne("mapper.schedule.countryInfo", team);
		return countryInfo;
	}

	@Override
	public List todayList(int matchnum) throws DataAccessException {
		List todayList = null;
		todayList = sqlSession.selectList("mapper.schedule.todayList", matchnum);
		return todayList;
	}

	@Override
	public String matchInfoHome(int matchnum) throws DataAccessException {
		String home=null;
		home = sqlSession.selectOne("mapper.schedule.matchInfoHome", matchnum);
		return home;
	}

	@Override
	public String matchInfoAway(int matchnum) throws DataAccessException {
		String away=null;
		away = sqlSession.selectOne("mapper.schedule.matchInfoAway", matchnum);
		return away;
	}
}
