package Qwerty.qwerty.WorldCup.member.service;

import java.util.List;

import org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import Qwerty.qwerty.WorldCup.member.dao.MemberDAO;
import Qwerty.qwerty.WorldCup.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	//Annotation 의존성 주입으로 MemberService에 MemberDAO 주입
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = memberDAO.selectAllMemberList();
		return membersList;
	}

	@Override
	public int addMember(MemberVO memberVO) throws DataAccessException {
		return memberDAO.insertMember(memberVO);
	}

	@Override
	public MemberVO findMember(String id) throws DataAccessException {
		MemberVO memberVO = null;
		memberVO = memberDAO.findMember(id);
		return memberVO;
	}

	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		return memberDAO.updateMember(memberVO);
	}

	@Override
	public int removeMember(String id) throws DataAccessException {
		return memberDAO.deleteMember(id);
	}

	@Override
	public MemberVO login(MemberVO memberVO) throws DataAccessException {
		return memberDAO.memberConfirm(memberVO);
	}

	@Override
	public int maxMemerNumber() throws DataAccessException {
		return memberDAO.getMaxMemNo();
	}

	@Override
	public MemberVO idCheck(String id) throws DataAccessException {
		MemberVO memberVO = memberDAO.findMember(id);
		return memberVO;
	}
	
	
}
