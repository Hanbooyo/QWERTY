package Qwerty.qwerty.WorldCup.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import Qwerty.qwerty.WorldCup.board.vo.FarticleVO;

@Repository("fboardDAO")
public class FboardDAOImpl implements FboardDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllArticles(Map pagingMap) throws DataAccessException {
		List selectAllArticles = null;
		selectAllArticles = sqlSession.selectList("mapper.board.selectAllArticles", pagingMap);
		return selectAllArticles;
	}

	@Override
	public int totArticles() throws DataAccessException {
		int totArticles = 0;
		totArticles = sqlSession.selectOne("mapper.board.totArticles");
		return totArticles;
	}


	@Override
	public int getNewf_aNo() throws DataAccessException {
		int getMaxf_aNo = sqlSession.selectOne("mapper.board.getNewf_aNo");
		int result = getMaxf_aNo +1;
		return result;
	}

	@Override
	public FarticleVO findArticle(int f_aNo) throws DataAccessException {
		FarticleVO farticleVO = null;
		farticleVO = sqlSession.selectOne("mapper.board.selectArticles", f_aNo);
		return farticleVO;
	}

	@Override
	public List findReplyList(int f_aNo) throws DataAccessException {
		List findReplyList = sqlSession.selectList("mapper.board.selectedReply", f_aNo);
		return findReplyList;
	}

	@Override
	public int insertNewArticle(Map articleMap) throws DataAccessException {
		int f_aNo = selectNewArticleNo();
		System.out.println("addArticle DAO");
		System.out.println(f_aNo);
		articleMap.put("f_aNo", f_aNo);
		sqlSession.insert("mapper.board.insertNewArticle", articleMap);
		return f_aNo;
	}
	
	private int selectNewArticleNo() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.getNewf_aNo");
		
	}

	@Override
	public int insertNewReply(FarticleVO farticleVO) throws DataAccessException {
		int f_aNo = selectNewArticleNo();
		farticleVO.setF_aNo(f_aNo);
		sqlSession.insert("mapper.board.insertNewReply", farticleVO);
		return f_aNo;
	}

	@Override
	public List removeArticle(int f_aNo) throws DataAccessException {
		List removeArticles = sqlSession.selectList("mapper.board.removeArticle", f_aNo);
		sqlSession.delete("mapper.board.deleteArticle", f_aNo);
		return removeArticles;
	}

}
