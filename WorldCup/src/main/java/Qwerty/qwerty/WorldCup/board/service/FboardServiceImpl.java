package Qwerty.qwerty.WorldCup.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import Qwerty.qwerty.WorldCup.board.dao.FboardDAO;
import Qwerty.qwerty.WorldCup.board.vo.FarticleVO;

@Service("fboardService")
public class FboardServiceImpl implements FboardService{
	
	@Autowired
	public FboardDAO fboardDAO;

	@Override
	public List selectAllArticles(Map pagingMap) throws DataAccessException {
		List selectAllArticles = null;
		selectAllArticles = fboardDAO.selectAllArticles(pagingMap);
		return selectAllArticles;
	}

	@Override
	public int totArticles() throws DataAccessException {
		int totArticles =0 ;
		totArticles = fboardDAO.totArticles();
		System.out.println(totArticles);
		return totArticles;
	}


	@Override
	public int maxArticleNum() throws DataAccessException {
		return fboardDAO.getNewf_aNo();
	}

	@Override
	public FarticleVO findArticle(int f_aNo) throws DataAccessException {
		FarticleVO farticleVO = null;
		farticleVO = fboardDAO.findArticle(f_aNo);
		return farticleVO;
	}

	@Override
	public List findReplyList(int f_aNo) throws DataAccessException {
		List findReplyList = fboardDAO.findReplyList(f_aNo);
		return findReplyList;
	}

	@Override
	public int addArticle(Map articleMap) throws Exception {
		System.out.println("addArticle ¼­ºñ½º");
		return fboardDAO.insertNewArticle(articleMap);
	}

	@Override
	public int addReply(FarticleVO farticleVO) throws Exception {
		return fboardDAO.insertNewReply(farticleVO);
	}

	@Override
	public List removeArticle(int f_aNo) throws Exception {
		List removeArticles = fboardDAO.removeArticle(f_aNo);
		return removeArticles;
	}

}
