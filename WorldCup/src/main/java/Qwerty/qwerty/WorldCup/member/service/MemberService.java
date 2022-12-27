package Qwerty.qwerty.WorldCup.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import Qwerty.qwerty.WorldCup.member.vo.MemberVO;

public interface MemberService {
	public List listMembers() throws DataAccessException;
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public MemberVO findMember(String id) throws DataAccessException;
	public int updateMember(MemberVO memberVO) throws DataAccessException;
	public int removeMember(String id) throws DataAccessException;
	public MemberVO login(MemberVO memberVO) throws DataAccessException;
	public int maxMemerNumber() throws DataAccessException;
	public MemberVO idCheck(String id) throws DataAccessException;
}
