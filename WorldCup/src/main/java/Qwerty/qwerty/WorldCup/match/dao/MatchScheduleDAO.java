package Qwerty.qwerty.WorldCup.match.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import Qwerty.qwerty.WorldCup.match.vo.CountryVO;

public interface MatchScheduleDAO {
	
	public List selectAllMatchList() throws DataAccessException;
	public List dayList(int matchday) throws DataAccessException;
	public String matchInfoHome(int matchnum) throws DataAccessException;
	public String matchInfoAway(int matchnum) throws DataAccessException;
	public List matchPlayers(String team) throws DataAccessException;
	public int today(int matchnum) throws DataAccessException;
	public CountryVO countryInfo(String team) throws DataAccessException;
	public List todayList(int matchnum) throws DataAccessException;
}
