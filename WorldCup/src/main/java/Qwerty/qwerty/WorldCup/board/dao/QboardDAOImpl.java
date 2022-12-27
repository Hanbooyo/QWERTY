package Qwerty.qwerty.WorldCup.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import Qwerty.qwerty.WorldCup.board.vo.QboardVO;

@Repository("qBoardDAO")
public class QboardDAOImpl implements QboardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllArticleList(Map pagingMap) throws DataAccessException {
		List q_articleList = sqlSession.selectList("mapper.qBoard.selectAllArticleList", pagingMap);
		return q_articleList;
	}
	
	@Override
	public int totArticles() throws DataAccessException {
		int totArticles = 0;
		totArticles = sqlSession.selectOne("mapper.qBoard.selectTotArticles");
		return totArticles;
	}
	
	@Override
	public QboardVO selectArticle(int q_ano) throws DataAccessException {
		QboardVO article = sqlSession.selectOne("mapper.qBoard.selectArticle", q_ano);
		return article;
	}
	
	@Override
	public int insertNewArticle(Map articleMap) throws DataAccessException {
		int q_ano = selectNewQ_ano();
		articleMap.put("q_ano", q_ano);
		sqlSession.insert("mapper.qBoard.insertNewArticle", articleMap);
		return q_ano;
	}
	
	private int selectNewQ_ano() throws DataAccessException{
		return sqlSession.selectOne("mapper.qBoard.selectNewQ_ano");
	}
	
	@Override
	public void updateArticle(Map articleMap) throws DataAccessException {
		sqlSession.update("mapper.qBoard.updateArticle", articleMap);
	}
	
	@Override
	public void deleteArticle(int q_ano) throws DataAccessException {
		sqlSession.delete("mapper.qBoard.deleteArticle", q_ano);
	}
	
	
}
