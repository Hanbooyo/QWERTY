package Qwerty.qwerty.WorldCup.member.dao;

import java.sql.ResultSet;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import Qwerty.qwerty.WorldCup.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	//Annotation 의존성 주입으로 MemberDAO에 SqlSession 주입
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllMemberList() throws DataAccessException {
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}

	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}

	@Override
	public MemberVO findMember(String id) throws DataAccessException {
		MemberVO memberVO = new MemberVO();
		memberVO = (MemberVO)sqlSession.selectOne("mapper.member.findMember", id);
		return memberVO;
	}

	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.update("mapper.member.updateMember", memberVO);
		return result;
	}

	@Override
	public int deleteMember(String id) throws DataAccessException {
		int result = sqlSession.delete("mapper.member.deleteMember", id);
		return result;
	}

	@Override
	public MemberVO memberConfirm(MemberVO memberVO) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mapper.member.memberConfirm", memberVO);
		return vo;
	}
	
	@Override
	public int getMaxMemNo() {
		int maxMemNo = sqlSession.selectOne("mapper.member.memberNumber");
		int result = maxMemNo + 1; 
		System.out.println(result);
		return result;
	}
}
