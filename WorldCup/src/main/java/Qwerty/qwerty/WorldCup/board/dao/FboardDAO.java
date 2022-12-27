package Qwerty.qwerty.WorldCup.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import Qwerty.qwerty.WorldCup.board.vo.FarticleVO;

public interface FboardDAO {

	public List selectAllArticles(Map pagingMap) throws DataAccessException;
	public int totArticles() throws DataAccessException;
	public int insertNewArticle(Map articleMap) throws DataAccessException;
	public int getNewf_aNo() throws DataAccessException;
	public FarticleVO findArticle(int f_aNo) throws DataAccessException;
	public List findReplyList(int f_aNo) throws DataAccessException;
	public int insertNewReply(FarticleVO farticleVO) throws DataAccessException;
	public List removeArticle(int f_aNo) throws DataAccessException;
}
