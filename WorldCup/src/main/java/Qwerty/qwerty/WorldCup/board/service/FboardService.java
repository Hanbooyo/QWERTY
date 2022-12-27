package Qwerty.qwerty.WorldCup.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import Qwerty.qwerty.WorldCup.board.vo.FarticleVO;

public interface FboardService {
	
	public List selectAllArticles(Map pagingMap) throws Exception;
	public int totArticles() throws Exception;
	public int addArticle(Map articleMap) throws Exception;
	public int maxArticleNum() throws Exception;
	public FarticleVO findArticle(int f_aNo) throws Exception;
	public List findReplyList(int f_aNo) throws Exception;
	public int addReply(FarticleVO farticleVO) throws Exception;
	public List removeArticle(int f_aNo) throws Exception;
}
