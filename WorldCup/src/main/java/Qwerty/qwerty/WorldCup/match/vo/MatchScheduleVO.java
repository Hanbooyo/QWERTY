package Qwerty.qwerty.WorldCup.match.vo;

import org.springframework.stereotype.Component;

@Component("matchScheduleVO")
public class MatchScheduleVO {
	private Integer matchday;
	private Integer matchnum;
	private Integer month;
	private Integer day;
	private Integer hour;
	private String stadium;
	private String home;
	private String away;
	
	public MatchScheduleVO() {
		
	}

	
	public MatchScheduleVO(Integer matchday) {
		super();
		this.matchday = matchday;
	}


	public MatchScheduleVO(Integer matchday, Integer matchnum, Integer month, Integer day, Integer hour, String stadium,
			String home, String away) {
		super();
		this.matchday = matchday;
		this.matchnum = matchnum;
		this.month = month;
		this.day = day;
		this.hour = hour;
		this.stadium = stadium;
		this.home = home;
		this.away = away;
	}


	public MatchScheduleVO(Integer matchday, String home, String away) {
		super();
		this.matchday = matchday;
		this.home = home;
		this.away = away;
	}


	public Integer getMatchday() {
		return matchday;
	}

	public void setMatchday(Integer matchday) {
		this.matchday = matchday;
	}

	public Integer getMatchnum() {
		return matchnum;
	}

	public void setMatchnum(Integer matchnum) {
		this.matchnum = matchnum;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Integer getDay() {
		return day;
	}

	public void setDay(Integer day) {
		this.day = day;
	}

	public Integer getHour() {
		return hour;
	}

	public void setHour(Integer hour) {
		this.hour = hour;
	}

	public String getStadium() {
		return stadium;
	}

	public void setStadium(String stadium) {
		this.stadium = stadium;
	}

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	public String getAway() {
		return away;
	}

	public void setAway(String away) {
		this.away = away;
	}

	public String toString() {
		return "{"
				+ "\"matchday\" : \""	+ this.matchday + "\", "
				+ "\"matchnum\" : \"" + this.matchnum + "\", "
				+ "\"month\" : \"" + this.month + "\", "
				+ "\"day\" : \"" + this.day + "\", "
				+ "\"hour\" : \"" + this.hour + "\", "
				+ "\"stadium\" : \"" + this.stadium + "\", "
				+ "\"home\" : \"" + this.home + "\", "				
				+ "\"away\" : \"" + this.away + "\"" 
				+ "}";
	}
	

}
