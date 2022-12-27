package Qwerty.qwerty.WorldCup.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import Qwerty.qwerty.WorldCup.board.vo.QboardVO;

public interface QboardDAO {
	public List selectAllArticleList(Map pagingMap) throws DataAccessException;
	public int totArticles() throws DataAccessException;
	public QboardVO selectArticle(int q_ano) throws DataAccessException;
	public int insertNewArticle(Map articleMap) throws DataAccessException;
	public void updateArticle(Map articleMap) throws DataAccessException;
	public void deleteArticle(int q_ano) throws DataAccessException;
}
