package Qwerty.qwerty.WorldCup.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Qwerty.qwerty.WorldCup.board.dao.QboardDAO;
import Qwerty.qwerty.WorldCup.board.vo.QboardVO;

@Service("qBoardService")
public class QboardServiceImpl implements QboardService {
	@Autowired
	private QboardDAO qboardDAO;
	@Autowired
	private QboardVO qboardVO;
	
	@Override
	public List listArticles(Map pagingMap) throws Exception {
		List listArticles = qboardDAO.selectAllArticleList(pagingMap);
		return listArticles;
	}
	
	@Override
	public int totArticles() throws Exception {
		int totArticles = qboardDAO.totArticles();
		return totArticles;
	}
	
	@Override
	public QboardVO viewArticle(int q_ano) throws Exception {
		qboardVO = qboardDAO.selectArticle(q_ano);
		return qboardVO;
	}
	
	@Override
	public int addArticle(Map articleMap) throws Exception {
		return qboardDAO.insertNewArticle(articleMap);
	}
	
	@Override
	public void modArticle(Map articleMap) throws Exception {
		qboardDAO.updateArticle(articleMap);		
	}
	
	@Override
	public void removeArticle(int q_ano) throws Exception {
		qboardDAO.deleteArticle(q_ano);
		
	}
	@Override
	public int addReply(Map articleMap) throws Exception {
		return qboardDAO.insertNewArticle(articleMap);
	}
}
