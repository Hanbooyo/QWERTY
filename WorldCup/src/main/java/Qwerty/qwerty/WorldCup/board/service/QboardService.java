package Qwerty.qwerty.WorldCup.board.service;

import java.util.List;
import java.util.Map;

import Qwerty.qwerty.WorldCup.board.vo.QboardVO;

public interface QboardService {
	
	public List listArticles(Map pagingMap) throws Exception;
	public int totArticles() throws Exception;
	public QboardVO viewArticle(int q_ano) throws Exception;
	public int addArticle(Map articleMap) throws Exception;
	public void modArticle(Map articleMap) throws Exception;
	public void removeArticle(int q_ano) throws Exception;
	public int addReply(Map articleMap) throws Exception;
}
