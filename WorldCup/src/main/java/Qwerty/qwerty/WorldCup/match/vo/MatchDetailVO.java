package Qwerty.qwerty.WorldCup.match.vo;

import org.springframework.stereotype.Component;

@Component("matchDetailVO")
public class MatchDetailVO {
	private String position;
	private Integer p_num;
	private String p_name;
	private String p_birth;
	private String p_team;
	private Integer starting;
	private String country;
	

	public MatchDetailVO() {
		
	}
	
	public MatchDetailVO(String position, Integer p_num, String p_name, String p_birth, String p_team,
			Integer starting) {
		super();
		this.position = position;
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_birth = p_birth;
		this.p_team = p_team;
		this.starting = starting;
	}
	
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Integer getP_num() {
		return p_num;
	}
	public void setP_num(Integer p_num) {
		this.p_num = p_num;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_birth() {
		return p_birth;
	}
	public void setP_birth(String p_birth) {
		this.p_birth = p_birth;
	}
	public String getP_team() {
		return p_team;
	}
	public void setP_team(String p_team) {
		this.p_team = p_team;
	}
	public Integer getStarting() {
		return starting;
	}
	public void setStarting(Integer starting) {
		this.starting = starting;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
}
